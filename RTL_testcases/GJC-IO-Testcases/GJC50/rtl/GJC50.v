//***********************************************************
// Functionality: dff and multiply with i_serdes using a pll clock dividers 
// Author:        Zaheer Ahmad 
//***********************************************************

module GJC50 #(parameter WIDTH = 4) (
  input wire clk_in,
  input wire reset,
  input wire enable,
  input wire i1,
  input wire [WIDTH-1:0] i2,
  output reg [WIDTH-1:0] data_out,
  input wire bitslip_adj,
  output wire dpa_loc,
  output wire dpa_err
  );

  wire data_in;
  reg [WIDTH-1:0] data_out_flop;
  wire pll_lock;
  wire reset_ibuf;
  wire clk_in_clkbuf;
  wire clk_in_ibuf;
  wire d_valid;
  wire dpa_err_out;
  wire i1_ibuf;
  wire [WIDTH-1:0] i2_ibuf;
  wire bitslip_adj_ibuf;
  wire iserder_clk_out;
  wire clk_pll_in;
  wire dpa_loc_out;
  wire pll_clk;
  reg dpa_loc_obuf,dpa_err_out_obuf;
  wire en;
  wire [WIDTH-1:0] q_out;
  wire enable_ibuf;

  assign en = 1;

  I_BUF i_buf_inst1 (.I(clk_in),.EN(en),.O(clk_in_ibuf));
  I_BUF i_buf_inst2 (.I(reset),.EN(en),.O(reset_ibuf));
  I_BUF i_buf_inst3 (.I(i1),.EN(en),.O(i1_ibuf));
  I_BUF i_buf_inst4 (.I(i2[0]),.EN(en),.O(i2_ibuf[0]));
  I_BUF i_buf_inst7 (.I(i2[1]),.EN(en),.O(i2_ibuf[1]));
  I_BUF i_buf_inst8 (.I(i2[2]),.EN(en),.O(i2_ibuf[2]));
  I_BUF i_buf_inst9 (.I(i2[3]),.EN(en),.O(i2_ibuf[3]));
  I_BUF i_buf_inst5 (.I(bitslip_adj),.EN(en),.O(bitslip_adj_ibuf));
  I_BUF i_buf_inst6 (.I(enable),.EN(en),.O(enable_ibuf));

  CLK_BUF clk_buf_inst (.I(clk_in_ibuf), .O(clk_in_clkbuf));

  I_SERDES inst(
    .D(i1_ibuf),
    .RST(reset_ibuf),
    .BITSLIP_ADJ(bitslip_adj_ibuf),
    .EN(enable_ibuf),
    .CLK_IN(clk_in_clkbuf),
    .CLK_OUT(iserder_clk_out),
    .Q(q_out),
    .DATA_VALID(d_valid),
    .DPA_LOCK(dpa_loc_out),
    .DPA_ERROR(dpa_err_out),
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

  O_BUF data_o_buffer0 (.I(dpa_loc_obuf), .O(dpa_loc));
  O_BUF data_o_buffer1 (.I(dpa_err_out_obuf), .O(dpa_err));

  assign data_out_flop = q_out * i2_ibuf; 

  always @ (posedge clk_in_clkbuf or negedge reset_ibuf)
  begin
  if(!reset_ibuf) begin
    dpa_err_out_obuf <= 1'b0;
  end 
  else begin
    dpa_err_out_obuf <= dpa_err_out;
  end
  end

  always @ (posedge clk_in_clkbuf or negedge reset_ibuf)
  begin
  if(!reset_ibuf)begin
    dpa_loc_obuf <= 1'b0;
  end
  else begin
    dpa_loc_obuf <= dpa_loc_out;
  end
  end

  always @ (posedge iserder_clk_out or negedge reset_ibuf)
  begin
  if(!reset_ibuf)
    data_out <= 4'b0;
  else if (d_valid) 
    data_out <= data_out_flop;
  end

endmodule