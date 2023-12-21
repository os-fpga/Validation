module dsp_fractured_mul_signed_reg_with_accum (clk, reset, subtract_i, A, A_fmode, B, B_fmode, P);
	input clk, reset, subtract_i;
	input signed [9:0] A, A_fmode;
	input signed [8:0] B, B_fmode;
	output reg signed [37:0] P;
	reg signed [9:0] i1, i1_fmode;
	reg signed [8:0] i2, i2_fmode;
	reg signed [18:0] add_or_sub, add_or_sub_fmode, f1, f2;
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
			P <= {add_or_sub, add_or_sub_fmode};

	end

	always @ (*)  begin
		f1 = i1 * i2;
		f2 = i1_fmode * i2_fmode;
	end

	always @ (*)  begin
		if (subtract_i) begin
			add_or_sub = P - f1;
			add_or_sub_fmode = P - f2;
		end
		else begin
			add_or_sub = P + f1;
			add_or_sub_fmode = P + f2;
		end
	end
endmodule