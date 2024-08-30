/////////////////////////////////////////
//  Functionality: flop to flop path
//  Author:        George Chen
////////////////////////////////////////
// `timescale 1ns / 1ps


module GJC2(
  din,
  dout,
  clk);

input din;
input clk;
output reg dout=0;

reg q1=0 ;
   reg q2=0 ;
   

always @(posedge clk)
    begin
      q1 <= din ;
	end

always @(posedge clk)
    begin
      q2 <= q1 ;
	end

always @(posedge clk)
    begin 
	    dout <= q2 ;
	end
		
endmodule
