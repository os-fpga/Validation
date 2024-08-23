`timescale 1ns/1ps
module co_sim_GJC47;
    reg 		[11:0] 		usr_rd_dly_value;
    reg 		[6:0] 		g2f_trx_dly_tap;
    wire 		[5:0] 		dly_tap_val_inv_buf	,	dly_tap_val_inv_buf_netlist;
    reg 		[3:0] 		sel_dly;
    wire 		[11:0] 		data_delayed_buf	,	data_delayed_buf_netlist;
    reg 		[5:0] 		g2f_rx_dly_tap;
    wire 		[4:0] 		f2g_dly_addr	,	f2g_dly_addr_netlist;
    reg 		[5:0] 		din_idly;
    reg 		[5:0] 		din_odly;
    reg 		clk_i_buf;
    reg 		dly_adj_buf;
    reg 		dly_incdec_buf;
    reg 		dly_ld_buf;
    wire 		f2g_trx_dly_adj	,	f2g_trx_dly_adj_netlist;
    wire 		f2g_trx_dly_inc	,	f2g_trx_dly_inc_netlist;
    wire 		f2g_trx_dly_ld	,	f2g_trx_dly_ld_netlist;
    reg 		reset;
	integer		mismatch	=	0;

GJC47	golden (.*);

`ifdef PNR
	GJC47_post_route route_net (.*, .dly_tap_val_inv_buf(dly_tap_val_inv_buf_netlist), .data_delayed_buf(data_delayed_buf_netlist), .f2g_dly_addr(f2g_dly_addr_netlist), .f2g_trx_dly_adj(f2g_trx_dly_adj_netlist), .f2g_trx_dly_inc(f2g_trx_dly_inc_netlist), .f2g_trx_dly_ld(f2g_trx_dly_ld_netlist) );
`else
	GJC47_post_synth synth_net (.*, .dly_tap_val_inv_buf(dly_tap_val_inv_buf_netlist), .data_delayed_buf(data_delayed_buf_netlist), .f2g_dly_addr(f2g_dly_addr_netlist), .f2g_trx_dly_adj(f2g_trx_dly_adj_netlist), .f2g_trx_dly_inc(f2g_trx_dly_inc_netlist), .f2g_trx_dly_ld(f2g_trx_dly_ld_netlist) );
`endif

always #1 clk_i_buf = ~clk_i_buf;
// Initialize values to zero 
initial	begin
	{usr_rd_dly_value, g2f_trx_dly_tap, sel_dly, g2f_rx_dly_tap, din_idly, din_odly, clk_i_buf, dly_adj_buf, dly_incdec_buf, dly_ld_buf } <= 'd0;
	reset <= 1'b1;
	repeat (10) @(negedge clk_i_buf);
	compare();
	reset <= 1'b1;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		usr_rd_dly_value <= $urandom();
		g2f_trx_dly_tap <= $urandom();
		sel_dly <= $urandom();
		g2f_rx_dly_tap <= $urandom();
		din_idly <= $urandom();
		din_odly <= $urandom();
		clk_i_buf <= $urandom();
		dly_adj_buf <= $urandom();
		dly_incdec_buf <= $urandom();
		dly_ld_buf <= $urandom();
		reset <= $urandom();
		@(negedge clk_i_buf);
		compare();
	end
	@(negedge clk_i_buf);
	// ----------- Corner Case stimulus generation -----------
	usr_rd_dly_value <= 4095;
	g2f_trx_dly_tap <= 127;
	sel_dly <= 15;
	g2f_rx_dly_tap <= 63;
	din_idly <= 63;
	din_odly <= 63;
	clk_i_buf <= 1;
	dly_adj_buf <= 1;
	dly_incdec_buf <= 1;
	dly_ld_buf <= 1;
	reset <= 1;
	@(negedge clk_i_buf)
	compare();
	@(negedge clk_i_buf);
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( dly_tap_val_inv_buf !== dly_tap_val_inv_buf_netlist	||	data_delayed_buf !== data_delayed_buf_netlist	||	f2g_dly_addr !== f2g_dly_addr_netlist	||	f2g_trx_dly_adj !== f2g_trx_dly_adj_netlist	||	f2g_trx_dly_inc !== f2g_trx_dly_inc_netlist	||	f2g_trx_dly_ld !== f2g_trx_dly_ld_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", dly_tap_val_inv_buf, data_delayed_buf, f2g_dly_addr, f2g_trx_dly_adj, f2g_trx_dly_inc, f2g_trx_dly_ld, dly_tap_val_inv_buf_netlist, data_delayed_buf_netlist, f2g_dly_addr_netlist, f2g_trx_dly_adj_netlist, f2g_trx_dly_inc_netlist, f2g_trx_dly_ld_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", dly_tap_val_inv_buf, data_delayed_buf, f2g_dly_addr, f2g_trx_dly_adj, f2g_trx_dly_inc, f2g_trx_dly_ld, dly_tap_val_inv_buf_netlist, data_delayed_buf_netlist, f2g_dly_addr_netlist, f2g_trx_dly_adj_netlist, f2g_trx_dly_inc_netlist, f2g_trx_dly_ld_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
