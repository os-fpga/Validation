`timescale 1ns / 1ps
`ifndef TESTBENC
  `define size 32
`endif

module bit32_up_counter (clk1,clk2,clk3,clk4,counter1,counter2,counter3,counter4,rst);

  input clk1,clk2,clk3,clk4;
  input rst;
  output [`size-1:0] counter1,counter2,counter3,counter4;

  counter counter1_dut(.clk(clk1),.rst(rst),.q(counter1));
  counter counter2_dut(.clk(clk2),.rst(rst),.q(counter2));
  counter counter3_dut(.clk(clk3),.rst(rst),.q(counter3));
  counter counter4_dut(.clk(clk4),.rst(rst),.q(counter4));

endmodule 

module counter (clk, q, rst);

  input clk;
  input rst;
  output reg [`size-1:0] q;
  
  always @ (posedge clk)
    begin
        if(rst)
    q <= 32'b00000000000000000000000000000000;
    else
    q <= q + 1;
  end

endmodule 


