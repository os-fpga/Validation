module primitive_example_design_14 
  #(parameter WIDTH = 4)(
  input clk_in,
  input reset,
  input i1,
  input i2,
  output reg [WIDTH-1:0] data_out,
  input RX_RST,
  input BITSLIP_ADJ,
  output CLK_OUT,
  output DATA_VALID,
  output DPA_LOCK,
  output DPA_ERROR,
  input PLL_CLK
);

wire data_in;
reg [WIDTH-1:0] data_out_flop;
reg enable, pll_lock;

I_SERDES inst(
.D(data_in),
.RST(RX_RST),
.BITSLIP_ADJ(BITSLIP_ADJ),
.EN(enable),
.CLK_IN(clk_in),
.CLK_OUT(CLK_OUT),
.Q(data_out_flop),
.DATA_VALID(DATA_VALID),
.DPA_LOCK(DPA_LOCK),
.DPA_ERROR(DPA_ERROR),
.PLL_LOCK(pll_lock),
.PLL_CLK(PLL_CLK)
);

assign data_in = i1*i2; 

always @ (posedge clk_in or negedge reset)
  begin
  if(!reset) begin
   enable <= 1'b0;
   pll_lock <= 1'b0;
  end 
  else begin
  enable <= 1'b1;
  pll_lock <= 1'b1;
  end
 end

always @ (posedge clk_in or negedge reset)
 begin
  if(!reset)
    data_out <= 0;
  else 
    data_out <= data_out_flop;
 end

endmodule