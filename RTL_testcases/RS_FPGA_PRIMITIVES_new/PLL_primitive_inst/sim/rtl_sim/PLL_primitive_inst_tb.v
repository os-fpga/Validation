`timescale 1ns/1ps

module PLL_primitive_inst_tb;

  reg  PLL_EN;
  reg  CLK_IN;
  wire  CLK_OUT;
  wire  CLK_OUT_DIV2;
  wire  CLK_OUT_DIV3;
  wire  CLK_OUT_DIV4;
  wire  SERDES_FAST_CLK;
  wire  LOCK;

  PLL_primitive_inst  PLL_primitive_inst_inst (
    .PLL_EN(PLL_EN),
    .CLK_IN(CLK_IN),
    .CLK_OUT(CLK_OUT),
    .CLK_OUT_DIV2(CLK_OUT_DIV2),
    .CLK_OUT_DIV3(CLK_OUT_DIV3),
    .CLK_OUT_DIV4(CLK_OUT_DIV4),
    .SERDES_FAST_CLK(SERDES_FAST_CLK),
    .LOCK(LOCK)
  );

always #1  CLK_IN = ! CLK_IN;

initial begin
  CLK_IN = 0;
  PLL_EN = 0;

  #10;
  PLL_EN = 1;

  #10;
  PLL_EN = 0;

  #10;
  PLL_EN = 1;
  #20;
  PLL_EN = 0;
  #20;
  PLL_EN = 1;

  #100;

  $finish;
end

initial begin
  $dumpfile("wave.vcd");
  $dumpvars;
end

endmodule

