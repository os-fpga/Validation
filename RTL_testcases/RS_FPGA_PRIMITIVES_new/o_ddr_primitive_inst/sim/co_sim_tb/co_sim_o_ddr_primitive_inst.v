module co_sim_o_ddr_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg reset;

    reg 		[1:0] 		data_input;
    reg 		enable;
    wire 		output_data	,	output_data_netlist;
	integer		mismatch	=	0;

o_ddr_primitive_inst	golden (.*);

`ifdef PNR
	o_ddr_primitive_inst_post_route route_net (.*, .output_data(output_data_netlist) );
`else
	o_ddr_primitive_inst_post_synth synth_net (.*, .output_data(output_data_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	reset <= 0;
	@(negedge clk);
	{data_input, enable } <= 'd0;
	reset <= 1;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		data_input 		 <= $random();
		enable 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	data_input <= 3;
	enable <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clk);
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
