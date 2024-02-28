 
module co_sim_LUT3_primitive_inst;
  reg [2:0] A_LUT3; // Data Input
  wire Y_LUT3; // Data Output


`ifdef PNR
`else
   	LUT3_primitive_inst DUT (.*);
`endif
integer mismatch=0;

initial begin
  A_LUT3 = 3'b000;
  #5
  compare;
  A_LUT3 = 3'b001;
  #5
  compare;
  A_LUT3 = 3'b010;
  #5
  compare;
  A_LUT3 = 3'b011;
  #5
  compare;
  A_LUT3 = 3'b100;
  #5
  compare;
  A_LUT3 = 3'b101;
  #5
  compare;
  A_LUT3 = 3'b110;
  #5
  compare;
  A_LUT3 = 3'b111;
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
 	
  	if(Y_LUT3 !== (A_LUT3[2] + A_LUT3[1] + A_LUT3[0])) begin
    	$display("Data Mismatch. Input : %0b, Actual Out: %0b, Time: %0t", (A_LUT3[2] + A_LUT3[1] + A_LUT3[0]), Y_LUT3, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Input : %0b, Actual Out: %0b, Time: %0t", (A_LUT3[2] + A_LUT3[1] + A_LUT3[0]) ,Y_LUT3, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
