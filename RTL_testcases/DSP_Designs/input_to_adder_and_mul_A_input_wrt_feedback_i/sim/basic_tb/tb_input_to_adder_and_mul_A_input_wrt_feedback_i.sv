`include "../../rtl/input_to_adder_and_mul_A_input_wrt_feedback_i.v"
module tb_input_to_adder_and_mul_A_input_wrt_feedback_i ();
	reg signed [19:0] A;
	reg signed [17:0] B;
	reg signed [19:0] coef_0_i, coef_1_i, coef_2_i, coef_3_i;
	reg [2:0] feedback_i;
	reg [3:0] acc_fir;
	reg clk, reset, subtract_i ;
	wire signed [37:0] P;
	reg signed  [37:0] P_value;
	initial clk=0;
	always #5 
	   clk=~clk;
	initial begin
		reset = 0;
		A=0;
		B=0;
		coef_0_i = 0;
		coef_1_i = 0;
		coef_2_i = 0;
		coef_3_i = 0;
		acc_fir = 0;
		feedback_i = 0;
		subtract_i = 0;
		@(posedge clk);
		reset = 1;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d",reset, clk, A, B, P);
		if (P == 0)
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		reset = 0;
		subtract_i = 0;
		@(negedge clk);

		$display ("\n\n***Directed Functionality Test is applied for P = P + A*B ***\n\n");
		A = 5;
		B = 2;
		P_value = P + A*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

		$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P + A*B***\n\n");
		A = $random( );
		B = $random( );
		@(negedge clk);
		repeat (32) begin
			P_value = P + A*B;
			@(negedge clk);
			$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%d, B=%d, P=%d", reset, clk, A, B, P);
			if (P == P_value)
				$display ("Test Passed");
			else begin
				$display ("Test Failed:\n P value must be: %d \n", P_value);
			end
		end
		$display ("\n\n***Random Functionality Tests for P = P + A*B with signed inputs are ended***\n\n");

		reset =1;
		A=0;
		B=0;
		subtract_i = 1;
		P_value = 0;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d",reset, clk, A, B, P);
		if (P == 0 )
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		
		reset=0;
		@(negedge clk);
		@(negedge clk);
		$display ("\n\n***Reset Value is set zero again***\n\n");

		$display ("\n\n***Directed Functionality Test is applied for P = P - A*B ***\n\n");
		A = 5;
		B = 2;
		P_value = P - A*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for  P = P - A*B  is ended***\n\n");

		$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P - A*B***\n\n");
		A = $random( );
		B = $random( );
		@(negedge clk);
		repeat (32) begin
			P_value = P - A*B;
			@(negedge clk);
			$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%d, B=%d, P=%d", reset, clk, A, B, P);
			if (P == P_value)
				$display ("Test Passed");
			else begin
				$display ("Test Failed:\n P value must be: %d \n", P_value);
			end
		end
		$display ("\n\n***Random Functionality Tests for P = P - A*B with signed inputs are ended***\n\n");

		feedback_i = 3'd2;
		acc_fir = 1;
		reset =1;
		A=0;
		B=0;
		subtract_i = 0;
		P_value = 0;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d",reset, clk, A, B, P);
		if (P == 0 )
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		
		reset=0;
		@(negedge clk);
		@(negedge clk);
		$display ("\n\n***Reset Value is set zero again***\n\n");

		$display ("\n\n***Directed Functionality Test is applied for P = (A<<acc_fir) + A*B with feedback_i = 3'd2 and acc_fir = 1 ***\n\n");
		A = 5;
		B = 2;
		P_value = (A<<acc_fir) + A*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for  P = (A<<acc_fir) + A*B with feedback_i = 3'd2 and acc_fir = 1  is ended***\n\n");

		feedback_i = 3'd3;

		$display ("\n\n***Directed Functionality Test is applied for P = (A<<acc_fir) + P*B with feedback_i = 3'd3 and acc_fir = 1 ***\n\n");
		A = 5;
		B = 2;
		P_value = (A<<acc_fir) + P*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for  P = (A<<acc_fir) + P*B with feedback_i = 3'd3 and acc_fir = 1  is ended***\n\n");

		feedback_i = 3'd4;
		coef_0_i = 5;

		$display ("\n\n***Directed Functionality Test is applied for P = (A<<acc_fir) + coef_0_i*B with feedback_i = 3'd4 and acc_fir = 1 ***\n\n");
		A = 15;
		B = 12;
		P_value = (A<<acc_fir) + coef_0_i*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for  P = (A<<acc_fir) + coef_0_i*B with feedback_i = 3'd4 and acc_fir = 1  is ended***\n\n");
		
		subtract_i = 1;
		feedback_i = 3'd7;
		coef_3_i = 5;

		$display ("\n\n***Directed Functionality Test is applied for P = (A<<acc_fir) - coef_3_i*B with feedback_i = 3'd7 and acc_fir = 1 ***\n\n");
		A = 15;
		B = 12;
		P_value = (A<<acc_fir) - coef_3_i*B;
		@(negedge clk);
		@(negedge clk);
		$display ($time,," Test stimulus is:\n reset=%0b, clk=%0b, A=%0d, B=%0d, P=%0d", reset, clk, A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for  P = (A<<acc_fir) - coef_3_i*B with feedback_i = 3'd7 and acc_fir = 1  is ended***\n\n");
		#100;
		$finish;
	end
input_to_adder_and_mul_A_input_wrt_feedback_i DUT (clk, reset, subtract_i,feedback_i, coef_0_i, coef_1_i, coef_2_i, coef_3_i, acc_fir, A, B, P);
endmodule