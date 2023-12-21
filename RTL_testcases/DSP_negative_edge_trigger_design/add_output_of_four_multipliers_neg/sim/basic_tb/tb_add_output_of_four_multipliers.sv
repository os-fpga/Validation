`include "../../rtl/mult_unsigned.v"
`include "../../rtl/add_output_of_four_multipliers.v"
module tb_add_output_of_four_multipliers #(
    parameter INPUT_WIDTH = 14,
    parameter OUTPUT_WIDTH = 28
  ) ();
    reg clk, reset;
    reg [0:INPUT_WIDTH-1] a;
    reg [0:INPUT_WIDTH-1] b;
    wire [0:OUTPUT_WIDTH-1] y;

	initial clk=0;
	always #5 
	   clk=~clk;
	initial begin
		reset = 0;
		a=0;
		b=0;
		@(posedge clk);
		reset = 1;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%0b, clk=%0b, a=%0d, b=%0d, y=%0d",reset, clk, a, b, y);
		if (y == 0)
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; y value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		reset = 0;
		@(negedge clk);

		a = 0;
		b = 1;
		#50; 
		a = 5;
		b = 10;
		#50;
		a = 1;
		b = 1;
		#50;
		a = 2;
		b = 2;
		#50;
		a = 14'h3ff;
		b = 14'h3ff;
		#50;
		a = 3;
		b = 1;
		#50;
		a = 4;
		b = 6;
		#50;
		#100;
		$finish;
	end
	add_output_of_four_multipliers DUT(.clk(clk),. reset(reset),. a(a),. b(b),. y(y));

	initial begin
		$dumpfile("tb.vcd");
		$dumpvars;
	end

endmodule