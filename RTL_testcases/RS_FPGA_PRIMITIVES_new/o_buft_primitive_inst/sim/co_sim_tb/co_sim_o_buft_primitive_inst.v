 
module co_sim_o_buft_primitive_inst;
  reg I_O_BUFT; // Data input
  reg T_O_BUFT; // Tri-state output
  wire O_O_BUFT; 

  wire expected_data_output;
o_buft_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  {I_O_BUFT, T_O_BUFT} = 2'b00;
  #5
  compare;
  {I_O_BUFT, T_O_BUFT} = 2'b01;
  #5
  compare;
  {I_O_BUFT, T_O_BUFT} = 2'b10;
  #5
  compare;
  {I_O_BUFT, T_O_BUFT} = 2'b11;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

assign expected_data_output =  T_O_BUFT ? I_O_BUFT : 1'bz;

task compare;
 	
  	if(O_O_BUFT !== expected_data_output) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output, O_O_BUFT, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output ,O_O_BUFT, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
