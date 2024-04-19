module co_sim_i_ddr_primitive_inst;
    wire 		[1:0] 		output_data	,	output_data_netlist;
    reg 		clock;
    reg 		data_input;
    reg 		enable;
    reg 		reset;
	integer		mismatch	=	0;

i_ddr_primitive_inst	golden (.*);

`ifdef PNR
	i_ddr_primitive_inst_post_route route_net (.*, .output_data(output_data_netlist) );
`else
	i_ddr_primitive_inst_post_synth synth_net (.*, .output_data(output_data_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{clock, data_input, enable, reset } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		clock <= $random();
		data_input <= $random();
		enable <= $random();
		reset <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	clock <= 1;
	data_input <= 1;
	enable <= 1;
	reset <= 1;
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
	if ( output_data !== output_data_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", output_data, output_data_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", output_data, output_data_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
