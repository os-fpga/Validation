
module co_sim_register_2;
	reg  [1:0] data_in;
	reg clk, rst ;
	wire  [1:0] data_out, data_out_netlist;

	integer mismatch=0,i=0;

register_2 golden(.*);
    `ifdef PNR
    `else
    register_2_post_synth netlist(.*, .data_out(data_out_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
	
    forever #5 clk = ~clk;
end
initial begin
	rst = 1;
	repeat (10) @(negedge clk);
	rst = 0;
	for (i=0;i<10;i=i+1) begin
		repeat (1) @ (negedge clk);
		data_in=$random;
		compare();
	end

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);

	
	repeat (10) @ (negedge clk);	
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