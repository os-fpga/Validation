`timescale 1ns/1ps
module co_sim_o_buft_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg rst;

    wire 		O_O_BUFT	,	O_O_BUFT_netlist;
    reg 		data1;
    reg 		data2;
	integer		mismatch	=	0;

o_buft_primitive_inst	golden (.*);

`ifdef PNR
	o_buft_primitive_inst_post_route route_net (.*, .O_O_BUFT(O_O_BUFT_netlist) );
`else
	o_buft_primitive_inst_post_synth synth_net (.*, .O_O_BUFT(O_O_BUFT_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	rst <= 1;
	@(negedge clk);
	{data1, data2 } <= 'd0;
	rst <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		data1 		 <= $random();
		data2 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	data1 <= 1;
	data2 <= 1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clk);
	$finish;
end

task compare();
	if ( O_O_BUFT !== O_O_BUFT_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", O_O_BUFT, O_O_BUFT_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", O_O_BUFT, O_O_BUFT_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
