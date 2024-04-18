module co_sim_primitive_example_design_6;

  reg [1:0] in;
  reg  clk;
  reg  rst;
  reg  ibuf_oe1;
  reg  ibuf_oe2;
  reg  ibuf_oe3;
  reg  ibuf_oe4;
  reg  oddr_en;
  wire  q_p,q_p_netlist;
  wire  q_n,q_n_netlist;

	integer mismatch=0;

  primitive_example_design_6 golden (.in(in),.clk(clk),. rst( rst),.ibuf_oe1(ibuf_oe1),.ibuf_oe2(ibuf_oe2),.ibuf_oe3(ibuf_oe3),.ibuf_oe4(ibuf_oe4),.oddr_en(oddr_en),.q_p(q_p),.q_n(q_n));
  `ifdef PNR
  primitive_example_design_6_post_route netlist (.in(in),.clk(clk),. rst( rst),.ibuf_oe1(ibuf_oe1),.ibuf_oe2(ibuf_oe2),.ibuf_oe3(ibuf_oe3),.ibuf_oe4(ibuf_oe4),.oddr_en(oddr_en),.q_p(q_p_netlist),.q_n(q_n_netlist));
  `else
  primitive_example_design_6_post_synth netlist (.in(in),.clk(clk),. rst( rst),.ibuf_oe1(ibuf_oe1),.ibuf_oe2(ibuf_oe2),.ibuf_oe3(ibuf_oe3),.ibuf_oe4(ibuf_oe4),.oddr_en(oddr_en),.q_p(q_p_netlist),.q_n(q_n_netlist));
  `endif

  always #1 clk = !clk ;

  initial begin
    {in,clk,rst,ibuf_oe1,ibuf_oe2,ibuf_oe3,ibuf_oe4,oddr_en}<=0;

    repeat(10)@(negedge clk);
    ibuf_oe1<=1;
    ibuf_oe2<=1;
    ibuf_oe3<=1;
    ibuf_oe4<=1;
    oddr_en<=1;
    repeat(5)@(negedge clk);
    rst<=1;
    repeat(5)@(negedge clk);
    in<=2'b11;
    compare();

    repeat(500)@(negedge clk) begin
      in<=$random();
      compare();
    end

    rst<=0;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    rst<=1;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    oddr_en<=0;
    repeat(200)@(negedge clk) begin
      in<=$random();
      compare();
    end
    oddr_en<=1;
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
    $dumpfile("primitive_example_design_5.vcd");
    $dumpvars;
  end

endmodule
