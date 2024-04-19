module co_sim_dffre_primitive_inst;
// Clock signals
    reg clock;
// Reset signals
    reg reset;

    reg 		data_input;
    wire 		data_output	,	data_output_netlist;
    reg 		enable;
	integer		mismatch	=	0;

dffre_primitive_inst	golden (.*);

`ifdef PNR
	dffre_primitive_inst_post_route route_net (.*, .data_output(data_output_netlist) );
`else
	dffre_primitive_inst_post_synth synth_net (.*, .data_output(data_output_netlist) );
`endif

//clock initialization for clock
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
//Reset Stimulus generation
initial begin
	reset <= 0;
	@(negedge clock);
	{data_input, enable } <= 'd0;
	reset <= 1;
	@(negedge clock);
	$display ("***Reset Test is applied***");
	@(negedge clock);
	@(negedge clock);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clock) begin
		data_input 		 <= $random();
		enable 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	data_input <= 1;
	enable <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clock);
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
