`timescale 1ns/1ps
module co_sim_accum_20lsb_input_to_mulltiplier_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [37:0] expected_out;
	reg  [63:0] add_sub_in, add_sub_out, mult;

	integer mismatch=0;

`ifdef PNR
`else

accum_20lsb_input_to_mulltiplier_dsp19x2 golden(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 1;
	@(negedge clk);
	reset = 0;
	{a, b, add_sub_out, expected_out, mult, add_sub_in}= 'd0;
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
	mult[31:0]  = add_sub_out[9:0] * b[8:0];
	mult[63:32] = add_sub_out[41:32] * b[17:9]; 
	@(posedge clk)
	add_sub_in = {{{22'b0, a[19:10]} << 6'd2},{{22'b0, a[9:0]} << 6'd2}};
	add_sub_out = {{add_sub_in[63:32] - mult[63:32]},{add_sub_in[31:0] - mult[31:0]}};
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	#3;
	compare(); 
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");
	
	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h7ffff;
	b = 18'h1ffff;
	mult[31:0]  = add_sub_out[9:0] * b[8:0];
	mult[63:32] = add_sub_out[41:32] * b[17:9]; 
	@(posedge clk)
	add_sub_in = {{{22'b0, a[19:10]} << 6'd2},{{22'b0, a[9:0]} << 6'd2}};
	add_sub_out = {((add_sub_in[63:32]) - (mult[63:32])),((add_sub_in[31:0]) - (mult[31:0]))}; 
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	#3;
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 20'h80000;
	b = 18'h20000;
	mult[31:0]  = add_sub_out[9:0] * b[8:0];
	mult[63:32] = add_sub_out[41:32] * b[17:9]; 
	@(posedge clk)
	add_sub_in = {{{22'b0, a[19:10]} << 6'd2},{{22'b0, a[9:0]} << 6'd2}};
	add_sub_out = {{add_sub_in[63:32] - mult[63:32]},{add_sub_in[31:0] - mult[31:0]}};
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	#3;
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	a = 417393;
	b = 109048;
	mult[31:0]  = add_sub_out[9:0] * b[8:0];
	mult[63:32] = add_sub_out[41:32] * b[17:9]; 
	@(posedge clk)
	add_sub_in = {{{22'b0, a[19:10]} << 6'd2},{{22'b0, a[9:0]} << 6'd2}};
	add_sub_out = {{add_sub_in[63:32] - mult[63:32]},{add_sub_in[31:0] - mult[31:0]}};
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	#3;
	compare();	
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied***\n\n");
	
	repeat (10) begin
		a = $urandom( );
		b = $urandom( );
		mult[31:0]  = add_sub_out[9:0] * b[8:0];
		mult[63:32] = add_sub_out[41:32] * b[17:9]; 
		@(posedge clk)
		add_sub_in = {{{22'b0, a[19:10]} << 6'd2},{{22'b0, a[9:0]} << 6'd2}};
		add_sub_out = {{add_sub_in[63:32] - mult[63:32]},{add_sub_in[31:0] - mult[31:0]}};
		expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
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
	// if ((add_sub_in) >= 64'd274877906943) begin //Saturation overflow logic	
	// 	expected_out = 38'd274877906943;
	// end
 	
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