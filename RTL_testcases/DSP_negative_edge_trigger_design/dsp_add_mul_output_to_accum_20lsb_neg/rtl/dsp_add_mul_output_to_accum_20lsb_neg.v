module dsp_add_mul_output_to_accum_20lsb_neg (clk, reset, A, B, P);
	input clk, reset;
	input signed [19:0] A;
	input signed [17:0] B;
	output reg signed [37:0] P;
	reg signed [19:0] i1;
	reg signed [17:0] i2;
	reg signed [37:0] mul, adder;
	always @(negedge clk) begin
		if(reset == 1) begin
			i1 <= 0;
			i2 <= 0;
		end
		else begin
			i1 <= A;
			i2 <= B;
		end
	end
	always @(negedge clk) begin
		if (reset ==1 )
			P <= 0;
		else 
			P<= adder;

	end

	always @ (*)  begin
		mul  = i1 * i2;
	end

	always @ (*)  begin
			adder = adder + mul;
	end
endmodule