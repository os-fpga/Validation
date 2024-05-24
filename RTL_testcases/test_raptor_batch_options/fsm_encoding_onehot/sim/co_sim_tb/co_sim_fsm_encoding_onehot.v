`timescale 1ns/1ps
module co_sim_fsm_encoding_onehot #(parameter width = 12);
	reg clk;
	reg reset_n;
	wire q;

	wire  q_netlist;
	
	integer mismatch=0;
	
	fsm_encoding_onehot  rtl (.*);
    `ifdef PNR
    `else
    	fsm_encoding_onehot_post_synth netlist (.* ,.q(q_netlist));
    `endif
		   
//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset_n = 1'b0;
	#40;
	compare();
	#40;
	reset_n <= 1'b1;
	compare();
	reset_n <= 1'b0;
	repeat(10) @(negedge clk);
	compare();
	@(negedge clk);
	reset_n <= 1'b1;
	compare();
	repeat (100)
		begin
			@(negedge clk);
			compare();
		end
	repeat (100)
		begin
			@(negedge clk);
			compare();
		end
	if(mismatch == 0)
    	$display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
    	$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

	task compare();
		
		if(q !== q_netlist) begin
		  $display("Comparison Data Mismatch. Golden q: %0d, Netlist q_netlist: %0d, Time: %0t", q, q_netlist, $time);
		  mismatch = mismatch+1;
	   end
		else begin
			$display("Data Matched. Golden q: %0d, Netlist q_netlist: %0d, Time: %0t", q, q_netlist, $time);
		end
  endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
