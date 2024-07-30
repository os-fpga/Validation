`timescale 1ns/1ps
module co_sim_GJC30;
    wire 		[5:0] 		dly_tap_val_inv_buf	,	dly_tap_val_inv_buf_netlist;
    reg 		clk_i_buf;
    reg 		data_i_n;
	reg 		reset;
    reg 		data_i_p;
    wire 		data_o_inv_delayed_buf	,	data_o_inv_delayed_buf_netlist;
    reg 		dly_adj_buf;
    reg 		dly_incdec_buf;
    reg 		dly_ld_buf;
	integer		mismatch	=	0;

GJC30	golden (.*);

`ifdef PNR
	GJC30_post_route route_net (.*, .dly_tap_val_inv_buf(dly_tap_val_inv_buf_netlist), .data_o_inv_delayed_buf(data_o_inv_delayed_buf_netlist) );
`else
	GJC30_post_synth synth_net (.*, .dly_tap_val_inv_buf(dly_tap_val_inv_buf_netlist), .data_o_inv_delayed_buf(data_o_inv_delayed_buf_netlist) );
`endif

reg random;

always #100 clk_i_buf = ~clk_i_buf;
		
initial	begin
	// Initialize values to zero 
	{clk_i_buf, random, data_i_n, dly_adj_buf, dly_incdec_buf, dly_ld_buf } <= 'd0;
	data_i_p <= 'd1;
	reset <= 1;
	@(negedge clk_i_buf);
	@(negedge clk_i_buf);
	reset <= 0;

// Generating random stimulus 
	for (int i = 0; i < 1000; i = i + 1) begin
		random 			<= $random();
		data_i_p 		<= random;
		data_i_n 		<= ~random;
		dly_adj_buf 	<= $urandom();
		dly_incdec_buf 	<= $urandom();
		dly_ld_buf 		<= $urandom();
		@(negedge clk_i_buf);
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_i_n <= 1;
	data_i_p <= 1;
	dly_adj_buf <= 1;
	dly_incdec_buf <= 1;
	dly_ld_buf <= 1;
	@(negedge clk_i_buf);
	#1
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
	if ( dly_tap_val_inv_buf !== dly_tap_val_inv_buf_netlist	||	data_o_inv_delayed_buf !== data_o_inv_delayed_buf_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", dly_tap_val_inv_buf, data_o_inv_delayed_buf, dly_tap_val_inv_buf_netlist, data_o_inv_delayed_buf_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", dly_tap_val_inv_buf, data_o_inv_delayed_buf, dly_tap_val_inv_buf_netlist, data_o_inv_delayed_buf_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule