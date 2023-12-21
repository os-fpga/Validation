 
module co_sim_LUT4_primitive_inst;
  reg [3:0] A_LUT4; // Data Input
  wire Y_LUT4; // Data Output

`ifdef PNR
		LUT4_primitive_inst DUT (
    A_LUT4[0] ,
    A_LUT4[1] ,  
    A_LUT4[2] ,
    A_LUT4[3] ,
    Y_LUT4 );
`else
   	LUT4_primitive_inst DUT (.*);
`endif
integer mismatch=0,i;

initial begin
  for (i = 0 ; i<16 ; i=i+1) begin
    A_LUT4 = i;
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
 	
  	if(Y_LUT4 !== (A_LUT4[3] + A_LUT4[2] + A_LUT4[1] + A_LUT4[0])) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", (A_LUT4[3] + A_LUT4[2] + A_LUT4[1] + A_LUT4[0]), Y_LUT4, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", (A_LUT4[3] + A_LUT4[2] + A_LUT4[1] + A_LUT4[0]) ,Y_LUT4, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
