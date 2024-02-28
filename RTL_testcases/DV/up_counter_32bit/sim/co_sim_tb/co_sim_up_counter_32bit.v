
module co_sim_up_counter_32bit;

  parameter CLK_PERIOD = 2; // Clock period in nanoseconds
  parameter TOTAL_TIME = 1048576;

  reg clk;
  reg rst;
  wire [19:0] count,count_netlist;

  reg[31:0] error=0;
  reg [`COUNTER_WIDTH - 1:0] test_cycles;

	integer mismatch=0;

  up_counter_32bit dut (.clk(clk),.rst(rst),.count(count));
  `ifdef PNR
    up_counter_32bit_post_synth  netlist (.clk(clk),.rst(rst),.count(count_netlist));
  `endif 

  always #((CLK_PERIOD/2)) clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;

    #20 rst = 1;
    repeat(20)@(negedge clk);
    compare();
    rst = 0;
    @(negedge clk);
    @(negedge clk);
    compare();

    repeat(1048590) @(negedge clk) begin
      // @(negedge clk);
      // display_stimulus();
      // @(negedge clk);
      compare();
    end
  
    repeat(10)@(negedge clk);
  
    if(mismatch == 0)
      $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
      $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);

    $finish;
  end

  task compare();
  	if(count !== count_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", count_netlist, count_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", count, count_netlist, $time);
  endtask

  task display_stimulus();
  	$display ($time,," Test stimulus is: inpt=%0d", count);
  endtask

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule 
