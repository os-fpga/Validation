module I_SERDES_primitive_inst #(
  parameter DATA_RATE = "SDR", // Single or double data rate
  parameter WIDTH = 4, // Width of Deserialization (3-10)
  parameter DPA_MODE = "NONE" // Select Dynamic Phase Alignment or Clock Data Recovery (NONE/DPA/CDR)
) (
  input data_in, // Data input (connect to input port, buffer or I_DELAY)
  input reset,
  input BITSLIP_ADJ, // BITSLIP_ADJ input
  input EN, // EN input data (input data is low when driven low)
  input CLK_IN, // Fabric clock input
  output CLK_OUT, // Fabric clock output
  output [WIDTH-1:0] Q, // Data output
  output DATA_VALID, // DATA_VALID output
  output DPA_LOCK, // DPA_LOCK output
  output DPA_ERROR // DPA_ERROR output
);

reg [WIDTH-1:0] dff;
wire [WIDTH-1:0] i_serdes_out;
wire pll_lock;
wire pll_clk;
wire clk_pll_in;

I_SERDES #(
  .DATA_RATE("SDR"), // Single or double data rate
  .WIDTH(4), // Width of Deserialization (3-10)
  .DPA_MODE("NONE") 
) inst (
  .D(data_in),
  .RST(reset),
  .BITSLIP_ADJ(BITSLIP_ADJ),
  .EN(EN),
  .CLK_IN(CLK_IN),
  .CLK_OUT(CLK_OUT),
  .Q(i_serdes_out),
  .DATA_VALID(DATA_VALID),
  .DPA_LOCK(DPA_LOCK),
  .DPA_ERROR(DPA_ERROR),
  .PLL_LOCK(pll_lock),
  .PLL_CLK(pll_clk)
);

  PLL #(.PLL_MULT(50), .PLL_DIV(1), .PLL_POST_DIV(17)) clk_pll_gen0 (
    .PLL_EN(1'b1),
    .CLK_IN(clk_pll_in),
    .CLK_OUT(pll_clk),
    .LOCK(pll_lock)
  );

  BOOT_CLOCK boot_clk_inst (clk_pll_in);

  always @(negedge CLK_IN or negedge reset) begin
    if (!reset) begin
        dff <= 0;
    end
    else
        dff <= i_serdes_out;
  end

  assign Q = dff;

endmodule
