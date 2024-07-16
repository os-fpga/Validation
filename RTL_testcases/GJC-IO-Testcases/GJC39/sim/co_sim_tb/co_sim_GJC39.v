`timescale 1ns/1ps
module co_sim_GJC39;
    wire 		clk_o	,	clk_o_netlist;
    wire 		data_o	,	data_o_netlist;
    reg 		enable_n;
    reg 		reset;
	integer		mismatch	=	0;

GJC39	golden (.*);

`ifdef PNR
	GJC39_post_route route_net (.*, .clk_o(clk_o_netlist), .data_o(data_o_netlist) );
`else
	GJC39_post_synth synth_net (.*, .clk_o(clk_o_netlist), .data_o(data_o_netlist) );
`endif

		// Initialize values to zero 
initial	begin
	enable_n <= 'd1;
	reset <= 'd1;
	#10;
// Generating random stimulus 
	for (int i = 0; i < 1000; i = i + 1) begin
		enable_n <= 'd0;
		reset <= 'd0;
		#10;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	enable_n <= 1;
	reset <= 1;
	compare();
	#10;
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#10;
	$finish;
end

task compare();
	if ( clk_o !== clk_o_netlist	||	data_o !== data_o_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", clk_o, data_o, clk_o_netlist, data_o_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", clk_o, data_o, clk_o_netlist, data_o_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
