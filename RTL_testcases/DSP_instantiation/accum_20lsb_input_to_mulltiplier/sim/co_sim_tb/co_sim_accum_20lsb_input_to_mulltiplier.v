module co_sim_accum_20lsb_input_to_mulltiplier;
	reg  [19:0] a;
	reg  [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [37:0] expected_out;
	reg  [63:0] expected_out_shifted, expected_out2, mult;
	wire [37:0] z_out_netlist;

	integer mismatch=0;

accum_20lsb_input_to_mulltiplier golden(.*);
accum_20lsb_input_to_mulltiplier_post_synth netlist(.*, .z_out(z_out_netlist));

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	@(negedge clk);
	reset = 1;
	{a, b, expected_out2, expected_out, mult, expected_out_shifted}= 'd0;
	$display ("\n\n***Reset Test is applied***\n\n");
	@(negedge clk);
	@(negedge clk);
	display_stimulus();
	#2;
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h7;
	b = 18'h3;
	mult = expected_out2[19:0] * b; 
	@(posedge clk)
	expected_out_shifted = {44'b0, a} << 6'd19;
	expected_out2 = expected_out_shifted - mult;
	expected_out = expected_out2[37:0];
	display_stimulus();
	#3;
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h7ffff;
	b = 18'h1ffff;
	mult = expected_out2[19:0] * b;
	@(posedge clk)
	expected_out_shifted = {44'b0, a} << 6'd19;
	expected_out2 = expected_out_shifted - mult;
	expected_out = expected_out2[37:0];
	display_stimulus();
	#3;
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h80000;
	b = 18'h20000;
	mult = expected_out2[19:0] * b;
	@(posedge clk)
	//$display ("mult value:%0d", mult);
	expected_out_shifted = {44'b0, a} << 6'd19;
	expected_out2 = expected_out_shifted - mult;
	expected_out = expected_out2[37:0];
	display_stimulus();
	#3;
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 417393;
	b = 109048;
	mult = expected_out2[19:0] * b;
	@(posedge clk)
	expected_out_shifted = {44'b0, a} << 6'd19;
	expected_out2 = expected_out_shifted - mult;
	expected_out = expected_out2[37:0];
	display_stimulus();
	#3;
	compare();	
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied***\n\n");
	
	repeat (10) begin
		a = $urandom( );
		b = $urandom( );
		mult = expected_out2[19:0] * b;
		@(posedge clk)
		expected_out_shifted = {44'b0, a} << 6'd19;
		expected_out2 = expected_out_shifted - mult;
		expected_out = expected_out2[37:0];
		display_stimulus();
		#3;
		compare();
		@(negedge clk);
	end
	$display ("\n\n***Random Functionality Tests with random inputs are ended***\n\n");

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	
task compare();
	// if ((expected_out_shifted) >= 64'd274877906943) begin //Saturation overflow logic	
	// 	expected_out = 38'd274877906943;
	// end
 	
  	if ((z_out !== z_out_netlist) || (z_out_netlist !== expected_out) || (z_out !== expected_out)) begin
    	$display("Data Mismatch. Golden RTL: %0d, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden RTL: %0d, Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule