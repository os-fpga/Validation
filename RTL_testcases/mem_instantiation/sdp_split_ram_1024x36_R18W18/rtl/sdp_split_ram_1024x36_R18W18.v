

module sdp_split_ram_1024x36_R18W18 (
   input clk, we1,
  input [9:0] wr_addr1, rd_addr1,
  input  [17:0] din1, 
  output [17:0] dout1,
  input we2, 
  input [9:0] wr_addr2, rd_addr2,
  input  [17:0] din2, 
  output [17:0] dout2);

parameter [80:0] MODE_BITS =81'h100000012480000000924;

 RS_TDP36K  #(.MODE_BITS(81'h100000012480000000924))
  inst1(
    .ADDR_A1({ rd_addr1, 5'h00 }),
    .ADDR_A2({ rd_addr2[8:0], 5'h00 }),
    .ADDR_B1({ wr_addr1, 5'h00 }),
    .ADDR_B2({ wr_addr2[8:0], 5'h00 }),
    .BE_A1({1, 1}),
    .BE_A2({1, 1}),
    .BE_B1({1, 1}),
    .BE_B2({1, 1}),
    .CLK_A1(clk),
    .CLK_A2(clk),
    .CLK_B1(clk),
    .CLK_B2(clk),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(dout1),
    .RDATA_A2(dout2),
    .RDATA_B1(),
    .RDATA_B2(),
    .REN_A1(0),
    .REN_A2(0),
    .REN_B1(0),
    .REN_B2(0),
    .WDATA_A1(0),
    .WDATA_A2(0),
    .WDATA_B1(din1),
    .WDATA_B2(din2),
    .WEN_A1(0),
    .WEN_A2(0),
    .WEN_B1(we1),
    .WEN_B2(we2)
  );
 

endmodule
