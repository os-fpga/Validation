/////////////////////////////////////////
//  Functionality: flop to flop path
//  Author:        George Chen
////////////////////////////////////////
// `timescale 1ns / 1ps


module GJC1(
  din,
  dout,
  clk);

input din;
input clk;
output reg dout=0;

reg q1=0 ;


always @(posedge clk)
    begin
      q1 <= din ;
	end

always @(posedge clk)
    begin 
	    dout <= q1 ;
	end
		
endmodule
