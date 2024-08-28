module integralImageGeneration(	

  //////////// CLOCK ////////////
  input bit clk,
  input bit resetn,
    
  //////////// Data Signals ////////////

  //////////// Interfaces ////////////
  
  output structs::struct_SQImageCache_Write sqcw,
  input structs::struct_SQImageCache_Write_Out sqcw_out,
  
  output structs::struct_integralImageCache_Write icw,
  input structs::struct_integralImageCache_Write_Out icw_out,
  
  input structs::struct_scaleCache_Read_Out scr_out,
  output structs::struct_scaleCache_Read_In scr_in,
  
  input structs::struct_integralImageGeneration_control_in iigc_in,
  output structs::struct_integralImageGeneration_control_out iigc_out

  
);

  // import local parameters
  import pkg_integralImageGeneration::*;
  
  logic unsigned  [INTEGRAL_X_COUNTER_WIDTH - 1 : 0] imageXAddr, intXAddr,intXAddrRead, scaleSizeX;
  logic unsigned  [INTEGRAL_Y_COUNTER_WIDTH - 1 : 0] imageYAddr, intYAddr,intYAddrRead, scaleSizeY;
  logic unsigned  [INTEGRAL_DATA_WIDTH - 1 : 0] rowSum,localIntRes;
  logic unsigned  [SQ_DATA_WIDTH - 1 : 0] rowSQSum,localSQRes;
  logic unsigned  [16 - 1 : 0] pixelMultWire;
  
  logic finishedImage,doneRowOne,doneColOne;
  
  //define states variables
  STATES_t NextState,CurState;
  
  always_ff @ (posedge clk) begin
    CurState <= NextState;	
  end
  
  always_comb begin
    scr_in.raddrX = imageXAddr;
    scr_in.raddrY = imageYAddr;
    icw.waddrX = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intXAddr    : intXAddrRead;
    icw.waddrY = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intYAddr    : intYAddrRead;
    icw.wdata =  (CurState == S_Write) ?  localIntRes : 0;
    
    sqcw.waddrX = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intXAddr    : intXAddrRead;
    sqcw.waddrY = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intYAddr    : intYAddrRead;
    sqcw.wdata =  (CurState == S_Write) ?  localSQRes : 0;
  end
  
  always_comb begin
    case(CurState)
      S_Reset				  : NextState = S_FillRowOne;
      S_FillRowOne : NextState = doneRowOne ? S_FillColOne : S_FillRowOne;
      S_FillColOne : NextState = doneColOne ? S_Ready : S_FillColOne;
      S_Ready				  : NextState = iigc_in.start ? S_Read : S_Ready;
      S_Index				  : NextState = S_Read;
      S_Read				   : NextState = S_CalcRow;
      S_CalcRow				: NextState = S_CalcRes;
      S_CalcRes				: NextState = S_Write;
      S_Write				  : NextState = finishedImage ? S_Done : S_Index;
      S_Done				  : NextState = iigc_in.taken ? S_Ready : S_Done;
    endcase
  end


  always_comb begin
    iigc_out.ready = (CurState == S_Ready);	
    iigc_out.done = (CurState == S_Done);
    finishedImage = imageXAddr == (scaleSizeX-2) && (imageYAddr == (scaleSizeY-2) );
    doneRowOne = (intXAddr == globalDefinitions::supportedImageWidth);
    doneColOne = (intYAddr == globalDefinitions::supportedImageHeight);		
    icw.we = (CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write);
    sqcw.we = (CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write);
  end
  
  
  
  always_ff @ (posedge clk) begin
    
    
    
    
    case(CurState)
      
      S_Reset				  :
        begin
          imageXAddr = 0; imageYAddr = 0;
          intXAddrRead = 1; intYAddrRead = 0; 
          intXAddr = 0; intYAddr = 0;
          scaleSizeX = 0; scaleSizeY = 0;
          rowSum = 0; rowSQSum = 0;                   
        end
      S_Ready :
      begin
        if(iigc_in.start) begin
          scaleSizeX <= iigc_in.sizeX;
          scaleSizeY <= iigc_in.sizeY;
          intYAddr <= 1;
          intXAddr <= 1;			
        end		
      end
    S_Index : 
      begin
        if(imageXAddr < (scaleSizeX - 1)) begin
          imageXAddr <= imageXAddr + 1;
          intXAddr <= intXAddr + 1;
          intXAddrRead <= intXAddrRead + 1;
        end else begin
          imageXAddr <= 0;
          intXAddr <= 1;
          intXAddrRead <= 1;
          rowSum <= 0;
          rowSQSum <= 0;
          imageYAddr <= imageYAddr + 1;		
          intYAddrRead <= intYAddrRead +1;	
          intYAddr <= intYAddr + 1;
        end		
      end
      S_FillRowOne : if(doneRowOne) intXAddr <= 0; else intXAddr <= intXAddr + 1;
      S_FillColOne : if(doneColOne) intYAddr <= 0; else intYAddr <= intYAddr + 1;
      S_Ready				  : ;      
      S_Read				   : ;
      S_CalcRow				: 
        begin
          rowSum <= rowSum + scr_out.q;
          rowSQSum <= rowSQSum + pixelMultWire;
        end 
        
      S_CalcRes				: 
        begin
          localIntRes <= rowSum + icw_out.q;
          localSQRes <= rowSQSum + sqcw_out.q;
        end
      S_Write				  : ;
      S_Done :       
       begin
          if(iigc_in.taken) begin
            imageXAddr = 0; imageYAddr = 0;
            intXAddrRead = 1; intYAddrRead = 0; 
            intXAddr = 0; intYAddr = 0;
            scaleSizeX = 0; scaleSizeY = 0;
            rowSum = 0; rowSQSum = 0; 
          end                  
        end
    endcase
