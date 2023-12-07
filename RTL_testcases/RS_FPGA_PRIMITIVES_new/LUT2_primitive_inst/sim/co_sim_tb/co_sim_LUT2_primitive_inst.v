 
module co_sim_LUT2_primitive_inst;
  reg [1:0] A_LUT2; // Data Input
  wire Y_LUT2; // Data Output


`ifdef PNR
		LUT2_primitive_inst DUT (
    A_LUT2[0] ,
    A_LUT2[1] ,
    Y_LUT2 );
`else
   	LUT2_primitive_inst DUT (.*);
`endif

integer mismatch=0;

initial begin
  A_LUT2 = 2'b00;
  #5
  compare;
  A_LUT2 = 2'b01;
  #5
  compare;
  A_LUT2 = 2'b10;
  #5
  compare;
  A_LUT2 = 2'b11;
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
 	
  	if(Y_LUT2 !== (A_LUT2[1] & A_LUT2[0])) begin
    	$display("Data Mismatch. Input : %0b, Golden: %0b, Netlist: %0b, Time: %0t", (A_LUT2[1] & A_LUT2[0]), Y_LUT2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Input : %0b, Golden: %0b, Netlist: %0b, Time: %0t", (A_LUT2[1] & A_LUT2[0]) ,Y_LUT2, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
