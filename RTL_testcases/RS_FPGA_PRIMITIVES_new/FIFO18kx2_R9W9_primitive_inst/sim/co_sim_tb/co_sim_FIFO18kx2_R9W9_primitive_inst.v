`timescale 1ns/1ps
module co_sim_FIFO18kx2_R9W9_primitive_inst;
    reg 		[8:0] 		din1;
    reg 		[8:0] 		din2;
    wire 		[8:0] 		dout1	,	dout1_netlist;
    wire 		[8:0] 		dout2	,	dout2_netlist;
    wire 		almost_empty1	,	almost_empty1_netlist;
    wire 		almost_empty2	,	almost_empty2_netlist;
    wire 		almost_full1	,	almost_full1_netlist;
    wire 		almost_full2	,	almost_full2_netlist;
    reg 		clock0;
    reg 		clock1;
    reg 		clock2;
    reg 		clock3;
    wire 		empty1	,	empty1_netlist;
    wire 		empty2	,	empty2_netlist;
    wire 		full1	,	full1_netlist;
    wire 		full2	,	full2_netlist;
    wire 		overflow1	,	overflow1_netlist;
    wire 		overflow2	,	overflow2_netlist;
    wire 		prog_empty1	,	prog_empty1_netlist;
    wire 		prog_empty2	,	prog_empty2_netlist;
    wire 		prog_full1	,	prog_full1_netlist;
    wire 		prog_full2	,	prog_full2_netlist;
    reg 		re1;
    reg 		re2;
    reg 		rst_ptr1;
    reg 		rst_ptr2;
    wire 		underflow1	,	underflow1_netlist;
    wire 		underflow2	,	underflow2_netlist;
    reg 		we1;
    reg 		we2;
	integer		mismatch	=	0;

FIFO18kx2_R9W9_primitive_inst	golden (.*);

`ifdef PNR
	FIFO18kx2_R9W9_primitive_inst_post_route route_net (.*, .dout1(dout1_netlist), .dout2(dout2_netlist), .almost_empty1(almost_empty1_netlist), .almost_empty2(almost_empty2_netlist), .almost_full1(almost_full1_netlist), .almost_full2(almost_full2_netlist), .empty1(empty1_netlist), .empty2(empty2_netlist), .full1(full1_netlist), .full2(full2_netlist), .overflow1(overflow1_netlist), .overflow2(overflow2_netlist), .prog_empty1(prog_empty1_netlist), .prog_empty2(prog_empty2_netlist), .prog_full1(prog_full1_netlist), .prog_full2(prog_full2_netlist), .underflow1(underflow1_netlist), .underflow2(underflow2_netlist) );
`else
	FIFO18kx2_R9W9_primitive_inst_post_synth synth_net (.*, .dout1(dout1_netlist), .dout2(dout2_netlist), .almost_empty1(almost_empty1_netlist), .almost_empty2(almost_empty2_netlist), .almost_full1(almost_full1_netlist), .almost_full2(almost_full2_netlist), .empty1(empty1_netlist), .empty2(empty2_netlist), .full1(full1_netlist), .full2(full2_netlist), .overflow1(overflow1_netlist), .overflow2(overflow2_netlist), .prog_empty1(prog_empty1_netlist), .prog_empty2(prog_empty2_netlist), .prog_full1(prog_full1_netlist), .prog_full2(prog_full2_netlist), .underflow1(underflow1_netlist), .underflow2(underflow2_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{din1, din2, clock0, clock1, clock2, clock3, re1, re2, rst_ptr1, rst_ptr2, we1, we2 } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		din1 <= $random();
		din2 <= $random();
		clock0 <= $random();
		clock1 <= $random();
		clock2 <= $random();
		clock3 <= $random();
		re1 <= $random();
		re2 <= $random();
		rst_ptr1 <= $random();
		rst_ptr2 <= $random();
		we1 <= $random();
		we2 <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	din1 <= 511;
	din2 <= 511;
	clock0 <= 1;
	clock1 <= 1;
	clock2 <= 1;
	clock3 <= 1;
	re1 <= 1;
	re2 <= 1;
	rst_ptr1 <= 1;
	rst_ptr2 <= 1;
	we1 <= 1;
	we2 <= 1;
	compare();
	#50;
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( dout1 !== dout1_netlist	||	dout2 !== dout2_netlist	||	almost_empty1 !== almost_empty1_netlist	||	almost_empty2 !== almost_empty2_netlist	||	almost_full1 !== almost_full1_netlist	||	almost_full2 !== almost_full2_netlist	||	empty1 !== empty1_netlist	||	empty2 !== empty2_netlist	||	full1 !== full1_netlist	||	full2 !== full2_netlist	||	overflow1 !== overflow1_netlist	||	overflow2 !== overflow2_netlist	||	prog_empty1 !== prog_empty1_netlist	||	prog_empty2 !== prog_empty2_netlist	||	prog_full1 !== prog_full1_netlist	||	prog_full2 !== prog_full2_netlist	||	underflow1 !== underflow1_netlist	||	underflow2 !== underflow2_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", dout1, dout2, almost_empty1, almost_empty2, almost_full1, almost_full2, empty1, empty2, full1, full2, overflow1, overflow2, prog_empty1, prog_empty2, prog_full1, prog_full2, underflow1, underflow2, dout1_netlist, dout2_netlist, almost_empty1_netlist, almost_empty2_netlist, almost_full1_netlist, almost_full2_netlist, empty1_netlist, empty2_netlist, full1_netlist, full2_netlist, overflow1_netlist, overflow2_netlist, prog_empty1_netlist, prog_empty2_netlist, prog_full1_netlist, prog_full2_netlist, underflow1_netlist, underflow2_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", dout1, dout2, almost_empty1, almost_empty2, almost_full1, almost_full2, empty1, empty2, full1, full2, overflow1, overflow2, prog_empty1, prog_empty2, prog_full1, prog_full2, underflow1, underflow2, dout1_netlist, dout2_netlist, almost_empty1_netlist, almost_empty2_netlist, almost_full1_netlist, almost_full2_netlist, empty1_netlist, empty2_netlist, full1_netlist, full2_netlist, overflow1_netlist, overflow2_netlist, prog_empty1_netlist, prog_empty2_netlist, prog_full1_netlist, prog_full2_netlist, underflow1_netlist, underflow2_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
