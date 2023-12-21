module ram_inst_as_2split_FIFO_18_mode1 (
  input clock0, clock1, we_fifo1, we_bramA2, we_bramB2, re_fifo1, rst_ptr_fifo1, rst_bram2,
  input [9:0] addrA, addrB,
  input [17:0] din_fifo1, dinA_bram, dinB_bram,
  output [17:0] dout_fifo1, doutA_bram, doutB_bram,
  output EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1);

parameter [80:0] MODE_BITS =81'h14928800ffc2490000001;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 1'b0, addrA, 4'h00 }),
    .ADDR_A2({ addrA, 4'h00 }),
    .ADDR_B1({ 1'b0, addrB, 4'h00 }),
    .ADDR_B2({ addrB, 4'h00 }),
    .BE_A1(0),
    .BE_A2(2'b11),
    .BE_B1(0),
    .BE_B2(2'b11),
    .CLK_A1(clock0),
    .CLK_A2(clock1),
    .CLK_B1(clock0),
    .CLK_B2(clock1),
    .FLUSH1(rst_ptr_fifo1),
    .FLUSH2(0),
    .RDATA_A1({EMPTY1,EPO1,EWM1,UNDERRUN1,FULL1,FMO1,FWM1,OVERRUN1}),
    .RDATA_A2(doutA_bram[17:0]),
    .RDATA_B1(dout_fifo1[17:0]),
    .RDATA_B2(doutB_bram[17:0]),
    .REN_A1(1),
    .REN_A2(~we_bramA2),
    .REN_B1(re_fifo1),
    .REN_B2(~we_bramB2),
    .WDATA_A1(din_fifo1[17:0]),
    .WDATA_A2(dinA_bram[17:0]),
    .WDATA_B1(0),
    .WDATA_B2(dinB_bram),
    .WEN_A1(we_fifo1),
    .WEN_A2(we_bramA2),
    .WEN_B1(0),
    .WEN_B2(we_bramB2)
  );
 

endmodule