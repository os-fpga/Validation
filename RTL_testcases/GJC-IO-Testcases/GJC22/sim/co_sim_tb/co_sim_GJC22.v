`timescale 1ns/1ps
module co_sim_GJC22;
    reg 		clk;
    reg 		data_i;
    wire 		data_o	,	data_o_netlist;
    reg 		enable;
	integer		mismatch	=	0;

GJC22	golden (.*);

`ifdef PNR
	GJC22_post_route route_net (.*, .data_o(data_o_netlist) );
`else
	GJC22_post_synth synth_net (.*, .data_o(data_o_netlist) );
`endif

always #1 clk = ~clk;
		// Initialize values to zero 
initial	begin
	{clk, data_i, enable } <= 'd0;
	@(negedge clk);
	compare();
// Generating random stimulus 
	for (int i = 0; i < 1000; i = i + 1) begin
		data_i <= $urandom();
		enable <= $urandom();
		@(negedge clk);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i <= 1;
	enable <= 1;
	@(negedge clk);
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
	if ( data_o !== data_o_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o, data_o_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o, data_o_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
