module co_sim_clk_mux;
// Reset signals
    reg rst;

    reg 		[31:0] 		data_in;
    wire 		[31:0] 		data_out	,	data_out_netlist;
    reg 		clk;
    reg 		clk_sel;
	integer		mismatch	=	0;

	clk_mux	golden (.*);
	`ifdef PNR
		clk_mux_post_route route_net (.*, .data_out(data_out_netlist) );
	`else
		clk_mux_post_synth synth_net (.*, .data_out(data_out_netlist) );
	`endif

	always #1 clk = ~clk;

// Initialize values to zero 
initial	begin
	{data_in, clk, clk_sel } <= 'd0;
	rst <= 1;
	#10;
	rst <= 0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_in <= $random();
		#50;
		compare();
	end

	clk_sel <= 1;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_in <= $random();
		#50;
		compare();
	end
	rst <= 1;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_in <= $random();
		#50;
		compare();
	end
	rst <= 0;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_in <= $random();
		#50;
		compare();
	end

	clk_sel <= 0;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		data_in <= $random();
		#50;
		compare();
	end
	// ----------- Corner Case stimulus generation -----------
	data_in <= 4294967295;
	// clk <= 1;
	clk_sel <= 1;
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
	if ( data_out !== data_out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_out, data_out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_out, data_out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
