`timescale 1ns/1ps
module co_sim_comparator1BitVerilog;
    wire 		eq	,	eq_netlist;
    reg 		x;
    reg 		y;
	integer		mismatch	=	0;

comparator1BitVerilog	golden (.*);

`ifdef PNR
	comparator1BitVerilog_post_route route_net (.*, .eq(eq_netlist) );
`else
	comparator1BitVerilog_post_synth synth_net (.*, .eq(eq_netlist) );
`endif

		// Initialize values to zero 
initial	begin
	{x, y } <= 'd0;
	#10;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		x <= $urandom();
		y <= $urandom();
		#10;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	x <= 1;
	y <= 1;
	compare();
	#10;
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( eq !== eq_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", eq, eq_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", eq, eq_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
