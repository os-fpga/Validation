

module sp_split_ram_1024x18_1R2W4_2R2W4 (
 input clk, we1,
  input [9:0] addr1,
  input  [3:0] din1, 
  output [1:0] dout1,
  input we2, 
  input [9:0] addr2,
  input  [3:0] din2, 
  output [1:0] dout2);

parameter [80:0] MODE_BITS =81'h100000024D8000000126C;

 RS_TDP36K  #(.MODE_BITS(81'h100000024D8000000126C))
  inst1(
   .ADDR_A1({ 5'h00, addr1 }),
    .ADDR_A2({ 4'h0, addr2 }),
    .ADDR_B1({ 5'h00, addr1 }),
    .ADDR_B2({ 4'h0, addr2 }),
    .BE_A1({1, 1}),
    .BE_A2({1, 1}),
    .BE_B1(0),
    .BE_B2(0),
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
    .WDATA_A1(din1),
    .WDATA_A2(din2),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we1),
    .WEN_A2(we2),
    .WEN_B1(0),
    .WEN_B2(0)
  );
 

endmodule
