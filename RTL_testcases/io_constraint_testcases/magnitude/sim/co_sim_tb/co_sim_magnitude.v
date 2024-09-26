`timescale 1ns/1ps
module co_sim_magnitude;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset;

    wire 		[7:0] r, r_netlist;
    reg 		[7:0] x;
    reg 		[7:0] y;
	integer		mismatch = 0;

magnitude	golden (.*);

`ifdef PNR_SIM
	magnitude_post_route route_net (.*, .r(r_netlist) );
`else
	magnitude_post_synth synth_net (.*, .r(r_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #5.0 clk = ~clk;
end
//Reset Stimulus generation
initial begin
	$display ("***Reset Test is applied***");
	reset <= 1;
	{x, y } <= 'd0;
	repeat (2) @(negedge clk);
	reset <= 0;
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(1000) @ (negedge clk) begin
		x <= $urandom();
		y <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clk);
	x <= 8'd255;
	y <= 8'd255;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		begin
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$fatal(1);
		end
	repeat(200) @(posedge clk);
	$finish;
end

task compare();
	if ( r !== r_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", r, r_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", r, r_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
