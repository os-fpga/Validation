module primitive_example_design_12 (
  input pll_en,
  input latch_en1,latch_en2,
  input clk,reset,
  input clk_out0_en,
  input clk_out1_en,
  input clk_out2_en,
  input clk_out3_en,
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
    .CLK_OUT0_EN(clk_out0_en_w),
    .CLK_OUT1_EN(clk_out1_en_w),
    .CLK_OUT2_EN(clk_out2_en_w),
    .CLK_OUT3_EN(clk_out3_en_w),
    .CLK_OUT0(clk_out0_w),
    .CLK_OUT1(clk_out1_w),
    .CLK_OUT2(clk_out2_w),
    .CLK_OUT3(clk_out3_w),
    .SERDES_FAST_CLK(serdes_fast_clk_w),
    .LOCK(lock_w)
  );
  
  latch latch_inst (.d(pll_en),.en(latch_en1),.q(pll_en_w));

  register reg_inst1 (.d(clk_out0_en),.clk(clk),.rst(reset),.q(clk_out0_en_w));
  register reg_inst2 (.d(clk_out1_en),.clk(clk),.rst(reset),.q(clk_out1_en_w));
  register reg_inst3 (.d(clk_out2_en),.clk(clk),.rst(reset),.q(clk_out2_en_w));
  register reg_inst4 (.d(clk_out3_en),.clk(clk),.rst(reset),.q(clk_out3_en_w));
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
