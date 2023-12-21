 
 
module co_sim_i_buf_ds_primitive_inst;
  reg data_positive_input;    // Data positive input (connect to top-level port)
  reg data_negative_input;    // Data negative input (connect to top-level port)
  reg enable_input;           // Enable the input
  wire data_output;           // Data output

  reg expected_data_output;
i_buf_ds_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  {data_positive_input, data_negative_input , enable_input} = 3'b000;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b001;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b010;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b011;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b100;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b101;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b110;
  #5
  compare;
  {data_positive_input, data_negative_input , enable_input} = 3'b111;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

///model////
always @(data_positive_input, data_negative_input, enable_input) begin
    casez ({data_positive_input, data_negative_input, enable_input})
      3'b??0 : expected_data_output = 0;      // When not enabled, output is set to zero
      3'b101 : expected_data_output = 1;
      3'b011 : expected_data_output = 0;
      default : begin end  // If enabled and I_P and I_N are the same, output does not change
    endcase
  end

task compare;
 	
  	if(data_output !== expected_data_output) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output, data_output, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output ,data_output, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
