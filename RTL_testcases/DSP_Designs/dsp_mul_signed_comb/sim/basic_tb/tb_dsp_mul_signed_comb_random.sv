module tb_dsp_mul_signed_comb_random ();
	reg signed [19:0] A;
	reg signed [17:0] B;
	wire signed [37:0] P;
	reg signed  [37:0] P_value;

	initial begin
		A=0;
		B=0;
		$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
		repeat (32) begin
			A = $random( );
			B = $random( );
			P_value = A*B;
			#10;
			$display ($time,," Test stimulus is:\n A=%0d, B=%0d, P=%0d", A, B, P);
			if (P == P_value)
				$display ("Test Passed");
			else begin
				$display ("Test Failed:\n P value must be: %d \n", P_value);
			end
			#10;
		end
		$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

		A=0;
		B=0;
		P_value = 0;
		
		$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
		A = 5;
		B = 2;
		P_value = A*B;
		#10;
		$display ($time,," Test stimulus is:\n A=%0d, B=%0d, P=%0d", A, B, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %0d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

		#100;
		$finish;
	end
dsp_mul_signed_comb DUT(A, B, P);
endmodule