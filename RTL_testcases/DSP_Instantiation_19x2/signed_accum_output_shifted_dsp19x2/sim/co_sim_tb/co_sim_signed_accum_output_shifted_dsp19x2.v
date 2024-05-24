`timescale 1ns/1ps
module co_sim_signed_accum_output_shifted_dsp19x2;
	reg signed [19:0] a;
	reg signed [17:0] b;
	reg  [4:0] shift_right;
	reg clk, reset;
	wire signed [37:0] z_out;
	reg signed [37:0] expected_out;
	reg signed [63:0]add_sub_in, add_sub_out;
	reg signed [31:0]mult1,mult2;
	reg signed [63:0] expected_out2;
	wire signed [37:0] z_out_netlist;

	integer mismatch=0;
`ifdef PNR
`else

signed_accum_output_shifted_dsp19x2 golden(.*);
`endif


//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	{reset, a, b, shift_right, expected_out, expected_out2, add_sub_in, add_sub_out,mult1,mult2}= 'd0;
	@(negedge clk);
	reset = 1;
	expected_out2= 38'd0;
	expected_out= 38'd0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied for shifted output of z_out = z_out + a*b***\n\n");
	a = 20'h8;
	b = 18'h2;
	shift_right = 6'h2;
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	add_sub_in[31:0] = add_sub_in[31:0] + mult1;
	add_sub_in[63:32] = add_sub_in[63:32] + mult2;
	add_sub_out[31:0] = add_sub_in[31:0] >>shift_right;
	add_sub_out[63:32] = add_sub_in[63:32] >> shift_right;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted output of z_out = z_out + a*b***\n\n");
	

	a = 20'h4;
	b = 18'h2;
	shift_right = 6'h1;
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	add_sub_in[31:0] = add_sub_in[31:0] + mult1;
	add_sub_in[63:32] = add_sub_in[63:32] + mult2;
	add_sub_out[31:0] = add_sub_in[31:0] >>shift_right;
	add_sub_out[63:32] = add_sub_in[63:32] >> shift_right;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for shifted output of z_out = z_out + a*b***\n\n");
	
	a = 20'h80000;
	b = 18'h20000;
	mult1 = ($signed(a[9:0])*$signed(b[8:0]));
	mult2 = ($signed(a[19:10])*$signed(b[17:9]));
	add_sub_in[31:0] = add_sub_in[31:0] + mult1;
	add_sub_in[63:32] = add_sub_in[63:32] + mult2;
	add_sub_out[31:0] = add_sub_in[31:0] >>shift_right;
	add_sub_out[63:32] = add_sub_in[63:32] >> shift_right;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for shifted output of z_out = z_out + a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for shifted output of z_out = z_out + a*b***\n\n");
	repeat (600) begin
		a = $random( );
		b = $random( );
		shift_right = 5'd2;
		mult1 = ($signed(a[9:0])*$signed(b[8:0]));
		mult2 = ($signed(a[19:10])*$signed(b[17:9]));
		add_sub_in[31:0] = add_sub_in[31:0] + mult1;
		add_sub_in[63:32] = add_sub_in[63:32] + mult2;
		add_sub_out[31:0] = add_sub_in[31:0] >>shift_right;
		add_sub_out[63:32] = add_sub_in[63:32] >> shift_right;
		expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with random inputs for shifted output of z_out = z_out + a*b are ended***\n\n");

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