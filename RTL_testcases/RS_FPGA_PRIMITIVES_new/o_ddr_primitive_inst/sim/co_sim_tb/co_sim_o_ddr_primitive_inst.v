 
module co_sim_o_ddr_primitive_inst;
  reg [1:0] data_input;       // Data input (connect to your input signal)
  reg reset;            // Active-low asynchronous reset
  reg enable;           // Active-high enable
  reg clock;            // Clock input
  wire output_data; // Data output

  reg [1:0] Expected_out;
o_ddr_primitive_inst DUT (.*);

integer mismatch=0;
always #5 clock = ~clock;
initial begin
  reset = 0;
  enable = 0;
  clock = 0;
  data_input = 0;
  @ (negedge clock);
  compare;

  reset = 1;
  enable = 1;
  data_input = 2'b11;
  @ (negedge clock);
  compare;

  repeat (10) begin
    reset = $random;
    enable = $random;
    data_input = $random;
    @ (negedge clock);
    compare;
  end
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

///model////
  always @(negedge reset)
    Expected_out <= 1'b0;

  always @(clock)
    if (!reset)
      Expected_out <= 1'b0;
    else if (enable) 
      if (clock)
        Expected_out <= data_input[0];
      else
        Expected_out <= data_input[1];

 
task compare;
 	
  	if(output_data !== Expected_out) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", Expected_out, output_data, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", Expected_out ,output_data, $time);
    
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
