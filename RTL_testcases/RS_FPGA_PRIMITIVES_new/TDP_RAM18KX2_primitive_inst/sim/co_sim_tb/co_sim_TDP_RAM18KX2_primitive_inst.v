module co_sim_TDP_RAM18KX2_primitive_inst;
// Clock signals
    reg CLK_A1;
    reg CLK_A2;
    reg CLK_B1;
    reg CLK_B2;
    reg 		[1:0] 		BE_A2;
    reg 		[13:0] 		ADDR_B2;
    reg 		[13:0] 		ADDR_B1;
    reg 		[13:0] 		ADDR_A2;
    reg 		[1:0] 		BE_B2;
    reg 		[1:0] 		BE_B1;
    wire 		[15:0] 		RDATA_B2	,	RDATA_B2_netlist;
    reg 		[15:0] 		WDATA_A1;
    reg 		[1:0] 		WPARITY_A2;
    reg 		[15:0] 		WDATA_B2;
    reg 		[1:0] 		WPARITY_B1;
    reg 		[15:0] 		WDATA_A2;
    reg 		[1:0] 		WPARITY_A1;
    reg 		[1:0] 		BE_A1;
    reg 		[1:0] 		WPARITY_B2;
    wire 		[1:0] 		RPARITY_B1	,	RPARITY_B1_netlist;
    wire 		[1:0] 		RPARITY_A2	,	RPARITY_A2_netlist;
    wire 		[1:0] 		RPARITY_A1	,	RPARITY_A1_netlist;
    reg 		[15:0] 		WDATA_B1;
    reg 		[13:0] 		ADDR_A1;
    wire 		[1:0] 		RPARITY_B2	,	RPARITY_B2_netlist;
    wire 		[15:0] 		RDATA_B1	,	RDATA_B1_netlist;
    wire 		[15:0] 		RDATA_A2	,	RDATA_A2_netlist;
    wire 		[15:0] 		RDATA_A1	,	RDATA_A1_netlist;
    reg 		REN_A1;
    reg 		REN_A2;
    reg 		REN_B1;
    reg 		REN_B2;
    reg 		WEN_A1;
    reg 		WEN_A2;
    reg 		WEN_B1;
    reg 		WEN_B2;
	integer		mismatch	=	0;

TDP_RAM18KX2_primitive_inst	golden (.*);

`ifdef PNR
	TDP_RAM18KX2_primitive_inst_post_route route_net (.*, .RDATA_B2(RDATA_B2_netlist), .RPARITY_B1(RPARITY_B1_netlist), .RPARITY_A2(RPARITY_A2_netlist), .RPARITY_A1(RPARITY_A1_netlist), .RPARITY_B2(RPARITY_B2_netlist), .RDATA_B1(RDATA_B1_netlist), .RDATA_A2(RDATA_A2_netlist), .RDATA_A1(RDATA_A1_netlist) );
`else
	TDP_RAM18KX2_primitive_inst_post_synth synth_net (.*, .RDATA_B2(RDATA_B2_netlist), .RPARITY_B1(RPARITY_B1_netlist), .RPARITY_A2(RPARITY_A2_netlist), .RPARITY_A1(RPARITY_A1_netlist), .RPARITY_B2(RPARITY_B2_netlist), .RDATA_B1(RDATA_B1_netlist), .RDATA_A2(RDATA_A2_netlist), .RDATA_A1(RDATA_A1_netlist) );
