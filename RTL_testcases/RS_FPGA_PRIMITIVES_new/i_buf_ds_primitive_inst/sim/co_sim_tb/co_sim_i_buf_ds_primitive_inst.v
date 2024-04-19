module co_sim_i_buf_ds_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg enable_output;

    reg 		data_negative_input;
    wire 		data_output	,	data_output_netlist;
    reg 		data_positive_input;
    reg 		enable_input;
	integer		mismatch	=	0;

i_buf_ds_primitive_inst	golden (.*);

`ifdef PNR
	i_buf_ds_primitive_inst_post_route route_net (.*, .data_output(data_output_netlist) );
`else
	i_buf_ds_primitive_inst_post_synth synth_net (.*, .data_output(data_output_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	enable_output <= 0;
	@(negedge clk);
	{data_negative_input, data_positive_input, enable_input } <= 'd0;
	enable_output <= 1;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		data_negative_input 		 <= $random();
		data_positive_input 		 <= $random();
		enable_input 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	data_negative_input <= 1;
	data_positive_input <= 1;
	enable_input <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clk);
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
