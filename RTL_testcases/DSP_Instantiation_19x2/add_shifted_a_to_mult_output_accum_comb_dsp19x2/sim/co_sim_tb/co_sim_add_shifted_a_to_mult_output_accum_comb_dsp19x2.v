`timescale 1ns/1ps
module co_sim_add_shifted_a_to_mult_output_accum_comb_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [4:0] acc_fir;
	reg  [31:0] mult1, mult2;
	reg  [63:0]mult_out, add_sub_in, add_sub_out;
	reg  [37:0] expected_out;

	integer mismatch=0;
`ifdef PNR
`else

add_shifted_a_to_mult_output_accum_comb_dsp19x2 golden(.*);
`endif

initial begin
	clk = 1'b1;
	forever #5 clk = ~clk;
end

initial begin
	{a, b, reset, acc_fir, expected_out, mult1, mult2, mult_out, add_sub_in, add_sub_out} = 0;
	@(negedge clk);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;

	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =5'h1;
	mult_out[63:32] =  expected_out[28:19]*b[17:9];
	mult_out[31:0] =  expected_out[9:0]*b[8:0];
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_out[63:32] = add_sub_in[63:32] + mult_out[63:32];
	add_sub_out[31:0] = add_sub_in[31:0] + mult_out[31:0];
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	@(negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	a = 20'd200;
	b = 18'd1;
	acc_fir =5'h1;
	mult_out[63:32] =  expected_out[28:19]*b[17:9];
	mult_out[31:0] =  expected_out[9:0]*b[8:0];
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_out[63:32] = add_sub_in[63:32] + mult_out[63:32];
	add_sub_out[31:0] = add_sub_in[31:0] + mult_out[31:0];
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	@(negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");
	
	repeat (600) begin
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	$display ("\n\n*** Random Functionality Tests with random inputs are applied for multiplier and acc_fir***\n\n");
		a = $urandom( );
		b = $urandom( );
		acc_fir =5'h1;	
		mult_out[63:32] =  expected_out[28:19]*b[17:9];
		mult_out[31:0] =  expected_out[9:0]*b[8:0];
		add_sub_in[63:32] = a[19:10]<<acc_fir;
		add_sub_in[31:0] = a[9:0]<<acc_fir;
		add_sub_out[63:32] = add_sub_in[63:32] + mult_out[63:32];
		add_sub_out[31:0] = add_sub_in[31:0] + mult_out[31:0];
		expected_out = {add_sub_out[50:32],add_sub_out[18:0]};//calculate the result at every negedge
		@(negedge clk);
		display_stimulus();
		compare();
	end
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};

	$display ("\n\n***Random Functionality Tests with random inputs for multiplier and acc_fir are ended***\n\n");

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
	$display ($time,," Test stimulus is: a=%0d, b=%0d, acc_fir=%0d", a, b, acc_fir);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule