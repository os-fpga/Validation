
module co_sim_invertion_4;
	reg [3:0] data_in;
	wire  [3:0] data_out, data_out_netlist;

	integer mismatch=0,i=0;

invertion_4 golden(.*);
invertion_4_post_synth netlist(.*, .data_out(data_out_netlist));

initial begin
	
	for (i=0;i<10;i=i+1) begin
		#10
		data_in=$random;
		#1
		compare();
	end

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);

	
	#100	
	$finish;
end
	

task compare();
 	
  	if(data_out !== data_out_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", data_out, data_out_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", data_out, data_out_netlist, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule