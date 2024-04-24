module co_sim_I_SERDES_primitive_inst;
// Clock signals
    reg CLK_IN;
// Reset signals
    reg reset;

    wire 		[3:0] 		Q	,	Q_netlist;
    reg 		BITSLIP_ADJ;
    wire 		CLK_OUT	,	CLK_OUT_netlist;
    wire 		DATA_VALID	,	DATA_VALID_netlist;
    wire 		DPA_ERROR	,	DPA_ERROR_netlist;
    wire 		DPA_LOCK	,	DPA_LOCK_netlist;
    reg 		EN;
    reg 		PLL_CLK;
    reg 		PLL_LOCK;
    reg 		RX_RST;
    reg 		data_in;
	integer		mismatch	=	0;

I_SERDES_primitive_inst	golden (.*);

`ifdef PNR
	I_SERDES_primitive_inst_post_route route_net (.*, .Q(Q_netlist), .CLK_OUT(CLK_OUT_netlist), .DATA_VALID(DATA_VALID_netlist), .DPA_ERROR(DPA_ERROR_netlist), .DPA_LOCK(DPA_LOCK_netlist) );
`else
	I_SERDES_primitive_inst_post_synth synth_net (.*, .Q(Q_netlist), .CLK_OUT(CLK_OUT_netlist), .DATA_VALID(DATA_VALID_netlist), .DPA_ERROR(DPA_ERROR_netlist), .DPA_LOCK(DPA_LOCK_netlist) );
`endif

//clock initialization for CLK_IN
    initial begin
        CLK_IN = 1'b0;
        forever #5 CLK_IN = ~CLK_IN;
    end
//Reset Stimulus generation
initial begin
	reset <= 1;
	@(negedge CLK_IN);
	{BITSLIP_ADJ, EN, PLL_CLK, PLL_LOCK, RX_RST, data_in } <= 'd0;
	reset <= 0;
	@(negedge CLK_IN);
	$display ("***Reset Test is applied***");
	@(negedge CLK_IN);
	@(negedge CLK_IN);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(10000) @ (negedge CLK_IN) begin
		BITSLIP_ADJ 		 <= $random();
		EN 		 					 <= $random();
		PLL_CLK 		 	   <= $random();
		PLL_LOCK 		 	   <= 1;
		RX_RST 		 			 <= 1;
		data_in 		 	   <= $random();
		compare();
end

	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		BITSLIP_ADJ 		 <= $random();
		EN 		 					 <= $random();
		PLL_CLK 		 	   <= $random();
		PLL_LOCK 		 	   <= $random();
		RX_RST 		 			 <= $random();
		data_in 		 	   <= $random();
		compare();
end
	
	// ----------- Corner Case stimulus generation -----------
	BITSLIP_ADJ <= 1;
	EN <= 1;
	PLL_CLK <= 1;
	PLL_LOCK <= 1;
	RX_RST <= 1;
	data_in <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge CLK_IN);
	$finish;
end

task compare();
	if ( Q !== Q_netlist	||	CLK_OUT !== CLK_OUT_netlist	||	DATA_VALID !== DATA_VALID_netlist	||	DPA_ERROR !== DPA_ERROR_netlist	||	DPA_LOCK !== DPA_LOCK_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, Time: %0t ", Q, CLK_OUT, DATA_VALID, DPA_ERROR, DPA_LOCK, Q_netlist, CLK_OUT_netlist, DATA_VALID_netlist, DPA_ERROR_netlist, DPA_LOCK_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, Time: %0t ", Q, CLK_OUT, DATA_VALID, DPA_ERROR, DPA_LOCK, Q_netlist, CLK_OUT_netlist, DATA_VALID_netlist, DPA_ERROR_netlist, DPA_LOCK_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
