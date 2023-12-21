`include "../../rtl/dsp_multiplier_accum_with_add_and_sub.v"
module dsp_multiplier_accum_with_add_and_sub_random ();
	reg signed [29:0] A;
	reg signed [17:0] B;
	reg signed [47:0] C;
	reg signed [26:0] D;
	reg clk, reset, sel_c_or_p ;
	reg INMODE;
	reg ALUMODE;
	wire signed [47:0] P;
	reg signed  [47:0] P_value;
	initial clk=0;
	always #5 
	   clk=~clk;
	initial begin
		reset =1;
		sel_c_or_p=1;
		INMODE = 1'b0;
		ALUMODE = 1'b0;
		$display ("\n\n***Reset Test is applied***\n\n");
		@(posedge clk);
		@(posedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == 0)
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		reset = 0;
		@(negedge clk);

		$display ("\n\n*** Random Functionality Tests of output P with sel_p_or_c=1 are applied***\n\n");
		repeat (32) begin
			A = $random( );
			B = $random( );
			C = $random( );
			D = $random( );
			P_value = C - B*(A-D);
			@(negedge clk);
			@(negedge clk);
			$display ($time,," Test stimulus is:\n reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
			if (P == B*(A-D) -C)
				$display ("Test Passed");
			else begin
				$display ("Test Failed:\n P value must be: %d \n", P_value);
			end
		end

		$display ("\n\n***Random Functionality Tests of output P with sel_p_or_c=1 is ended***\n\n");

		reset =1;
		sel_c_or_p=1;
		A=0;
		B=0;
		C=0;
		D=0;
		$display ("\n\n***Reset Test is applied***\n\n");
		P_value = 0;
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == 0 )
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		

		#1
		reset=0;
		$display ("\n\n***Reset Value is set zero again***\n\n");


		$display ("\n\n***Directed Functionality Test of output P with sel_p_or_c=0 is applied***\n\n");
		sel_c_or_p=0;
		A = 5;
		B = 2;
		C = 3;
		D = 4;
		P_value = P_value - B*(A-D);
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test of output P with sel_p_or_c=0 is ended***\n\n");

		$display ("\n\n***Random Functionality Tests of output P with sel_p_or_c=0 are applied***\n\n");
		
		repeat (32) begin
			P_value = P_value - B*(A-D);
			A = $random( );
			B = $random( );
			C = $random( );
			D = $random( );
			@(negedge clk);
			$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
			if (P == P_value)
				$display ("Test Passed");
			else begin
				$display ("Test Failed:\n P value must be: %d \n", P_value);
			end
		end
		$display ("\n\n***Random Functionality Tests of output P with sel_p_or_c=0 are ended***\n\n");
		reset =1;
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		$display ("\n\n***Reset Test is applied***\n\n");
		P_value = 0;
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == 0 )
			$display ("Reset Test Passed");
		else begin
			$display ("Reset Test Failed; P value must be: 0 \n ");
		end
		$display ("\n\n***Reset Test is ended***\n\n");
		
		#1
		reset=0;
		$display ("\n\n***Reset Value is set zero again***\n\n");
		$display ("\n\n***Directed Functionality Test of output P with sel_p_or_c=1 is applied***\n\n");
		sel_c_or_p=1;
		A = 5;
		B = 2;
		C = 3;
		D = 4;
		P_value = B*(A-D) - C;
		@(negedge clk);
		@(negedge clk);
		$display ($time,,"reset=%b, clk=%b, sel_c_or_p=%d, A=%d, B=%d, C=%d, D=%d, P=%d",reset, clk, sel_c_or_p, A, B, C, D, P);
		if (P == P_value)
			$display ("Test Passed");
		else begin
			$display ("Test Failed:\n P value must be: %d \n", P_value);
		end
		$display ("\n\n***Directed Functionality Test of output P with sel_p_or_c=1 is ended***\n\n");
		#100;
		$finish;
	end
dsp_multiplier_accum_with_add_and_sub DUT(clk, reset, sel_c_or_p, INMODE, ALUMODE, A, B, C, D, P);
endmodule