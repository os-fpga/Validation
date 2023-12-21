

module ram_inst_sp_18 (
  input clock0, we,
  input [9:0] addr, 
  input [17:0] din, 
  output [17:0] dout);

parameter [80:0] MODE_BITS =81'h049200000002490000000;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 1'h0, addr, 4'h0 }),
    .ADDR_A2(0),
    .ADDR_B1(0),
    .ADDR_B2(0),
    .BE_A1(3),
    .BE_A2(3),
    .BE_B1(3),
    .BE_B2(3),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock0),
    .CLK_B2(clock0),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(dout),
    .RDATA_A2(),
    .RDATA_B1(),
    .RDATA_B2(),
    .REN_A1(~we),
    .REN_A2(0),
    .REN_B1(0),
    .REN_B2(0),
    .WDATA_A1(din),
    .WDATA_A2(0),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we),
    .WEN_A2(0),
    .WEN_B1(0),
    .WEN_B2(0)
  );
 

endmodule
