module featureCacheLoader( 	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,	
	
	//////////// Ports Signals ////////////
	input logic [pkg_featureCache::freatureAddressBits-1:0] data,
	input bit data_ready,
	output bit data_wanted,
	
	//////////// Interfaces ////////////		
	output structs::struct_featureCache_Write fcw	

);	
	
import pkg_featureCache::*;

simpleArrayFill #(	 
	.ADDR_WIDTH(ADDR_WIDTH),
	.WORD_SIZE(WORD_SIZE) 
) featureFill( 
	.clk(clk),
	.resetn(resetn),
	.data(data), 	
	.data_ready(data_ready),
	.data_wanted(data_wanted),
	.we(fcw.we),
	.q(fcw.wdata),
	.waddr(fcw.waddr),
	.loaded()
);
 
endmodule : featureCacheLoader