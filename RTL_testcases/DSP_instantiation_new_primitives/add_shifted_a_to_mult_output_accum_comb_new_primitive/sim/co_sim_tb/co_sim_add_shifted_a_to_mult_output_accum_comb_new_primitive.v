module co_sim_add_shifted_a_to_mult_output_accum_comb_new_primitive;
	reg  [19:0] a;
	reg  [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [5:0] acc_fir;
	reg  [37:0] expected_out;

	integer mismatch=0;
`ifdef PNR
	add_shifted_a_to_mult_output_accum_comb_new_primitive_post_route golden(.*);
`else
	add_shifted_a_to_mult_output_accum_comb_new_primitive_post_synth golden(.*);
`endif

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	{a, b, reset, acc_fir, expected_out} = 0;
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

	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	@(negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");

	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	@(negedge clk);
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	@(negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for multiplier and acc_fir***\n\n");
	repeat (600) begin
		expected_out = (a<<acc_fir) + (expected_out[19:0]*b); //calculate the result at every negedge
		@(negedge clk);
		display_stimulus();
		compare();
		a = $urandom( );
		b = $urandom( );
		acc_fir = $urandom( );
	end
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