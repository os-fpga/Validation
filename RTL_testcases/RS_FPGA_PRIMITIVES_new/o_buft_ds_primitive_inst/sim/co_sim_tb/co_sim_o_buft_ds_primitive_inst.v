module co_sim_o_buft_ds_primitive_inst;
    wire 		O_N_O_BUFT_DS	,	O_N_O_BUFT_DS_netlist;
    wire 		O_P_O_BUFT_DS	,	O_P_O_BUFT_DS_netlist;
    reg 		d1;
    reg 		d2;
    reg 		en1;
    reg 		en2;
	integer		mismatch	=	0;

o_buft_ds_primitive_inst	golden (.*);

`ifdef PNR
	o_buft_ds_primitive_inst_post_route route_net (.*, .O_N_O_BUFT_DS(O_N_O_BUFT_DS_netlist), .O_P_O_BUFT_DS(O_P_O_BUFT_DS_netlist) );
`else
	o_buft_ds_primitive_inst_post_synth synth_net (.*, .O_N_O_BUFT_DS(O_N_O_BUFT_DS_netlist), .O_P_O_BUFT_DS(O_P_O_BUFT_DS_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{d1, d2, en1, en2 } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		d1 <= $random();
		d2 <= $random();
		en1 <= $random();
		en2 <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	d1 <= 1;
	d2 <= 1;
	en1 <= 1;
	en2 <= 1;
	compare();
	#50;
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( O_N_O_BUFT_DS !== O_N_O_BUFT_DS_netlist	||	O_P_O_BUFT_DS !== O_P_O_BUFT_DS_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_N_O_BUFT_DS, O_P_O_BUFT_DS, O_N_O_BUFT_DS_netlist, O_P_O_BUFT_DS_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_N_O_BUFT_DS, O_P_O_BUFT_DS, O_N_O_BUFT_DS_netlist, O_P_O_BUFT_DS_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
