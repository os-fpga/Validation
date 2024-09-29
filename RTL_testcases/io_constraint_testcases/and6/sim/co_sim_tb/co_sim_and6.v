`timescale 1ns/1ps
module co_sim_and6;
// Clock signals
    reg			clock0;
    reg 		[5:0] 		a;
    reg 		[2:0] 		id;
    wire 		c, c_netlist;
	integer		mismatch = 0;

and6	golden (.*);

`ifdef PNR_SIM
	and6_post_route route_net (.*, .c(c_netlist) );
`else
	and6_post_synth synth_net (.*, .c(c_netlist) );
`endif

// clock initialization for clock0
initial begin
	clock0 = 1'b0;
	forever #5.0 clock0 = ~clock0;
end

// Initialize values to zero 
initial	begin
		{a, id } <= 'd0;
	 repeat (2) @ (negedge clock0); 
	compare();
	//Random stimulus generation
	repeat(1000) @ (negedge clock0) begin
		a <= $urandom();
		id <= $urandom();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clock0);
	a <= 6'd63;
	id <= 4'd15;
	repeat (2) @ (negedge clock0);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		begin
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$fatal(1);
		end
	#200;
	$finish;
end

task compare();
	if ( c !== c_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", c, c_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", c, c_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
