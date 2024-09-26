`timescale 1ns/1ps
module co_sim_queue;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset;

    wire [3:0]  read_data, read_data_netlist;
    reg [3:0]   write_data;
    wire 		empty, empty_netlist;
    wire 		full, full_netlist;
    reg 		read_cmd;
    reg 		write_cmd;
	integer		mismatch = 0;

queue	golden (.*);

`ifdef PNR_SIM
	queue_post_route route_net (.*, .read_data(read_data_netlist), .empty(empty_netlist), .full(full_netlist) );
`else
	queue_post_synth synth_net (.*, .read_data(read_data_netlist), .empty(empty_netlist), .full(full_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end
//Reset Stimulus generation
initial begin

// Initialization for queue_reg
	for (integer i = 0; i < 16; i++)  begin
		golden.queue_reg[i] = 'b0;
	end

	$display ("***Reset Test is applied***");
	reset <= 1;
	{write_data, read_cmd, write_cmd } <= 'd0;
	repeat (2) @(negedge clk);
	reset <= 0;
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(1000) @ (negedge clk) begin
		write_data <= $urandom();
		read_cmd <= $urandom();
		write_cmd <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clk);
	write_data <= 4'd15;
	read_cmd <= 1'd1;
	write_cmd <= 1'd1;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		begin
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$fatal(1);
		end
	repeat(200) @(posedge clk);
	$finish;
end

task compare();
	if ( read_data !== read_data_netlist	||	empty !== empty_netlist	||	full !== full_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", read_data, empty, full, read_data_netlist, empty_netlist, full_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, %0d, Netlist Output %0d, %0d, %0d, Time: %0t ", read_data, empty, full, read_data_netlist, empty_netlist, full_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
