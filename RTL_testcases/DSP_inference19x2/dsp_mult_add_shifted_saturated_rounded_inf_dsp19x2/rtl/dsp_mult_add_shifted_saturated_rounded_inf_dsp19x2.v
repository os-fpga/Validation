module dsp_mult_add_shifted_saturated_rounded_inf_dsp19x2 (clk, reset, subtract, round, saturate, A1, A2, B1, B2, shift_right, P);
	input clk, reset, subtract, round, saturate;
	input [9:0] A1, A2;
	input [8:0] B1, B2;
	input [4:0] shift_right;
	output [37:0] P;
	reg [4:0] shift_right_reg;
	reg [63:0] P_shifted;
	reg [63:0] P_saturated;
	reg [63:0] P_rounded;
	reg [9:0] i1, i3;
	reg [8:0] i2, i4;
	reg [63:0] add_or_sub, mul;

	always @(posedge clk, negedge reset) begin
		if(reset == 0) begin
			i1 <= 0;
			i2 <= 0;
			i3 <= 0;
			i4 <= 0;
			shift_right_reg <= 0;
		end
		else begin
			i1 <= A1;
			i2 <= B1;
			i3 <= A2;
			i4 <= B2;
			shift_right_reg <= shift_right;
		end
	end
	
		always @ (posedge clk)  begin
		mul[31:0] = i1 * i2;
		mul[63:32] = i3 * i4;
	end

	always @ (posedge clk)  begin
		if (subtract) begin
			add_or_sub[63:32] = 0 - $signed(mul[63:32]);
			add_or_sub[31:0] = 0 - $signed(mul[31:0]);
		end
		else begin
			add_or_sub[63:32] = 0 - $signed(mul[63:32]);
			add_or_sub[31:0] = 0 - $signed(mul[31:0]);
		end
	end

	always @(posedge clk) begin
		P_shifted[31:0] <=  add_or_sub[31:0] >> shift_right_reg;
		P_shifted[63:32] <= add_or_sub[63:32] >> shift_right_reg;
	end

	always @ (posedge clk)  begin
		if (round) begin
			if (add_or_sub[shift_right -1]==1) begin
			P_rounded[31:0] <= P_shifted[31:0] + 1'b1;
			end
			if (add_or_sub[(shift_right + 32) -1]==1) begin 
			P_rounded[63:32] <= P_shifted[63:32] + 1'b1;
			end
			else begin
			 P_rounded[63:32] <= P_shifted[31:0];
		     P_rounded[31:0] <=  P_shifted[63:32];
			end
		end
		else begin
			P_rounded[63:32] <= P_shifted[31:0];
			P_rounded[31:0] <=  P_shifted[63:32];
		end
	end

	always @ (posedge clk)  begin
		if (saturate) begin
			if ($signed(P_rounded[31:0]) >= 19'h7ffff) begin //Saturation overflow logic
			P_saturated = 19'h7ffff;
			end
			if ($signed(P_rounded[63:0]) >= 19'h7ffff) begin //Saturation overflow logic
				P_saturated = 19'h7ffff;
			end
			if ($signed(P_rounded[31:0]) < 19'h0) begin //Saturation overflow logic
			P_saturated = 19'h0;
			end
			if ($signed(P_rounded[63:0]) >= 19'h0) begin //Saturation overflow logic
				P_saturated = 19'h0;
			end
			else begin
				P_saturated[63:32] = P_rounded[31:0];
				P_saturated[31:0] =  P_rounded[63:32];
			end
		end
		else begin
			P_saturated[63:32] = P_rounded[31:0];
			P_saturated[31:0] =  P_rounded[63:32];
		end
	end

	assign P = {P_saturated[50:32],P_saturated[18:0]};


endmodule