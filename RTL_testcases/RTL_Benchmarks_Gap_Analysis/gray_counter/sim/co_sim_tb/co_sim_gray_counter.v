`define size 5

`timescale 1ns/1ps
module co_sim_gray_counter;

	reg  clk;
	reg  rst;
	wire [`size-1:0] out,out_netlist;

	integer mismatch=0;

	gray_counter golden (.clk(clk),.rst(rst),.out(out));
	`ifdef PNR
	gray_counter_post_route netlist (.clk(clk),.rst(rst),.out(out_netlist));
	`else
	gray_counter_post_synth netlist (.clk(clk),.rst(rst),.out(out_netlist));
	`endif

	always #1  clk = ! clk ;

	initial begin
		clk<=0;
		rst<=1;
		repeat(10)@(negedge clk);
		rst<=0;
		
		repeat(100)@(negedge clk) begin
			compare();
		end

		repeat(10)@(negedge clk);
		if(mismatch == 0)
			$display("\n**** All Comparison Matched ***\nSimulation Passed");
		else
			$display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);

		#20;
		$finish;
	end

	task compare();
		$display("*** Comparing ***");
		if(out !== out_netlist) begin
			$display("Data Mismatch. Golden: %0b, Netlist: %0b, Time: %0t", out, out_netlist, $time);
			mismatch = mismatch+1;
		end
		else
			$display("Data Matched. Golden: %0b, Netlist: %0b, Time: %0t", out, out_netlist, $time);
	endtask

	task display_stimulus();
		$display ($time,," Test stimulus is: out=%0d out_netlist=%0d", out, out_netlist);
	endtask

	initial begin
		$dumpfile("gray_counter.vcd");
		$dumpvars;
	end

endmodule
