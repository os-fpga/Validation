module co_sim_DSP38_primitive_inst;
// Clock signals
    reg clk;
// Reset signals
    reg reset;

    reg 		[19:0] 		a;
    reg 		[17:0] 		b;
    wire 		[37:0] 		z_out	,	z_out_netlist;
    reg 		[5:0] 		shift_right;
	integer		mismatch	=	0;

DSP38_primitive_inst	golden (.*);

`ifdef PNR
	DSP38_primitive_inst_post_route route_net (.*, .z_out(z_out_netlist) );
`else
	DSP38_primitive_inst_post_synth synth_net (.*, .z_out(z_out_netlist) );
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
	{a, b, shift_right } <= 'd0;
	reset <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		a 		 <= $random();
		b 		 <= $random();
		shift_right 		 <= $random();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	a <= 1048575;
	b <= 262143;
	shift_right <= 63;
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
