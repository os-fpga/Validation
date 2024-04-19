module co_sim_FIFO36K_synch_primitive_inst;
    wire 		[35:0] 		pop	,	pop_netlist;
    reg 		[35:0] 		push;
    wire 		almost_empty	,	almost_empty_netlist;
    wire 		almost_full	,	almost_full_netlist;
    reg 		clk;
    wire 		empty	,	empty_netlist;
    wire 		full	,	full_netlist;
    wire 		overflow	,	overflow_netlist;
    wire 		prog_empty	,	prog_empty_netlist;
    wire 		prog_full	,	prog_full_netlist;
    reg 		rd_en;
    reg 		rst;
    wire 		underflow	,	underflow_netlist;
    reg 		wr_en;
	integer		mismatch	=	0;

FIFO36K_synch_primitive_inst	golden (.*);

`ifdef PNR
	FIFO36K_synch_primitive_inst_post_route route_net (.*, .pop(pop_netlist), .almost_empty(almost_empty_netlist), .almost_full(almost_full_netlist), .empty(empty_netlist), .full(full_netlist), .overflow(overflow_netlist), .prog_empty(prog_empty_netlist), .prog_full(prog_full_netlist), .underflow(underflow_netlist) );
`else
	FIFO36K_synch_primitive_inst_post_synth synth_net (.*, .pop(pop_netlist), .almost_empty(almost_empty_netlist), .almost_full(almost_full_netlist), .empty(empty_netlist), .full(full_netlist), .overflow(overflow_netlist), .prog_empty(prog_empty_netlist), .prog_full(prog_full_netlist), .underflow(underflow_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{push, clk, rd_en, rst, wr_en } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		push <= $random();
		clk <= $random();
		rd_en <= $random();
		rst <= $random();
		wr_en <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	push <= 68719476735;
	clk <= 1;
	rd_en <= 1;
	rst <= 1;
	wr_en <= 1;
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
	if ( pop !== pop_netlist	||	almost_empty !== almost_empty_netlist	||	almost_full !== almost_full_netlist	||	empty !== empty_netlist	||	full !== full_netlist	||	overflow !== overflow_netlist	||	prog_empty !== prog_empty_netlist	||	prog_full !== prog_full_netlist	||	underflow !== underflow_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", pop, almost_empty, almost_full, empty, full, overflow, prog_empty, prog_full, underflow, pop_netlist, almost_empty_netlist, almost_full_netlist, empty_netlist, full_netlist, overflow_netlist, prog_empty_netlist, prog_full_netlist, underflow_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", pop, almost_empty, almost_full, empty, full, overflow, prog_empty, prog_full, underflow, pop_netlist, almost_empty_netlist, almost_full_netlist, empty_netlist, full_netlist, overflow_netlist, prog_empty_netlist, prog_full_netlist, underflow_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
