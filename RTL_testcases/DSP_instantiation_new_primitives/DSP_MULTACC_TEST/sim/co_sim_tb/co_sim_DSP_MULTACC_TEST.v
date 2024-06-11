`timescale 1ns/1ps
module co_sim_DSP_MULTACC_TEST;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset;

    wire 		[37:0] 		z_multacc	,	z_multacc_netlist;
    reg 		[2:0] 		feedback;
    reg 		[5:0] 		acc_fir;
    wire 		[37:0] 		z_multadd	,	z_multadd_netlist;
    reg 		[5:0] 		shift_right;
    reg 		[19:0] 		a;
    reg 		[17:0] 		b;
    reg 		load_acc;
    reg 		round;
    reg 		saturate_enable;
    reg 		subtract;
    reg 		unsigned_a;
    reg 		unsigned_b;
	integer		mismatch	=	0;

DSP_MULTACC_TEST	golden (.*);

`ifdef PNR
	DSP_MULTACC_TEST_post_route route_net (.*, .z_multacc(z_multacc_netlist), .z_multadd(z_multadd_netlist) );
`else
	DSP_MULTACC_TEST_post_synth synth_net (.*, .z_multacc(z_multacc_netlist), .z_multadd(z_multadd_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end
//Reset Stimulus generation
initial begin
	reset <= 1;
	@(negedge clk);
	{feedback, acc_fir, shift_right, a, b, load_acc, round, saturate_enable, subtract, unsigned_a, unsigned_b } <= 'd0;
	reset <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		feedback 			 <= $urandom();
		acc_fir 			 <= $urandom();
		shift_right 			 <= $urandom();
		a 			 <= $urandom();
		b 			 <= $urandom();
		load_acc 			 <= $urandom();
		round 			 <= $urandom();
		saturate_enable 			 <= $urandom();
		subtract 			 <= $urandom();
		unsigned_a 			 <= $urandom();
		unsigned_b 			 <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	feedback <= 7;
	acc_fir <= 63;
	shift_right <= 63;
	a <= 1048575;
	b <= 262143;
	load_acc <= 1;
	round <= 1;
	saturate_enable <= 1;
	subtract <= 1;
	unsigned_a <= 1;
	unsigned_b <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(200) @(posedge clk);
	$finish;
end

task compare();
	if ( z_multacc !== z_multacc_netlist	||	z_multadd !== z_multadd_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", z_multacc, z_multadd, z_multacc_netlist, z_multadd_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", z_multacc, z_multadd, z_multacc_netlist, z_multadd_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
