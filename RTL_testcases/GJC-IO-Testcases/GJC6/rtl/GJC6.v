/////////////////////////////////////////
//  Functionality: flop to flop path
//  Author:        George Chen
////////////////////////////////////////
// `timescale 1ns / 1ps


module GJC6(
		 din,
		 oe,
		 tristate_out,
		 clk);

   input din;
   input clk;
   input oe;
   output tristate_out;

   reg q1=0;
   reg q2=0;

always @(posedge clk)
    begin
      q1 <= din ;
	end

always @(posedge clk)
    begin 
	    q2 <= q1 ;
    end


assign tristate_out = oe ? q2 : 1'bz ;
   
endmodule
