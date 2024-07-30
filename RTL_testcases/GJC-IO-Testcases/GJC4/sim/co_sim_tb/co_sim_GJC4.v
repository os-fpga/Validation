`timescale 1ns/1ps
module co_sim_GJC4;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset;

    wire 		[37:0] 		z_multacc	,	z_multacc_netlist;
    wire 		[37:0] 		z_multacc_regin	,	z_multacc_regin_netlist;
    wire 		[37:0] 		z_mult_regin_regout	,	z_mult_regin_regout_netlist;
    wire 		[37:0] 		z_multadd_regin	,	z_multadd_regin_netlist;
    wire 		[37:0] 		z_mult_regout	,	z_mult_regout_netlist;
    wire 		[17:0] 		dly_b_mult_regin	,	dly_b_mult_regin_netlist;
    wire 		[17:0] 		dly_b_mult_regin_regout	,	dly_b_mult_regin_regout_netlist;
    wire 		[37:0] 		z_multadd	,	z_multadd_netlist;
    wire 		[17:0] 		dly_b_multadd	,	dly_b_multadd_netlist;
    wire 		[37:0] 		z_mult	,	z_mult_netlist;
    wire 		[37:0] 		z_mult_regin	,	z_mult_regin_netlist;
    reg 		[5:0] 		acc_fir;
    wire 		[37:0] 		z_multacc_regin_regout	,	z_multacc_regin_regout_netlist;
    wire 		[37:0] 		z_multadd_regin_regout	,	z_multadd_regin_regout_netlist;
    wire 		[17:0] 		dly_b_multacc_regout	,	dly_b_multacc_regout_netlist;
    wire 		[17:0] 		dly_b_multacc_regin_regout	,	dly_b_multacc_regin_regout_netlist;
    wire 		[17:0] 		dly_b_mult_regout	,	dly_b_mult_regout_netlist;
    wire 		[17:0] 		dly_b_multadd_regin_regout	,	dly_b_multadd_regin_regout_netlist;
    reg 		[19:0] 		a;
    wire 		[37:0] 		z_multadd_regout	,	z_multadd_regout_netlist;
    wire 		[17:0] 		dly_b_multadd_regin	,	dly_b_multadd_regin_netlist;
    wire 		[17:0] 		dly_b_multadd_regout	,	dly_b_multadd_regout_netlist;
    reg 		[2:0] 		feedback;
    reg 		[17:0] 		b;
    reg 		[5:0] 		shift_right;
    wire 		[37:0] 		z_multacc_regout	,	z_multacc_regout_netlist;
    wire 		[17:0] 		dly_b_multacc_regin	,	dly_b_multacc_regin_netlist;
    reg 		load_acc;
    reg 		round;
    reg 		saturate_enable;
    reg 		subtract;
    reg 		unsigned_a;
    reg 		unsigned_b;
	integer		mismatch	=	0;

GJC4	golden (.*);

`ifdef PNR
	GJC4_post_route route_net (.*, .z_multacc(z_multacc_netlist), .z_multacc_regin(z_multacc_regin_netlist), .z_mult_regin_regout(z_mult_regin_regout_netlist), .z_multadd_regin(z_multadd_regin_netlist), .z_mult_regout(z_mult_regout_netlist), .dly_b_mult_regin(dly_b_mult_regin_netlist), .dly_b_mult_regin_regout(dly_b_mult_regin_regout_netlist), .z_multadd(z_multadd_netlist), .dly_b_multadd(dly_b_multadd_netlist), .z_mult(z_mult_netlist), .z_mult_regin(z_mult_regin_netlist), .z_multacc_regin_regout(z_multacc_regin_regout_netlist), .z_multadd_regin_regout(z_multadd_regin_regout_netlist), .dly_b_multacc_regout(dly_b_multacc_regout_netlist), .dly_b_multacc_regin_regout(dly_b_multacc_regin_regout_netlist), .dly_b_mult_regout(dly_b_mult_regout_netlist), .dly_b_multadd_regin_regout(dly_b_multadd_regin_regout_netlist), .z_multadd_regout(z_multadd_regout_netlist), .dly_b_multadd_regin(dly_b_multadd_regin_netlist), .dly_b_multadd_regout(dly_b_multadd_regout_netlist), .z_multacc_regout(z_multacc_regout_netlist), .dly_b_multacc_regin(dly_b_multacc_regin_netlist) );
