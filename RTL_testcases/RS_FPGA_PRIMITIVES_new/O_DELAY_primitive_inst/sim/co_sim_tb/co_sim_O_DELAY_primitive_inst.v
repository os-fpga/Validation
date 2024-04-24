module co_sim_O_DELAY_primitive_inst;
// Clock signals
    reg CLK_IN;
// Reset signals
    reg reset;

    wire 		[5:0] 		DLY_TAP_VALUE	,	DLY_TAP_VALUE_netlist;
    reg 		DLY_ADJ;
    reg 		DLY_INCDEC;
    reg 		DLY_LOAD;
    wire 		O	,	O_netlist;
    reg 		in;
	integer		mismatch	=	0;

O_DELAY_primitive_inst	golden (.*);

`ifdef PNR
	O_DELAY_primitive_inst_post_route route_net (.*, .DLY_TAP_VALUE(DLY_TAP_VALUE_netlist), .O(O_netlist) );
`else
	O_DELAY_primitive_inst_post_synth synth_net (.*, .DLY_TAP_VALUE(DLY_TAP_VALUE_netlist), .O(O_netlist) );
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
	{DLY_ADJ, DLY_INCDEC, DLY_LOAD, in } <= 'd0;
	reset <= 0;
	@(negedge CLK_IN);
	$display ("***Reset Test is applied***");
	@(negedge CLK_IN);
	@(negedge CLK_IN);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		DLY_ADJ 		 <= $random();
		DLY_INCDEC 		 <= $random();
		DLY_LOAD 		 <= $random();
		in 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	DLY_ADJ <= 1;
	DLY_INCDEC <= 1;
	DLY_LOAD <= 1;
	in <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge CLK_IN);
	$finish;
end

task compare();
	if ( DLY_TAP_VALUE !== DLY_TAP_VALUE_netlist	||	O !== O_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", DLY_TAP_VALUE, O, DLY_TAP_VALUE_netlist, O_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", DLY_TAP_VALUE, O, DLY_TAP_VALUE_netlist, O_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
