

module ram_inst_tdp_no_split_9 (
  input clock0, clock1, weA, weB,
  input [9:0] addrA, addrB,
  input [8:0] dinA, dinB, 
  output [8:0] doutA, doutB);

parameter [80:0] MODE_BITS =81'h92400000004920000000;
wire [9:0] open_wire1, open_wire2;
 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 2'h0, addrA, 3'h0 }),
    .ADDR_A2({ 1'h0, addrA, 3'h0 }),
    .ADDR_B1({ 2'h0, addrB, 3'h0 }),
    .ADDR_B2({ 1'h0, addrB, 3'h0 }),
    .BE_A1(3),
    .BE_A2(0),
    .BE_B1(3),
    .BE_B2(0),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock1),
    .CLK_B2(clock1),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1({open_wire1[8],doutA[8],open_wire1[7:0],doutA[7:0]}),
    .RDATA_A2(),
    .RDATA_B1({open_wire2[8],doutB[8],open_wire2[7:0],doutB[7:0]}),
    .RDATA_B2(),
    .REN_A1(1),
    .REN_A2(1),
    .REN_B1(1),
    .REN_B2(1),
    .WDATA_A1({1'b0,dinA[8],8'b0,dinA[7:0]}),
    .WDATA_A2(0),
    .WDATA_B1({1'b0,dinB[8],8'b0,dinB[7:0]}),
    .WDATA_B2(0),
    .WEN_A1(weA),
    .WEN_A2(0),
    .WEN_B1(weB),
    .WEN_B2(0)
  );
 

endmodule
