module masterControler(

	//////////// CLOCK //////////////////
	input bit clk,
	input bit resetn,

	
	//////////// Data Signals //////////////	
	input bit start,
	output bit ready,	
	output bit done,
	output bit internalResetn,	
	
	input [7:0] stages,
	input [pkg_imageCache::rowBits - 1 : 0] baseImageWidth,
  input [pkg_imageCache::colBits - 1 : 0] baseImageHeight,
  input [globalDefinitions::fixedbits -1 : 0 ] baseScaleFactor,
  input [globalDefinitions::fixed - 1 : 0 ] winSize,
  input [globalDefinitions::fixed - 1 : 0 ] minWinSize,
  input [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv,	
	
	//////////// Interfaces //////////////
	
	input structs::struct_scaleParams_out sp_out,
	output structs::struct_scaleParams_in sp_in,	
	
	input structs::struct_resize_control_out rc_out,
  output structs::struct_resize_control_in rc_in,	   
  
  output structs::struct_integralImageGeneration_control_in iigc_in,
  input structs::struct_integralImageGeneration_control_out iigc_out,
 
	output structs::struct_varLoader_control_in vlc_in,
	input structs::struct_varLoader_control_out vlc_out,    
	output structs::struct_winLoader_control_in wlc_in,

	input structs::struct_winLoader_control_out wlc_out,
	output structs::struct_resultStore_control_in rsc_in,
	input structs::struct_resultStore_control_out rsc_out,
	output structs::struct_processor_control_in pc_in[globalDefinitions::cores],
	input structs::struct_processor_control_out pc_out[globalDefinitions::cores]
);
	
import pkg_masterControler::*;

// internal logic
logic dblBuf;
logic varReady;
logic featReady;
logic exhustedAllWindows;
logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
logic unsigned [pkg_integralImageCache::integralRowBits-1:0] startX;
logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock,startBlockm1;	
	
//define states variables
STATES_t NextState,CurState;

// update states
always_ff @(posedge clk) begin
	CurState <= NextState;       
end


//// ---- state independant logic---- ////

// system logic
always_comb begin 
  // result all computation elements      
  internalResetn <= ~(CurState == S_Reset);
  
  // which block in the integral image to does the X position represent
  startBlock <= (startX)/globalDefinitions::windowCacheBlocking;
  //startBlockm1 <= (startX-1)/globalDefinitions::windowCacheBlocking;
  

  // when have we finished scanning the image
  exhustedAllWindows <= ( (startX + CORES + CORES + 1 + sp_out.winSize) >= sp_out.scaleImageWidth) && ((startY + 1 + sp_out.winSize) >=  sp_out.scaleImageHeight);
  
  // the entire system is ready for a new frame    
  ready <= (CurState == S_Ready);
  
  done <= (CurState == S_Done);
end

// SIMD processes thus the processor cluster is only ready when all procs are ready
always_comb begin
 
  for(int x = 0 ; x < CORES ; x++) begin
    if(x == 0) varReady = pc_out[0].varReady;
    else	varReady = varReady & pc_out[x].varReady;
  end

  for(int x = 0 ; x < CORES ; x++) begin
    if(x == 0) featReady = pc_out[0].ready;
    else	featReady = featReady & pc_out[x].ready;
  end   
end

// scale parameter generation
always_comb begin
  sp_in.start <= (sp_out.ready) && (CurState == S_CalcScaleVars) ;
  //sp_in.taken <= (rc_out.ready && sp_out.done) && (CurState == S_Scale);
  sp_in.taken <= (NextState != S_Scale) && (CurState == S_Scale);
  sp_in.stages <= stages;
  sp_in.baseImageWidth <= baseImageWidth;
  sp_in.baseImageHeight <= baseImageHeight;
  sp_in. baseScaleFactor <=  baseScaleFactor;
  sp_in.winSize <= winSize;
  sp_in.minWinSize <= minWinSize;
  sp_in.winSizeInv <= winSizeInv;	
end

always_comb begin
  // resize control vars
  rc_in.start <= (NextState == S_GenIntegralImages) && (CurState == S_Scale);
  //rc_in.start <= (rc_out.ready && sp_out.done) && (CurState == S_GenIntegralImages) && (CurState == S_Scale);
  rc_in.taken <= (iigc_out.ready && rc_out.done) && (CurState == S_GenIntegralImages);
  rc_in.imageYSize <= sp_out.baseImageHeight; 
  rc_in.imageXSize <= sp_out.baseImageWidth;
  rc_in.targetYSize <= sp_out.scaleImageHeight;
  rc_in.targetXSize <= sp_out.scaleImageWidth;
  rc_in.factorY <= sp_out.scaleFactorY;
  rc_in.factorX <= sp_out.scaleFactorX;
end

always_comb begin
  // start integral image generation   
  iigc_in.start <= (iigc_out.ready && rc_out.done) && (CurState == S_GenIntegralImages);
  iigc_in.sizeX <= sp_out.scaleImageWidth;
  iigc_in.sizeY <= sp_out.scaleImageHeight;
  iigc_in.taken <= (vlc_out.ready) && (CurState == S_LoadVar) && (iigc_out.done);
end

always_comb begin
  // load the variance cache
  vlc_in.start <= (vlc_out.ready) && (CurState == S_LoadVar) && (iigc_out.done || iigc_out.ready);
  vlc_in.ack <= (varReady==1) && (vlc_out.done==1) && (CurState == S_StartVar);	 
  vlc_in.dblBuf <= dblBuf;
  vlc_in.startY <= startY;
  vlc_in.startBlock <= startBlock;
  vlc_in.winSize <= winSize;
end

// load the window cache
always_comb begin  
  wlc_in.start <= (wlc_out.ready) && (CurState == S_LoadWindow);
  wlc_in.ack <= (featReady==1) && (wlc_out.done==1) && (CurState == S_StartFeat);
  wlc_in.dblBuf <= dblBuf;
  wlc_in.startY <= startY;
  wlc_in.startBlock <= startBlock;
  wlc_in.winSize <= winSize;	
end

// control for each of the n processors  
always_comb begin
  for(int i = 0 ; i < CORES ; i++) begin
    pc_in[i].startVar <= (varReady==1) && (vlc_out.done==1) && (CurState == S_StartVar);
    pc_in[i].start <= (featReady==1) && (wlc_out.done==1) && (CurState == S_StartFeat);
    pc_in[i].dblBufVar <= dblBuf;
    pc_in[i].dblBuf <= dblBuf;
    pc_in[i].inv_window_area <= sp_out. winSizeInv;
    pc_in[i].numberOfStages <= sp_out.stages;
  end  
end

// store the reuslts	
always_comb begin
	rsc_in.start <= rsc_out.ready && ((CurState == S_StoreRes) || (CurState == S_WriteExitCode)) ;
	rsc_in.startX <= (CurState == S_WriteExitCode) ? baseImageHeight : startX;
	rsc_in.startY <= (CurState == S_WriteExitCode) ? baseImageWidth: startY;
	rsc_in.scale <= (CurState == S_WriteExitCode) ? 0 : sp_out.scaleCount;
	rsc_in.exit <= (CurState == S_WriteExitCode);
end



/// ---- state transition table ---- ////
always_comb begin
	if(~resetn) begin
		NextState = S_Reset;			
	end else begin
		case(CurState)
			S_Reset			          : NextState = S_Ready;
			S_Ready			          : NextState = start ? S_CalcScaleVars : S_Ready;
			S_CalcScaleVars     : NextState = sp_out.ready ? S_Scale : S_CalcScaleVars; 
			S_Scale		           :
			 begin
			   if(sp_out.done) begin
			     if (sp_out.trueWinSize < sp_out.minWinSize) begin
			       NextState = S_CalcScaleVars;
			     end else if ( rc_out.ready ) begin
			       NextState = S_GenIntegralImages;
			     end else begin
			       NextState = S_Scale;	
			     end                                         	     
			   end else begin
			     NextState = S_Scale;		     
			   end
			 end
			S_GenIntegralImages : NextState = (iigc_out.ready && rc_out.done)? S_LoadVar : S_GenIntegralImages; 
			S_LoadVar           : NextState = (vlc_out.ready && (iigc_out.done || iigc_out.ready)) ? S_StartVar : S_LoadVar;				
			S_StartVar		        : NextState = (varReady && vlc_out.done)? S_LoadWindow : S_StartVar;
			S_LoadWindow	       : NextState = (wlc_out.ready)  ? S_StartFeat : S_LoadWindow; 
			S_StartFeat	        : NextState = (featReady && wlc_out.done) ? S_StoreRes : S_StartFeat;				
			S_StoreRes          : NextState = rsc_out.ready ? S_Finish : S_StoreRes;
			S_Finish            : 
			 begin
			   if(exhustedAllWindows) begin
			       if( (sp_out.trueWinSize < (sp_out.baseImageWidth - CORES)) && (sp_out.trueWinSize < (sp_out.baseImageWidth - CORES)) ) begin
			         NextState = S_CalcScaleVars;			         
			       end else begin
			         NextState = S_WriteExitCode;			         
			       end
			   end else begin
			       NextState = S_LoadVar;			     
			   end			 
			  end  
		 S_WriteExitCode 			:  NextState =  rsc_out.ready ? S_Done : S_WriteExitCode;
       S_Done			       : NextState = S_Done;
 		default               : NextState = S_Reset;
		endcase		
	end
end 


//// ---- state action table ---- ////
	always_ff @ (posedge clk) begin	
		if(CurState == S_Reset)begin
		  startY <= 0;
      startX <= 0;
      dblBuf <= 0;
		end else begin  
			case(CurState)
				S_Finish	:  
					begin					  
					  dblBuf <= ~dblBuf;
						if(NextState == S_CalcScaleVars) begin
							startX <= 0;
							startY <= 0;
						end else if( (startX + CORES + CORES + 1 + sp_out.winSize ) < sp_out.scaleImageWidth ) begin
							startX <= startX + CORES;
						end else begin
							startX <= 1;
							startY <= startY + 1;	                     
						end                      			
				  end
				default : ;
			endcase
		end
	end
	
endmodule : masterControler
