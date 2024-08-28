module scalePixelGeneration(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////	
	input structs::struct_scalePixelGeneration_in spg_in,
	output structs::struct_scalePixelGeneration_out spg_out,
	
	input structs::struct_imageCache_Read_Out icr_out,
	output structs::struct_imageCache_Read_In icr_in,
	output structs::struct_scaleCache_Write scw	
);

	// import local parameters
	import pkg_scalePixelGeneration::*;
	import globalDefinitions::*;
	
	// 1 in fixed point
	localparam int one = (1 << (globalDefinitions::fixed ));
	localparam int CLKS_TO_COMPUTE = 11;
	
	logic unsigned [globalDefinitions::fixedbits-1:0] fx,fy,fxinv,fyinv,sx,sy;
	logic unsigned [globalDefinitions::fixedbits-1:0] fypipe,fyinvpipe;
	logic unsigned [globalDefinitions::fixedbits-1:0] as,bs,cs,ds,abr,cdr;
	logic unsigned [globalDefinitions::fixedbits-1:0] aswire,bswire,cswire,dswire;
	logic unsigned [globalDefinitions::fixedbits-1:0] ab,cd,abswire,cdswire,abs,cds,abcd;
	logic unsigned [globalDefinitions::fixed-1:0] dx,dy,dxpipe,dypipe;
	logic unsigned [globalDefinitions::inputImageDepth-1:0] a,b,c,d;
	logic unsigned [globalDefinitions::inputImageDepth-1:0] abcdr;
	logic unsigned we[CLKS_TO_COMPUTE];
	
	//define states variables	
	STATES_t NextState,CurState;
	
	// update to new state each cycle
	always_ff @ (posedge clk) begin
		if(resetn == 0) CurState <= S_Reset;
		else CurState <= NextState;
	
		// chain 1 bit registers together
		for(int x = CLKS_TO_COMPUTE ; x > 0 ; x--)
			begin
				if(x == CLKS_TO_COMPUTE) we[x-1] <= ((CurState == S_Ready) && (spg_in.start == 1));
				else we[x-1] <= we[x];		
			end	
		
		// write back the result
		scw.waddrX <= dxpipe;
		scw.waddrY <= dypipe;
		scw.wdata <= abcdr;		
		scw.we<= we[0];
	end
	
	// state transition table
	always_comb begin
		case(CurState)
		S_Reset		: NextState <= S_Ready;  
		S_Ready		: NextState <= spg_in.start ? S_ReadA : S_Ready;  
		S_ReadA		: NextState <= S_ReadB;  
		S_ReadB		: NextState <= S_ReadC;  
		S_ReadC		: NextState <= S_ReadD;  
		S_ReadD		: NextState <= S_Ready;  
		default		: NextState <= S_Reset;
		endcase
	end

	// combinational logic
	always_comb begin
		spg_out.ready <= (CurState == S_Ready);
		
		// calulate read addresses
    case(CurState)
      S_Ready : 
        begin 
          icr_in.raddrX <= spg_in.sx ;
          icr_in.raddrY <= spg_in.sy;
        end
      S_ReadA : begin icr_in.raddrX <= sx + 1; icr_in.raddrY <= sy; end
      S_ReadB : begin icr_in.raddrX <= sx; icr_in.raddrY <= sy + 1; end
      S_ReadC : begin icr_in.raddrX <= sx + 1; icr_in.raddrY <= sy + 1; end
      default : begin icr_in.raddrX <= 0; icr_in.raddrY <= 0; end	
    endcase						
	end
	
	
	// registered logic
	always_ff @ (posedge clk) begin		
		// store in the input paramiters
		if(CurState == S_Ready) begin			
			if(spg_in.start)
				begin
					// store incoming params
					fx <= spg_in.fx;
					fy <= spg_in.fy;
					sx <= spg_in.sx;
					sy <= spg_in.sy;
					dx <= spg_in.dx;
					dy <= spg_in.dy;
					dy <= spg_in.dy;
					
					//save the last set of params still needed to finish the pipeline
					fypipe <= fy;
					fyinvpipe <= fyinv;			
					dxpipe <= dx;
					dypipe <= dy;			
				end
			end	
		
		// store pixel values
		case(CurState)
			S_ReadA : a <= icr_out.q;
			S_ReadB : b <= icr_out.q;
			S_ReadC : c <= icr_out.q;
			S_ReadD : d <= icr_out.q;		
			default : ;
		endcase
		

		
		if(CurState == S_ReadA)
			begin
				fxinv <= (one - fx) >> 7;
				fyinv <= (one - fy) >> 7;		
				fx <= fx >> 7;
				fy <= fy >> 7;
			end
		
		// calc row pixel percentages
		as <= aswire;
		bs <= bswire;
		cs <= cswire;
		ds <= dswire;
		
		// contrust new row pixel values
		ab <= as + bs;
		cd <= cs + ds;
		
		// round the results
		//if(ab & 36'h10000) abr <= ((ab >> fixed) + 1);
		//else 
		
		//abr <= (ab >> 11);
		abr <= (ab >> 0);
			
		//if(cd & 36'h10000) cdr <= (cd >> fixed) + 1;
		//else 
		cdr <= (cd >> 0);
		//cdr <= (cd >> 11);
		
		// calc col pixel percentages
		abs <= abswire;
		cds <= cdswire;	
		
		// construct new col pixel value
		abcd <= (abs + cds) >> 11;
		
		// round the results
		abcdr <= (abcd + (1<<10)) >> 11;
				
	end
	
	
	
	FullDspMult m1(.dataa({28'd0,a}),.datab(fxinv),.result(aswire));
	FullDspMult m2(.dataa({28'd0,b}),.datab(fx),.result(bswire));
	FullDspMult m3(.dataa({28'd0,c}),.datab(fxinv),.result(cswire));
	FullDspMult m4(.dataa({28'd0,d}),.datab(fx),.result(dswire));
	
	FullDspMult m5(.dataa(abr),.datab(fyinvpipe),.result(abswire));
	FullDspMult m6(.dataa(cdr),.datab(fypipe),.result(cdswire));
	
endmodule : scalePixelGeneration