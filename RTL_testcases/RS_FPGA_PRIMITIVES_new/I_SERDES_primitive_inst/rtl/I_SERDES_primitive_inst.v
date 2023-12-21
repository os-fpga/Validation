module I_SERDES_primitive_inst #(
  parameter DATA_RATE = "SDR", // Single or double data rate
  parameter WIDTH = 4, // Width of Deserialization (3-10)
  parameter DPA_MODE = "NONE" // Select Dynamic Phase Alignment or Clock Data Recovery (NONE/DPA/CDR)
) (
  input D, // Data input (connect to input port, buffer or I_DELAY)
  input RST, // Active-low asycnhronous reset
  input FIFO_RST, // FIFO reset
  input BITSLIP_ADJ, // BITSLIP_ADJ input
  input EN, // EN input
  input CLK_IN, // CLK_IN input
  output CLK_OUT, // CLK_OUT output
  output [WIDTH-1:0] Q, // data output
  output DATA_VALID, // DATA_VALID output
  output DPA_LOCK, // DPA_LOCK output
  output DPA_ERROR, // DPA_ERROR output
  input PLL_LOCK, // PLL lock input
  input PLL_CLK // PLL clock input
);

I_SERDES #(
  .DATA_RATE("SDR"), // Single or double data rate
  .WIDTH(4), // Width of Deserialization (3-10)
  .DPA_MODE("NONE") 
) inst (
  .D(D), // Data input (connect to input port, buffer or I_DELAY)
  .RST(RST), // Active-low asycnhronous reset
  .FIFO_RST(FIFO_RST), // FIFO reset
  .BITSLIP_ADJ(BITSLIP_ADJ), // BITSLIP_ADJ input
  .EN(EN), // EN input
  .CLK_IN(CLK_IN), // CLK_IN input
  .CLK_OUT(CLK_OUT), // CLK_OUT output
  .Q(Q), // data output
  .DATA_VALID(DATA_VALID), // DATA_VALID output
  .DPA_LOCK(DPA_LOCK), // DPA_LOCK output
  .DPA_ERROR(DPA_ERROR), // DPA_ERROR output
  .PLL_LOCK(PLL_LOCK), // PLL lock input
  .PLL_CLK(PLL_CLK) 
);

endmodule
