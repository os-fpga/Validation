`timescale 1ns/1ps
module co_sim_memory_no_change;
// Clock signals
    reg			clk;
// Reset signals
    reg			rst;

    reg 		[31:0] 		wr_data_in;
    reg 		[9:0] 		wr_addr;
    wire 		[31:0] 		rd_data_out	,	rd_data_out_netlist;
    reg 		[9:0] 		rd_addr;
    reg 		rd_en;
    reg 		wr_en;
	integer		mismatch	=	0;

memory_no_change	golden (.*);

`ifdef PNR
	memory_no_change_post_route route_net (.*, .rd_data_out(rd_data_out_netlist) );
`else
	memory_no_change_post_synth synth_net (.*, .rd_data_out(rd_data_out_netlist) );
`endif

// clock initialization for clk
initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end
//Reset Stimulus generation
initial begin

// Initialization for mem
	for (integer i = 0; i < 1024; i++)  begin
		golden.mem[i] = 'b0;
	end

	{wr_data_in, wr_addr, rd_addr, rd_en, wr_en } <= 'd0;
	rst <= 1;
	@(negedge clk);
	@(negedge clk);
	rst <= 0;
	@(negedge clk);
	$display ("***Reset Test is applied***");
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("***Reset Test is ended***");

	for (integer i = 0; i < 1024; i++)  begin
		wr_data_in 			 <= i;
		wr_addr 			 <= i;
		wr_en 			 <= 1;
		@ (negedge clk);
	end

	//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		wr_data_in 			 <= $urandom();
		wr_addr 			 <= $urandom_range(0,511);
		rd_addr 			 <= $urandom_range(512,1023);
		rd_en 			 <= $urandom();
		wr_en 			 <= $urandom();
		@ (negedge clk);
		compare();
end
//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		wr_data_in 			 <= $urandom();
		rd_addr 			 <= $urandom_range(0,511);
		wr_addr 			 <= $urandom_range(512,1023);
		rd_en 			 <= $urandom();
		wr_en 			 <= $urandom();
		@ (negedge clk);
		compare();
end
//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		wr_data_in 			 <= $urandom();
		rd_addr 			 <= $urandom_range(0,511);
		wr_addr 			 <= $urandom_range(512,1023);
		rd_en 			 <= $urandom();
		wr_en 			 <= $urandom();
		@ (negedge clk);
		compare();
end
//Random stimulus generation
	repeat(100) @ (negedge clk) begin
		wr_data_in 			 <= $urandom();
		wr_addr 			 <= $urandom_range(0,511);
		rd_addr 			 <= $urandom_range(512,1023);
		rd_en 			 <= $urandom();
		wr_en 			 <= $urandom();
		@ (negedge clk);
		compare();
end

	// ----------- Corner Case stimulus generation -----------
	wr_data_in <= 4294967295;
	wr_addr <= 1023;
	rd_addr <= 0;
	rd_en <= 0;
	wr_en <= 1;
	@ (negedge clk);
	compare();

	@ (negedge clk);
	wr_data_in <= 4294967295;
	wr_addr <= 0;
	rd_addr <= 1023;
	rd_en <= 1;
	wr_en <= 0;
	@ (negedge clk);
	compare();

	@ (negedge clk);
	wr_data_in <= 4294967295;
	wr_addr <= 0;
	rd_addr <= 1023;
	rd_en <= 0;
	wr_en <= 1;
	@ (negedge clk);
	compare();

	@ (negedge clk);
	wr_data_in <= 4294967295;
	wr_addr <= 1023;
	rd_addr <= 0;
	rd_en <= 1;
	wr_en <= 0;
	@ (negedge clk);
	compare();

	@ (negedge clk);
	wr_data_in <= 4294967295;
	wr_addr <= 1023;
	rd_addr <= 0;
	rd_en <= 1;
	wr_en <= 1;
	@ (negedge clk);
	compare();

	@ (negedge clk);
	wr_data_in <= 4294967295;
	wr_addr <= 0;
	rd_addr <= 1023;
	rd_en <= 1;
	wr_en <= 1;
	@ (negedge clk);
	compare();

	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	repeat(200) @(posedge clk);
	$finish;
end

task compare();
	if ( rd_data_out !== rd_data_out_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", rd_data_out, rd_data_out_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", rd_data_out, rd_data_out_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
