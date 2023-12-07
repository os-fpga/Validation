 
module co_sim_o_buf_ds_primitive_inst;
  reg I_O_BUF_DS; // Data input
  wire O_P_O_BUF_DS; // Data positive output (connect to top-level port)
  wire O_N_O_BUF_DS ;

  wire O_P_expected, O_N_expected;
o_buf_ds_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  {I_O_BUF_DS} = 1'b0;
  #5
  compare;
  {I_O_BUF_DS} = 1'b1;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

    assign O_P_expected = I_O_BUF_DS;
    assign O_N_expected = ~I_O_BUF_DS;

task compare;
 	
  	if(O_P_O_BUF_DS !== O_P_expected) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", O_P_expected, O_P_O_BUF_DS, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", O_P_expected ,O_P_O_BUF_DS, $time);
    
    if(O_N_O_BUF_DS !== O_N_expected) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", O_N_expected, O_N_O_BUF_DS, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", O_N_expected ,O_N_O_BUF_DS, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
