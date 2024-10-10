`timescale 1ns/1ps
module co_sim_GJC49;
// Clock signals
    reg			clk_in;
// Reset signals
    reg			reset;

    reg 		[3:0] 		i2;
    reg 		[3:0] 		i1;
    wire 		CHANNEL_BOND_SYNC_OUT	,	CHANNEL_BOND_SYNC_OUT_netlist;
    reg 		channel_bond_sync_in;
    wire 		data_out	,	data_out_netlist;
    reg 		load_word;
	reg 		s;
	integer		mismatch	=	0;

GJC49	golden (.*);

`ifdef PNR_SIM
	GJC49_post_route route_net (.*, .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist), .data_out(data_out_netlist) );
`else
	GJC49_post_synth synth_net (.*, .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist), .data_out(data_out_netlist) );
`endif

`ifdef TIMED_SIM
	initial begin
		$display("SDF ANNOTATION: ../routing/fabric_GJC49_post_route_blasted.sdf");
		$sdf_annotate("../routing/fabric_GJC49_post_route_blasted.sdf", co_sim_GJC49.route_net.fabric_instance);
	end
`endif

// clock initialization for clk_in
initial begin
	clk_in = 1'b0;
	forever #5 clk_in = ~clk_in;
end
//Reset Stimulus generation
initial begin
	$display ("***Reset Test is applied***");
	reset <= 1;
	s <= 0;
	load_word <= 1;
	{i2, i1, channel_bond_sync_in } <= 'd0;
	repeat (2) @(negedge clk_in);
	s <= 1;
	@(negedge clk_in);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(2000) @ (negedge clk_in) begin
		i2                   <= $urandom();
		i1                   <= $urandom();
		channel_bond_sync_in <= 1;
		load_word            <= 1;
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clk_in);
	i2                     <= 4'd15;
	i1                     <= 4'd15;
	channel_bond_sync_in   <= 1'd1;
	load_word              <= 1'd1;
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
	if ( CHANNEL_BOND_SYNC_OUT !== CHANNEL_BOND_SYNC_OUT_netlist	||	data_out !== data_out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", CHANNEL_BOND_SYNC_OUT, data_out, CHANNEL_BOND_SYNC_OUT_netlist, data_out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", CHANNEL_BOND_SYNC_OUT, data_out, CHANNEL_BOND_SYNC_OUT_netlist, data_out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
