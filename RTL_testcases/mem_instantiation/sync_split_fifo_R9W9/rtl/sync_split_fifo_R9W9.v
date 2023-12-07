

module sync_split_fifo_R9W9 (
  input clock0, clock1, we1, we2, re1, re2, rst_ptr1, rst_ptr2,
  input [8:0] din1,
  input [8:0] din2,
  output [8:0] dout1, 
  output [8:0] dout2,
  output EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1, EMPTY2,EPO2,EWM2,UNDERRUN2,FULL2,FMO2,FWM2,OVERRUN2);

//parameter [80:0] MODE_BITS =81'h18208800ffcc104400ffd;
parameter [80:0] MODE_BITS =81'h19208800ffcc904400ffd;

wire [8:0] open_wire1, open_wire2;
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
    .CLK_A2(clock1),
    .CLK_B1(clock0),
    .CLK_B2(clock1),
    .FLUSH1(rst_ptr1),
    .FLUSH2(rst_ptr2),
    .RDATA_A1({EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1}),
    .RDATA_A2({EMPTY2,EPO2,EWM2,UNDERRUN2,FULL2,FMO2,FWM2,OVERRUN2}),
    .RDATA_B1({open_wire1[8],dout1[8],open_wire1[7:0],dout1[7:0]}),
    .RDATA_B2({open_wire2[8],dout2[8],open_wire2[7:0],dout2[7:0]}),
    .REN_A1(0),
    .REN_A2(0),
    .REN_B1(re1),
    .REN_B2(re2),
    .WDATA_A1({1'b0,din1[8],8'b0,din1[7:0]}),
    .WDATA_A2({1'b0,din2[8],8'b0,din2[7:0]}),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we1),
    .WEN_A2(we2),
    .WEN_B1(0),
    .WEN_B2(0)
  );
 

endmodule