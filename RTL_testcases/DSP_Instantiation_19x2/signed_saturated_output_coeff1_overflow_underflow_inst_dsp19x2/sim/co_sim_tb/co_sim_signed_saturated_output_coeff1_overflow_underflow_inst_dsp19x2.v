module co_sim_signed_saturated_output_coeff1_overflow_underflow_inst_dsp19x2;
	reg signed [19:0] a;
	reg signed [17:0] b;
	reg clk, reset;
	wire signed [37:0] z_out;
	reg  signed [37:0] expected_out;
	reg signed [31:0] mult1, mult2;
	reg  signed [63:0] expected_out_shifted, expected_out2, mult;
	wire signed [37:0] z_out_netlist;

	integer mismatch=0;
`ifdef PNR
`else
signed_saturated_output_coeff1_overflow_underflow_inst_dsp19x2 golden(.*);
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
	{a, b, expected_out2, expected_out, mult, expected_out_shifted, mult1, mult2}= 'd0;
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
	@(negedge clk);
	mult1 = $signed(10'h3ff) * $signed(b[8:0]); 
	mult2 = $signed(10'h3ff) * $signed(b[17:9]); 
	expected_out_shifted[31:0] = $signed(a[9:0]) << 5'd2;
	expected_out_shifted[63:32] = $signed(a[19:10]) << 5'd2;
	expected_out2[31:0] = expected_out_shifted[31:0] + mult1; 
	expected_out2[63:32] = expected_out_shifted[63:32] + mult2;
	#2;
	saturate();
	expected_out = {expected_out2[50:32],expected_out2[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();

	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 20'h7ffff;
	b = 18'h1ffff;
	@(negedge clk);
	mult1 = $signed(10'h3ff) * $signed(b[8:0]); 
	mult2 = $signed(10'h3ff) * $signed(b[17:9]); 
	expected_out_shifted[31:0] = $signed(a[9:0]) << 5'd2;
	expected_out_shifted[63:32] = $signed(a[19:10]) << 5'd2;
	expected_out2[31:0] = expected_out_shifted[31:0] + mult1; 
	expected_out2[63:32] = expected_out_shifted[63:32] + mult2;
	#2;
	saturate();
	expected_out = {expected_out2[50:32],expected_out2[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	@(negedge clk);
	a = 20'h80000;
	b = 18'h20000;
	@(negedge clk);
	mult1 = $signed(10'h3ff) * $signed(b[8:0]); 
	mult2 = $signed(10'h3ff) * $signed(b[17:9]); 
	expected_out_shifted[31:0] = $signed(a[9:0]) << 5'd2;
	expected_out_shifted[63:32] = $signed(a[19:10]) << 5'd2;
	expected_out2[31:0] = expected_out_shifted[31:0] + mult1; 
	expected_out2[63:32] = expected_out_shifted[63:32] + mult2;
	#2;
	saturate();
	expected_out = {expected_out2[50:32],expected_out2[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	//@(negedge clk);
	a = 417393;
	b = 109048;
	@(negedge clk);
	mult1 = $signed(10'h3ff) * $signed(b[8:0]); 
	mult2 = $signed(10'h3ff) * $signed(b[17:9]); 
	expected_out_shifted[31:0] = $signed(a[9:0]) << 5'd2;
	expected_out_shifted[63:32] = $signed(a[19:10]) << 5'd2;
	expected_out2[31:0] = expected_out_shifted[31:0] + mult1; 
	expected_out2[63:32] = expected_out_shifted[63:32] + mult2;
	#2;
	saturate();
	expected_out = {expected_out2[50:32],expected_out2[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied***\n\n");
	
	repeat (500) begin
		a = $random( );
		b = $random( );
		@(negedge clk);
		mult1 = $signed(10'h3ff) * $signed(b[8:0]); 
		mult2 = $signed(10'h3ff) * $signed(b[17:9]); 
		expected_out_shifted[31:0] = $signed(a[9:0]) << 5'd2;
		expected_out_shifted[63:32] = $signed(a[19:10]) << 5'd2;
		expected_out2[31:0] = expected_out_shifted[31:0] + mult1; 
		expected_out2[63:32] = expected_out_shifted[63:32] + mult2;
		#2;
		saturate();
		expected_out = {expected_out2[50:32],expected_out2[18:0]};
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
	
task saturate();

	if ($signed(expected_out2[31:0]) > $signed(19'h3ffff)) begin //Saturation overflow logic	
		expected_out2[31:0] = $signed(19'h3ffff);
	end
	if ($signed(expected_out2[63:32]) > $signed(19'h3ffff)) begin //Saturation overflow logic	
		expected_out2[63:32] = $signed(19'h3ffff);
	end
	if ($signed(expected_out2[31:0]) < $signed(19'h40000)) begin //Saturation overflow logic	
		expected_out2[31:0] = $signed(19'h40000);
	end
	if ($signed(expected_out2[63:32]) < $signed(19'h40000)) begin //Saturation overflow logic	
		expected_out2[63:32] = $signed(19'h40000);
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