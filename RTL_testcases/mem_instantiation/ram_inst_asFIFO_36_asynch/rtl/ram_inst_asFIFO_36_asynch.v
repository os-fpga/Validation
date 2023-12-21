

module ram_inst_asFIFO_36_asynch (
  input clock0, clock1, we, re, rst_ptr,
  input [35:0] din,
  output [35:0] dout,
  output EMPTY,EPO,EWM,UNDERRUN,FULL,FMO,FWM,OVERRUN);
//7FE0022DB7
parameter [80:0] MODE_BITS =81'h0db68800ffc0000000000;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1(0),
    .ADDR_A2(0),
    .ADDR_B1(0),
    .ADDR_B2(0),
    .BE_A1(0),
    .BE_A2(0),
    .BE_B1(0),
    .BE_B2(0),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock1),
    .CLK_B2(clock1),
    .FLUSH1(rst_ptr),
    .FLUSH2(0),
    .RDATA_A1({EMPTY,EPO,EWM,UNDERRUN,FULL,FMO,FWM,OVERRUN}),
    .RDATA_A2(),
    .RDATA_B1({dout[17:0]}),
    .RDATA_B2({dout[35:18]}),
    .REN_A1(0),
    .REN_A2(0),
    .REN_B1(re),
    .REN_B2(0),
    .WDATA_A1(din[17:0]),
    .WDATA_A2(din[35:18]),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we),
    .WEN_A2(0),
    .WEN_B1(0),
    .WEN_B2(0)
  );
 

endmodule
