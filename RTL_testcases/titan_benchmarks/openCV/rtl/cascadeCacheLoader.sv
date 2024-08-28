module cascadeCacheLoader( 	
	
	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals ////////////
	input [63:0] data,
	input bit data_ready,
	output bit data_wanted,
		
	//////////// Interfaces ////////////	
	output structs::struct_cascadeCache_Write ccw			
);	
	
import pkg_cascadeCache::*;

simpleArrayFill #(	 
	.ADDR_WIDTH(ADDR_WIDTH),
	.WORD_SIZE(WORD_SIZE) 
) cascadeFill( 
	.clk(clk),
	.resetn(resetn),
	.data(data), 	
	.data_ready(data_ready),
	.data_wanted(data_wanted),
	.we(ccw.we),
	.q(ccw.wdata),
	.waddr(ccw.waddr),
	.loaded()
);
 
endmodule : cascadeCacheLoader