end
    
  pixelSQMult m1(scr_out.q,pixelMultWire);
  
endmodule : integralImageGeneration

/*
module integralImageGeneration(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////
	
	output structs::struct_SQImageCache_Write sqcw,
	input structs::struct_SQImageCache_Write_Out sqcw_out,
	
	output structs::struct_integralImageCache_Write icw,
	input structs::struct_integralImageCache_Write_Out icw_out,
	
	input structs::struct_scaleCache_Read_Out scr_out,
	output structs::struct_scaleCache_Read_In scr_in,
	
	input structs::struct_integralImageGeneration_control_in iigc_in,
	output structs::struct_integralImageGeneration_control_out iigc_out

	
);

	// import local parameters
	import pkg_integralImageGeneration::*;
	
	logic unsigned  [INTEGRAL_X_COUNTER_WIDTH - 1 : 0] imageXAddr, intXAddr,intXAddrRead, scaleSizeX;
	logic unsigned  [INTEGRAL_Y_COUNTER_WIDTH - 1 : 0] imageYAddr, intYAddr,intYAddrRead, scaleSizeY;
	logic unsigned  [INTEGRAL_DATA_WIDTH - 1 : 0] rowSum,localIntRes;
	logic unsigned  [SQ_DATA_WIDTH - 1 : 0] rowSQSum,localSQRes;
	logic unsigned  [16 - 1 : 0] pixelMultWire;
	
	logic finishedImage,doneRowOne,doneColOne;
	
	//define states variables
	STATES_t NextState,CurState;
	
	always_ff @ (posedge clk) begin
		CurState <= NextState;	
	end
	
	always_comb begin
	  scr_in.raddrX = imageXAddr;
	  scr_in.raddrY = imageYAddr;
	  icw.waddrX = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intXAddr    : intXAddrRead;
    icw.waddrY = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intYAddr    : intYAddrRead;
	  icw.wdata =  (CurState == S_Write) ?  localIntRes : 0;
	  
	  sqcw.waddrX = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intXAddr    : intXAddrRead;
    sqcw.waddrY = ((CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write)) ?  intYAddr    : intYAddrRead;
    sqcw.wdata =  (CurState == S_Write) ?  localSQRes : 0;
	end
	
	always_comb begin
		case(CurState)
			S_Reset				  : NextState = S_FillRowOne;
			S_FillRowOne : NextState = doneRowOne ? S_FillColOne : S_FillRowOne;
			S_FillColOne : NextState = doneColOne ? S_Ready : S_FillColOne;
			S_Ready				  : NextState = iigc_in.start ? S_Read : S_Ready;
			S_Index				  : NextState = S_Read;
			S_Read				   : NextState = S_CalcRow;
			S_CalcRow				: NextState = S_CalcRes;
			S_CalcRes				: NextState = S_Write;
			S_Write				  : NextState = finishedImage ? S_Done : S_Index;
			S_Done				  : NextState = iigc_in.taken ? S_Ready : S_Done;
		endcase
	end


	always_comb begin
		iigc_out.ready = (CurState == S_Ready);	
		iigc_out.done = (CurState == S_Done);
		finishedImage = imageXAddr == (scaleSizeX-1) && (imageYAddr == (scaleSizeY-1) );
		doneRowOne = (intXAddr == globalDefinitions::supportedImageWidth + 1);
		doneColOne = (intYAddr == globalDefinitions::supportedImageHeight + 1);		
		icw.we = (CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write);
		sqcw.we = (CurState == S_FillRowOne) || (CurState == S_FillColOne) || (CurState == S_Write);
	end
	
	
	
	always_ff @ (posedge clk) begin
		
		
		
		
		case(CurState)
      
      S_Reset				  :
        begin
          imageXAddr = 0; imageYAddr = 0;
          intXAddrRead = 0; intYAddrRead = 0; 
          intXAddr = 1; intYAddr = 0;
          scaleSizeX = 0; scaleSizeY = 0;
          rowSum = 0; rowSQSum = 0;                   
        end
      S_Ready :
			begin
				if(iigc_in.start) begin
					scaleSizeX <= iigc_in.sizeX;
					scaleSizeY <= iigc_in.sizeY;
					intYAddr <= 1;
					intXAddr <= 1;			
				end		
			end
		S_Index : 
			begin
				if(imageXAddr < (scaleSizeX-1)) begin
					imageXAddr <= imageXAddr + 1;
					intXAddr <= intXAddr + 1;
					intXAddrRead <= intXAddrRead + 1;
				end else begin
					imageXAddr <= 0;
					intXAddr <= 1;
					intXAddrRead <= 1;
					rowSum <= 0;
					rowSQSum <= 0;
					imageYAddr <= imageYAddr + 1;		
					//if(imageYAddr > 0) intYAddrRead <= intYAddrRead +1;	
					if(imageYAddr > 0) intYAddrRead <= intYAddrRead +1;
					intYAddr <= intYAddr + 1;
				end		
			end
      S_FillRowOne : if(doneRowOne) intXAddr <= 0; else intXAddr <= intXAddr + 1;
      S_FillColOne : if(doneColOne) intYAddr <= 0; else intYAddr <= intYAddr + 1;
      S_Ready				  : ;      
      S_Read				   : ;
      S_CalcRow				: 
        begin
          rowSum <= rowSum + scr_out.q;
          rowSQSum <= rowSQSum + pixelMultWire;
        end 
        
      S_CalcRes				: 
        begin
          if(imageYAddr == 0) begin
            localIntRes <= rowSum;
            localSQRes <= rowSQSum;
            
          end else begin
            localIntRes <= rowSum + icw_out.q;
            localSQRes <= rowSQSum + sqcw_out.q;          
          end
        end
      S_Write				  : ;
      S_Done :       
       begin
          if(iigc_in.taken) begin
            imageXAddr = 0; imageYAddr = 0;
            intXAddrRead = 1; intYAddrRead = 0; 
            intXAddr = 0; intYAddr = 0;
            scaleSizeX = 0; scaleSizeY = 0;
            rowSum = 0; rowSQSum = 0; 
          end                  
        end
    endcase
end
		
	pixelSQMult m1(scr_out.q,pixelMultWire);
	
endmodule : integralImageGeneration

*/