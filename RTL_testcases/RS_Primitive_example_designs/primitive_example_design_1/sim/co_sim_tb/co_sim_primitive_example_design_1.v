module co_sim_primitive_example_design_1;

  reg [2:0] in;
  reg       clk;
  reg       rst;
  reg       mux1_sel;
  reg       mux2_sel;
  reg       ibuf0_en;
  reg       ibuf1_en;
  reg       ibuf2_en;
  reg       ibuf3_en;
  reg       ibuf4_en;
  reg       ibuf5_en;
  reg       ibuf6_en;
  reg       ibuf7_en;
  reg       ibuf8_en;
  reg       ibuf9_en;
  reg       ibuf10_en;
  reg       ibuf11_en;
  reg       ibuf12_en;
  reg       ibuf13_en;
  reg       ibuf14_en;
  reg       ibuf15_en;
  reg       ibuf16_en;
  reg       P;
  reg       G;
  reg [5:0] ram_addr;
  reg       ram_we;
  reg       obuft_oe;
  wire      Q,Q_netlist;
  wire      buft_out,buft_out_netlist;
  wire      out,out_netlist;
  wire      Cout,Cout_netlist;

	integer mismatch=0;

  primitive_example_design_1  golden (.in(in),.clk(clk),.rst(rst),.mux1_sel(mux1_sel),.mux2_sel(mux2_sel),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.Q(Q),.buft_out(buft_out),.out(out),.Cout(Cout));
  `ifdef PNR
  primitive_example_design_1_post_route  netlist (.in(in),.clk(clk),.rst(rst),.mux1_sel(mux1_sel),.mux2_sel(mux2_sel),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.Q(Q_netlist),.buft_out(buft_out_netlist),.out(out_netlist),.Cout(Cout_netlist));
  `else
  primitive_example_design_1_post_synth  netlist (.in(in),.clk(clk),.rst(rst),.mux1_sel(mux1_sel),.mux2_sel(mux2_sel),.ibuf0_en(ibuf0_en),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.ibuf6_en(ibuf6_en),.ibuf7_en(ibuf7_en),.ibuf8_en(ibuf8_en),.ibuf9_en(ibuf9_en),.ibuf10_en(ibuf10_en),.ibuf11_en(ibuf11_en),.ibuf12_en(ibuf12_en),.ibuf13_en(ibuf13_en),.ibuf14_en(ibuf14_en),.ibuf15_en(ibuf15_en),.ibuf16_en(ibuf16_en),.P(P),.G(G),.ram_addr(ram_addr),.ram_we(ram_we),.obuft_oe(obuft_oe),.Q(Q_netlist),.buft_out(buft_out_netlist),.out(out_netlist),.Cout(Cout_netlist));
  `endif

  always #1  clk = ! clk ;

  initial begin
    {clk,in,mux1_sel,mux2_sel,ibuf0_en,ibuf1_en,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en,ibuf6_en,ibuf7_en,ibuf8_en,ibuf9_en,ibuf10_en,ibuf11_en,ibuf12_en,ibuf13_en,ibuf14_en,ibuf15_en,ibuf16_en,P,G,ram_addr,obuft_oe} <= 'b0;
    rst<=0;
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
    mux2_sel<=1;
    obuft_oe<=1;
    rst<=1;
    in<=3'b111;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    repeat(5)@(negedge clk);
    mux1_sel<=1;
    compare();
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    repeat(10)@(negedge clk);
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
      in<=$random();
      ram_addr<=$random();
      compare();
    end
    repeat(10)@(negedge clk);

    #10;
    if(mismatch == 0)
          $display("\n**** All Comparison Matched ***\nSimulation Passed");
      else
          $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	  $finish;
  end

  task compare();
  	if(Q !== Q_netlist || buft_out !== buft_out_netlist || out !== out_netlist || Cout !== Cout_netlist) begin
    	$display("Data Mismatch. Golden Q: %0d, Netlist Q: %0d, Golden buft_out: %0d, Netlist buft_out: %0d, Golden out: %0d, Netlist out: %0d, Golden Cout: %0d, Netlist Cout: %0d, Time: %0t", Q, Q_netlist,buft_out,buft_out_netlist,out,out_netlist,Cout,Cout_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden Q: %0d, Netlist Q: %0d, Golden buft_out: %0d, Netlist buft_out: %0d, Golden out: %0d, Netlist out: %0d, Golden Cout: %0d, Netlist Cout: %0d, Time: %0t", Q, Q_netlist,buft_out,buft_out_netlist,out,out_netlist,Cout,Cout_netlist,$time);
  endtask

  initial begin
    $dumpfile("primitive_example_design_1.vcd");
    $dumpvars;
  end

endmodule