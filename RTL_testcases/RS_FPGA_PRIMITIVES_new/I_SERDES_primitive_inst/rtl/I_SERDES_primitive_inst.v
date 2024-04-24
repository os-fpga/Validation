module I_SERDES_primitive_inst #(
  parameter DATA_RATE = "SDR", // Single or double data rate
  parameter WIDTH = 4, // Width of Deserialization (3-10)
  parameter DPA_MODE = "NONE" // Select Dynamic Phase Alignment or Clock Data Recovery (NONE/DPA/CDR)
) (
  input data_in, // Data input (connect to input port, buffer or I_DELAY)
  input reset,
  input RX_RST, // Active-low asycnhronous reset
  input BITSLIP_ADJ, // BITSLIP_ADJ input
  input EN, // EN input data (input data is low when driven low)
  input CLK_IN, // Fabric clock input
  output CLK_OUT, // Fabric clock output
  output [WIDTH-1:0] Q, // Data output
  output DATA_VALID, // DATA_VALID output
  output DPA_LOCK, // DPA_LOCK output
  output DPA_ERROR, // DPA_ERROR output
  input PLL_LOCK, // PLL lock input
  input PLL_CLK // PLL clock input
);

reg dff;

I_SERDES #(
  .DATA_RATE("SDR"), // Single or double data rate
  .WIDTH(4), // Width of Deserialization (3-10)
  .DPA_MODE("NONE") 
) inst (
  .D(dff),
  .RX_RST(RX_RST),
  .BITSLIP_ADJ(BITSLIP_ADJ),
  .EN(EN),
  .CLK_IN(CLK_IN),
  .CLK_OUT(CLK_OUT),
  .Q(Q),
  .DATA_VALID(DATA_VALID),
  .DPA_LOCK(DPA_LOCK),
  .DPA_ERROR(DPA_ERROR),
  .PLL_LOCK(PLL_LOCK),
  .PLL_CLK(PLL_CLK)
);

  always @(negedge CLK_IN) begin
    if (reset) begin
        dff <= 0;
    end
    else
        dff <= data_in;
  end

endmodule
