module varianceCache( 	
	
	//////////// CLOCK //////////
	input bit clk,
	
	//////////// Interfaces //////////
	input structs::struct_varianceCache_Write vcw,
	input structs::struct_varianceCache_Read_in vcr_in,
	output structs::struct_varianceCache_Read_out vcr_out	
	
);	
	
	import pkg_varianceCache::*;

	logic unsigned [WORD_SIZE-1:0] area[3:0];
	logic unsigned [WORD_SIZE_SQ-1:0] areaSq[3:0];	
	
	always_ff @ (posedge clk) begin
		
		if(vcw.we) area[vcw.waddr] <= vcw.wdata;
		vcr_out.q <= area[vcr_in.raddr];
		
		if(vcw.weSQ) areaSq[vcw.waddrSQ] <= vcw.wdataSQ;
		vcr_out.qSQ <= areaSq[vcr_in.raddrSQ];
	end
	
	
endmodule : varianceCache



























/*
  //variance integral image data
  simpleDualPortRam #(
    // paramiters
    .ADDR_WIDTH(ADDR_WIDTH),
    .WORD_SIZE(WORD_SIZE),
    .WORDS(1),	
    .BLOCKIN(0),
    .BLOCKOUT(0)
  ) area (		
    // signals
    .clk(clk),
    .waddr(vcw.waddr),
    .raddr(vcr_in.raddr),
    .raddrElm(),
    .waddrElm(0),
    .wdata(vcw.wdata),
    .we(vcw.we),
    .q(vcr_out.q)			
  );	
    
  //sqsum variance threshold data
  simpleDualPortRam #(
    // paramiters
      .ADDR_WIDTH(ADDR_WIDTH),
      .WORD_SIZE(WORD_SIZE_SQ),
      .WORDS(1),	
      .BLOCKIN(0),
    .BLOCKOUT(0)
  ) areaSq(		
   // signals
    .clk(clk),
    .waddr(vcw.waddrSQ),
    .raddr(vcr_in.raddrSQ),
    .raddrElm(),
    .waddrElm(0),
    .wdata(vcw.wdataSQ),
    .we(vcw.weSQ),
    .q(vcr_out.qSQ)			
  );	
  */
