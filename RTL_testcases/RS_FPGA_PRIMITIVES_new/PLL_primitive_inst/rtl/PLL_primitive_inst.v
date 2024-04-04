module PLL_primitive_inst (
  input PLL_EN, // PLL Enable
  input CLK_IN, // Clock input
  output reg CLK_OUT = 1'b0, // Output clock, frequency is CLK_IN_FREQ*PLL_MULT/PLL_DIV/PLL_POST_DIV
  output reg CLK_OUT_DIV2 = 1'b0, // CLK_OUT divided by 2 output
  output reg CLK_OUT_DIV3 = 1'b0, // CLK_OUT divided by 3 output
  output reg CLK_OUT_DIV4 = 1'b0, // CLK_OUT divided by 4 output
  output reg SERDES_FAST_CLK = 1'b0, // Gearbox fast clock output
  output reg LOCK = 1'b0 // PLL lock signal
);

wire pll_lock;

PLL inst (
  .PLL_EN(PLL_EN),
  .CLK_IN(CLK_IN),
  .CLK_OUT(CLK_OUT),
  .CLK_OUT_DIV2(CLK_OUT_DIV2),
  .CLK_OUT_DIV3(CLK_OUT_DIV3),
  .CLK_OUT_DIV4(CLK_OUT_DIV4),
  .SERDES_FAST_CLK(SERDES_FAST_CLK),
  .LOCK(pll_lock)
);


always @(negedge CLK_IN) begin
  if (reset) begin
    LOCK <= 0;
  end
    LOCK <= pll_lock;
end

endmodule