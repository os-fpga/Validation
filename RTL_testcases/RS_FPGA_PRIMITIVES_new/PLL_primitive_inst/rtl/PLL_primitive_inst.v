module PLL_primitive_inst (
  input PLL_EN, // PLL Enable
  input CLK_IN, // Clock input
  input CLK_OUT0_EN, // Enable CLK_OUT0
  input CLK_OUT1_EN, // Enable CLK_OUT1
  input CLK_OUT2_EN, // Enable CLK_OUT2
  input CLK_OUT3_EN, // Enable CLK_OUT3
  output CLK_OUT0, // CLK_OUT0 output
  output CLK_OUT1, // CLK_OUT1 output
  output CLK_OUT2, // CLK_OUT2 output
  output CLK_OUT3, // CLK_OUT3 output
  output SERDES_FAST_CLK, // Gearbox fast clock output
  output LOCK // PLL lock signal
);

PLL inst (
  .PLL_EN(PLL_EN), // PLL Enable
  .CLK_IN(CLK_IN), // Clock input
  .CLK_OUT0_EN(CLK_OUT0_EN), // Enable CLK_OUT0
  .CLK_OUT1_EN(CLK_OUT1_EN), // Enable CLK_OUT1
  .CLK_OUT2_EN(CLK_OUT2_EN), // Enable CLK_OUT2
  .CLK_OUT3_EN(CLK_OUT3_EN), // Enable CLK_OUT3
  .CLK_OUT0(CLK_OUT0), // CLK_OUT0 output
  .CLK_OUT1(CLK_OUT1), // CLK_OUT1 output
  .CLK_OUT2(CLK_OUT2), // CLK_OUT2 output
  .CLK_OUT3(CLK_OUT3), // CLK_OUT3 output
  .SERDES_FAST_CLK(SERDES_FAST_CLK), // Gearbox fast clock output
  .LOCK(LOCK) 
);
endmodule