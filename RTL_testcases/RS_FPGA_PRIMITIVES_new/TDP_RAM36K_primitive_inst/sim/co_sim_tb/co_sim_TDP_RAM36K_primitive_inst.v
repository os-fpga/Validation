module co_sim_TDP_RAM36K_primitive_inst;
// Clock signals
    reg CLK_A;
    reg CLK_B;
    reg 		[14:0] 		ADDR_A;
    reg 		[31:0] 		WDATA_B;
    wire 		[31:0] 		RDATA_B	,	RDATA_B_netlist;
    reg 		[31:0] 		WDATA_A;
    reg 		[14:0] 		ADDR_B;
    wire 		[31:0] 		RDATA_A	,	RDATA_A_netlist;
    reg 		REN_A;
    reg 		REN_B;
    reg 		WEN_A;
    reg 		WEN_B;
	integer		mismatch	=	0;

TDP_RAM36K_primitive_inst	golden (.*);

`ifdef PNR
	TDP_RAM36K_primitive_inst_post_route route_net (.*, .RDATA_B(RDATA_B_netlist), .RDATA_A(RDATA_A_netlist) );
`else
	TDP_RAM36K_primitive_inst_post_synth synth_net (.*, .RDATA_B(RDATA_B_netlist), .RDATA_A(RDATA_A_netlist) );
`endif

//clock initialization for CLK_A
    initial begin
        CLK_A = 1'b0;
        forever #5 CLK_A = ~CLK_A;
    end
//clock initialization for CLK_B
    initial begin
        CLK_B = 1'b0;
        forever #5 CLK_B = ~CLK_B;
    end
// Initialize values to zero 
initial	begin
	repeat (2) @ (negedge CLK_A);
{ADDR_A, WDATA_B, WDATA_A, ADDR_B, REN_A, REN_B, WEN_A, WEN_B } <= 'd0;
	 repeat (2) @ (negedge CLK_A); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_A) begin
		ADDR_A <= $random();
		WDATA_B <= $random();
		WDATA_A <= $random();
		ADDR_B <= $random();
		REN_A <= $random();
		REN_B <= $random();
		WEN_A <= $random();
		WEN_B <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	ADDR_A <= 32767;
	WDATA_B <= 4294967295;
	WDATA_A <= 4294967295;
	ADDR_B <= 32767;
	REN_A <= 1;
	REN_B <= 1;
	WEN_A <= 1;
	WEN_B <= 1;
	repeat (2) @ (negedge CLK_A);
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
	repeat (2) @ (negedge CLK_B);
{ADDR_A, WDATA_B, WDATA_A, ADDR_B, REN_A, REN_B, WEN_A, WEN_B } <= 'd0;
	 repeat (2) @ (negedge CLK_B); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_B) begin
		ADDR_A <= $random();
		WDATA_B <= $random();
		WDATA_A <= $random();
		ADDR_B <= $random();
		REN_A <= $random();
		REN_B <= $random();
		WEN_A <= $random();
		WEN_B <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	ADDR_A <= 32767;
	WDATA_B <= 4294967295;
	WDATA_A <= 4294967295;
	ADDR_B <= 32767;
	REN_A <= 1;
	REN_B <= 1;
	WEN_A <= 1;
	WEN_B <= 1;
	repeat (2) @ (negedge CLK_B);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( RDATA_B !== RDATA_B_netlist	||	RDATA_A !== RDATA_A_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", RDATA_B, RDATA_A, RDATA_B_netlist, RDATA_A_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", RDATA_B, RDATA_A, RDATA_B_netlist, RDATA_A_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
