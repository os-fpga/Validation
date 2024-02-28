module co_sim_accum_output_shifted_rounded_inst_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	reg  [4:0] shift_right;
	reg clk, reset;
	wire  [37:0] z_out;
	reg  [37:0] expected_out;
	reg [31:0]add_sub_out1,add_sub_out2;
	reg [31:0]shifted_out1,shifted_out2;
	reg  [63:0] expected_out2;

	integer mismatch=0;

`ifdef PNR
`else

accum_output_shifted_rounded_inst_dsp19x2 golden(.*);
`endif


//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	{reset, a, b, shift_right, expected_out, expected_out2, add_sub_out1, add_sub_out2, shifted_out1,shifted_out2} = 'd0;
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

	$display ("\n\n***Directed Functionality Test is applied for shifted right and rounded output of z_out = z_out + a*b***\n\n");
	a = 20'h7;
	b = 18'h3;
	shift_right = 5'h0;
	expected_out2[31:0] = (a[9:0]*b[8:0]) + expected_out2[31:0];
	expected_out2[63:32] = (a[19:10]*b[17:9]) + expected_out2[63:32];
	shifted_out1 = expected_out2[31:0]>>shift_right;
	shifted_out2 = expected_out2[63:32]>>shift_right;
	round();
	expected_out = {shifted_out2[18:0],shifted_out1[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right and rounded output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right and rounded output of z_out = z_out + a*b***\n\n");
	a = 20'h1;
	b = 18'h2;
	shift_right = 5'h3;
	expected_out2[31:0] = (a[9:0]*b[8:0]) + expected_out2[31:0];
	expected_out2[63:32] = (a[19:10]*b[17:9]) + expected_out2[63:32];
	shifted_out1 = expected_out2[31:0]>>shift_right;
	shifted_out2 = expected_out2[63:32]>>shift_right;
	round();
	expected_out = {shifted_out2[18:0],shifted_out1[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right and rounded output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted right and rounded output of z_out = z_out + a*b***\n\n");
	a = 20'h80000;
	b = 18'h20000;
	expected_out2[31:0] = (a[9:0]*b[8:0]) + expected_out2[31:0];
	expected_out2[63:32] = (a[19:10]*b[17:9]) + expected_out2[63:32];
	shifted_out1 = expected_out2[31:0]>>shift_right;
	shifted_out2 = expected_out2[63:32]>>shift_right;
	round();
	expected_out = {shifted_out2[18:0],shifted_out1[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted right and rounded output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for shifted right and rounded output of z_out = z_out + a*b***\n\n");
	
	repeat (600) begin
		a = $urandom( );
		b = $urandom( );
		shift_right = 5;
		expected_out2[31:0] = (a[9:0]*b[8:0]) + expected_out2[31:0];
		expected_out2[63:32] = (a[19:10]*b[17:9]) + expected_out2[63:32];
		shifted_out1 = expected_out2[31:0]>>shift_right;
		shifted_out2 = expected_out2[63:32]>>shift_right;
		round();
		expected_out = {shifted_out2[18:0],shifted_out1[18:0]};
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with random inputs for shifted right and rounded output of z_out = z_out + a*b are ended***\n\n");

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task round();
 	if (expected_out2[shift_right - 1]==1) begin //Rounding logic
		shifted_out1 =shifted_out1 + 1'b1;
	end
	if (expected_out2[(shift_right + 32) - 1]==1) begin //Rounding logic
		shifted_out2 = shifted_out2 + 1'b1;
	end
endtask

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