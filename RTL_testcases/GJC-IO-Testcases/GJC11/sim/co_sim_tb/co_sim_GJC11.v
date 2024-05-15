`timescale 1ns/1ps
module co_sim_GJC11;
// Clock signals
    reg			clock0;
    reg 		data_in_N;
    reg 		data_in_P;
    wire 		data_out_N	,	data_out_N_netlist;
    wire 		data_out_P	,	data_out_P_netlist;
    reg 		data_push_N;
    reg 		data_push_P;
	integer		mismatch	=	0;

GJC11	golden (.*);

`ifdef PNR
	GJC11_post_route route_net (.*, .data_out_N(data_out_N_netlist), .data_out_P(data_out_P_netlist) );
`else
	GJC11_post_synth synth_net (.*, .data_out_N(data_out_N_netlist), .data_out_P(data_out_P_netlist) );
`endif

// clock initialization for clock0
initial begin
	clock0 = 1'b0;
	forever #1 clock0 = ~clock0;
end

// Initialize values to zero 
initial	begin
	{data_in_N, data_in_P, data_push_N, data_push_P } <= 'd0;
	@ (negedge clock0); 
	compare();
	//Random stimulus generation
	repeat(1000) @ (negedge clock0) begin
		data_in_N			 <= $urandom();
		data_in_P			 <= $urandom();
		data_push_N			 <= $urandom();
		data_push_P			 <= $urandom();
		@ (negedge clock0)
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_in_N <= 1;
	data_in_P <= 1;
	data_push_N <= 1;
	data_push_P <= 1;
	@ (negedge clock0);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( data_out_N !== data_out_N_netlist	||	data_out_P !== data_out_P_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", data_out_N, data_out_P, data_out_N_netlist, data_out_P_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", data_out_N, data_out_P, data_out_N_netlist, data_out_P_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
