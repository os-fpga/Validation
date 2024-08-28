module  imageCacheLoader(

	//////////// CLOCK ////////// 	
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals //////////
	input [32-1:0] data,
	input data_ready,
	output data_wanted,
	
	//////////// Interfaces //////////	
	output structs::struct_imageCache_Write icw	
	
);	
	
import pkg_imageCache::*;

	simpleArray2DFill #(	 
		.ADDR_WIDTH(ADDR_WIDTH),
		.WORD_SIZE(32), 
		.ROW_WIDTH(ROW_WIDTH),
		.COL_WIDTH(COL_WIDTH)
		
	) SumFill( 
		.clk(clk),
		.resetn(resetn),
		.data(data), 	
		.data_ready(data_ready),
		.data_wanted(data_wanted),
		.we(icw.we),
		.q(icw.wdata),
		.waddrX(icw.waddrX),
		.waddrY(icw.waddrY),
		.loaded()
	);

 
endmodule :  imageCacheLoader