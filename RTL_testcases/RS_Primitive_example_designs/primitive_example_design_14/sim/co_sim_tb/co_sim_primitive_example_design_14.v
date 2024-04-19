module co_sim_primitive_example_design_14;

  localparam  WIDTH = 4;

  reg  clk_in;
  reg  reset;
  reg  i1;
  reg  i2;
  wire [WIDTH-1:0] data_out,data_out_netlist;
  reg  RX_RST;
  reg  BITSLIP_ADJ;
  wire  CLK_OUT,CLK_OUT_netlist;
  wire  DATA_VALID,DATA_VALID_netlist;
  wire  DPA_LOCK,DPA_LOCK_netlist;
  wire  DPA_ERROR,DPA_ERROR_netlist;
  reg  PLL_CLK;

	integer mismatch=0;

  primitive_example_design_14 # (.WIDTH(WIDTH)) golden (.clk_in(clk_in),.reset(reset),.i1(i1),.i2(i2),.data_out(data_out),.RX_RST(RX_RST),.BITSLIP_ADJ(BITSLIP_ADJ),.CLK_OUT(CLK_OUT),.DATA_VALID(DATA_VALID),.DPA_LOCK(DPA_LOCK),.DPA_ERROR(DPA_ERROR),.PLL_CLK(PLL_CLK));
  `ifdef PNR
  primitive_example_design_14_post_route netlist (.clk_in(clk_in),.reset(reset),.i1(i1),.i2(i2),.data_out(data_out_netlist),.RX_RST(RX_RST),.BITSLIP_ADJ(BITSLIP_ADJ),.CLK_OUT(CLK_OUT_netlist),.DATA_VALID(DATA_VALID_netlist),.DPA_LOCK(DPA_LOCK_netlist),.DPA_ERROR(DPA_ERROR_netlist),.PLL_CLK(PLL_CLK));
  `else
  primitive_example_design_14_post_synth netlist (.clk_in(clk_in),.reset(reset),.i1(i1),.i2(i2),.data_out(data_out_netlist),.RX_RST(RX_RST),.BITSLIP_ADJ(BITSLIP_ADJ),.CLK_OUT(CLK_OUT_netlist),.DATA_VALID(DATA_VALID_netlist),.DPA_LOCK(DPA_LOCK_netlist),.DPA_ERROR(DPA_ERROR_netlist),.PLL_CLK(PLL_CLK));
  `endif

  always #1 clk_in = !clk_in;
  always #2.5 PLL_CLK = !PLL_CLK;

  initial begin
    {clk_in,reset,i1,i2,RX_RST,BITSLIP_ADJ,PLL_CLK}<=0;

    repeat(5)@(negedge clk_in);
    reset<=1;
    RX_RST<=1;
    compare();
    repeat(5)@(negedge clk_in);
    // BITSLIP_ADJ<=1;
    i1<=1;
    repeat(5)@(negedge clk_in);
    i2<=1;
    // repeat(1000)@(negedge clk_in);
    repeat(2000)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    RX_RST<=0;
    repeat(2)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    RX_RST<=1;
    repeat(2000)@(negedge clk_in) begin
      i1<=$random();
      i2<=$random();
      compare();
    end
    if(mismatch == 0)
          $display("\n**** All Comparison Matched ***\nSimulation Passed");
      else
          $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    $finish;
  end

  task compare();
  	if(data_out !== data_out_netlist) begin
    	$display("Data Mismatch. Golden data_out: %0d, Netlist data_out: %0d, Time: %0t", data_out, data_out_netlist,$time);
    	mismatch = mismatch+1;
 	  end
  	else
  		$display("Data Matched. Golden data_out: %0d, Netlist data_out: %0d, Time: %0t", data_out, data_out_netlist,,$time);
  endtask

  initial begin
    $dumpfile("primitive_example_design_14.vcd");
    $dumpvars;
  end

endmodule
