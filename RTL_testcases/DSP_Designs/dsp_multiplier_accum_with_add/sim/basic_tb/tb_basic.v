`include "../../rtl/dsp_multiplier_accum_with_add.v"
module tb_basic ();
	reg signed [31:0] A,B,C,D;
	reg clk, reset, sel_c_or_p ;
	wire signed [63:0] P;
	integer P_value;
	initial clk=0;
	always #5 
	   clk=~clk;
	initial begin
		reset =1;
		A=0;
		B=0;
		C=0;
		D=0;
		sel_c_or_p=1;
		P_value = C + B*(A+D);
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == C + B*(A+D))
	       $display ("Test Passed");
		#1
		reset = 1;
		P_value = C + B*(A+D);
		@(posedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == 0 )
			$display ("Reset Test Passed");
		#1
		reset = 0;
		A = 1;
		B = 2;
		C = 3;
		D = 4;
		P_value = C + B*(A+D);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == C + B*(A+D))
			$display ("Test Passed");
		else begin
			$display ("Test Failed here P value must be: %d", P_value);
		end
		#1
		A = - 3;
		B = 4;
		P_value = C + B*(A+D);
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == C + B*(A+D))
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end
		#1
		C = 2;
		D = 8;
		P_value = C + B*(A+D);
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == C + B*(A+D))
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end
		#1
		sel_c_or_p=0;
		
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		P_value = P_value + B*(A+D);
		@(negedge clk);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end

		
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		P_value = P_value + B*(A+D);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		P_value = P_value + B*(A+D);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		P_value = P_value + B*(A+D);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed P value must be: %d", P_value);
		end
		#100;
		$finish;
	end
dsp_multiplier_accum_with_add DUT(clk, reset, sel_c_or_p, A, B, C, D, P);
endmodule