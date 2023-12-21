module FIFO18kx2_R9W9_primitive_inst (
  input clock0, clock2, clock1, clock3, we1, we2, re1, re2, rst_ptr1, rst_ptr2,
  input [8:0] din1, din2,
  output [8:0] dout1, dout2,
  output empty1, // FIFO empty flag
  output full1, // FIFO full flag
  output almost_empty1, // FIFO almost empty flag
  output almost_full1, // FIFO almost full flag
  output prog_empty1, // FIFO programmable empty flag
  output prog_full1, // FIFO programmable full flag
  output overflow1, // FIFO overflow error flag
  output underflow1, // FIFO underflow error flag
  output empty2, // FIFO empty flag
  output full2, // FIFO full flag
  output almost_empty2, // FIFO almost empty flag
  output almost_full2, // FIFO almost full flag
  output prog_empty2, // FIFO programmable empty flag
  output prog_full2, // FIFO programmable full flag
  output overflow2, // FIFO overflow error flag
  output underflow2 // FIFO underflow error flag
  );

FIFO18KX2 #(
 .DATA_WRITE_WIDTH1(9), 
 .DATA_READ_WIDTH1(9), 
 .FIFO_TYPE1("ASYNCHRONOUS"), 
 .PROG_EMPTY_THRESH1(12'h001), 
 .PROG_FULL_THRESH1(12'h3ff),
 .DATA_WRITE_WIDTH2(9), 
 .DATA_READ_WIDTH2(9), 
 .FIFO_TYPE2("ASYNCHRONOUS"), 
 .PROG_EMPTY_THRESH2(12'h001), 
 .PROG_FULL_THRESH2(12'h3ff) ) 
 fifo18kx2_r9w9 (
    .WR_CLK1(clock0),
    .WR_CLK2(clock2),
    .RD_CLK1(clock1),
    .RD_CLK2(clock3),
    .RESET1(rst_ptr1),
    .RESET2(rst_ptr2),
    .EMPTY1(empty), // FIFO empty flag
    .FULL1(full), // FIFO full flag
    .ALMOST_EMPTY1(almost_empty), // FIFO almost empty flag
    .ALMOST_FULL1(almost_full), // FIFO almost full flag
    .PROG_EMPTY1(prog_empty), // FIFO programmable empty flag
    .PROG_FULL1(prog_full), // FIFO programmable full flag
    .OVERFLOW1(overflow), // FIFO overflow error flag
    .UNDERFLOW1(underflow) // FIFO underflow error flag
    .EMPTY2(empty), // FIFO empty flag
    .FULL2(full), // FIFO full flag
    .ALMOST_EMPTY2(almost_empty), // FIFO almost empty flag
    .ALMOST_FULL2(almost_full), // FIFO almost full flag
    .PROG_EMPTY2(prog_empty), // FIFO programmable empty flag
    .PROG_FULL2(prog_full), // FIFO programmable full flag
    .OVERFLOW2(overflow), // FIFO overflow error flag
    .UNDERFLOW2(underflow) // FIFO underflow error flag
    .RD_DATA1(dout1[8:0]),
    .RD_DATA2(dout2[8:0]),
    .RD_EN1(re1),
    .RD_EN2(re2),
    .WR_DATA1(din1[8:0]),
    .WR_DATA2(din2[8:0]),
    .WR_EN1(we1),
    .WR_EN2(we2),
  );

endmodule