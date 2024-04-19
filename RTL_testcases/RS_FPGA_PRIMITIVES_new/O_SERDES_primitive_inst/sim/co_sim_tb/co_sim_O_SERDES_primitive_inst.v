module co_sim_O_SERDES_primitive_inst;
// Clock signals
    reg CLK_IN;
    reg 		[3:0] 		in;
    reg 		CHANNEL_BOND_SYNC_IN;
    wire 		CHANNEL_BOND_SYNC_OUT	,	CHANNEL_BOND_SYNC_OUT_netlist;
    reg 		LOAD_WORD;
    reg 		OE_IN;
    wire 		OE_OUT	,	OE_OUT_netlist;
    reg 		PLL_CLK;
    reg 		PLL_LOCK;
    wire 		Q	,	Q_netlist;
    reg 		RST;
    reg 		reset;
	integer		mismatch	=	0;

O_SERDES_primitive_inst	golden (.*);

`ifdef PNR
	O_SERDES_primitive_inst_post_route route_net (.*, .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist), .OE_OUT(OE_OUT_netlist), .Q(Q_netlist) );
`else
	O_SERDES_primitive_inst_post_synth synth_net (.*, .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist), .OE_OUT(OE_OUT_netlist), .Q(Q_netlist) );
`endif

//clock initialization for CLK_IN
    initial begin
        CLK_IN = 1'b0;
        forever #5 CLK_IN = ~CLK_IN;
    end
// Initialize values to zero 
initial	begin
	{in, CHANNEL_BOND_SYNC_IN, LOAD_WORD, OE_IN, PLL_CLK, PLL_LOCK, RST, reset } <= 'd0;
	 repeat (2) @ (negedge CLK_IN); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		in <= $random();
		CHANNEL_BOND_SYNC_IN <= $random();
		LOAD_WORD <= $random();
		OE_IN <= $random();
		PLL_CLK <= $random();
		PLL_LOCK <= $random();
		RST <= $random();
		reset <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	in <= 15;
	CHANNEL_BOND_SYNC_IN <= 1;
	LOAD_WORD <= 1;
	OE_IN <= 1;
	PLL_CLK <= 1;
	PLL_LOCK <= 1;
	RST <= 1;
	reset <= 1;
	repeat (2) @ (negedge CLK_IN);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( CHANNEL_BOND_SYNC_OUT !== CHANNEL_BOND_SYNC_OUT_netlist	||	OE_OUT !== OE_OUT_netlist	||	Q !== Q_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", CHANNEL_BOND_SYNC_OUT, OE_OUT, Q, CHANNEL_BOND_SYNC_OUT_netlist, OE_OUT_netlist, Q_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", CHANNEL_BOND_SYNC_OUT, OE_OUT, Q, CHANNEL_BOND_SYNC_OUT_netlist, OE_OUT_netlist, Q_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
