module co_sim_primitive_example_design_13;

  reg  clk_in;
  reg  pll_clk;
  reg  reset;
  reg [3:0] i1;
  reg [3:0] i2;
  reg  load_word;
  reg  channel_bond_sync_in;
  wire  data_out,data_out_netlist;
  wire OE_OUT,OE_OUT_netlist;
  wire CHANNEL_BOND_SYNC_OUT,CHANNEL_BOND_SYNC_OUT_netlist;

	integer mismatch=0;

  primitive_example_design_13 golden (.clk_in(clk_in),.pll_clk(pll_clk),.reset(reset),.i1(i1),.i2(i2),.load_word(load_word),.channel_bond_sync_in(channel_bond_sync_in),.data_out(data_out),.OE_OUT(OE_OUT),.CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT));
  `ifdef PNR
  primitive_example_design_13_post_route netlist (.clk_in(clk_in),.pll_clk(pll_clk),.reset(reset),.i1(i1),.i2(i2),.load_word(load_word),.channel_bond_sync_in(channel_bond_sync_in),.data_out(data_out_netlist),.OE_OUT(OE_OUT_netlist),.CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist));
  `else
  primitive_example_design_13_post_synth netlist (.clk_in(clk_in),.pll_clk(pll_clk),.reset(reset),.i1(i1),.i2(i2),.load_word(load_word),.channel_bond_sync_in(channel_bond_sync_in),.data_out(data_out_netlist),.OE_OUT(OE_OUT_netlist),.CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT_netlist));
  `endif

  always #1 clk_in = !clk_in;
  always #1.5 pll_clk = !pll_clk;

  initial begin
    {clk_in,pll_clk,reset,i1,i2,load_word,channel_bond_sync_in}<=0;

    repeat(10)@(negedge clk_in);
    reset<=1;
    channel_bond_sync_in<=1;
    repeat(1)@(negedge clk_in);
    load_word<=1;
    repeat(5)@(negedge clk_in);
    i1<=4'b1000;
    i2<=4'b0011;
    compare();
    repeat(100)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    load_word<=0;
    repeat(100)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    load_word<=1;
    repeat(1000)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    channel_bond_sync_in<=0;
    repeat(100)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    channel_bond_sync_in<=1;
    repeat(100)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    reset<=0;
    repeat(100)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    repeat(2)@(negedge clk_in);
    reset<=1;
    repeat(1000)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end

    repeat(10)@(negedge clk_in);
    if(mismatch == 0)
          $display("\n**** All Comparison Matched ***\nSimulation Passed");
      else
          $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    $finish;
  end

  task compare();
  	if(data_out !== data_out_netlist || OE_OUT !== OE_OUT_netlist || CHANNEL_BOND_SYNC_OUT !== CHANNEL_BOND_SYNC_OUT_netlist) begin
    	$display("Data Mismatch. Golden data_out: %0d, Netlist data_out: %0d, Golden OE_OUT: %0d, Netlist OE_OUT: %0d, Golden CHANNEL_BOND_SYNC_OUT: %0d, Netlist CHANNEL_BOND_SYNC_OUT: %0d, Time: %0t", data_out, data_out_netlist,OE_OUT,OE_OUT_netlist,CHANNEL_BOND_SYNC_OUT,CHANNEL_BOND_SYNC_OUT_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden data_out: %0d, Netlist data_out: %0d, Golden OE_OUT: %0d, Netlist OE_OUT: %0d, Golden CHANNEL_BOND_SYNC_OUT: %0d, Netlist CHANNEL_BOND_SYNC_OUT: %0d, Time: %0t", data_out, data_out_netlist,OE_OUT,OE_OUT_netlist,CHANNEL_BOND_SYNC_OUT,CHANNEL_BOND_SYNC_OUT_netlist,$time);
  endtask

  initial begin
    $dumpfile("primitive_example_design_13.vcd");
    $dumpvars;
  end

endmodule
