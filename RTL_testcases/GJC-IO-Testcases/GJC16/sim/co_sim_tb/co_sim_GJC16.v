`timescale 1ns/1ps
module co_sim_GJC16;
    reg 		[1:0] 		data_i;
    reg 		clk_i;
    wire 		data_o	,	data_o_netlist;
    reg 		enable;
    reg 		reset_n;
	integer		mismatch	=	0;

GJC16	golden (.*);

`ifdef PNR
	GJC16_post_route route_net (.*, .data_o(data_o_netlist) );
`else
	GJC16_post_synth synth_net (.*, .data_o(data_o_netlist) );
`endif

always #1 clk_i = ~clk_i;
		// Initialize values to zero 
initial	begin
	{data_i, clk_i, enable, reset_n } <= 'd0;
	@(negedge clk_i);
	compare();
	reset_n <= 'd1;
	@(negedge clk_i);
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_i <= $urandom();
		enable <= $urandom();
		@(negedge clk_i);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i <= 3;
	clk_i <= 1;
	enable <= 1;
	reset_n <= 0;
	@(negedge clk_i);
	compare();

	data_i <= 3;
	clk_i <= 1;
	enable <= 1;
	reset_n <= 1;
	@(negedge clk_i);
	compare();
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
