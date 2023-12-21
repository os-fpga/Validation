`include "../netlist/dsp_mul_signed_reg_with_accum_netlist.v"
module tb_dsp_mul_signed_reg_with_accum_netlist_random ();
	reg signed [19:0] A;
	reg signed [17:0] B;
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

		#100;
		$finish;
	end
dsp_mul_signed_reg_with_accum_netlist DUT(clk, reset, subtract_i, A, B, P);
endmodule