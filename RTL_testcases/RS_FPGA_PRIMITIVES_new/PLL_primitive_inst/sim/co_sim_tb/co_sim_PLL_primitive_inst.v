`timescale 1ns/1ps
module co_sim_PLL_primitive_inst;
// Clock signals
    reg CLK_IN;
    wire 		CLK_OUT	,	CLK_OUT_netlist;
    wire 		CLK_OUT_DIV2	,	CLK_OUT_DIV2_netlist;
    wire 		CLK_OUT_DIV3	,	CLK_OUT_DIV3_netlist;
    wire 		CLK_OUT_DIV4	,	CLK_OUT_DIV4_netlist;
    wire 		LOCK	,	LOCK_netlist;
    reg 		PLL_EN;
    wire 		SERDES_FAST_CLK	,	SERDES_FAST_CLK_netlist;
    reg 		reset;
	integer		mismatch	=	0;

PLL_primitive_inst	golden (.*);

`ifdef PNR
	PLL_primitive_inst_post_route route_net (.*, .CLK_OUT(CLK_OUT_netlist), .CLK_OUT_DIV2(CLK_OUT_DIV2_netlist), .CLK_OUT_DIV3(CLK_OUT_DIV3_netlist), .CLK_OUT_DIV4(CLK_OUT_DIV4_netlist), .LOCK(LOCK_netlist), .SERDES_FAST_CLK(SERDES_FAST_CLK_netlist) );
`else
	PLL_primitive_inst_post_synth synth_net (.*, .CLK_OUT(CLK_OUT_netlist), .CLK_OUT_DIV2(CLK_OUT_DIV2_netlist), .CLK_OUT_DIV3(CLK_OUT_DIV3_netlist), .CLK_OUT_DIV4(CLK_OUT_DIV4_netlist), .LOCK(LOCK_netlist), .SERDES_FAST_CLK(SERDES_FAST_CLK_netlist) );
`endif

//clock initialization for CLK_IN
    initial begin
        CLK_IN = 1'b0;
        forever #5 CLK_IN = ~CLK_IN;
    end
// Initialize values to zero 
initial	begin
	{PLL_EN} <= 'd0;
	reset <= 1 ;
	 repeat (2) @ (negedge CLK_IN); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		PLL_EN <= 1;
		reset <= 0;

		compare();
	end
	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		PLL_EN <= $random();
		reset <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	PLL_EN <= 1;
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
	if ( CLK_OUT !== CLK_OUT_netlist	||	CLK_OUT_DIV2 !== CLK_OUT_DIV2_netlist	||	CLK_OUT_DIV3 !== CLK_OUT_DIV3_netlist	||	CLK_OUT_DIV4 !== CLK_OUT_DIV4_netlist	||	LOCK !== LOCK_netlist	||	SERDES_FAST_CLK !== SERDES_FAST_CLK_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", CLK_OUT, CLK_OUT_DIV2, CLK_OUT_DIV3, CLK_OUT_DIV4, LOCK, SERDES_FAST_CLK, CLK_OUT_netlist, CLK_OUT_DIV2_netlist, CLK_OUT_DIV3_netlist, CLK_OUT_DIV4_netlist, LOCK_netlist, SERDES_FAST_CLK_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, %0d, %0d, Time: %0t ", CLK_OUT, CLK_OUT_DIV2, CLK_OUT_DIV3, CLK_OUT_DIV4, LOCK, SERDES_FAST_CLK, CLK_OUT_netlist, CLK_OUT_DIV2_netlist, CLK_OUT_DIV3_netlist, CLK_OUT_DIV4_netlist, LOCK_netlist, SERDES_FAST_CLK_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
