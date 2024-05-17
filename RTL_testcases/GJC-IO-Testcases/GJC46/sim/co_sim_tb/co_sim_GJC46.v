`timescale 1ns/1ps
module co_sim_GJC46;
// Clock signals
    reg			clkGHz;
// Reset signals
    reg			reset;

    reg 		bitslip_ctrl_n;
    reg 		data_i;
    wire 		data_o	,	data_o_netlist;
    reg 		enable_n;
    wire 		ready	,	ready_netlist;
	integer		mismatch	=	0;

GJC46	golden (.*);

`ifdef PNR
	GJC46_post_route route_net (.*, .data_o(data_o_netlist), .ready(ready_netlist) );
`else
	GJC46_post_synth synth_net (.*, .data_o(data_o_netlist), .ready(ready_netlist) );
`endif

// clock initialization for clkGHz
initial begin
	clkGHz = 1'b0;
	forever #1 clkGHz = ~clkGHz;
end
//Reset Stimulus generation
initial begin
	reset <= 1;
	enable_n <= 1;
	@(negedge clkGHz);
	{bitslip_ctrl_n, data_i } <= 'd0;
	reset <= 0;
	@(negedge clkGHz);
	$display ("***Reset Test is applied***");
	enable_n <= 0;
	@(negedge clkGHz);
	@(negedge clkGHz);
	bitslip_ctrl_n <= 1;
	@(negedge clkGHz);
	@(negedge clkGHz);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(1000) @ (negedge clkGHz) begin
		// bitslip_ctrl_n 			 <= $urandom();
		data_i 			 <= $urandom();
		// enable_n 			 <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	bitslip_ctrl_n <= 1;
	data_i <= 1;
	enable_n <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(10) @(posedge clkGHz);
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
