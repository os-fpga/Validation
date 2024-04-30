`timescale 1ns/1ps
module co_sim_ram_true_dp_512x16;
// Clock signals
    reg clk;
    reg 		[8:0] 		addrA;
    reg 		[15:0] 		dinA;
    reg 		[15:0] 		dinB;
    wire 		[15:0] 		doutB	,	doutB_netlist;
    wire 		[15:0] 		doutA	,	doutA_netlist;
    reg 		[8:0] 		addrB;
    reg 		weA;
    reg 		weB;
	integer		mismatch	=	0;

ram_true_dp_512x16	golden (.*);

`ifdef PNR
	ram_true_dp_512x16_post_route route_net (.*, .doutB(doutB_netlist), .doutA(doutA_netlist) );
`else
	ram_true_dp_512x16_post_synth synth_net (.*, .doutB(doutB_netlist), .doutA(doutA_netlist) );
`endif

//clock initialization for clk
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
		// Initialize values to zero 
initial	begin
	
// Initialization for ram
	for (integer i = 0; i < 512; i++)  begin
		golden.ram[i] = 'b0;
	end

repeat (2) @ (negedge clk);
	{addrA, dinA, dinB, addrB, weA, weB } <= 'd0;
	 repeat (2) @ (negedge clk); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		dinB <= $random();
		addrB <= $urandom_range(0,255);
		dinA <= $random();
		addrA <= $urandom_range(256,511);
		weA <= $random();
		weB <= $random();

		compare();
	end
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		dinB <= $random();
		addrA <= $urandom_range(0,255);
		dinA <= $random();
		addrB <= $urandom_range(256,511);
		weA <= $random();
		weB <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	dinB <= 65535;
	addrB <= 511;
	dinA <= 65535;
	addrA <= 0;
	weA <= 1;
	weB <= 1;
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
	if ( doutB !== doutB_netlist	||	doutA !== doutA_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", doutB, doutA, doutB_netlist, doutA_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", doutB, doutA, doutB_netlist, doutA_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
