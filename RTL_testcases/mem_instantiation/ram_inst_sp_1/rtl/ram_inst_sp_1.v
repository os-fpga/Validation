

module ram_inst_sp_1 (
  input clock0, we,
  input [9:0] addr, 
  input din, 
  output dout);

parameter [80:0] MODE_BITS =81'hb6d00000000000000000;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 5'h00, addr }),
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
    .REN_A1(1),
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
