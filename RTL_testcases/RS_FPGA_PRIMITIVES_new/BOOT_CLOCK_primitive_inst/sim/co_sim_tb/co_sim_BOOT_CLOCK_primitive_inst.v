module co_sim_BOOT_CLOCK_primitive_inst;
// Clock signals
    reg clk1;
    wire 		O_BOOT_CLOCK	,	O_BOOT_CLOCK_netlist;
    reg 		async_signal;
    wire 		sync_signal	,	sync_signal_netlist;
	integer		mismatch	=	0;

BOOT_CLOCK_primitive_inst	golden (.*);

`ifdef PNR
	BOOT_CLOCK_primitive_inst_post_route route_net (.*, .O_BOOT_CLOCK(O_BOOT_CLOCK_netlist), .sync_signal(sync_signal_netlist) );
`else
	BOOT_CLOCK_primitive_inst_post_synth synth_net (.*, .O_BOOT_CLOCK(O_BOOT_CLOCK_netlist), .sync_signal(sync_signal_netlist) );
`endif

//clock initialization for clk1
    initial begin
        clk1 = 1'b0;
        forever #5 clk1 = ~clk1;
    end
// Initialize values to zero 
initial	begin
	
	async_signal <= 'd0;
	 repeat (2) @ (negedge clk1); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clk1) begin
		async_signal <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	async_signal <= 1;
	repeat (2) @ (negedge clk1);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( O_BOOT_CLOCK !== O_BOOT_CLOCK_netlist	||	sync_signal !== sync_signal_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_BOOT_CLOCK, sync_signal, O_BOOT_CLOCK_netlist, sync_signal_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_BOOT_CLOCK, sync_signal, O_BOOT_CLOCK_netlist, sync_signal_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
