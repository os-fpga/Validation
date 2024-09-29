`timescale 1ns/1ps
module co_sim_reg_file;
// Clock signals
    reg			clk;
// Reset signals
    reg			reset;

    reg [7:0]   data;
    reg [3:0]   rs;
    reg [3:0]   rt;
    reg [3:0]   rd;
    wire [7:0]  t , t_netlist;
    wire [7:0]  s , s_netlist;
    reg 		reg_ena;
	integer		mismatch = 0;

reg_file	golden (.*);

`ifdef PNR_SIM
	reg_file_post_route route_net (.*, .t(t_netlist), .s(s_netlist) );
`else
	reg_file_post_synth synth_net (.*, .t(t_netlist), .s(s_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #5.0 clk = ~clk;
end
//Reset Stimulus generation
initial begin
	$display ("***Reset Test is applied***");
	reset <= 1;
	{data, rs, rt, rd, reg_ena } <= 'd0;
	repeat (2) @(negedge clk);
	reset <= 0;
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");
	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		data <= $urandom();
		rs <= $urandom();
		rt <= $urandom();
		rd <= $urandom();
		reg_ena <= $urandom();
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	repeat (2) @(negedge clk);
	data <= 8'd255;
	rs <= 4'd15;
	rt <= 4'd15;
	rd <= 4'd15;
	reg_ena <= 1'd1;
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
	if ( t !== t_netlist	||	s !== s_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", t, s, t_netlist, s_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, %0d, Netlist Output %0d, %0d, Time: %0t ", t, s, t_netlist, s_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
