module windowAlignment #(	

	parameter int OFFSET = 0

)(		

	//////////// CLOCK ////////////
	input bit clk,
	
	//////////// Interfaces ////////////
	input structs::struct_windowAlignment waIn,
	output structs::struct_windowAlignment waOut
);
		
	// import local parameters	
	import pkg_windowAlignment::*;
	
	
	// registers for 1 clk cycle buffer and hardwired shift
	logic [WORDS-1:0][WORD_SIZE-1:0] stageData;	
	logic [INDEX_WIDTH-1:0] waddrY; 
	logic [INDEX_WIDTH-1:0] waddrBlock;
	logic we;
	
	
	//// ---- state independent logic---- ////
	always_ff @(posedge clk) begin
	
		//forward the we, and addr signals
		we <= waIn.we; 	
		waOut.we <= we;
		
		waddrY <= waIn.waddrY;
		waOut.waddrY <= waddrY;
		
		waddrBlock <= waIn.waddrBlock;
		waOut.waddrBlock <= waddrBlock;
		
		for(int x = 0 ; x < WORDS ; x++) begin : hardshiftloop1			
			if(x < WORDS - OFFSET) stageData[x] <= waIn.wdata[x+OFFSET] ;		
			else stageData[x] <= 0;
		end
		
		for(int x = 0; x < WORDS ; x++) begin : hardshiftloop2
			if(x < WORDS - OFFSET) waOut.wdata[x] <= stageData[x]; 
			else waOut.wdata[x] <= waIn.wdata[x + OFFSET - WORDS ]; 	
		end	
		
	end
		
		
endmodule : windowAlignment