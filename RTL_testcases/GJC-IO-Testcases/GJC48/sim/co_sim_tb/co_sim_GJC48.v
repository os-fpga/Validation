`timescale 1ns/1ps
module co_sim_GJC48;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset_n;

    reg 		[3:0] 		dma_req_in;
    wire 		[3:0] 		dma_ack_out	,	dma_ack_out_netlist;
	integer		mismatch	=	0;

GJC48	golden (.*);

`ifdef PNR
	GJC48_post_route route_net (.*, .dma_ack_out(dma_ack_out_netlist) );
`else
	GJC48_post_synth synth_net (.*, .dma_ack_out(dma_ack_out_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end
//Reset Stimulus generation
initial begin
	reset_n <= 0;
	@(negedge clk);
	{dma_req_in } <= 'd0;
	reset_n <= 1;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		dma_req_in           <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	dma_req_in             <= 15;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(200) @(posedge clk);
	$finish;
end

task compare();
	if ( dma_ack_out !== dma_ack_out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", dma_ack_out, dma_ack_out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", dma_ack_out, dma_ack_out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