`endif

//clock initialization for CLK_A1
    initial begin
        CLK_A1 = 1'b0;
        forever #5 CLK_A1 = ~CLK_A1;
    end
//clock initialization for CLK_A2
    initial begin
        CLK_A2 = 1'b0;
        forever #5 CLK_A2 = ~CLK_A2;
    end
//clock initialization for CLK_B1
    initial begin
        CLK_B1 = 1'b0;
        forever #5 CLK_B1 = ~CLK_B1;
    end
//clock initialization for CLK_B2
    initial begin
        CLK_B2 = 1'b0;
        forever #5 CLK_B2 = ~CLK_B2;
    end
// Initialize values to zero 
initial	begin
	{BE_A2, ADDR_B2, ADDR_B1, ADDR_A2, BE_B2, BE_B1, WDATA_A1, WPARITY_A2, WDATA_B2, WPARITY_B1, WDATA_A2, WPARITY_A1, BE_A1, WPARITY_B2, WDATA_B1, ADDR_A1, REN_A1, REN_A2, REN_B1, REN_B2, WEN_A1, WEN_A2, WEN_B1, WEN_B2 } <= 'd0;
	 repeat (2) @ (negedge CLK_A1); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_A1) begin
		BE_A2 <= $random();
		ADDR_B2 <= $random();
		ADDR_B1 <= $random();
		ADDR_A2 <= $random();
		BE_B2 <= $random();
		BE_B1 <= $random();
		WDATA_A1 <= $random();
		WPARITY_A2 <= $random();
		WDATA_B2 <= $random();
		WPARITY_B1 <= $random();
		WDATA_A2 <= $random();
		WPARITY_A1 <= $random();
		BE_A1 <= $random();
		WPARITY_B2 <= $random();
		WDATA_B1 <= $random();
		ADDR_A1 <= $random();
		REN_A1 <= $random();
		REN_A2 <= $random();
		REN_B1 <= $random();
		REN_B2 <= $random();
		WEN_A1 <= $random();
		WEN_A2 <= $random();
		WEN_B1 <= $random();
		WEN_B2 <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	BE_A2 <= 3;
	ADDR_B2 <= 16383;
	ADDR_B1 <= 16383;
	ADDR_A2 <= 16383;
	BE_B2 <= 3;
	BE_B1 <= 3;
	WDATA_A1 <= 65535;
	WPARITY_A2 <= 3;
	WDATA_B2 <= 65535;
	WPARITY_B1 <= 3;
	WDATA_A2 <= 65535;
	WPARITY_A1 <= 3;
	BE_A1 <= 3;
	WPARITY_B2 <= 3;
	WDATA_B1 <= 65535;
	ADDR_A1 <= 16383;
	REN_A1 <= 1;
	REN_A2 <= 1;
	REN_B1 <= 1;
	REN_B2 <= 1;
	WEN_A1 <= 1;
	WEN_A2 <= 1;
	WEN_B1 <= 1;
	WEN_B2 <= 1;
	repeat (2) @ (negedge CLK_A1);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

// Initialize values to zero 
initial	begin
	{BE_A2, ADDR_B2, ADDR_B1, ADDR_A2, BE_B2, BE_B1, WDATA_A1, WPARITY_A2, WDATA_B2, WPARITY_B1, WDATA_A2, WPARITY_A1, BE_A1, WPARITY_B2, WDATA_B1, ADDR_A1, REN_A1, REN_A2, REN_B1, REN_B2, WEN_A1, WEN_A2, WEN_B1, WEN_B2 } <= 'd0;
	 repeat (2) @ (negedge CLK_A2); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_A2) begin
		BE_A2 <= $random();
		ADDR_B2 <= $random();
		ADDR_B1 <= $random();
		ADDR_A2 <= $random();
		BE_B2 <= $random();
		BE_B1 <= $random();
		WDATA_A1 <= $random();
		WPARITY_A2 <= $random();
		WDATA_B2 <= $random();
		WPARITY_B1 <= $random();
		WDATA_A2 <= $random();
		WPARITY_A1 <= $random();
		BE_A1 <= $random();
		WPARITY_B2 <= $random();
		WDATA_B1 <= $random();
		ADDR_A1 <= $random();
		REN_A1 <= $random();
		REN_A2 <= $random();
		REN_B1 <= $random();
		REN_B2 <= $random();
		WEN_A1 <= $random();
		WEN_A2 <= $random();
		WEN_B1 <= $random();
		WEN_B2 <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	BE_A2 <= 3;
	ADDR_B2 <= 16383;
	ADDR_B1 <= 16383;
	ADDR_A2 <= 16383;
	BE_B2 <= 3;
	BE_B1 <= 3;
	WDATA_A1 <= 65535;
	WPARITY_A2 <= 3;
	WDATA_B2 <= 65535;
	WPARITY_B1 <= 3;
	WDATA_A2 <= 65535;
	WPARITY_A1 <= 3;
	BE_A1 <= 3;
	WPARITY_B2 <= 3;
	WDATA_B1 <= 65535;
	ADDR_A1 <= 16383;
	REN_A1 <= 1;
	REN_A2 <= 1;
	REN_B1 <= 1;
	REN_B2 <= 1;
	WEN_A1 <= 1;
	WEN_A2 <= 1;
	WEN_B1 <= 1;
	WEN_B2 <= 1;
	repeat (2) @ (negedge CLK_A2);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

// Initialize values to zero 
initial	begin
	{BE_A2, ADDR_B2, ADDR_B1, ADDR_A2, BE_B2, BE_B1, WDATA_A1, WPARITY_A2, WDATA_B2, WPARITY_B1, WDATA_A2, WPARITY_A1, BE_A1, WPARITY_B2, WDATA_B1, ADDR_A1, REN_A1, REN_A2, REN_B1, REN_B2, WEN_A1, WEN_A2, WEN_B1, WEN_B2 } <= 'd0;
	 repeat (2) @ (negedge CLK_B1); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_B1) begin
		BE_A2 <= $random();
		ADDR_B2 <= $random();
		ADDR_B1 <= $random();
		ADDR_A2 <= $random();
		BE_B2 <= $random();
		BE_B1 <= $random();
		WDATA_A1 <= $random();
		WPARITY_A2 <= $random();
		WDATA_B2 <= $random();
		WPARITY_B1 <= $random();
		WDATA_A2 <= $random();
		WPARITY_A1 <= $random();
		BE_A1 <= $random();
		WPARITY_B2 <= $random();
		WDATA_B1 <= $random();
		ADDR_A1 <= $random();
		REN_A1 <= $random();
		REN_A2 <= $random();
		REN_B1 <= $random();
		REN_B2 <= $random();
		WEN_A1 <= $random();
		WEN_A2 <= $random();
		WEN_B1 <= $random();
		WEN_B2 <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	BE_A2 <= 3;
	ADDR_B2 <= 16383;
	ADDR_B1 <= 16383;
	ADDR_A2 <= 16383;
	BE_B2 <= 3;
	BE_B1 <= 3;
	WDATA_A1 <= 65535;
	WPARITY_A2 <= 3;
	WDATA_B2 <= 65535;
	WPARITY_B1 <= 3;
	WDATA_A2 <= 65535;
	WPARITY_A1 <= 3;
	BE_A1 <= 3;
	WPARITY_B2 <= 3;
	WDATA_B1 <= 65535;
	ADDR_A1 <= 16383;
	REN_A1 <= 1;
	REN_A2 <= 1;
	REN_B1 <= 1;
	REN_B2 <= 1;
	WEN_A1 <= 1;
	WEN_A2 <= 1;
	WEN_B1 <= 1;
	WEN_B2 <= 1;
	repeat (2) @ (negedge CLK_B1);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

// Initialize values to zero 
initial	begin
	{BE_A2, ADDR_B2, ADDR_B1, ADDR_A2, BE_B2, BE_B1, WDATA_A1, WPARITY_A2, WDATA_B2, WPARITY_B1, WDATA_A2, WPARITY_A1, BE_A1, WPARITY_B2, WDATA_B1, ADDR_A1, REN_A1, REN_A2, REN_B1, REN_B2, WEN_A1, WEN_A2, WEN_B1, WEN_B2 } <= 'd0;
	 repeat (2) @ (negedge CLK_B2); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_B2) begin
		BE_A2 <= $random();
		ADDR_B2 <= $random();
		ADDR_B1 <= $random();
		ADDR_A2 <= $random();
		BE_B2 <= $random();
		BE_B1 <= $random();
		WDATA_A1 <= $random();
		WPARITY_A2 <= $random();
		WDATA_B2 <= $random();
		WPARITY_B1 <= $random();
		WDATA_A2 <= $random();
		WPARITY_A1 <= $random();
		BE_A1 <= $random();
		WPARITY_B2 <= $random();
		WDATA_B1 <= $random();
		ADDR_A1 <= $random();
		REN_A1 <= $random();
		REN_A2 <= $random();
		REN_B1 <= $random();
		REN_B2 <= $random();
		WEN_A1 <= $random();
		WEN_A2 <= $random();
		WEN_B1 <= $random();
		WEN_B2 <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	BE_A2 <= 3;
	ADDR_B2 <= 16383;
	ADDR_B1 <= 16383;
	ADDR_A2 <= 16383;
	BE_B2 <= 3;
	BE_B1 <= 3;
	WDATA_A1 <= 65535;
	WPARITY_A2 <= 3;
	WDATA_B2 <= 65535;
	WPARITY_B1 <= 3;
	WDATA_A2 <= 65535;
	WPARITY_A1 <= 3;
	BE_A1 <= 3;
	WPARITY_B2 <= 3;
	WDATA_B1 <= 65535;
	ADDR_A1 <= 16383;
	REN_A1 <= 1;
	REN_A2 <= 1;
	REN_B1 <= 1;
	REN_B2 <= 1;
	WEN_A1 <= 1;
	WEN_A2 <= 1;
	WEN_B1 <= 1;
	WEN_B2 <= 1;
	repeat (2) @ (negedge CLK_B2);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( RDATA_B2 !== RDATA_B2_netlist	||	RPARITY_B1 !== RPARITY_B1_netlist	||	RPARITY_A2 !== RPARITY_A2_netlist	||	RPARITY_A1 !== RPARITY_A1_netlist	||	RPARITY_B2 !== RPARITY_B2_netlist	||	RDATA_B1 !== RDATA_B1_netlist	||	RDATA_A2 !== RDATA_A2_netlist	||	RDATA_A1 !== RDATA_A1_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", RDATA_B2, RPARITY_B1, RPARITY_A2, RPARITY_A1, RPARITY_B2, RDATA_B1, RDATA_A2, RDATA_A1, RDATA_B2_netlist, RPARITY_B1_netlist, RPARITY_A2_netlist, RPARITY_A1_netlist, RPARITY_B2_netlist, RDATA_B1_netlist, RDATA_A2_netlist, RDATA_A1_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", RDATA_B2, RPARITY_B1, RPARITY_A2, RPARITY_A1, RPARITY_B2, RDATA_B1, RDATA_A2, RDATA_A1, RDATA_B2_netlist, RPARITY_B1_netlist, RPARITY_A2_netlist, RPARITY_A1_netlist, RPARITY_B2_netlist, RDATA_B1_netlist, RDATA_A2_netlist, RDATA_A1_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
