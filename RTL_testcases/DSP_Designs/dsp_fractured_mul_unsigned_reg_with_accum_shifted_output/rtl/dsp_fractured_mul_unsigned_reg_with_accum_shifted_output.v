module dsp_fractured_mul_unsigned_reg_with_accum_shifted_output (clk, reset, subtract_i, A, A_fmode, B, B_fmode, shift_right_i, P);
	input clk, reset, subtract_i;
	input [9:0] A, A_fmode;
	input [8:0] B, B_fmode;
	input [5:0] shift_right_i;
	output reg [37:0] P;
	reg [5:0] shift_right_i_reg;
	reg [18:0] P_f1, P_f2;
	reg [9:0] i1, i1_fmode;
	reg [8:0] i2, i2_fmode;
	reg [18:0] add_or_sub, add_or_sub_fmode, mul_f1, mul_f2;
	always @(posedge clk) begin
		if(reset == 1) begin
			i1 <= 0;
			i2 <= 0;
			i1_fmode <= 0;
			i2_fmode <= 0;
			shift_right_i_reg <= 0;
		end
		else begin
			i1 <= A;
			i2 <= B;
			i1_fmode <= A_fmode;
			i2_fmode <= B_fmode;
			shift_right_i_reg <= shift_right_i;
		end
	end
	always @(posedge clk) begin
		if (reset ==1 ) begin
			P <= 0;
			P_f1 <= 0;
			P_f2 <= 0;
		end
		else begin
			P_f1 <= add_or_sub >> shift_right_i_reg;
			P_f2 <= add_or_sub_fmode >> shift_right_i_reg;
			P <= {P_f1, P_f2};
		end

	end

	always @ (*)  begin
		mul_f1 = i1 * i2;
		mul_f2 = i1_fmode * i2_fmode;
	end

	always @ (*)  begin
		if (subtract_i) begin
			add_or_sub = P_f1 - mul_f1;
			add_or_sub_fmode = P_f2 - mul_f2;
		end
		else begin
			add_or_sub = P_f1 + mul_f1;
			add_or_sub_fmode = P_f2 + mul_f2;
		end
	end
endmodule