module primitive_example_design_13 (
  input clk_in,
  input pll_clk,
  input reset,
  input [3:0]i1,
  input [3:0]i2,
  input load_word,
  input channel_bond_sync_in,
  output wire data_out,
  output wire CHANNEL_BOND_SYNC_OUT
);

reg [3:0] data_in;
reg data_out_flop;
reg output_enable, pll_lock,out_tri_en,channel_sync_out_wire;
wire out_tri_en_ofab;

O_SERDES #(
  .DATA_RATE("SDR"), // Single or double data rate (SDR/DDR)
  .WIDTH(4) // Width of input data to serializer (3-10)
) inst(
.D(data_in), // D input bus
.RST(reset), // Active-low, asynchronous reset
.DATA_VALID(load_word), // Load word input
.CLK_IN(clk_in), // Fabric clock input
.OE_IN(output_enable), // Output tri-state enable input
.OE_OUT(out_tri_en), // Output tri-state enable output (conttect to O_BUFT or inferred tri-state signal)
.Q(data_out_flop), // Data output (Connect to output port, buffer or O_DELAY)
.CHANNEL_BOND_SYNC_IN(channel_bond_sync_in), // Channel bond sync input
.CHANNEL_BOND_SYNC_OUT(channel_sync_out_wire), // Channel bond sync output
.PLL_LOCK(pll_lock), // PLL lock input
.PLL_CLK(pll_clk) // PLL clock input
);

O_BUF inst_o_buf (
  .I(channel_sync_out_wire),
  .O(CHANNEL_BOND_SYNC_OUT)
);
assign data_in = i1+i2; 
// O_FAB o_fab_inst (
//   .I(out_tri_en),
//   .O(out_tri_en_ofab)
// );
O_BUFT inst_o_buft (
      .I(data_out_flop), // Data input
      .T(out_tri_en), // Tri-state output
      .O(data_out) // Data output (connect to top-level port)
  );
always @ (posedge clk_in or negedge reset)
  begin
  if(!reset) begin
   output_enable <= 1'b0;
   pll_lock <= 1'b0;
  end 
  else begin
  output_enable <= 1'b1;
  pll_lock <= 1'b1;
  end
 end


endmodule
