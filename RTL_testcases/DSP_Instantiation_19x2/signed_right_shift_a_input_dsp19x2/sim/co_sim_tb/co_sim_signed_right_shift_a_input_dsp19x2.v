module co_sim_signed_right_shift_a_input_dsp19x2;
	reg   [19:0] a;
	reg   [17:0] b;
	reg   [4:0] shift_right;
	reg   clk, reset;
	wire  [37:0] z_out;
	reg   [37:0] expected_out;
	reg   [37:0] expected_mult;
	reg   signed [31:0] mult1, mult2;
	reg   signed [63:0] expected_out_acc;
	reg   [63:0] expected_out_shifted;

	integer mismatch=0;
`ifdef PNR
`else

signed_right_shift_a_input_dsp19x2 golden(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	{reset, a, b, shift_right, expected_out, expected_out_acc, expected_out_shifted, expected_mult, mult1, mult2} = 'd0;
	@(negedge clk);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");
	//@(negedge clk);
	//@(negedge clk);
	a = 20'h8;
	b = 18'h2;
	shift_right = 5'h2;
	@(posedge clk);
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	expected_out_acc[31:0] = expected_out_acc[31:0] + mult1;
	expected_out_acc[63:32] = expected_out_acc[63:32] + mult2;
	expected_out[18:0] = expected_out_acc[31:0] >>> shift_right;
	expected_out[37:19] = expected_out_acc[63:32] >>> shift_right;
	display_stimulus();
	#2;
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");
	
	@(negedge clk);
	a = 20'h4;
	b = 18'h2;
	shift_right = 5'h1;
	@(posedge clk);
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	expected_out_acc[31:0] = expected_out_acc[31:0] + mult1;
	expected_out_acc[63:32] = expected_out_acc[63:32] + mult2;
	expected_out[18:0] = expected_out_acc[31:0] >>> shift_right;
	expected_out[37:19] = expected_out_acc[63:32] >>> shift_right;
	display_stimulus();
	#2;
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");

	@(negedge clk);
	a = 20'hfffff;
	b = 18'h20000;
	shift_right = 5'h3;
	@(posedge clk);
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	expected_out_acc[31:0] = expected_out_acc[31:0] + mult1;
	expected_out_acc[63:32] = expected_out_acc[63:32] + mult2;
	expected_out[18:0] = expected_out_acc[31:0] >>> shift_right;
	expected_out[37:19] = expected_out_acc[63:32] >>> shift_right;
	display_stimulus();
	//@(negedge clk);
	#2;
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for shifted right output of  z_out = z_out + a*b***\n\n");

	repeat (600) begin
		@(negedge clk);
		a = $urandom( );
		b = $urandom( );
		shift_right = 5'd4;
		@(posedge clk);
		mult1 = ($signed(a[9:0])*$signed(b[8:0]));
		mult2 = ($signed(a[19:10])*$signed(b[17:9]));
		expected_out_acc[31:0] = expected_out_acc[31:0] + mult1;
		expected_out_acc[63:32] = expected_out_acc[63:32] + mult2;
		expected_out[18:0] = expected_out_acc[31:0] >>> shift_right;
		expected_out[37:19] = expected_out_acc[63:32] >>> shift_right;
		display_stimulus();
		#2;
		compare();
	end
	$display ("\n\n***Random Functionality Tests with random inputs for shifted right output of  z_out = z_out + a*b are ended***\n\n");

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
 	if ((z_out !== expected_out)) begin
    	$display("Data Mismatch, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched: Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, expected_out, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, shift_right=%0d", a, b, shift_right);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule