module primitive_example_design_14 
  #(parameter WIDTH = 4)(
  input clk_in,
  input reset,
  input i1,
  input [WIDTH-1:0] i2,
  output reg [WIDTH-1:0] data_out,
  input BITSLIP_ADJ,
  output CLK_OUT,
  output DATA_VALID,
  output DPA_LOCK,
  output DPA_ERROR,
  input PLL_CLK
);

reg [WIDTH-1:0] data_out_flop;
reg enable, pll_lock;
wire i1_ibuf;
reg [WIDTH-1:0] dff_out;

I_BUF i_buf_inst1 (.I(clk_in),.EN(en),.O(clk_in_ibuf));
I_BUF i_buf_inst2 (.I(i1),.EN(en),.O(i1_ibuf));
CLK_BUF clk_buf_inst (.I(clk_in_ibuf), .O(clk_in_clkbuf));

I_SERDES inst(
.D(i1_ibuf),
.RST(reset),
.BITSLIP_ADJ(BITSLIP_ADJ),
.EN(enable),
.CLK_IN(clk_in_clkbuf),
.CLK_OUT(CLK_OUT),
.Q(data_out_flop),
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

assign data_out = (dff_out + i2) * (dff_out - i2); 

always @ (posedge clk_in_clkbuf or negedge reset)
  begin
  if(!reset) begin
   enable <= 1'b0;
  end 
  else begin
  enable <= 1'b1;
  end
 end

always @ (posedge clk_in_clkbuf or negedge reset)
 begin
  if(!reset)
    dff_out <= 0;
  else 
    dff_out <= data_out_flop;
 end

endmodule