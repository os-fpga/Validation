 
module co_sim_LUT5_primitive_inst;
  reg [4:0] A_LUT5; // Data Input
  wire Y_LUT5; // Data Output

`ifdef PNR
`else
   	LUT5_primitive_inst DUT (.*);
`endif
integer mismatch=0,i;

initial begin
  for (i = 0 ; i<32 ; i=i+1) begin
    A_LUT5 = i;
    #5
    compare;
  end
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
  $finish;
end

task compare;
 	
  	if(Y_LUT5 !== (A_LUT5[4] + A_LUT5[3] + A_LUT5[2] + A_LUT5[1] + A_LUT5[0])) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", (A_LUT5[4] + A_LUT5[3] + A_LUT5[2] + A_LUT5[1] + A_LUT5[0]), Y_LUT5, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", (A_LUT5[4] + A_LUT5[3] + A_LUT5[2] + A_LUT5[1] + A_LUT5[0]) ,Y_LUT5, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
