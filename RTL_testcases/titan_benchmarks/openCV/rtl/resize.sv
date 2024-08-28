module resize(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////
	
	input structs::struct_imageCache_Read_Out icr_out,
	output structs::struct_imageCache_Read_In icr_in,
	
	input structs::struct_resize_control_in rc_in,
	output structs::struct_resize_control_out rc_out,
	
	output structs::struct_scaleCache_Write scw	
);

	// import local parameters
	import pkg_resize::*;
	import globalDefinitions::*;

	// define local logic and structures	
	logic unsigned [pkg_imageCache::colBits-1 : 0 ] dy;
	logic unsigned [pkg_imageCache::rowBits-1 : 0 ] dx;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0] factorY,factorX;
	logic unsigned [pkg_imageCache::colBits-1:0] imageYSize,targetYSize;
	logic unsigned [pkg_imageCache::rowBits-1:0] imageXSize,targetXSize;
	logic unsigned [globalDefinitions::fixedbits-1:0] sy,sx,fy,fx;
	logic imageDone;
	
	structs::struct_scalePixelGeneration_in spg_in; 
	structs::struct_scalePixelGeneration_out spg_out; 
	structs::struct_sfGeneration_in sfg_in; 
	structs::struct_sfGeneration_out sfg_out; 
	
	//define states variables
	STATES_t NextState,CurState;
	
	// update to new state each cycle
	always_ff @ (posedge clk) begin
		if(resetn == 0) CurState <= S_Reset;
		else CurState <= NextState;	
	end
	
	
	// wire the sub module structures
	always_comb begin	
		sfg_in.start <= (CurState == S_StartCalcSF) && (sfg_out.ready == 1);
		sfg_in.taken <= (CurState == S_StartPixelGen) && (sfg_out.done && spg_out.ready);
		sfg_in.factorY <= factorY;
		sfg_in.factorX <= factorX;
		sfg_in.dx <= dx;
		sfg_in.dy <= dy;
	
		spg_in.start <= (CurState == S_StartPixelGen) && (sfg_out.done && spg_out.ready);
		spg_in.fx <= sfg_out.fx;
		spg_in.fy <= sfg_out.fy;
		spg_in.sx <= sfg_out.sx;
		spg_in.sy <= sfg_out.sy;
		spg_in.dx <= dx;
		spg_in.dy <= dy;
	end
	
	// state transition table
	always_comb begin
		case(CurState)
			S_Reset 				: NextState <= S_Ready;       
			S_Ready 				: NextState <= rc_in.start ? S_StartCalcSF : S_Ready;
			S_StartCalcSF 		: NextState <= sfg_out.ready ? S_StartPixelGen : S_StartCalcSF		;
			S_StartPixelGen	: NextState <= (sfg_out.done && spg_out.ready) ?  S_Index : S_StartPixelGen;
			S_Index				: NextState <= imageDone ? S_Done : S_StartCalcSF;
			S_Done				: NextState <= rc_in.taken ? S_Reset : S_Done;
			default				: NextState <= S_Reset;
		endcase
	end

		
	// combinational logic
	always_comb begin
		imageDone <= (dx == targetXSize-1) && (dy == targetYSize-1);
		rc_out.ready <= (CurState == S_Ready);
		rc_out.done <= (CurState == S_Done);
	end
	
	// registered logic	
	always_ff @ (posedge clk) begin
		case(CurState)
      S_Reset :       
			begin
			  // clear local registers
			  targetXSize <= 0;
			  targetYSize <= 0;
        dy <= 0;
			  dx <= 0;
			end
      S_Ready : 
			begin
				// store in the input paramiters
				if(rc_in.start) imageYSize <= rc_in.imageYSize;
				if(rc_in.start) imageXSize <= rc_in.imageXSize;
				if(rc_in.start) targetYSize <= rc_in.targetYSize;
				if(rc_in.start) targetXSize <= rc_in.targetXSize;
				if(rc_in.start) factorY <= rc_in.factorY;
				if(rc_in.start) factorX <= rc_in.factorX;
			end
      S_StartCalcSF : ;			
      S_StartPixelGen : ;
      S_Index : 
			begin
				if(dx == targetXSize-1)
					begin
					  dy <= dy + 1;
            dx <= 0;
					end
				else
					begin
						dx <= dx + 1;
					end			
			end
		default : ;
    endcase		
	end
	

	
	// sub module instatiations
	
	scalePixelGeneration spg_module(	
		.clk(clk),
		.resetn(resetn),
		.spg_in(spg_in),
		.spg_out(spg_out), 	
		.icr_out(icr_out),
		.icr_in(icr_in),
		.scw(scw)	
	);


	sfGeneration sfg_module(	
		.clk(clk),
		.resetn(resetn),
		.sfg_in(sfg_in), 
		.sfg_out(sfg_out)
	);
	
endmodule : resize