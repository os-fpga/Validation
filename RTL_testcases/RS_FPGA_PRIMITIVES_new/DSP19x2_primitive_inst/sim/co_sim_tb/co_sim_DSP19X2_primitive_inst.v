module co_sim_DSP19X2_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg reset;

    reg 		[17:0] 		b;
    reg 		[19:0] 		a;
    wire 		[37:0] 		z_out	,	z_out_netlist;
	integer		mismatch	=	0;

DSP19X2_primitive_inst	golden (.*);

`ifdef PNR
	DSP19X2_primitive_inst_post_route route_net (.*, .z_out(z_out_netlist) );
`else
	DSP19X2_primitive_inst_post_synth synth_net (.*, .z_out(z_out_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//Reset Stimulus generation
initial begin
	reset <= 1;
	@(negedge clk);
	{b, a } <= 'd0;
	reset <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		b 		 <= $random();
		a 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	b <= 262143;
	a <= 1048575;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(50) @(posedge clk);
	$finish;
end

task compare();
	if ( z_out !== z_out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", z_out, z_out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", z_out, z_out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
