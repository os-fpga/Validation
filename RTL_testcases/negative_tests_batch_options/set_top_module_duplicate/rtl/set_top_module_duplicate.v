`include "accumulator.v"
module set_top_module_duplicate (A, B, P);
	input signed [19:0] A;
	input signed [17:0] B;
	output signed [37:0] P;

		assign P   = A * B;
endmodule