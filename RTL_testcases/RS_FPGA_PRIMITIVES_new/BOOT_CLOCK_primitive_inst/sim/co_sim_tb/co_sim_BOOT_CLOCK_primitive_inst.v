 
module co_sim_BOOT_CLOCK_primitive_inst;
  reg clk1;       // Source clock domain clock
  reg async_signal; // Asynchronous signal to be synchronized
  wire sync_signal; // Synchronized signal
  wire O_BOOT_CLOCK; // Clock output

  reg sync_signal_expected;
  reg expected_clk_output;
  reg [1:0] sync_reg; // Two-stage synchronizer flip-flops

BOOT_CLOCK_primitive_inst DUT (.*);

integer mismatch=0;

// Clock generation for clk1
initial begin
    clk1 = 0;
    forever #7.5 clk1 = ~clk1; // Generate clk1 with a period of 15ns
end

initial begin
  // Initialize inputs
  async_signal = 0;
  expected_clk_output = 0;

  // Delay to let the simulation stabilize
  #10;

  // Start comparing expected output with actual output from DUT
  async_signal = 1;
  #15 compare;
   async_signal = 0;
  #15 compare;
   async_signal = 1;
  #15 compare;

  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

localparam HALF_PERIOD = 30/2.0;
 always #HALF_PERIOD expected_clk_output <= ~expected_clk_output;
 always @(posedge clk1) begin    // Capture input on source clock domain
    sync_reg[0] <= async_signal;
  end

  always @(posedge expected_clk_output) begin    // Release synchronized signal on destination clock domain
    sync_signal_expected <= sync_reg[1];
    sync_reg[1] <= sync_reg[0];
  end

task compare;
 	
  	if(O_BOOT_CLOCK !== expected_clk_output) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_clk_output, O_BOOT_CLOCK, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_clk_output ,O_BOOT_CLOCK, $time);

    if(sync_signal !== sync_signal_expected) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", sync_signal_expected, sync_signal, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", sync_signal_expected ,sync_signal, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
