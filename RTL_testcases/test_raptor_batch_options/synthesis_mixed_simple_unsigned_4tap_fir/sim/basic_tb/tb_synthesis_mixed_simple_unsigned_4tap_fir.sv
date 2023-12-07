`include "../../rtl/mult_unsigned.v"
`include "../../rtl/dff.v"
`include "../../rtl/synthesis_mixed_simple_unsigned_4tap_fir.v"
module tb_synthesis_mixed_simple_unsigned_4tap_fir #(
    parameter INPUT_WIDTH = 14,
    parameter OUTPUT_WIDTH = 28
  ) ();
    reg clk, reset;
    reg [0:INPUT_WIDTH-1] x;
    wire [0:OUTPUT_WIDTH-1] y;

	initial clk=0;
	always #5 
	   clk=~clk;
	initial begin
		reset = 0;
		x=0;
		@(posedge clk);
		reset = 1;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%0b, clk=%0b, x=%0d, y=%0d",reset, clk, x, y);
		if (y == 0)
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		reset = 0;
		@(negedge clk);

		x = 0; #50;  
		x = 1; #50; 
		x = 2; #50;  
		x = 3; #50;  
		x = 4; #50; 
		x = 5; #50; 
		x = 6; #50;  
		x = 7; #50; 
		x = 8; #50;  
		x = 9; #50;  

		#100;
		$finish;
	end
	simple_unsigned_4tap_fir DUT(.clk(clk),. reset(reset),. x(x),. y(y));

	initial begin
		$dumpfile("tb2.vcd");
		$dumpvars;
	end

endmodule