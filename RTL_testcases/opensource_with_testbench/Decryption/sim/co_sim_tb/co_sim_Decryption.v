`timescale 1ns/1ps

module co_sim_Decryption;

    reg			    clk;
    reg 	[127:0]	data_in;
    reg 	[127:0]	key_in;
    wire 	[127:0]	data_decrypted	,	data_decrypted_netlist;
	integer		mismatch	=	0;

    Decryption	golden (.*);
`ifdef PNR
	Decryption_post_route route_net (.*, .data_decrypted(data_decrypted_netlist) );
`else
	Decryption_post_synth synth_net (.*, .data_decrypted(data_decrypted_netlist) );
`endif

initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end

initial	begin
	key_in <= 'd0;
	data_in <= 'd0;

	repeat(2)@(negedge clk); 
	compare();

	repeat(50)@(negedge clk) begin
		data_in <= $urandom();
		key_in <= $urandom();
		compare();
	end

	data_in <= 1;
	key_in <= 1;
	repeat(2)@(negedge clk);
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#20;
	$finish;
end

task compare();
	if ( data_decrypted !== data_decrypted_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_decrypted, data_decrypted_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", data_decrypted, data_decrypted_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
 
