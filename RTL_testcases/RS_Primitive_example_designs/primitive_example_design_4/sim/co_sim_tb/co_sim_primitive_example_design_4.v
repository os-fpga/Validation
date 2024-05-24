`timescale 1ns/1ps
module co_sim_primitive_example_design_4;

  reg [2:0] in;
  reg  clk;
  reg  rst;
  reg  ibuf1_en;
  reg  ibuf2_en;
  reg  ibuf3_en;
  reg  ibuf4_en;
  reg  ibuf5_en;
  wire [2:0] q_n,q_n_netlist;
  wire [2:0] q_p,q_p_netlist;

	integer mismatch=0;

  primitive_example_design_4 golden (.in(in),.clk(clk),.rst(rst),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.q_n(q_n),.q_p(q_p));
  `ifdef PNR
  primitive_example_design_4_post_route netlist (.in(in),.clk(clk),.rst(rst),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.q_n(q_n_netlist),.q_p(q_p_netlist));
  `else
  primitive_example_design_4_post_synth netlist (.in(in),.clk(clk),.rst(rst),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.q_n(q_n_netlist),.q_p(q_p_netlist));
  `endif

  always #1  clk = ! clk ;

  initial begin
    {in,clk,rst,ibuf1_en,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en}<='b0;

    repeat(10)@(negedge clk);
    in<=3'b111;
    rst<=1;
    ibuf1_en<=1;
    ibuf2_en<=1;
    ibuf3_en<=1;
    ibuf4_en<=1;
    ibuf5_en<=1;
    compare();

    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf2_en<=0;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf3_en<=0;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf4_en<=0;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf2_en<=1;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf3_en<=1;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf4_en<=1;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf5_en<=0;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    ibuf5_en<=1;
    repeat(100)@(negedge clk) begin
      in<=$random();
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
  	if(q_n !== q_n_netlist || q_p !== q_p_netlist) begin
    	$display("Data Mismatch. Golden q_n: %0d, Netlist q_n: %0d, Golden q_p: %0d, Netlist q_p: %0d, Time: %0t", q_n, q_n_netlist,q_p,q_p_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden q_n: %0d, Netlist q_n: %0d, Golden q_p: %0d, Netlist q_p: %0d, Time: %0t", q_n, q_n_netlist,q_p,q_p_netlist,$time);
  endtask

  initial begin
    $dumpfile("primitive_example_design_4.vcd");
    $dumpvars;
  end

endmodule
