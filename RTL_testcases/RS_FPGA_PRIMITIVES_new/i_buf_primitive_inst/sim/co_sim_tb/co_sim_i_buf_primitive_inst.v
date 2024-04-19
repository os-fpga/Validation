module co_sim_i_buf_primitive_inst;
    reg 		data_input;
    wire 		data_output	,	data_output_netlist;
    reg 		enable_input;
    reg 		enable_output;
	integer		mismatch	=	0;

i_buf_primitive_inst	golden (.*);

`ifdef PNR
	i_buf_primitive_inst_post_route route_net (.*, .data_output(data_output_netlist) );
`else
	i_buf_primitive_inst_post_synth synth_net (.*, .data_output(data_output_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{data_input, enable_input, enable_output } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_input <= $random();
		enable_input <= $random();
		enable_output <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_input <= 1;
	enable_input <= 1;
	enable_output <= 1;
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
	if ( data_output !== data_output_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_output, data_output_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_output, data_output_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
