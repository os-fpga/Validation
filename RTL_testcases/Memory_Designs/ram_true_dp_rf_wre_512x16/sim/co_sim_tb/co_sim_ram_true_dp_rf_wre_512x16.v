`timescale 1ns/1ps
module co_sim_ram_true_dp_rf_wre_512x16;
// Clock signals
    reg clk;
    reg 		[15:0] 		dinB;
    reg 		[8:0] 		addrB;
    wire 		[15:0] 		doutA	,	doutA_netlist;
    reg 		[15:0] 		dinA;
    reg 		[8:0] 		addrA;
    wire 		[15:0] 		doutB	,	doutB_netlist;
    reg 		reA;
    reg 		reB;
    reg 		weA;
    reg 		weB;
	integer		mismatch	=	0;

ram_true_dp_rf_wre_512x16	golden (.*);

`ifdef PNR
	ram_true_dp_rf_wre_512x16_post_route route_net (.*, .doutA(doutA_netlist), .doutB(doutB_netlist) );
`else
	ram_true_dp_rf_wre_512x16_post_synth synth_net (.*, .doutA(doutA_netlist), .doutB(doutB_netlist) );
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
	{dinB, addrB, dinA, addrA, reA, reB, weA, weB } <= 'd0;
	 repeat (2) @ (negedge clk); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		dinB <= $random();
		addrB <= $urandom_range(0,255);
		dinA <= $random();
		addrA <= $urandom_range(256,511);
		reA <= $random();
		reB <= $random();
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
		reA <= $random();
		reB <= $random();
		weA <= $random();
		weB <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	dinB <= 65535;
	addrB <= 511;
	dinA <= 65535;
	addrA <= 0;
	reA <= 1;
	reB <= 1;
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
	if ( doutA !== doutA_netlist	||	doutB !== doutB_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", doutA, doutB, doutA_netlist, doutB_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", doutA, doutB, doutA_netlist, doutB_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
