

module sync_nsplit_fifo_R9W18 (
  input clock0, we_fifo1, re_fifo1, rst_ptr_fifo1,
  input [17:0] din_fifo1, 
  output [8:0] dout_fifo1, 
  output EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1);

parameter [80:0] MODE_BITS =81'h19128800ffc0000000000;
wire [8:0] open_wire1;
 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1(0),
    .ADDR_A2(0),
    .ADDR_B1(0),
    .ADDR_B2(0),
    .BE_A1(3),
    .BE_A2(3),
    .BE_B1(3),
    .BE_B2(3),
    .CLK_A1(clock0),
//    .CLK_A2(),
    .CLK_A2(clock0),
    .CLK_B1(clock0),
//    .CLK_B2(0),
    .CLK_B2(clock0),
    .FLUSH1(rst_ptr_fifo1),
    .FLUSH2(0),
    .RDATA_A1({EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1}),
    .RDATA_A2(),
    .RDATA_B1({open_wire1[8],dout_fifo1[8],open_wire1[7:0],dout_fifo1[7:0]}),
    .RDATA_B2(),
    .REN_A1(0),
    .REN_A2(0),
    .REN_B1(re_fifo1),
    .REN_B2(0),
    .WDATA_A1(din_fifo1),
    .WDATA_A2(0),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we_fifo1),
    .WEN_A2(0),
    .WEN_B1(0),
    .WEN_B2(0)
  );
 

endmodule