`else
	GJC4_post_synth synth_net (.*, .z_multacc(z_multacc_netlist), .z_multacc_regin(z_multacc_regin_netlist), .z_mult_regin_regout(z_mult_regin_regout_netlist), .z_multadd_regin(z_multadd_regin_netlist), .z_mult_regout(z_mult_regout_netlist), .dly_b_mult_regin(dly_b_mult_regin_netlist), .dly_b_mult_regin_regout(dly_b_mult_regin_regout_netlist), .z_multadd(z_multadd_netlist), .dly_b_multadd(dly_b_multadd_netlist), .z_mult(z_mult_netlist), .z_mult_regin(z_mult_regin_netlist), .z_multacc_regin_regout(z_multacc_regin_regout_netlist), .z_multadd_regin_regout(z_multadd_regin_regout_netlist), .dly_b_multacc_regout(dly_b_multacc_regout_netlist), .dly_b_multacc_regin_regout(dly_b_multacc_regin_regout_netlist), .dly_b_mult_regout(dly_b_mult_regout_netlist), .dly_b_multadd_regin_regout(dly_b_multadd_regin_regout_netlist), .z_multadd_regout(z_multadd_regout_netlist), .dly_b_multadd_regin(dly_b_multadd_regin_netlist), .dly_b_multadd_regout(dly_b_multadd_regout_netlist), .z_multacc_regout(z_multacc_regout_netlist), .dly_b_multacc_regin(dly_b_multacc_regin_netlist) );
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
	{acc_fir, a, feedback, b, shift_right, load_acc, round, saturate_enable, subtract, unsigned_a, unsigned_b } <= 'd0;
	reset <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		acc_fir 			 <= $urandom_range(0,43);
		a 			 <= $urandom();
		feedback 			 <= $urandom();
		b 			 <= $urandom();
		shift_right 			 <= $urandom();
		load_acc 			 <= $urandom();
		round 			 <= $urandom();
		saturate_enable 			 <= $urandom();
		subtract 			 <= $urandom();
		unsigned_a 			 <= $urandom();
		unsigned_b 			 <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	acc_fir <= 43;
	a <= 1048575;
	feedback <= 7;
	b <= 262143;
	shift_right <= 63;
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
	if ( z_multacc !== z_multacc_netlist	||	z_multacc_regin !== z_multacc_regin_netlist	||	z_mult_regin_regout !== z_mult_regin_regout_netlist	||	z_multadd_regin !== z_multadd_regin_netlist	||	z_mult_regout !== z_mult_regout_netlist	||	dly_b_mult_regin !== dly_b_mult_regin_netlist	||	dly_b_mult_regin_regout !== dly_b_mult_regin_regout_netlist	||	z_multadd !== z_multadd_netlist	||	dly_b_multadd !== dly_b_multadd_netlist	||	z_mult !== z_mult_netlist	||	z_mult_regin !== z_mult_regin_netlist	||	z_multacc_regin_regout !== z_multacc_regin_regout_netlist	||	z_multadd_regin_regout !== z_multadd_regin_regout_netlist	||	dly_b_multacc_regout !== dly_b_multacc_regout_netlist	||	dly_b_multacc_regin_regout !== dly_b_multacc_regin_regout_netlist	||	dly_b_mult_regout !== dly_b_mult_regout_netlist	||	dly_b_multadd_regin_regout !== dly_b_multadd_regin_regout_netlist	||	z_multadd_regout !== z_multadd_regout_netlist	||	dly_b_multadd_regin !== dly_b_multadd_regin_netlist	||	dly_b_multadd_regout !== dly_b_multadd_regout_netlist	||	z_multacc_regout !== z_multacc_regout_netlist	||	dly_b_multacc_regin !== dly_b_multacc_regin_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", z_multacc, z_multacc_regin, z_mult_regin_regout, z_multadd_regin, z_mult_regout, dly_b_mult_regin, dly_b_mult_regin_regout, z_multadd, dly_b_multadd, z_mult, z_mult_regin, z_multacc_regin_regout, z_multadd_regin_regout, dly_b_multacc_regout, dly_b_multacc_regin_regout, dly_b_mult_regout, dly_b_multadd_regin_regout, z_multadd_regout, dly_b_multadd_regin, dly_b_multadd_regout, z_multacc_regout, dly_b_multacc_regin, z_multacc_netlist, z_multacc_regin_netlist, z_mult_regin_regout_netlist, z_multadd_regin_netlist, z_mult_regout_netlist, dly_b_mult_regin_netlist, dly_b_mult_regin_regout_netlist, z_multadd_netlist, dly_b_multadd_netlist, z_mult_netlist, z_mult_regin_netlist, z_multacc_regin_regout_netlist, z_multadd_regin_regout_netlist, dly_b_multacc_regout_netlist, dly_b_multacc_regin_regout_netlist, dly_b_mult_regout_netlist, dly_b_multadd_regin_regout_netlist, z_multadd_regout_netlist, dly_b_multadd_regin_netlist, dly_b_multadd_regout_netlist, z_multacc_regout_netlist, dly_b_multacc_regin_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", z_multacc, z_multacc_regin, z_mult_regin_regout, z_multadd_regin, z_mult_regout, dly_b_mult_regin, dly_b_mult_regin_regout, z_multadd, dly_b_multadd, z_mult, z_mult_regin, z_multacc_regin_regout, z_multadd_regin_regout, dly_b_multacc_regout, dly_b_multacc_regin_regout, dly_b_mult_regout, dly_b_multadd_regin_regout, z_multadd_regout, dly_b_multadd_regin, dly_b_multadd_regout, z_multacc_regout, dly_b_multacc_regin, z_multacc_netlist, z_multacc_regin_netlist, z_mult_regin_regout_netlist, z_multadd_regin_netlist, z_mult_regout_netlist, dly_b_mult_regin_netlist, dly_b_mult_regin_regout_netlist, z_multadd_netlist, dly_b_multadd_netlist, z_mult_netlist, z_mult_regin_netlist, z_multacc_regin_regout_netlist, z_multadd_regin_regout_netlist, dly_b_multacc_regout_netlist, dly_b_multacc_regin_regout_netlist, dly_b_mult_regout_netlist, dly_b_multadd_regin_regout_netlist, z_multadd_regout_netlist, dly_b_multadd_regin_netlist, dly_b_multadd_regout_netlist, z_multacc_regout_netlist, dly_b_multacc_regin_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
