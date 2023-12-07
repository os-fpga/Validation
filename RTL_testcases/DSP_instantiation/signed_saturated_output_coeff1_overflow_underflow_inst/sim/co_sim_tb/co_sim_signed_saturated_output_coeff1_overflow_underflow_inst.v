module co_sim_signed_saturated_output_coeff1_overflow_underflow_inst;
	reg signed [19:0] a;
	reg signed [17:0] b;
	reg clk, reset;
	wire signed [37:0] z_out;
	reg  signed [37:0] expected_out;
	reg  signed [63:0] expected_out_shifted, expected_out2, mult;
	wire signed [37:0] z_out_netlist;

	integer mismatch=0;

signed_saturated_output_coeff1_overflow_underflow_inst golden(.*);
signed_saturated_output_coeff1_overflow_underflow_inst_post_synth netlist(.*, .z_out(z_out_netlist));

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
	@(negedge clk);
	display_stimulus();
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h7;
	b = 18'h3;
	@(posedge clk);
	mult = $signed(20'h7ffff) * $signed(b);
	expected_out_shifted = $signed(a) << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	display_stimulus();
	@(negedge clk);
	compare();

	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 20'h7ffff;
	b = 18'h1ffff;
	@(posedge clk);
	mult = $signed(20'h7ffff) * $signed(b);
	expected_out_shifted = $signed(a) << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	display_stimulus();
	@(negedge clk);
	compare();
	
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 20'h80000;
	b = 18'h20000;
	@(posedge clk);
	mult = $signed(20'h7ffff) * $signed(b);
	expected_out_shifted = $signed(a) << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	display_stimulus();
	@(negedge clk);
	compare();
	
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	//@(negedge clk);
	a = 417393;
	b = 109048;
	@(posedge clk);
	mult = $signed(20'h7ffff) * $signed(b);
	expected_out_shifted = $signed(a) << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	display_stimulus();
	@(negedge clk);
	compare();
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied***\n\n");
	
	repeat (500) begin
		a = $random( );
		b = $random( );
		@(posedge clk);
		mult = $signed(20'h7ffff) * $signed(b);
		expected_out_shifted = $signed(a) << 6'd19;
		expected_out2 = expected_out_shifted + mult;
		display_stimulus();
		@(negedge clk);
		compare();
		
		
	end
	$display ("\n\n***Random Functionality Tests with random inputs are ended***\n\n");

	if(mismatch == 0)
        $display("\n**** all Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
	
	if ((expected_out2) >= $signed (64'd137438953471)) begin //Saturation overflow logic
		expected_out = 38'd137438953471;
	end
	if ((expected_out2) <= $signed (-64'd137438953472)) begin //Saturation underflow logic
		expected_out = -38'd137438953472;
	end
	if (((expected_out2) > $signed (-64'd137438953472)) && ((expected_out2) < $signed (64'd137438953471)))  begin //Saturation underflow logic
		expected_out = expected_out2[37:0];
	end

 	
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