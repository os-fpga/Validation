`timescale 1ns/1ps
module co_sim_GJC32;
    reg 		[1:0] 		data_i_buf;
    reg 		clk_i_buf;
    wire 		data_o	,	data_o_netlist;
    reg 		dly_inc_pulse_inv_buf;
    reg 		enable_buf;
    reg 		reset_n_buf;
	integer		mismatch	=	0;

GJC32	golden (.*);

`ifdef PNR
	GJC32_post_route route_net (.*, .data_o(data_o_netlist) );
`else
	GJC32_post_synth synth_net (.*, .data_o(data_o_netlist) );
`endif

always #50 clk_i_buf = ~clk_i_buf;

		// Initialize values to zero 
initial	begin
	{data_i_buf, clk_i_buf, dly_inc_pulse_inv_buf, enable_buf, reset_n_buf } <= 'd0;
	#100;
	reset_n_buf <= 'd1;
// Generating random stimulus 
	for (int i = 0; i < 1000; i = i + 1) begin
		data_i_buf <= $urandom();
		dly_inc_pulse_inv_buf <= $urandom();
		enable_buf <= $urandom();
		@(negedge clk_i_buf);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i_buf <= 3;
	dly_inc_pulse_inv_buf <= 1;
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
