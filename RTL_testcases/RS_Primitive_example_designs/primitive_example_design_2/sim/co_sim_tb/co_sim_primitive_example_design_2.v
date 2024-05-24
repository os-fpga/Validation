`timescale 1ns/1ps
module co_sim_primitive_example_design_2;

  reg [2:0] in_n;
  reg [2:0] in_p;
  reg  clk;
  reg  rst;
  reg  mux1_sel_n;
  reg  mux1_sel_p;
  reg  mux2_sel_n;
  reg  mux2_sel_p;
  reg  ibuf0_en;
  reg  ibuf1_en;
  reg  ibuf2_en;
  reg  ibuf3_en;
  reg  ibuf4_en;
  reg  ibuf5_en;
  reg  ibuf6_en;
  reg  ibuf7_en;
  reg  ibuf8_en;
  reg  ibuf9_en;
  reg  ibuf10_en;
  reg  ibuf11_en;
  reg  ibuf12_en;
  reg  ibuf13_en;
  reg  ibuf14_en;
  reg  ibuf15_en;
  reg  ibuf16_en;
  reg  P;
  reg  G;
  reg [5:0] ram_addr;
  reg  ram_we;
  reg  obuft_oe;
  wire  q_p,q_p_netlist;
  wire  q_n,q_n_netlist;
  wire  buft_out_p,buft_out_p_netlist;
  wire  buft_out_n,buft_out_n_netlist;
  wire  Cout,Cout_netlist;

	integer mismatch=0;

  primitive_example_design_2  golden (.in_n(in_n),.in_p(in_p),.clk(clk),.rst(rst),.mux1_sel_n(mux1_sel_n),.mux1_sel_p(mux1_sel_p),.mux2_sel_n(mux2_sel_n),.mux2_sel_p(mux2_sel_p),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.q_p(q_p),.q_n(q_n),.buft_out_p(buft_out_p),.buft_out_n(buft_out_n),.Cout(Cout));
  `ifdef PNR
  primitive_example_design_2_post_route netlist (.in_n(in_n),.in_p(in_p),.clk(clk),.rst(rst),.mux1_sel_n(mux1_sel_n),.mux1_sel_p(mux1_sel_p),.mux2_sel_n(mux2_sel_n),.mux2_sel_p(mux2_sel_p),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.q_p(q_p_netlist),.q_n(q_n_netlist),.buft_out_p(buft_out_p_netlist),.buft_out_n(buft_out_n_netlist),.Cout(Cout_netlist));
  `else
  primitive_example_design_2_post_synth netlist (.in_n(in_n),.in_p(in_p),.clk(clk),.rst(rst),.mux1_sel_n(mux1_sel_n),.mux1_sel_p(mux1_sel_p),.mux2_sel_n(mux2_sel_n),.mux2_sel_p(mux2_sel_p),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.q_p(q_p_netlist),.q_n(q_n_netlist),.buft_out_p(buft_out_p_netlist),.buft_out_n(buft_out_n_netlist),.Cout(Cout_netlist));
  `endif

  always #1  clk = ! clk ;

  initial begin
    {in_n,in_p,clk,rst,mux1_sel_n,mux1_sel_p,mux2_sel_n,mux2_sel_p,ibuf0_en,ibuf1_en,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en,ibuf6_en,ibuf7_en,ibuf8_en,ibuf9_en,ibuf10_en,ibuf11_en,ibuf12_en,ibuf13_en,ibuf14_en,ibuf15_en,ibuf16_en,P,G,ram_addr,ram_we,obuft_oe
    } <= 'b0;
    ram_we<=1;

    repeat(10)@(negedge clk);
    ibuf0_en<=1;
    ibuf1_en<=1;
    ibuf2_en<=1;
    ibuf3_en<=1;
    ibuf4_en<=1;
    ibuf5_en<=1;
    ibuf6_en<=1;
    ibuf7_en<=1;
    ibuf8_en<=1;
    ibuf9_en<=1;
    ibuf10_en<=1;
    ibuf11_en<=1;
    ibuf12_en<=1;
    ibuf13_en<=1;
    ibuf14_en<=1;
    ibuf15_en<=1;
    ibuf16_en<=1;
    mux1_sel_p<=1;
    mux1_sel_n<=1;
    mux2_sel_p<=1;
    mux2_sel_n<=1;
    obuft_oe<=1;
    P<=1;
    G<=0;
    rst<=1;
    in_n<=3'b111;
    in_p<=3'b001;
    repeat(100)@(negedge clk) begin
      in_n<=$random();
      in_p<=$random();
      compare();
    end
    repeat(5)@(negedge clk);
    mux1_sel_p<=1;
    mux1_sel_n<=0;
    mux2_sel_p<=1;
    mux2_sel_n<=0;
    compare();
    repeat(100)@(negedge clk) begin
      in_n<=$random();
      in_p<=$random();
      compare();
    end
    repeat(100)@(negedge clk);
    P<=1;
    G<=1;
    compare();
    repeat(100)@(negedge clk) begin
      P<=$random();
      G<=$random();
      compare();
    end
    repeat(500)@(negedge clk) begin
      P<=$random();
      G<=$random();
      in_n<=$random();
      in_p<=$random();
      ram_addr<=$random();
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
  	if(q_p !== q_p_netlist || q_n !== q_n_netlist || buft_out_p !== buft_out_p_netlist || buft_out_n !== buft_out_n_netlist || Cout !== Cout_netlist) begin
    	$display("Data Mismatch. Golden q_p: %0d, Netlist q_p: %0d, Golden q_n: %0d, Netlist q_n: %0d, Golden buft_out_p: %0d, Netlist buft_out_p: %0d, Golden buft_out_n: %0d, Netlist buft_out_n: %0d, Golden Cout: %0d, Netlist Cout: %0d, Time: %0t", q_p, q_p_netlist,q_n, q_n_netlist,buft_out_p,buft_out_p_netlist,buft_out_n,buft_out_n_netlist,Cout,Cout_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden q_p: %0d, Netlist q_p: %0d, Golden q_n: %0d, Netlist q_n: %0d, Golden buft_out_p: %0d, Netlist buft_out_p: %0d, Golden buft_out_n: %0d, Netlist buft_out_n: %0d, Golden Cout: %0d, Netlist Cout: %0d, Time: %0t", q_p, q_p_netlist,q_n, q_n_netlist,buft_out_p,buft_out_p_netlist,buft_out_n,buft_out_n_netlist,Cout,Cout_netlist,$time);
  endtask

  initial begin
    $dumpfile("primitive_example_design_2.vcd");
    $dumpvars;
  end

endmodule
