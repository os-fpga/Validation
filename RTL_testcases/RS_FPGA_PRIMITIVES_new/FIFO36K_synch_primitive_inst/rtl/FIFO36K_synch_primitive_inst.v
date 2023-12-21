module FIFO36K_synch_primitive_inst(
  input rst, // Active high synchronous FIFO reset
  input clk, // clock
  input wr_en, // Write enable
  input rd_en, // Read enable
  input [35:0] push, // Write data
  output [35:0] pop, // Read data
  output empty, // FIFO empty flag
  output full, // FIFO full flag
  output almost_empty, // FIFO almost empty flag
  output almost_full, // FIFO almost full flag
  output prog_empty, // FIFO programmable empty flag
  output prog_full, // FIFO programmable full flag
  output overflow, // FIFO overflow error flag
  output underflow // FIFO underflow error flag
);

FIFO36K #(
 .DATA_WRITE_WIDTH(36), 
 .DATA_READ_WIDTH(36), 
 .FIFO_TYPE("SYNCHRONOUS"), 
 .PROG_EMPTY_THRESH(12'h001), 
 .PROG_FULL_THRESH(12'h3ff) ) fifo36_sync (
  .RESET(rst), // Active high synchronous FIFO reset
  .WR_CLK(clk), // Write clock
  .RD_CLK(clk), // Read clock
  .WR_EN(wr_en), // Write enable
  .RD_EN(rd_en), // Read enable
  .WR_DATA(push), // Write data
  .RD_DATA(pop), // Read data
  .EMPTY(empty), // FIFO empty flag
  .FULL(full), // FIFO full flag
  .ALMOST_EMPTY(almost_empty), // FIFO almost empty flag
  .ALMOST_FULL(almost_full), // FIFO almost full flag
  .PROG_EMPTY(prog_empty), // FIFO programmable empty flag
  .PROG_FULL(prog_full), // FIFO programmable full flag
  .OVERFLOW(overflow), // FIFO overflow error flag
  .UNDERFLOW(underflow) // FIFO underflow error flag
);
endmodule  
