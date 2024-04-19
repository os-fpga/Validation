module co_sim_DSP19X2_primitive_inst;
    wire 		[18:0] 		Z1	,	Z1_netlist;
    wire 		[18:0] 		Z2	,	Z2_netlist;
    reg 		[8:0] 		B1;
    reg 		[9:0] 		A2;
    wire 		[8:0] 		DLY_B1	,	DLY_B1_netlist;
    reg 		[4:0] 		ACC_FIR;
    reg 		[8:0] 		B2;
    reg 		[9:0] 		A1;
    wire 		[8:0] 		DLY_B2	,	DLY_B2_netlist;
    reg 		[2:0] 		FEEDBACK;
    reg 		[4:0] 		SHIFT_RIGHT;
    reg 		CLK;
    reg 		LOAD_ACC;
    reg 		RESET;
    reg 		ROUND;
    reg 		SATURATE;
    reg 		SUBTRACT;
    reg 		UNSIGNED_A;
    reg 		UNSIGNED_B;
	integer		mismatch	=	0;

DSP19X2_primitive_inst	golden (.*);

`ifdef PNR
	DSP19X2_primitive_inst_post_route route_net (.*, .Z1(Z1_netlist), .Z2(Z2_netlist), .DLY_B1(DLY_B1_netlist), .DLY_B2(DLY_B2_netlist) );
`else
	DSP19X2_primitive_inst_post_synth synth_net (.*, .Z1(Z1_netlist), .Z2(Z2_netlist), .DLY_B1(DLY_B1_netlist), .DLY_B2(DLY_B2_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{B1, A2, ACC_FIR, B2, A1, FEEDBACK, SHIFT_RIGHT, CLK, LOAD_ACC, RESET, ROUND, SATURATE, SUBTRACT, UNSIGNED_A, UNSIGNED_B } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		B1 <= $random();
		A2 <= $random();
		ACC_FIR <= $random();
		B2 <= $random();
		A1 <= $random();
		FEEDBACK <= $random();
		SHIFT_RIGHT <= $random();
		CLK <= $random();
		LOAD_ACC <= $random();
		RESET <= $random();
		ROUND <= $random();
		SATURATE <= $random();
		SUBTRACT <= $random();
		UNSIGNED_A <= $random();
		UNSIGNED_B <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	B1 <= 511;
	A2 <= 1023;
	ACC_FIR <= 31;
	B2 <= 511;
	A1 <= 1023;
	FEEDBACK <= 7;
	SHIFT_RIGHT <= 31;
	CLK <= 1;
	LOAD_ACC <= 1;
	RESET <= 1;
	ROUND <= 1;
	SATURATE <= 1;
	SUBTRACT <= 1;
	UNSIGNED_A <= 1;
	UNSIGNED_B <= 1;
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
	if ( Z1 !== Z1_netlist	||	Z2 !== Z2_netlist	||	DLY_B1 !== DLY_B1_netlist	||	DLY_B2 !== DLY_B2_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, Time: %0t ", Z1, Z2, DLY_B1, DLY_B2, Z1_netlist, Z2_netlist, DLY_B1_netlist, DLY_B2_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, Time: %0t ", Z1, Z2, DLY_B1, DLY_B2, Z1_netlist, Z2_netlist, DLY_B1_netlist, DLY_B2_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
