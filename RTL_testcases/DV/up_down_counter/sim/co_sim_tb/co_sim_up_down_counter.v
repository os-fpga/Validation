`include "clb_defines.v"

module co_sim_up_down_counter;

  reg  clock0;
  reg  reset;
  reg  dir;
  bit  load;
  bit [`COUNTER_WIDTH - 1:0] counter_input;
  wire [`COUNTER_WIDTH - 1:0] counter_output,counter_output_netlist;

  reg[31:0] error=0;
  reg [`COUNTER_WIDTH - 1:0] test_cycles;

	integer mismatch=0;

  up_down_counter  golden (.clock0(clock0),.reset(reset),.dir(dir),.load(load),.counter_input(counter_input),.counter_output(counter_output));
  `ifdef PNR
    up_down_counter_post_route netlist (
  );
  `else
    up_down_counter_post_synth  netlist (.clock0(clock0),.reset(reset),.dir(dir),.load(load),.counter_input(counter_input),.counter_output(counter_output_netlist));
  `endif 

  always #5  clock0 = !clock0;

  initial begin
    clock0=0;
    reset=0;
    dir =0;

    #50;
    @(negedge clock0);
    $display("Counter reset asserted for 1ns!");
    reset = 1;
    #1 reset = 0;
    display_stimulus();
    @(negedge clock0);
    @(negedge clock0);
    compare();
    if(counter_output !== {`COUNTER_WIDTH{1'b0}})begin
        error+=1;
        $display("Asynchronous reset Failed!");
    end else begin
        $display("Counter reset deasserted successfully!");
    end

  // Testing counter
  $display("Testing counter in <up> mode!");
  dir = 0;
  for (test_cycles = 0; test_cycles < 50; test_cycles+=1)begin
    @(posedge clock0);
    #1;
    display_stimulus();
    @(negedge clock0);
    @(negedge clock0);
    compare();
  end

  reset = 1;
  #1 reset = 0; 
  display_stimulus();
	@(negedge clock0);
	@(negedge clock0);
	compare();

  $display("Testing counter in <down> mode!");
  dir = 1;
  for (test_cycles = 0; test_cycles < 50; test_cycles+=1)begin
    @(posedge clock0);
    #1;
    display_stimulus();
    @(negedge clock0);
    @(negedge clock0);
    compare();
  end

  if(mismatch == 0)
    $display("\n**** All Comparison Matched ***\nSimulation Passed");
  else
    $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);

  #10;
  $finish;
  end

  task compare();
  	if(counter_output !== counter_output_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", counter_output, counter_output_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", counter_output, counter_output_netlist, $time);
  endtask

  task display_stimulus();
  	$display ($time,," Test stimulus is: inpt=%0d", counter_output);
  endtask

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule 
