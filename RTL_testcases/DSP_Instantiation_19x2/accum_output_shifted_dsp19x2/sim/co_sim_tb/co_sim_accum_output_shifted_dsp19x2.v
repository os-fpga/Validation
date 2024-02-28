module co_sim_accum_output_shifted_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	reg  [4:0] shift_right;
	reg clk, reset;
	wire  [37:0] z_out;
	reg  [37:0] expected_out;
	reg  [31:0] add_sub_out1;
	reg  [31:0] add_sub_out2;

	integer mismatch=0;

`ifdef PNR
`else

accum_output_shifted_dsp19x2 golden(.*);
`endif


//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	{reset, a, b, shift_right, expected_out, add_sub_out1, add_sub_out2} = 'd0;
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

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");
	a = 20'h8;
	b = 18'h2;
	shift_right = 5'h2;
	add_sub_out1= (a[9:0]*b[8:0]) + add_sub_out1;
	add_sub_out2 = (a[19:10]*b[17:9]) + add_sub_out2;
	expected_out[18:0] = add_sub_out1 >>> shift_right;
	expected_out[37:19] = add_sub_out2 >>>shift_right;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");
	a = 20'h4;
	b = 18'h2;
	shift_right = 5'h2;
	add_sub_out1= (a[9:0]*b[8:0]) + add_sub_out1;
	add_sub_out2 = (a[19:10]*b[17:9]) + add_sub_out2;
	expected_out[18:0] = add_sub_out1 >>> shift_right;
	expected_out[37:19] = add_sub_out2 >>>shift_right;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right output of  z_out = z_out + a*b***\n\n");
	a = 20'h20000;
	b = 18'h10000;
	shift_right = 5'h2;
	add_sub_out1= (a[9:0]*b[8:0]) + add_sub_out1;
	add_sub_out2 = (a[19:10]*b[17:9]) + add_sub_out2;
	expected_out[18:0] = add_sub_out1 >>> shift_right;
	expected_out[37:19] = add_sub_out2 >>>shift_right;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right output of  z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for shifted right output of  z_out = z_out + a*b***\n\n");
	
	repeat (600) begin
		a = 20'h00020;
		b = 18'h00100;
		shift_right = 5'h2;
		add_sub_out1= (a[9:0]*b[8:0]) + add_sub_out1;
		add_sub_out2 = (a[19:10]*b[17:9]) + add_sub_out2;
		expected_out[18:0] = add_sub_out1 >>> shift_right;
		expected_out[37:19] = add_sub_out2 >>>shift_right;
		display_stimulus();
		@(negedge clk);
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