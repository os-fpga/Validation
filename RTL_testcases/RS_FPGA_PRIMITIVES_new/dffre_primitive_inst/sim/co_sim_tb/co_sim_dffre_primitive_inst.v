 
module co_sim_dffre_primitive_inst;
  reg data_input;    // Data Input
  reg reset;         // Active-low, asynchronous reset
  reg enable;        // Active-high enable
  reg clock;         // Clock
  wire data_output;

  reg expected_out;

  dffre_primitive_inst DUT (.*);

integer mismatch=0;

always #5 clock = ~clock;
initial begin
  clock = 0;
  reset = 0;
  enable = 0;
  data_input = 0;
  repeat (5) @(negedge clock);
  reset = 1;
  compare;
  repeat (5) @(negedge clock);
  enable = 0;
  data_input = 1;
  compare;
  @(negedge clock);
  enable = 1;
  data_input = 1;
  compare;
  @(negedge clock);
  enable = 0;
  data_input = 1;
  compare;
  @(negedge clock);
  reset = 0;
  enable = 1;
  data_input = 1;
  compare;
  repeat (5) @(negedge clock);
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

 always @(posedge clock, negedge reset)
    if (!reset)
      expected_out <= 1'b0;
    else if (enable)
      expected_out <= data_input;

task compare;
 	
  	if(data_output !== expected_out) begin
    	$display("Data Mismatch. Expected out : %0b, Netlist: %0b, Time: %0t", expected_out, data_output, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected out : %0b, Netlist: %0b, Time: %0t", expected_out ,data_output, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
