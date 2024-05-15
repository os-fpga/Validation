`timescale 1ns/1ps
module co_sim_GJC12;
    reg 		in_N;
    reg 		in_P;
    wire 		out_N	,	out_N_netlist;
    wire 		out_P	,	out_P_netlist;
	integer		mismatch	=	0;

GJC12	golden (.*);

`ifdef PNR
	GJC12_post_route route_net (.*, .out_N(out_N_netlist), .out_P(out_P_netlist) );
`else
	GJC12_post_synth synth_net (.*, .out_N(out_N_netlist), .out_P(out_P_netlist) );
`endif

		// Initialize values to zero 
initial	begin
	{in_N, in_P } <= 'd0;
	#10;
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		in_N <= $urandom();
		in_P <= $urandom();
		#10;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	in_N <= 1;
	in_P <= 1;
	compare();
	#10;
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( out_N !== out_N_netlist	||	out_P !== out_P_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", out_N, out_P, out_N_netlist, out_P_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", out_N, out_P, out_N_netlist, out_P_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
