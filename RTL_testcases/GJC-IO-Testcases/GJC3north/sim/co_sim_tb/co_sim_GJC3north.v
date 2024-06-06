`timescale 1ns/1ps
module co_sim_GJC3north;
// Clock signals
    reg			clk;
    reg 		din;
    wire 		dout	,	dout_netlist;
	integer		mismatch	=	0;

GJC3north	golden (.*);

`ifdef PNR
	GJC3north_post_route route_net (.*, .dout(dout_netlist) );
`else
	GJC3north_post_synth synth_net (.*, .dout(dout_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end

// Initialize values to zero 
initial	begin
	repeat (2) @ (negedge clk);

	din <= 'd0;
	 repeat (2) @ (negedge clk); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		din                  <= $urandom();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	din                    <= 1;
	repeat (2) @ (negedge clk);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( dout !== dout_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", dout, dout_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", dout, dout_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
