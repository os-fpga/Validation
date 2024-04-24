module co_sim_clk_buf_primitive_inst;
// Clock signals
    reg clock_input;
    wire 		clock_output	,	clock_output_netlist;
	integer		mismatch	=	0;

clk_buf_primitive_inst	golden (.*);

`ifdef PNR
	clk_buf_primitive_inst_post_route route_net (.*, .clock_output(clock_output_netlist) );
`else
	clk_buf_primitive_inst_post_synth synth_net (.*, .clock_output(clock_output_netlist) );
`endif

//clock initialization for clock_input
    initial begin
        clock_input = 1'b0;
        forever #5 clock_input = ~clock_input;
    end
// Initialize values to zero 
initial	begin
	repeat (2) @ (negedge clock_input);


	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clock_input) begin

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @ (negedge clock_input);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( clock_output !== clock_output_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", clock_output, clock_output_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", clock_output, clock_output_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
