`timescale 1ns/1ps
module co_sim_carry_infer;

  reg clk;
  reg reset;
  reg subtract_i;
  reg signed [16:0] A;
  wire [16:0] P,P_netlist;

  carry_infer golden (.clk(clk),.reset(reset),.subtract_i(subtract_i),.A(A),.P(P));
  `ifdef PNR
  carry_infer_post_route netlist (.clk(clk),.reset(reset),.subtract_i(subtract_i),.A(A),.P(P_netlist));
  `else
  carry_infer_post_synth netlist (.clk(clk),.reset(reset),.subtract_i(subtract_i),.A(A),.P(P_netlist));
  `endif

	integer mismatch=0;

  always #1 clk = !clk;

  initial begin
    clk<=0;
    reset<=1;
    subtract_i<=0;
    A<='b0;
    
    repeat(10)@(negedge clk);
    reset<=0;
    compare();
    repeat(1000)@(negedge clk) begin
      A<=$random();
      compare();
    end

    subtract_i<=1;
    repeat(1000)@(negedge clk) begin
      A<=$random();
      compare();
    end

    repeat(10)@(negedge clk);
    if(mismatch == 0)
          $display("\n**** All Comparison Matched ***\nSimulation Passed");
      else
          $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    $finish;
  end

  task compare();
  	if(P !== P_netlist) begin
    	$display("Data Mismatch. Golden P: %0d, Netlist P: %0d, Time: %0t", P, P_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden P: %0d, Netlist P: %0d, Time: %0t", P, P_netlist,,$time);
  endtask

  initial begin
    $dumpfile("carry_infer.vcd");
    $dumpvars;
  end

endmodule
