 
module co_sim_o_buft_ds_primitive_inst;
  reg I_O_BUFT_DS; // Data input
  reg T_O_BUFT_DS; // Tri-state output
  wire O_P_O_BUFT_DS;  // Data positive output (connect to top-level port)
  wire O_N_O_BUFT_DS; // Data negative output (connect to top-level port)

  wire expected_data_output_P, expected_data_output_N;
o_buft_ds_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  {I_O_BUFT_DS, T_O_BUFT_DS} = 2'b00;
  #5
  compare;
  {I_O_BUFT_DS, T_O_BUFT_DS} = 2'b01;
  #5
  compare;
  {I_O_BUFT_DS, T_O_BUFT_DS} = 2'b10;
  #5
  compare;
  {I_O_BUFT_DS, T_O_BUFT_DS} = 2'b11;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

assign expected_data_output_P =  T_O_BUFT_DS ? I_O_BUFT_DS : 1'bz;
assign expected_data_output_N =  T_O_BUFT_DS ? ~I_O_BUFT_DS : 1'bz;

task compare;
 	
  	if(O_P_O_BUFT_DS !== expected_data_output_P) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output_P, O_P_O_BUFT_DS, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output_P ,O_P_O_BUFT_DS, $time);

    if(O_N_O_BUFT_DS !== expected_data_output_N) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output_N, O_N_O_BUFT_DS, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output_N ,O_N_O_BUFT_DS, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
