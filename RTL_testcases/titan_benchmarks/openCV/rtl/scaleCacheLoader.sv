module  scaleCacheLoader(

	//////////// CLOCK ////////// 	
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals //////////
	input [32-1:0] data,
	input data_ready,
	output data_wanted,
	
	//////////// Interfaces //////////	
	output structs::struct_scaleCache_Write scw	
	
);	
	
import pkg_scaleCache::*;

	simpleArray2DFill #(	 
		.ADDR_WIDTH(ADDR_WIDTH),
		.WORD_SIZE(WORD_SIZE), 
		.ROW_WIDTH(ROW_WIDTH),
		.COL_WIDTH(COL_WIDTH)
		
	) SumFill( 
		.clk(clk),
		.resetn(resetn),
		.data(data), 	
		.data_ready(data_ready),
		.data_wanted(data_wanted),
		.we(scw.we),
		.q(scw.wdata),
		.waddrX(scw.waddrX),
		.waddrY(scw.waddrY),
		.loaded()
	);

 
endmodule :  scaleCacheLoader