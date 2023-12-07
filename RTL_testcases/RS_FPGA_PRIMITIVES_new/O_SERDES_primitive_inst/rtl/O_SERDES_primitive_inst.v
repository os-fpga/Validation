
module O_SERDES_primitive_inst(
  input [3:0] D, // D input bus
  input RST, // Active-low, asynchronous reset
  input LOAD_WORD, // Load word input
  output OE, // Output enable output (Connect to T input of O_BUFT)
  input CLK_EN, // Clock enable input
  input CLK_IN, // Clock input
  output CLK_OUT, // Clock output
  output Q, // Data output (Connect to output port, buffer or O_DELAY)
  input CHANNEL_BOND_SYNC_IN, // Channel bond sync input
  output CHANNEL_BOND_SYNC_OUT, // channel bond sync output
  input PLL_LOCK, // PLL lock input
  input PLL_CLK // PLL clock input
);

O_SERDES inst (
  D, // D input bus
  RST, // Active-low, asynchronous reset
  LOAD_WORD, // Load word input
  OE, // Output enable output (Connect to T input of O_BUFT)
  CLK_EN, // Clock enable input
  CLK_IN, // Clock input
  CLK_OUT, // Clock output
  Q, // Data output (Connect to output port, buffer or O_DELAY)
  CHANNEL_BOND_SYNC_IN, // Channel bond sync input
  CHANNEL_BOND_SYNC_OUT, // channel bond sync output
  PLL_LOCK, // PLL lock input
  PLL_CLK 
);
endmodule
