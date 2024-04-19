module co_sim_DSP38_primitive_inst;
// Clock signals
    reg CLK;
// Reset signals
    reg RESET;

    wire 		[17:0] 		DLY_B	,	DLY_B_netlist;
    reg 		[17:0] 		B;
    reg 		[19:0] 		A;
    reg 		[5:0] 		SHIFT_RIGHT;
    reg 		[2:0] 		FEEDBACK;
    reg 		[5:0] 		ACC_FIR;
    wire 		[37:0] 		Z	,	Z_netlist;
    reg 		LOAD_ACC;
    reg 		ROUND;
    reg 		SATURATE;
    reg 		SUBTRACT;
    reg 		UNSIGNED_A;
    reg 		UNSIGNED_B;
	integer		mismatch	=	0;

DSP38_primitive_inst	golden (.*);

`ifdef PNR
	DSP38_primitive_inst_post_route route_net (.*, .DLY_B(DLY_B_netlist), .Z(Z_netlist) );
`else
	DSP38_primitive_inst_post_synth synth_net (.*, .DLY_B(DLY_B_netlist), .Z(Z_netlist) );
`endif

//clock initialization for CLK
    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end
//Reset Stimulus generation
initial begin
	RESET <= 1;
	@(negedge CLK);
	{B, A, SHIFT_RIGHT, FEEDBACK, ACC_FIR, LOAD_ACC, ROUND, SATURATE, SUBTRACT, UNSIGNED_A, UNSIGNED_B } <= 'd0;
	RESET <= 0;
	@(negedge CLK);
	$display ("***Reset Test is applied***");
	@(negedge CLK);
	@(negedge CLK);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge CLK) begin
		B 		 <= $random();
		A 		 <= $random();
		SHIFT_RIGHT 		 <= $random();
		FEEDBACK 		 <= $random();
		ACC_FIR 		 <= $random();
		LOAD_ACC 		 <= $random();
		ROUND 		 <= $random();
		SATURATE 		 <= $random();
		SUBTRACT 		 <= $random();
		UNSIGNED_A 		 <= $random();
		UNSIGNED_B 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	B <= 262143;
	A <= 1048575;
	SHIFT_RIGHT <= 63;
	FEEDBACK <= 7;
	ACC_FIR <= 63;
	LOAD_ACC <= 1;
	ROUND <= 1;
	SATURATE <= 1;
	SUBTRACT <= 1;
	UNSIGNED_A <= 1;
	UNSIGNED_B <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge CLK);
	$finish;
end

task compare();
	if ( DLY_B !== DLY_B_netlist	||	Z !== Z_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", DLY_B, Z, DLY_B_netlist, Z_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", DLY_B, Z, DLY_B_netlist, Z_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
