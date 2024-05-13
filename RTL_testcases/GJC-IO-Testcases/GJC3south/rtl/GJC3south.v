/////////////////////////////////////////
//  Functionality: flop to flop path
//  Author:        George Chen
////////////////////////////////////////
// `timescale 1ns / 1ps


module flop1( clk, din, q1 );
   input din;
   input clk;
   output reg q1;
   
always @(posedge clk)
    begin
      q1 <= din ;
	end

endmodule // flop1

module flop2( clk, q1, dout );
   input clk;

   input q1;
   output reg dout;
   
   
always @(posedge clk)
    begin
      dout <= q1 ;
	end

endmodule // flop2

module GJC3south(
  input din,
  output dout,
  input clk);

  wire q1;

   flop1 u1 (.clk(clk), .din(din), .q1(q1) );
   flop2 u2 (.clk(clk), .q1(q1), .dout(dout) );

endmodule