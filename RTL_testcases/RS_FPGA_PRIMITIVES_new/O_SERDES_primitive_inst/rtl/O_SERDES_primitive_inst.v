
module O_SERDES_primitive_inst #(
  parameter DATA_RATE = "SDR", // Single or double data rate (SDR/DDR)
  parameter WIDTH = 4 // Width of input data to serializer (3-10)(
)(
  input reset,
  input [WIDTH-1:0] in, // D input bus
  input RST, // Active-low, asynchronous reset
  input DATA_VALID, // Load word input
  input CLK_IN, // Fabric clock input
  input OE_IN, // Output tri-state enable input
  output OE_OUT, // Output tri-state enable output (conttect to O_BUFT or inferred tri-state signal)
  output Q, // Data output (Connect to output port, buffer or O_DELAY)
  input CHANNEL_BOND_SYNC_IN, // Channel bond sync input
  output CHANNEL_BOND_SYNC_OUT, // Channel bond sync output
  input PLL_LOCK, // PLL lock input
  input PLL_CLK // PLL clock input
);

reg [WIDTH-1:0] dff;

O_SERDES inst (
  .D(dff),
  .RST(RST),
  .DATA_VALID(LOAD_WORD),
  .CLK_IN(CLK_IN),
  .OE_IN(OE_IN),
  .OE_OUT(OE_OUT),
  .Q(Q),
  .CHANNEL_BOND_SYNC_IN(CHANNEL_BOND_SYNC_IN),
  .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT),
  .PLL_LOCK(PLL_LOCK),
  .PLL_CLK(PLL_CLK) 
);

always @(negedge CLK_IN) begin
  if (reset) begin
    dff <= 0;
  end
    dff <= in;
end

endmodule
