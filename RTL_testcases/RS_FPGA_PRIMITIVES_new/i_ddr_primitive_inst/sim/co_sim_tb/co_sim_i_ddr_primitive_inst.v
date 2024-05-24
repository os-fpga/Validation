`timescale 1ns/1ps
module co_sim_i_ddr_primitive_inst;
// Clock signals
    reg clock;
    wire 		[1:0] 		output_data	,	output_data_netlist;
    reg 		data_input;
    reg 		enable;
    reg 		reset;
	integer		mismatch	=	0;

i_ddr_primitive_inst	golden (.*);

`ifdef PNR
	i_ddr_primitive_inst_post_route route_net (.*, .output_data(output_data_netlist) );
`else
	i_ddr_primitive_inst_post_synth synth_net (.*, .output_data(output_data_netlist) );
`endif

//clock initialization for clock
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
// Initialize values to zero 
initial	begin
	repeat (2) @ (negedge clock);
{data_input, enable, reset } <= 'd0;
	 repeat (2) @ (negedge clock); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge clock) begin
		data_input <= $random();
		enable <= $random();
		reset <= $random();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	data_input <= 1;
	enable <= 1;
	reset <= 1;
	repeat (2) @ (negedge clock);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#50;
	$finish;
end

task compare();
	if ( output_data !== output_data_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", output_data, output_data_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", output_data, output_data_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
