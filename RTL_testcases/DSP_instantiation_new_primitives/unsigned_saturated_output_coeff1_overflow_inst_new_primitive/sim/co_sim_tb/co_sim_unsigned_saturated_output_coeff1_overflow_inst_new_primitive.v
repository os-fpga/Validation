module co_sim_unsigned_saturated_output_coeff1_overflow_inst_new_primitive;
	reg [19:0] a;
	reg [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [37:0] expected_out;
	reg  [63:0] expected_out_shifted, expected_out2, mult;
	

	integer mismatch=0;

`ifdef PNR
	unsigned_saturated_output_coeff1_overflow_inst_new_primitive_post_route golden(.*);
`else
	unsigned_saturated_output_coeff1_overflow_inst_new_primitive_post_synth golden(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	@(negedge clk);
	reset = 1;
	{a, b, expected_out2, expected_out, expected_out_shifted, mult}= 'd0;
	$display ("\n\n***Reset Test is applied***\n\n");
	@(negedge clk);
	@(negedge clk);
	display_stimulus();
	saturate();
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h7;
	b = 18'h3;
	mult = 20'h7ffff * b;
	@(posedge clk);
	expected_out_shifted = a << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	#2;
	saturate();
	display_stimulus();
	@(negedge clk);
	compare();
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 20'h7ffff;
	b = 18'h1ffff;
	mult = 20'h7ffff * b;
	@(posedge clk);
	expected_out_shifted = a << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	#2;
	display_stimulus();
	saturate();
	@(negedge clk);
	compare();
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");
    @(negedge clk); 
	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 417393;
	b = 109048;
	mult = 20'h7ffff * b;
	@(posedge clk);
	expected_out_shifted = a << 6'd19;
	expected_out2 = expected_out_shifted + mult;
	#2;
	saturate();
	display_stimulus();
	@(negedge clk);
	compare();
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied***\n\n");
	@(negedge clk);
	repeat (500) begin
		a = $urandom( );
		b = $urandom( );
		mult = 20'h7ffff * b;
		@(posedge clk);
		expected_out_shifted = a << 6'd19;
		expected_out2 = expected_out_shifted + mult;
		#2;
		saturate();
		display_stimulus();
		@(negedge clk);
		compare();
		@(negedge clk);
	end
	$display ("\n\n***Random Functionality Tests with random inputs are ended***\n\n");

	if(mismatch == 0)
        $display("\n**** all Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
	$finish;
end
	
task saturate();
	if ((expected_out2) >= 64'h3fffffffff) begin //Saturation overflow logic	
		expected_out = 38'd274877906943;
	end
	if ((expected_out2) < 64'd274877906943) begin //Saturation overflow logic	
		expected_out = expected_out2;
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
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule