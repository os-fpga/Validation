 
module co_sim_carry_chain_primitive_inst;
  reg P, G, CIN;
  wire O, COUT ;

  wire expected_cout, expected_sumout;
carry_chain_primitive_inst DUT (.*);

integer mismatch=0;

initial begin
  {P,G,CIN} = 3'b000;
  #5
  compare;
  {P,G,CIN} = 3'b001;
  #5
  compare;
  {P,G,CIN} = 3'b010;
  #5
  compare;
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

assign {expected_cout,expected_sumout} = {P ? CIN : G, P ^ CIN};

task compare;
 	
  	if(O !== expected_sumout) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_sumout, O, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_sumout ,O, $time);

    if(COUT !== expected_cout) begin
    	$display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_cout, COUT, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_cout ,COUT, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
