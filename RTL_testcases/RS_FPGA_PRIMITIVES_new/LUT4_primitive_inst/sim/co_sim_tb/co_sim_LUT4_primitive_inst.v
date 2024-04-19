module co_sim_LUT4_primitive_inst;
    reg 		[3:0] 		A_LUT4;
    wire 		Y_LUT4	,	Y_LUT4_netlist;
	integer		mismatch	=	0;

LUT4_primitive_inst	golden (.*);

`ifdef PNR
	LUT4_primitive_inst_post_route route_net (.*, .Y_LUT4(Y_LUT4_netlist) );
`else
	LUT4_primitive_inst_post_synth synth_net (.*, .Y_LUT4(Y_LUT4_netlist) );
`endif

// Initialize values to zero 
initial	begin
	A_LUT4 <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		A_LUT4 <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	A_LUT4 <= 15;
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
	if ( Y_LUT4 !== Y_LUT4_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", Y_LUT4, Y_LUT4_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", Y_LUT4, Y_LUT4_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
