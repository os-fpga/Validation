module co_sim_dffnre_primitive_inst;
// Clock signals
    reg C;
// Reset signals
    reg R;

    reg 		D;
    reg 		E;
    wire 		Q	,	Q_netlist;
	integer		mismatch	=	0;

dffnre_primitive_inst	golden (.*);

`ifdef PNR
	dffnre_primitive_inst_post_route route_net (.*, .Q(Q_netlist) );
`else
	dffnre_primitive_inst_post_synth synth_net (.*, .Q(Q_netlist) );
`endif

//clock initialization for C
    initial begin
        C = 1'b0;
        forever #5 C = ~C;
    end
//Reset Stimulus generation
initial begin
	R <= 0;
	@(negedge C);
	{D, E } <= 'd0;
	R <= 1;
	@(negedge C);
	$display ("***Reset Test is applied***");
	@(negedge C);
	@(negedge C);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge C) begin
		D 		 <= $random();
		E 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	D <= 1;
	E <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge C);
	$finish;
end

task compare();
	if ( Q !== Q_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", Q, Q_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", Q, Q_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
