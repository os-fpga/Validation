module dsp_mult_accum_input_output_not_registered_inf_dsp19x2 (clk, reset, subtract, A1, A2, B1, B2, P);
	input clk, reset, subtract;
	input  [9:0] A1;
	input  [9:0] A2;
	input  [8:0] B1;
	input  [8:0] B2;
	output [37:0] P;
	reg    [31:0] mult1, mult2;
	reg    [63:0] add_or_sub;

	always @ (posedge clk, negedge reset)  begin
		if(reset == 0) begin
		mult1 <= 0;
		mult2 <=  0;	
		end
		else begin
		mult1 <= A1*B1;
		mult2 <= A2*B2;
		end
	end

	always @ (posedge clk, negedge reset)  begin
		if(reset == 1) begin
			if (subtract)
				add_or_sub = {(add_or_sub[63:0] - mult2),(add_or_sub[31:0] - mult1)};
			else
				add_or_sub = {(add_or_sub[63:0] - mult2),(add_or_sub[31:0] - mult1)};
		end
		else begin
			add_or_sub = 0;
		end
	end

	assign P = {add_or_sub[50:32],add_or_sub[18:0]};

		
endmodule