 
module co_sim_BOOT_CLOCK_primitive_inst;
  wire O_BOOT_CLOCK ;

  wire expected_clk_output;
BOOT_CLOCK_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  expected_clk_output<=0;
  #15
  compare;
  #15
  compare;
  #15
  compare;
  #15
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
localparam HALF_PERIOD = 30/2.0;
 always #HALF_PERIOD expected_clk_output <= ~expected_clk_output;

task compare;
 	
  	if(O_BOOT_CLOCK !== expected_clk_output) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_clk_output, O_BOOT_CLOCK, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_clk_output ,O_BOOT_CLOCK, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
