//***********************************************************
// Functionality: dff and adder with o_serdes using a pll clock divider
// Author:        Zaheer Ahmad 
//***********************************************************

module GJC49 #(parameter WIDTH = 4) (
  input clk_in,
  input reset,
  input [WIDTH-1:0] i1,
  input [WIDTH-1:0] i2,
  input load_word,
  input channel_bond_sync_in,
  input s,
  output wire data_out,
  output wire CHANNEL_BOND_SYNC_OUT
);

  wire pll_clk,out_en;
  reg [WIDTH-1:0] data_in;
  reg data_out_buf;
  reg output_enable;
  wire pll_lock;
  wire channel_sync_out_wire;
  reg data_out_dff;
  wire clk_in_ibuf;
  wire reset_ibuf;
  wire load_word_ibuf;
  wire channel_bond_sync_in_ibuf;
  reg channel_bond_sync_in_ibuf_flop;
  wire pll_clk_d3;
  wire clk_pll_in;
  wire clk_in_clkbuf;
  wire reset_ibuf_n;
  wire load_word_ibuf_n;
  wire en;

  assign en = 1;

  I_BUF i_buf_inst1 (.I(clk_in),.EN(en),.O(clk_in_ibuf));
  I_BUF i_buf_inst2 (.I(reset),.EN(en),.O(reset_ibuf));
  I_BUF i_buf_inst3 (.I(load_word),.EN(en),.O(load_word_ibuf));
  I_BUF i_buf_inst4 (.I(channel_bond_sync_in),.EN(en),.O(channel_bond_sync_in_ibuf));

  CLK_BUF clk_buf_inst (.I(clk_in_ibuf), .O(clk_in_clkbuf));

  assign reset_ibuf_n = s ? reset_ibuf : ~reset_ibuf;
  assign load_word_ibuf_n = s ? load_word_ibuf : ~load_word_ibuf;

  O_SERDES #(
    .DATA_RATE("SDR"),
    .WIDTH(WIDTH)
  ) inst(
    .D(data_in),
    .RST(reset_ibuf_n),
    .DATA_VALID(load_word_ibuf_n),
    .CLK_IN(pll_clk_d3),
    .OE_IN(output_enable),
    .OE_OUT(out_en),
    .Q(data_out_buf),
    .CHANNEL_BOND_SYNC_IN(channel_bond_sync_in_ibuf_flop),
    .CHANNEL_BOND_SYNC_OUT(channel_sync_out_wire),
    .PLL_LOCK(pll_lock),
    .PLL_CLK(pll_clk)
  );

  PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(17)) pll_inst (
    .PLL_EN(en),
    .CLK_IN(clk_pll_in),
    .CLK_OUT(pll_clk),
    .CLK_OUT_DIV3(pll_clk_d3),
    .LOCK(pll_lock)
  );

  BOOT_CLOCK boot_clk_inst (clk_pll_in);

  O_BUF inst_o_buf (.I(channel_sync_out_wire),.O(CHANNEL_BOND_SYNC_OUT));

  assign data_in = i1+i2; 

  O_BUFT inst_o_buft (
    .I(data_out_buf),
    .T(out_en),
    .O(data_out)
  );

  always @ (posedge clk_in_clkbuf or negedge reset_ibuf_n)
  begin
    if(!reset_ibuf_n) begin
      output_enable <= 1'b0;
    end 
    else begin
      output_enable <= 1'b1;
    end
  end

  always @ (posedge clk_in_clkbuf or negedge reset_ibuf_n)
  begin
    if(!reset_ibuf_n) begin
      channel_bond_sync_in_ibuf_flop <= 1'b0;
    end 
    else begin
      channel_bond_sync_in_ibuf_flop <= channel_bond_sync_in_ibuf;
    end
  end

endmodule
