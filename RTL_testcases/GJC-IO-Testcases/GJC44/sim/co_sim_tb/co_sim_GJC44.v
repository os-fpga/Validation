`timescale 1ns/1ps
module co_sim_GJC44;
    wire 		[9:0] 		data_o	,	data_o_netlist;
    reg 		clkGHz;
    reg 		data_i;
    reg 		enable_n;
    wire 		ready	,	ready_netlist;
    reg 		reset;
	integer		mismatch	=	0;

GJC44	golden (.*);

`ifdef PNR
	GJC44_post_route route_net (.*, .data_o(data_o_netlist), .ready(ready_netlist) );
`else
	GJC44_post_synth synth_net (.*, .data_o(data_o_netlist), .ready(ready_netlist) );
`endif

		// Initialize values to zero 
initial	begin
	{clkGHz, data_i, enable_n } <= 'd0;
	reset <= 1;
	#10;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		clkGHz <= $urandom();
		data_i <= $urandom();
		enable_n <= $urandom();
		reset <= $urandom();
		#10;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	clkGHz <= 1;
	data_i <= 1;
	enable_n <= 1;
	reset <= 1;
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
	if ( data_o !== data_o_netlist	||	ready !== ready_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", data_o, ready, data_o_netlist, ready_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", data_o, ready, data_o_netlist, ready_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
