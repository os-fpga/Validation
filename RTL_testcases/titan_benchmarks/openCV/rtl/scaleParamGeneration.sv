module scaleParamGeneration(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////	
	input structs::struct_scaleParams_in sp_in,
	output structs::struct_scaleParams_out sp_out
);

	// import local parameters
	import pkg_scaleParamGeneration::*;
	import globalDefinitions::*;
	
	localparam int CYCLESTOCALCPARAMS = 6;
	localparam int ONE = (1 << fixed);
	
	// local logic
	logic unsigned [7:0] stages,scaleCount,divCount;
	logic unsigned [fixed-1:0] trueWinSize,winSize,minWinSize;	
	logic unsigned [fixedbits-1:0] winSizeInv;	
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] imageWidth,imageWidthScale;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] imageHeight,imageHeightScale;
	logic unsigned [fixedbits-1:0] baseScale,trueScale,trueScaleInv,scaleFactorX,scaleFactorY;	
	logic unsigned [fixedbits-1:0] m1a,m1b,m1r,d1d,d1n,d1q,d1r;	
	
	//define states variables	
	STATES_t NextState,CurState;
	
	// update to new state each cycle
	always_ff @ (posedge clk) begin
		if(resetn == 0) CurState <= S_Reset;
		else CurState <= NextState;
	end
	
	// assign output wires
	always_comb begin
		sp_out.ready <= (CurState == S_Ready);
		sp_out.done <= (CurState == S_Done);
		sp_out.baseImageWidth <= imageWidth;
		sp_out.baseImageHeight <= imageHeight;
		sp_out.scaleImageWidth <= imageWidthScale;
		sp_out.scaleImageHeight <= imageHeightScale;
		sp_out.scaleFactorX <= scaleFactorX;
		sp_out.scaleFactorY <= scaleFactorY;
		sp_out.winSize <= winSize;
		sp_out.minWinSize <= minWinSize;
		sp_out.trueWinSize <= trueWinSize;
		sp_out.winSizeInv <= winSizeInv;
		sp_out.scaleCount <= scaleCount;
		sp_out.stages  <= stages;			
	end
	
	// state transition table
	always_comb begin
		case(CurState)
		S_Reset				: NextState <= S_Ready;  
		S_Ready				: NextState <= sp_in.start ? S_IndexScaleCount : S_Ready;  
		S_IndexScaleCount	: NextState <= S_CalcNewX;  
		S_CalcNewX			: NextState <= S_CalcNewY;
		S_CalcNewY			: NextState <= S_CalcInvS; 	
		S_CalcInvS			: NextState <= S_CalcXS; 
		S_CalcXS				: NextState <= S_CalcYS; 
		S_CalcYS				: NextState <= S_WaitForDiv; 	
		S_WaitForDiv		: NextState <= (divCount == CYCLESTOCALCPARAMS) ? S_ReadInvS : S_WaitForDiv;
		S_ReadInvS			: NextState <= S_ReadXS;
		S_ReadXS				: NextState <= S_ReadXY;
		S_ReadXY				: NextState <= S_CalcNewWinSize;	
		S_CalcNewWinSize	: NextState <= S_Done;
		S_Done				: NextState <= sp_in.taken ? S_Ready : S_Done;  
		default				: NextState <= S_Reset;
		endcase
	end

	// combinational logic
	always_comb begin
		
		// mult input muxing
		case(CurState) 
			S_IndexScaleCount:
				begin
					m1a <= trueScale;
					m1b <= baseScale;
				end
			S_CalcNewX:
				begin
					m1a <= trueScale;
					m1b <= imageWidth;
				end
			S_CalcNewY:
				begin
					m1a <= trueScale;
					m1b <= imageHeight;
				end
			S_CalcNewWinSize:
				begin
					m1a <= trueScaleInv;
					m1b <= winSize;
				end
			default : 
				begin
					m1a <= 0;
					m1b <= 0;				
				end
		endcase
		
		// division input muxing
		case(CurState) 
			S_CalcInvS : 
				begin
					d1n <= ONE  << (fixed - 1) ;
					d1d <= trueScale;		
				end
			S_CalcXS	:
				begin
					d1n <= imageWidth << (fixed);
					d1d <= imageWidthScale;			
				end
			S_CalcYS :
				begin
					d1n <= imageHeight << (fixed);;
					d1d <= imageHeightScale;				
				end
			default : 
				begin
					d1n <= 0;
					d1d <= 0;				
				end
		endcase
		
	end
	
	
	// registered logic
	always_ff @ (posedge clk) begin	

		// single state storascaleParamGenerationge elements
		case(CurState)
			
			// reset varibles one that accumulate during runtime
			S_Reset :
				begin
					trueScale <= (1 << fixed);
					scaleCount <= 0;
					baseScale <= 0;
          imageWidth <= 0;
          imageHeight <= 0;
          winSize <= 0;	
          winSizeInv <= 0;
          divCount <= 0;
          trueWinSize <= 0;
          imageWidthScale <= 0;
          imageHeightScale <= 0;
          trueScaleInv <= 0;
          scaleFactorX <= 0;
          scaleFactorY <= 0;
          stages <= 0;
          minWinSize <= 0;
				end
				
			// stoe the input paramaters and clear local counter
			S_Ready :
				begin
					if(sp_in.start)
					begin
						baseScale <= sp_in.baseScaleFactor;
						imageWidth <= sp_in.baseImageWidth;
						imageHeight <= sp_in.baseImageHeight;
						winSize <= sp_in.winSize;	
						minWinSize <= sp_in.minWinSize;
						winSizeInv <= sp_in.winSizeInv;
						stages <= sp_in.stages;
						divCount <= 0;
					end			
				end
				
			// update the current scale and store its value
			S_IndexScaleCount: 
				begin
					scaleCount <= scaleCount + 1;
					trueScale <= (m1r >> fixed);			
				end
				
			// store the rounded version of the new scaled width
			S_CalcNewX:
				begin					
					if(m1r[fixed-1]) imageWidthScale = (m1r >> fixed) + 1;
					else imageWidthScale = (m1r >> fixed);
				end
				
			// store the rounded version of the new scaled height
			S_CalcNewY:
				begin				  
					if(m1r[fixed-1]) imageHeightScale = (m1r >> fixed) + 1;	
					else imageHeightScale = (m1r >> fixed);		
				end
				
			// wait for the first of the pipelined divisions to finish
			S_WaitForDiv : divCount <= divCount + 1;
			
			// store the inverse of the current scalling factor
			S_ReadInvS : trueScaleInv <= {d1q << 1};
			
			// store the exact width scalling factor
			S_ReadXS : scaleFactorX <= {d1q};
			
			//store the exact height scaling factor
			S_ReadXY	: scaleFactorY <= {d1q};
			
			// store the rounded virtual window size
			S_CalcNewWinSize : 
				begin					
					if(m1r[fixed-1]) trueWinSize = (m1r >> fixed) + 1;
					else trueWinSize = m1r >> fixed;
				end
			default :;
		endcase	
	end

	FullDspMult m1(.dataa(m1a),.datab(m1b),.result(m1r));
	FullDspDiv d1(.clock(clk), .denom(d1d), .numer(d1n),.quotient(d1q),.remain(d1r));
	
endmodule : scaleParamGeneration