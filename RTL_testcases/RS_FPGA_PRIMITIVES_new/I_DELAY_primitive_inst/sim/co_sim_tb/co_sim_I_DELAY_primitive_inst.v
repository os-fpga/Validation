`timescale 1ns/1ps
module co_sim_I_DELAY_primitive_inst;
// Clock signals
    reg			CLK_IN;
// Reset signals
    reg			reset;

    wire 		[5:0] 		DLY_TAP_VALUE	,	DLY_TAP_VALUE_netlist;
    reg 		DLY_ADJ;
    reg 		DLY_INCDEC;
    reg 		DLY_LOAD;
    wire 		O	,	O_netlist;
    reg 		in;
	integer		mismatch	=	0;

I_DELAY_primitive_inst	golden (.*);

`ifdef PNR
	I_DELAY_primitive_inst_post_route route_net (.*, .DLY_TAP_VALUE(DLY_TAP_VALUE_netlist), .O(O_netlist) );
`else
	I_DELAY_primitive_inst_post_synth synth_net (.*, .DLY_TAP_VALUE(DLY_TAP_VALUE_netlist), .O(O_netlist) );
`endif

// clock initialization for CLK_IN
initial begin
	CLK_IN = 1'b0;
	forever #1 CLK_IN = ~CLK_IN;
end
//Reset Stimulus generation
initial begin
	reset <= 0;
	@(negedge CLK_IN);
	{DLY_ADJ, DLY_INCDEC, DLY_LOAD, in } <= 'd0;
	reset <= 1;
	@(negedge CLK_IN);
	$display ("***Reset Test is applied***");
	@(negedge CLK_IN);
	repeat(16)@(negedge CLK_IN);
	compare();
	$display ("***Reset Test is ended***");
	repeat(100) @ (negedge CLK_IN);
	//Random stimulus generation
	repeat(5000) @ (negedge CLK_IN) begin
		DLY_ADJ 			 <= $urandom();
		DLY_INCDEC 			 <= $urandom();
		DLY_LOAD 			 <= $urandom();
		in 			 <= $urandom();
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
	repeat(10) @(posedge CLK_IN);
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
