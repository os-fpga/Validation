`timescale 1ns/1ps
module co_sim_GJC20;
    reg 		clk_i_buf;
    reg 		data_i;
    wire 		[1:0] 		data_o_buf	,	data_o_buf_netlist;
    reg 		dly_inc_pulse_inv_buf;
    reg 		enable_buf;
    reg 		reset_n_buf;
	integer		mismatch	=	0;

GJC20	golden (.*);

`ifdef PNR
	GJC20_post_route route_net (.*, .data_o_buf(data_o_buf_netlist) );
`else
	GJC20_post_synth synth_net (.*, .data_o_buf(data_o_buf_netlist) );
`endif

always #100 clk_i_buf = ~clk_i_buf;
		// Initialize values to zero 
initial	begin
	{clk_i_buf, data_i, dly_inc_pulse_inv_buf, enable_buf, reset_n_buf } <= 'd0;
	@ (negedge clk_i_buf);
	@ (negedge clk_i_buf);
	reset_n_buf <= 'd1;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_i <= $urandom();
		dly_inc_pulse_inv_buf <= $urandom();
		enable_buf <= $urandom();
		@ (negedge clk_i_buf);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i <= 1;
	dly_inc_pulse_inv_buf <= 1;
	enable_buf <= 1;
	@ (negedge clk_i_buf);
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
