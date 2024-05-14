`timescale 1ns/1ps
module co_sim_GJC10;
// Clock signals
    reg			clock0;
    wire 		led0	,	led0_netlist;
    wire 		led1	,	led1_netlist;
    wire 		led2	,	led2_netlist;
    wire 		led3	,	led3_netlist;
    reg 		push_button;
    reg 		reset;
	integer		mismatch	=	0;

GJC10	golden (.*);

`ifdef PNR
	GJC10_post_route route_net (.*, .led0(led0_netlist), .led1(led1_netlist), .led2(led2_netlist), .led3(led3_netlist) );
`else
	GJC10_post_synth synth_net (.*, .led0(led0_netlist), .led1(led1_netlist), .led2(led2_netlist), .led3(led3_netlist) );
`endif

 // Generate a 40MHz clock (Period = 25ns)
initial begin
		clock0 = 0; // Initial state of the clock
		forever #12.5 clock0 = ~clock0; // Toggle every 12.5ns
end
// Reset process using negative edge synchronization
initial begin
		reset = 1;
		push_button = 0;
		repeat (16) @(negedge clock0);  // Wait for several clock cycles
		reset = 0;
		compare();
		repeat (10) @(negedge clock0);  // Initial delay after reset

		repeat (5) begin
				@(negedge clock0);
				push_button = 1;
				repeat (30) @(negedge clock0); // Hold the button for 8 cycles of clock0
				compare();
				push_button = 0;
				repeat (30) @(negedge clock0); // Wait 16 clock cycles between presses
				compare();
		end

		repeat (20) @(negedge clock0); // Additional simulation run time
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clock0) begin
		push_button			 <= $urandom();

		compare();
	end

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( led0 !== led0_netlist	||	led1 !== led1_netlist	||	led2 !== led2_netlist	||	led3 !== led3_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, Time: %0t ", led0, led1, led2, led3, led0_netlist, led1_netlist, led2_netlist, led3_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, %0d, Time: %0t ", led0, led1, led2, led3, led0_netlist, led1_netlist, led2_netlist, led3_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
