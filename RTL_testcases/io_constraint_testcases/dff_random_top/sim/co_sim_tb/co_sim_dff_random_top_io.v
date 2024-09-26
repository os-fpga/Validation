`timescale 1ns/1ps
module co_sim_dff_random_top_io;

    reg			clk1;
    reg			clk2;
    reg			clk3;
    reg			clk4;

    reg			reset;

    reg [31:0]  in1;
    wire [31:0] out, out_netlist;
	integer		mismatch = 0;

dff_random_top_io	golden (.*);

`ifdef PNR_SIM
	dff_random_top_io_post_route route_net (.*, .out(out_netlist) );
`else
	dff_random_top_io_post_synth synth_net (.*, .out(out_netlist) );
`endif

// clock initialization for clk1
initial begin
	clk1 = 1'b0;
	forever #5 clk1 = ~clk1;
end
// clock initialization for clk2
initial begin
	clk2 = 1'b0;
	forever #5 clk2 = ~clk2;
end
// clock initialization for clk3
initial begin
	clk3 = 1'b0;
	forever #5 clk3 = ~clk3;
end
// clock initialization for clk4
initial begin
	clk4 = 1'b0;
	forever #5 clk4 = ~clk4;
end
//Reset Stimulus generation
initial begin

// Initialization for ra1.design108_10_15_inst.memory_cntrl_instance100.mem.mem
	for (integer i = 0; i < 1024; i++)  begin
		golden.ra1.design108_10_15_inst.memory_cntrl_instance100.mem.mem[i] = 'b0;
	end

	$display ("***Reset Test is applied***");
	reset <= 1;
	{in1 } <= 'd0;
	repeat (2) @(negedge clk1);
	reset <= 0;
	@(negedge clk1);
	$display ("***Reset Test is applied***");
	reset <= 1;
	{in1 } <= 'd0;
	repeat (2) @(negedge clk2);
	reset <= 0;
	@(negedge clk2);
	$display ("***Reset Test is applied***");
	reset <= 1;
	{in1 } <= 'd0;
	repeat (2) @(negedge clk3);
	reset <= 0;
	@(negedge clk3);
	$display ("***Reset Test is applied***");
	reset <= 1;
	{in1 } <= 'd0;
	repeat (2) @(negedge clk4);
	reset <= 0;
	@(negedge clk4);
	compare();
	$display ("***Reset Test is ended***");

	repeat(2000) @ (negedge clk4) begin
		in1 <= $urandom();
		compare();
end

	repeat (2) @(negedge clk4);
	in1 <= 32'd4294967295;
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		begin
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$fatal(1);
		end
	repeat(200) @(posedge clk4);
	$finish;
end

task compare();
	if ( out !== out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", out, out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", out, out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
