module co_sim_O_DELAY_primitive_inst;
// Clock signals
    reg CLK_IN;
    wire 		[5:0] 		DLY_TAP_VALUE	,	DLY_TAP_VALUE_netlist;
    reg 		DLY_ADJ;
    reg 		DLY_INCDEC;
    reg 		DLY_LOAD;
    wire 		O	,	O_netlist;
    reg 		in;
    reg 		reset;
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
// Initialize values to zero 
initial	begin
	{DLY_ADJ, DLY_INCDEC, DLY_LOAD, in, reset } <= 'd0;
	 repeat (2) @ (negedge CLK_IN); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLK_IN) begin
		DLY_ADJ <= $random();
		DLY_INCDEC <= $random();
		DLY_LOAD <= $random();
		in <= $random();
		reset <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	DLY_ADJ <= 1;
	DLY_INCDEC <= 1;
	DLY_LOAD <= 1;
	in <= 1;
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
