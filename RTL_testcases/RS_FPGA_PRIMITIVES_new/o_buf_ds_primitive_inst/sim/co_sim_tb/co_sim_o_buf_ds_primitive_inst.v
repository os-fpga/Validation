`timescale 1ns/1ps
module co_sim_o_buf_ds_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg rst;

    reg 		[7:0] 		parallel_in;
    wire 		O_N_O_BUF_DS	,	O_N_O_BUF_DS_netlist;
    wire 		O_P_O_BUF_DS	,	O_P_O_BUF_DS_netlist;
	integer		mismatch	=	0;

o_buf_ds_primitive_inst	golden (.*);

`ifdef PNR
	o_buf_ds_primitive_inst_post_route route_net (.*, .O_N_O_BUF_DS(O_N_O_BUF_DS_netlist), .O_P_O_BUF_DS(O_P_O_BUF_DS_netlist) );
`else
	o_buf_ds_primitive_inst_post_synth synth_net (.*, .O_N_O_BUF_DS(O_N_O_BUF_DS_netlist), .O_P_O_BUF_DS(O_P_O_BUF_DS_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	rst <= 0;
	@(negedge clk);
	{parallel_in } <= 'd0;
	rst <= 1;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		parallel_in 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	parallel_in <= 255;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clk);
	$finish;
end

task compare();
	if ( O_N_O_BUF_DS !== O_N_O_BUF_DS_netlist	||	O_P_O_BUF_DS !== O_P_O_BUF_DS_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_N_O_BUF_DS, O_P_O_BUF_DS, O_N_O_BUF_DS_netlist, O_P_O_BUF_DS_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", O_N_O_BUF_DS, O_P_O_BUF_DS, O_N_O_BUF_DS_netlist, O_P_O_BUF_DS_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
