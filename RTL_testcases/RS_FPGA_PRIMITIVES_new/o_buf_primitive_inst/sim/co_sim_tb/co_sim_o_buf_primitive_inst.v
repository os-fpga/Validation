`timescale 1ns/1ps
module co_sim_o_buf_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg rst;

    reg 		data_in;
    wire 		data_output	,	data_output_netlist;
	integer		mismatch	=	0;

o_buf_primitive_inst	golden (.*);

`ifdef PNR
	o_buf_primitive_inst_post_route route_net (.*, .data_output(data_output_netlist) );
`else
	o_buf_primitive_inst_post_synth synth_net (.*, .data_output(data_output_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	rst <= 1;
	@(negedge clk);
	{data_in } <= 'd0;
	rst <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		data_in 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	data_in <= 1;
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
