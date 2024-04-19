module co_sim_LUT3_primitive_inst;
    reg 		[2:0] 		A_LUT3;
    wire 		Y_LUT3	,	Y_LUT3_netlist;
	integer		mismatch	=	0;

LUT3_primitive_inst	golden (.*);

`ifdef PNR
	LUT3_primitive_inst_post_route route_net (.*, .Y_LUT3(Y_LUT3_netlist) );
`else
	LUT3_primitive_inst_post_synth synth_net (.*, .Y_LUT3(Y_LUT3_netlist) );
`endif

// Initialize values to zero 
initial	begin
	A_LUT3 <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		A_LUT3 <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	A_LUT3 <= 7;
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
	if ( Y_LUT3 !== Y_LUT3_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", Y_LUT3, Y_LUT3_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", Y_LUT3, Y_LUT3_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
