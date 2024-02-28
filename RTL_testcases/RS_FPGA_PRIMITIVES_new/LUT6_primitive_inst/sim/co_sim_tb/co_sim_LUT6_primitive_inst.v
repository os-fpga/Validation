 
module co_sim_LUT6_primitive_inst;
  reg [5:0] A_LUT6; // Data Input
  wire Y_LUT6; // Data Output

`ifdef PNR
`else
   	LUT6_primitive_inst DUT (.*);
`endif
integer mismatch=0,i;

initial begin
  for (i = 0 ; i<64 ; i=i+1) begin
    A_LUT6 = i;
    #5
    compare;
  end
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

task compare;
 	
  	if(Y_LUT6 !== (&A_LUT6)) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", (&A_LUT6), Y_LUT6, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", (&A_LUT6) ,Y_LUT6, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
