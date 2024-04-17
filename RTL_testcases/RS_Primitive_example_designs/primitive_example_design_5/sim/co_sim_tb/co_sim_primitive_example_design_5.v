module co_sim_primitive_example_design_5;

  reg [2:0] in;
  reg  rst;
  reg  clk;
  reg  ibuf1_en;
  reg  ibuf2_en;
  reg  ibuf3_en;
  reg  ibuf4_en;
  reg  ibuf5_en;
  reg  obuft_ds_en1;
  reg  obuft_ds_en2;
  reg  obuft_ds_en3;
  reg [2:0] iddr_en;
  wire [2:0] q_p,q_p_netlist;
  wire [2:0] q_n,q_n_netlist;

	integer mismatch=0;

  primitive_example_design_5 golden (.in(in),.rst(rst),.clk(clk),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.obuft_ds_en1(obuft_ds_en1),.obuft_ds_en2(obuft_ds_en2),.obuft_ds_en3(obuft_ds_en3),.iddr_en(iddr_en),.q_p(q_p),.q_n(q_n));
  `ifdef PNR
  primitive_example_design_5_post_route netlist (.in(in),.rst(rst),.clk(clk),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.obuft_ds_en1(obuft_ds_en1),.obuft_ds_en2(obuft_ds_en2),.obuft_ds_en3(obuft_ds_en3),.iddr_en(iddr_en),.q_p(q_p_netlist),.q_n(q_n_netlist));
  `else
  primitive_example_design_5_post_synth netlist (.in(in),.rst(rst),.clk(clk),.ibuf1_en(ibuf1_en),.ibuf2_en(ibuf2_en),.ibuf3_en(ibuf3_en),.ibuf4_en(ibuf4_en),.ibuf5_en(ibuf5_en),.obuft_ds_en1(obuft_ds_en1),.obuft_ds_en2(obuft_ds_en2),.obuft_ds_en3(obuft_ds_en3),.iddr_en(iddr_en),.q_p(q_p_netlist),.q_n(q_n_netlist));
  `endif

  always #1  clk = ! clk ;
  
  initial begin
    {in,rst,clk,ibuf1_en,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en,obuft_ds_en1,obuft_ds_en2,obuft_ds_en3,iddr_en}<='b0;
  
    repeat(10)@(negedge clk);
    rst<=1;
    ibuf1_en<=1;
    ibuf2_en<=1;
    ibuf3_en<=1;
    ibuf4_en<=1;
    ibuf5_en<=1;
    obuft_ds_en1<=1;
    obuft_ds_en2<=1;
    obuft_ds_en3<=1;
    iddr_en<=3'b111;
    in<=3'b111;

    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    iddr_en<=3'b000;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end
    iddr_en<=3'b111;
    repeat(100)@(negedge clk) begin
      in<=$random();
      compare();
    end

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
