 
module co_sim_LUT1_primitive_inst;
  reg A_LUT1; // Data Input
  wire Y_LUT1; // Data Output

LUT1_primitive_inst DUT (.*,.Y_LUT1(Y_LUT1));

integer mismatch=0;

initial begin
  A_LUT1 = 0;
  #5
  compare;
  A_LUT1 = 1;
  #5
  compare;
  A_LUT1 = 0;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
  $finish;
end

task compare;
 	
  	if(Y_LUT1 !== ~A_LUT1) begin
    	$display("Data Mismatch. Input : %0b, Golden: %0b, expected: %0b, Time: %0t", A_LUT1, Y_LUT1, ~A_LUT1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Input : %0b, Golden: %0b, expected: %0b, Time: %0t", A_LUT1 ,Y_LUT1, ~A_LUT1, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
