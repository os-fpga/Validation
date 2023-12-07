module co_sim_registered_output_mult_new_primitive;
	reg clk, reset;
	reg signed [19:0] a;
	reg signed [17:0] b;
	wire signed  [37:0] z_out;
	reg signed  [37:0] expected_out;
	wire signed [37:0] z_out_netlist;

	integer mismatch=0;

registered_output_mult_new_primitive golden(.*);
registered_output_mult_new_primitive_post_synth netlist(.*, .z_out(z_out_netlist));

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
	a=0;
	b=0;
	reset=0;
	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (500) begin
		@ (negedge clk);
		a = $random( );
		b = $random( );
		expected_out = a*b;
		@ (negedge clk);
		@ (negedge clk);
		display_stimulus();
		compare();
		expected_out = 32'd0;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	reset = 1;
	expected_out= 38'd0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@ (negedge clk);
	@ (negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	reset = 0;
	@(negedge clk);
	a = 20'hfffff;
	b = 18'h3ffff;
	expected_out = a*b;
	@ (negedge clk);
	@ (negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	#100;
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
	end
	

task compare();
 	
  	if ((z_out !== z_out_netlist) || (z_out_netlist !== expected_out) || (z_out !== expected_out)) begin
    	$display("Data Mismatch. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t", z_out, z_out_netlist, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else begin
  		$display("Data Matched. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t", z_out, z_out_netlist, expected_out, $time);
	end
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule