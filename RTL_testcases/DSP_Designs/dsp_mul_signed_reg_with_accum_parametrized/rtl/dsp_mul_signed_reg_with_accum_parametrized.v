module dsp_mul_signed_reg_with_accum_parametrized #(parameter A_WIDTH = 32, B_WIDTH = 32) (clk, reset, subtract_i, A, B, P);
	input clk, reset, subtract_i;
	input signed [A_WIDTH-1:0] A;
	input signed [B_WIDTH-1:0] B;
	output reg signed [A_WIDTH + B_WIDTH-1 :0] P;
	reg signed [A_WIDTH-1:0] i1;
	reg signed [B_WIDTH-1:0] i2;
	reg signed [A_WIDTH + B_WIDTH-1 :0] mul, add_or_sub;
	always @(posedge clk) begin
		if(reset == 1) begin
			i1 <= 0;
			i2 <= 0;
		end
		else begin
			i1 <= A;
			i2 <= B;
		end
	end
	always @(posedge clk) begin
		if (reset ==1 )
			P <= 0;
		else 
			P<= add_or_sub;

	end

	always @ (*)  begin
		mul  = i1 * i2;
	end

	always @ (*)  begin
		if (subtract_i)
			add_or_sub = P - mul;
		else
			add_or_sub = P + mul;
	end
endmodule