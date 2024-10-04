`timescale 1ns/1ps
module co_sim_GJC50;
// Clock signals
    reg			clk_in;
// Reset signals
    reg			reset;

    wire 		[3:0] 		data_out	,	data_out_netlist;
    reg 		bitslip_adj;
    wire 		dpa_err	,	dpa_err_netlist;
    wire 		dpa_loc	,	dpa_loc_netlist;
    reg 		i1;
    reg 		i2;
	integer		mismatch	=	0;

GJC50	golden (.*);

`ifdef PNR_SIM
	GJC50_post_route route_net (.*, .data_out(data_out_netlist), .dpa_err(dpa_err_netlist), .dpa_loc(dpa_loc_netlist) );
`else
	GJC50_post_synth synth_net (.*, .data_out(data_out_netlist), .dpa_err(dpa_err_netlist), .dpa_loc(dpa_loc_netlist) );
`endif

// clock initialization for clk_in
initial begin
	clk_in = 1'b0;
	forever #5.0 clk_in = ~clk_in;
end
//Reset Stimulus generation
initial begin
	$display ("***Reset Test is applied***");
	reset <= 0;
	{bitslip_adj, i1, i2 } <= 'd0;
	repeat (2) @(negedge clk_in);
	bitslip_adj <= 1;
	reset <= 1;
	@(negedge clk_in);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk_in) begin
		i1                   <= $urandom();
		i2                   <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clk_in);
	i1                     <= 1'd1;
	i2                     <= 1'd1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		begin
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$fatal(1);
		end
	repeat(200) @(posedge clk_in);
	$finish;
end

task compare();
	if ( data_out !== data_out_netlist	||	dpa_err !== dpa_err_netlist	||	dpa_loc !== dpa_loc_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", data_out, dpa_err, dpa_loc, data_out_netlist, dpa_err_netlist, dpa_loc_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", data_out, dpa_err, dpa_loc, data_out_netlist, dpa_err_netlist, dpa_loc_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
