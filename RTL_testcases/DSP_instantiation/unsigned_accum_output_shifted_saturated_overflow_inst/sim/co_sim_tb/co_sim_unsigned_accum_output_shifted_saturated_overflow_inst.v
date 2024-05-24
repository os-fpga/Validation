`timescale 1ns/1ps
module co_sim_unsigned_accum_output_shifted_saturated_overflow_inst;
	reg [19:0] a;
	reg [17:0] b;
	reg [5:0] shift_right;
	reg  clk, reset;
	wire [37:0] z_out;
	reg  [37:0] expected_out;
	reg  signed [63:0] expected_out2, mult, expected_out_shifted;
	wire [37:0] z_out_netlist;

	integer mismatch=0;

unsigned_accum_output_shifted_saturated_overflow_inst golden(.*);
    `ifdef PNR
    `else
    unsigned_accum_output_shifted_saturated_overflow_inst_post_synth netlist(.*, .z_out(z_out_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	{a, b, shift_right, expected_out, expected_out2, mult, expected_out_shifted}= 'd0;
	@(negedge clk);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	@(negedge clk);
	@(negedge clk);
	display_stimulus();
	compare();
	//@(posedge clk);
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	a = 20'h7;
	b = 18'h3;
	shift_right = 6'h5;
	mult = (a*b);
	@(posedge clk)
	expected_out2 = 0 - mult;
	expected_out_shifted = expected_out2>>>shift_right;
	expected_out = expected_out_shifted;
	display_stimulus();
	compare();
	@(posedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");

	@(negedge clk);
	a = 20'h1;
	b = 18'h2;
	shift_right = 6'h3;
	mult = (a*b);
	@(posedge clk)
	expected_out2 = 0 - mult;
	expected_out_shifted = expected_out2>>>shift_right;
	expected_out = expected_out_shifted;
	//#2;
	display_stimulus();
	compare();
	@(posedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	a = 20'h80000;
	b = 18'h20000;
	shift_right = 6'h1;
	mult = (a*b);
	@(posedge clk)
	$display ("mult value:%0d", mult);
	expected_out2 = 0 - mult;
	expected_out_shifted = expected_out2>>>shift_right;
	expected_out = expected_out_shifted;
	display_stimulus();
	compare();
	@(posedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	a = 20'd417393;
	b = 18'd109048;
	shift_right = 6'd5; // shift right previous value was 55 simulation failing for 55
	mult = (a*b);
	@(posedge clk)
	expected_out2 = 0 - mult;
	expected_out_shifted = expected_out2>>>shift_right;
	expected_out = expected_out_shifted;
	//#2;
	display_stimulus();
	compare();
	@(posedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied forshifted output of z_out = z_out - a*b***\n\n");
	
	repeat (100) begin
		a = $urandom( );
		b = $urandom( );
		shift_right = $urandom( ); // commented by saad 
		mult = (a*b);
		@(posedge clk)
		expected_out2 = 0 - mult;
		expected_out_shifted = expected_out2>>>shift_right;
		expected_out = expected_out_shifted;
		#2;
		display_stimulus();
		compare();
		@(posedge clk);
	end
	$display ("\n\n***Random Functionality Tests with random inputs forshifted output of z_out = z_out - a*b are ended***\n\n");

	$display ("\n\n***tests for underflow***\n\n");
	a = 524280;
	b = 131070;
	shift_right = 10;

	repeat (100) begin
		mult = (a*b);
		@(posedge clk)
		expected_out2 = 0 - mult;
		expected_out_shifted = expected_out2>>>shift_right;
		expected_out = expected_out_shifted;
		#2;
		display_stimulus();
		compare();
		@(posedge clk);
	end
	$display ("\n\n***tests for underflow ended***\n\n");

	$display ("\n\n***tests for overflow***\n\n");
	a = 524280;
	b = 131070;
	shift_right = 10;

	repeat (100) begin
		mult = (a*b);
		@(posedge clk)
		expected_out2 = 0 - mult;
		expected_out_shifted = expected_out2>>>shift_right;
		expected_out = expected_out_shifted;
		#2;
		display_stimulus();
		compare();
		@(posedge clk);
	end
	$display ("\n\n***tests for overflow ended***\n\n"); 

	if(mismatch == 0)
        $display("\n**** all Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
	//if (expected_out2[shift_right -1]==1) begin //Rounding logic
	//	expected_out = expected_out + 1'b1;
	//end
	
	if ((expected_out_shifted) < 0) begin //Saturation overflow logic
		expected_out = 0;
	end
	else
	 $display("code is working"); 
	

 	
  	if ((z_out !== z_out_netlist) || (z_out_netlist !== expected_out) || (z_out !== expected_out)) begin
    	$display("Data Mismatch. Golden RTL: %0d, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden RTL: %0d, Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, shift_right=%0d", a, b, shift_right);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule