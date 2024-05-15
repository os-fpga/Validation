`timescale 1ns/1ps
module co_sim_GJC26;
    wire 		[1:0] 		data_o_buf	,	data_o_buf_netlist;
    reg 		clk_i_buf;
    reg 		data_i_n;
    reg 		data_i_p;
    reg 		enable_buf;
    reg 		reset_n_buf;
	integer		mismatch	=	0;

GJC26	golden (.*);

`ifdef PNR
	GJC26_post_route route_net (.*, .data_o_buf(data_o_buf_netlist) );
`else
	GJC26_post_synth synth_net (.*, .data_o_buf(data_o_buf_netlist) );
`endif

always #1 clk_i_buf = ~clk_i_buf;
		// Initialize values to zero 
initial	begin
	{clk_i_buf, data_i_n, enable_buf, reset_n_buf } <= 'd0;
	data_i_p <= 'd1;
	#10;
	reset_n_buf <= 'd1;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_i_n <= $urandom();
		data_i_p <= $urandom();
		enable_buf <= $urandom();
		@(negedge clk_i_buf);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i_n <= 1;
	data_i_p <= 1;
	enable_buf <= 1;
	@(negedge clk_i_buf);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( data_o_buf !== data_o_buf_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o_buf, data_o_buf_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o_buf, data_o_buf_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
