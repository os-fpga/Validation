module  SQImageCacheLoader(

	//////////// CLOCK ////////// 	
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals //////////
	input [pkg_SQImageCache::WORD_SIZE-1:0] data,
	input data_ready,
	output data_wanted,
	
	//////////// Interfaces //////////	
	output structs::struct_SQImageCache_Write sqcw	
	
);	

	
import pkg_SQImageCache::*;

	simpleArray2DFill #(	 
		.ADDR_WIDTH(ADDR_WIDTH),
		.WORD_SIZE(WORD_SIZE), 
		.ROW_WIDTH(ROW_WIDTH),
		.COL_WIDTH(COL_WIDTH)
		
	) SQFill( 
		.clk(clk),
		.resetn(resetn),
		.data(data), 	
		.data_ready(data_ready),
		.data_wanted(data_wanted),
		.we(sqcw.we),
		.q(sqcw.wdata),
		.waddrX(sqcw.waddrX),
		.waddrY(sqcw.waddrY),
		.loaded()
	);

 
endmodule :  SQImageCacheLoader