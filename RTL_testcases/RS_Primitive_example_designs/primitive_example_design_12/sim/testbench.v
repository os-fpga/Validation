
module primitive_example_design_12_tb;

  //Ports
  reg  pll_en;
  reg  latch_en1;
  wire  latch_en2;
  reg  clk;
  wire  reset;
  // reg  clk_out0_en;
  // reg  clk_out1_en;
  // reg  clk_out2_en;
  // reg  clk_out3_en;
  wire  clk_out0;
  wire  clk_out1;
  wire  clk_out2;
  wire  clk_out3;
  wire  serdes_fast_clk;
  wire [31:0] lock_out;

  primitive_example_design_12  primitive_example_design_12_inst (
    .pll_en(pll_en),
    .latch_en1(latch_en1),
    .latch_en2(latch_en2),
    .clk(clk),
    .reset(reset),
    // .clk_out0_en(clk_out0_en),
    // .clk_out1_en(clk_out1_en),
    // .clk_out2_en(clk_out2_en),
    // .clk_out3_en(clk_out3_en),
    .clk_out0(clk_out0),
    .clk_out1(clk_out1),
    .clk_out2(clk_out2),
    .clk_out3(clk_out3),
    .serdes_fast_clk(serdes_fast_clk),
    .lock_out(lock_out)
  );

  always #1  clk = ! clk;

  initial begin
    clk = 0;
    latch_en1 = 0;
    latch_en2 = 0;
    pll_en = 0;
    reset = 1;

    #5;
    reset = 0;
    #10;
    pll_en = 1;
    latch_en1 = 1;
    latch_en2 = 1;

    #10;
    reset = 0;

    #15;
    reset = 1;

    #10;
    pll_en = 0;

    #10;

    #10;
    pll_en = 1;

    #100;

    $finish;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

endmodule 
