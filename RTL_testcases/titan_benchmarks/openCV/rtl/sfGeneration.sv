module sfGeneration(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////	
	//----- resize parameter generation -----//	
	input structs::struct_sfGeneration_in sfg_in,
	output structs::struct_sfGeneration_out sfg_out 
);

	// import local parameters
	import pkg_sfGeneration::*;
	import globalDefinitions::*;
	
	// 0.5 in fixed point
	int oneHalf = (1 << (globalDefinitions::fixed - 1));
	
	logic unsigned [globalDefinitions::fixedbits-1:0] factorY,factorX;
	logic unsigned [globalDefinitions::fixedbits-1:0] dx,dy,dyp5,dxp5;
	logic unsigned [globalDefinitions::fixedbits-1:0] fxp5,fyp5,fynorm,fxnorm;
	logic unsigned [globalDefinitions::fixedbits*2-1:0] fxp5wire,fyp5wire;
	logic unsigned [globalDefinitions::fixedbits-1:0] fx,fy,sx,sy;
	
	//define states variables	
	STATES_t NextState,CurState;
	
	// update to new state each cycle
	always_ff @ (posedge clk) begin
		if(resetn == 0) CurState <= S_Reset;
		CurState <= NextState;	
	end
	
	// state transition table
	always_comb begin
		case(CurState)
      S_Reset		: NextState <= S_Ready;       
      S_Ready 		: NextState <= sfg_in.start ? S_DXYP5 : S_Ready;
      S_DXYP5 		: NextState <= S_FXYP5		;
      S_FXYP5		: NextState <= S_FXYNORM;
      S_FXYNORM	: NextState <= S_FS;
		S_FS			: NextState <= S_Done;
      S_Done		: NextState <= sfg_in.taken ? S_Ready : S_Done;
		default		: NextState <= S_Reset;
		endcase
	end

	// combinational logic
	always_comb begin
		sfg_out.done <= (CurState == S_Done);
		sfg_out.ready <= (CurState == S_Ready);
		sfg_out.fx <= fx;
		sfg_out.fy <= fy;
		sfg_out.sx <= sx;
		sfg_out.sy <= sy;
	end
	
	
	// registered logic
	always_ff @ (posedge clk) begin	
	
		// store in the input paramiters
		if(sfg_in.start && CurState == S_Ready) begin
			if(sfg_in.start) factorY <= sfg_in.factorY;
			if(sfg_in.start) factorX <= sfg_in.factorX;
			if(sfg_in.start) dx <= sfg_in.dx;
			if(sfg_in.start) dy <= sfg_in.dy;
		end	
	
		// add 0.5 to dy and dx and format to fixed point
		if(CurState == S_DXYP5) begin
			dyp5 <= (dy << 18) + oneHalf;
			dxp5 <= (dx << 18) + oneHalf;
		end
		
		// store mutiplication results for fx and fy;
		if(CurState == S_FXYP5) begin
			fxp5 <= fxp5wire >> 18;
			fyp5 <= fyp5wire >> 18;
		end
		
		// normilize result;
		if(CurState == S_FXYNORM) begin
		   fxnorm <= fxp5 - oneHalf;
	     fynorm <= fyp5 - oneHalf;
		end
		
		// seperate decimal and integer portions of result;
		if(CurState == S_FS) begin
			// sy is integer portion of fynorm 

			sy <= fynorm >> 18;
			sx <= fxnorm >> 18;
		
			// sy is the decimal portaion of fynorm
			fy <= fynorm & {18'hfffff};
			fx <= fxnorm & {18'hfffff};
		end
	end
	
	
	// hardware  multiplier instatiations
	dxyscaleMult calcFxp5 (dxp5,factorX,fxp5wire);
	dxyscaleMult calcFyp5 (dyp5,factorY,fyp5wire);
	

	
endmodule : sfGeneration