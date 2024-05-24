`timescale 1ns/1ps
module co_sim_carry_chain_primitive_inst;
    reg 		[7:0] 		p;
    reg 		[7:0] 		g;
    wire 		[7:0] 		sum	,	sum_netlist;
    reg 		cin;
    wire 		mycout	,	mycout_netlist;
	integer		mismatch	=	0;

carry_chain_primitive_inst	golden (.*);

`ifdef PNR
	carry_chain_primitive_inst_post_route route_net (.*, .sum(sum_netlist), .mycout(mycout_netlist) );
`else
	carry_chain_primitive_inst_post_synth synth_net (.*, .sum(sum_netlist), .mycout(mycout_netlist) );
`endif

// Initialize values to zero 
initial	begin
	{p, g, cin } <= 'd0;
	#50;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		p <= $random();
		g <= $random();
		cin <= $random();
		#50;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	p <= 255;
	g <= 255;
	cin <= 1;
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
	if ( sum !== sum_netlist	||	mycout !== mycout_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", sum, mycout, sum_netlist, mycout_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", sum, mycout, sum_netlist, mycout_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
