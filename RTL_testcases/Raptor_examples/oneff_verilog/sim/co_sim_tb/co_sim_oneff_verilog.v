module co_sim_oneff_verilog;
	reg d;
	reg rstn;
    reg clk;
    wire q,q_netlist;

	integer mismatch=0;

oneff_verilog golden (.d(d),.rstn(rstn),.clock0(clk),.q(q));
oneff_verilog_post_route netlist(.d(d),.rstn(rstn),.clock0(clk),.q(q_netlist));

always #1 clk = ~clk;

initial begin
	clk=1'b0;
	rstn=0;
	d=0;
	@(negedge clk);
	display_stimulus();
	@(negedge clk);
	
	rstn=1;
	repeat(500)@(negedge clk) begin
		d=$random;
		display_stimulus();
		compare();
	end

	rstn=0;
	repeat(500)@(negedge clk) begin
		d=$random;
		display_stimulus();
		compare();
	end

	rstn=1;
	repeat(1000)@(negedge clk) begin
		d=$random;
		display_stimulus();
		compare();
	end

	repeat(5)@(negedge clk);

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
 	
  	if(q !== q_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", q, q_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", q, q_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: d=%0d q=%0d", d, q);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule