module primitive_example_design_12 (
  input pll_en,
  input latch_en1,latch_en2,
  input clk,reset,
  output clk_out0,
  output clk_out1,
  output clk_out2,
  output clk_out3,
  output serdes_fast_clk,
  output [31:0] lock_out
);

  PLL pll_inst (
  .PLL_EN(pll_en_w),
  .CLK_IN(clk),
  .CLK_OUT(clk_out0_w),
  .CLK_OUT_DIV2(clk_out1_w),
  .CLK_OUT_DIV3(clk_out2_w),
  .CLK_OUT_DIV4(clk_out3_w),
  .FAST_CLK(serdes_fast_clk_w),
  .LOCK(lock_w)
);
  
  latch latch_inst (.d(pll_en),.en(latch_en1),.q(pll_en_w));

  register reg_inst5 (.d(lock_w),.clk(clk),.rst(reset),.q(lock_ww));

  assign lock_case = lock_ww ? 1'b0 : 1'b1; 

  O_BUF obuf_inst1 (.I(clk_out0_w),.O(clk_out0));
  O_BUF obuf_inst2 (.I(clk_out1_w),.O(clk_out1));
  O_BUF obuf_inst3 (.I(clk_out2_w),.O(clk_out2));
  O_BUF obuf_inst4 (.I(clk_out3_w),.O(clk_out3));
  O_BUF obuf_inst5 (.I(serdes_fast_clk_w),.O(serdes_fast_clk));
  
  latch latch_inst2 (.d(lock_case),.en(latch_en2),.q(lock));

  always @ (posedge clk or negedge reset) begin
    if (reset)
      lock_out <= 32'b0;
    else
      lock_out <= {lock_out[30:0],lock_case};
  end
endmodule

module register #(parameter WIDTH=1) (d,clk,rst,q);
    input clk;
    input rst;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(posedge clk) begin
        if (rst)
          q = 0;
        else 
          q = d;
    end
endmodule

module latch #(parameter WIDTH=1) (d,en,q);
    input en;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(*) begin
        if (en) 
          q = d;
    end
endmodule
