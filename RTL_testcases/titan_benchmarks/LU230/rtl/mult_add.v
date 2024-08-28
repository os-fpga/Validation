module mult_add (clk, A, B, C, mult_result, add_result);

parameter PRECISION = 32;

input clk;
input [PRECISION-1:0] A, B, C;
output [PRECISION-1:0] mult_result, add_result;

reg [PRECISION-1:0] out;
wire [PRECISION-1:0] mult_comp_result;
reg [PRECISION-1:0] add_a, add_b;

	multsplat11 mult_comp (
		.clock (clk),
		.dataa (A),
		.datab (B),
		.result (mult_comp_result));
	
	subsplat14 adder_comp (
		.clock (clk),
		.dataa (add_a),
		.datab (add_b),
		.result (add_result));

	always @ (posedge clk)
	begin
		add_a <= C;
		add_b <= mult_comp_result;
	end
	
	assign mult_result = mult_comp_result;

endmodule
