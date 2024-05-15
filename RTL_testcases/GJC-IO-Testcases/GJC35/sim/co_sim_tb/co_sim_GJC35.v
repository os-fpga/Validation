`timescale 1ns/1ps
module co_sim_GJC35;
    reg 		[7:0] 		enable;
    wire 		[7:0] 		data_o	,	data_o_netlist;
    reg 		[7:0] 		data_i;
	integer		mismatch	=	0;

GJC35	golden (.*);

`ifdef PNR
	GJC35_post_route route_net (.*, .data_o(data_o_netlist) );
`else
	GJC35_post_synth synth_net (.*, .data_o(data_o_netlist) );
`endif

		// Initialize values to zero 
initial	begin
	{enable, data_i } <= 'd0;
	#10;
	compare();
// Generating random stimulus 
	for (int i = 0; i < 100; i = i + 1) begin
		enable <= $urandom();
		data_i <= $urandom();
		#10;
		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	enable <= 255;
	data_i <= 255;
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
	if ( data_o !== data_o_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o, data_o_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_o, data_o_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
