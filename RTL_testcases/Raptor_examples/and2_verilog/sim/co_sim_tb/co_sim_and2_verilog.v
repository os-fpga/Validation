`timescale 1ns/1ps
module co_sim_and2_verilog #(parameter WIDTH=32, CHANNEL=10);

	reg a     = 1'b0;
	reg b     = 1'b0;
	reg clk   = 1'b0;
	reg reset = 1'b1;
	wire c, c_netlist;

	integer mismatch=0;

and2_verilog golden (.a(a),.reset(reset),.b(b),.clk(clk),.c(c));
and2_verilog_post_route netlist(.a(a),.b(b),.clk(clk),.reset(reset),.c(c_netlist));

always #1 clk = ~clk;

initial begin
	a=0;
	b=0;
	@(negedge clk);
	display_stimulus();
	@(negedge clk);
	compare();

	a=1;
	b=0;
	@(negedge clk);
	display_stimulus();
	@(negedge clk);
	compare();

	a=0;
	b=1;
	@(negedge clk);
	display_stimulus();
	@(negedge clk);
	compare();

	a=1;
	b=1;
	@(negedge clk);
	display_stimulus();
	@(negedge clk);
	compare();

	repeat(500)@(negedge clk) begin
		a=$random;
		b=$random;
		@(negedge clk);
		display_stimulus();
		@(negedge clk);
		compare();
	end

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
 	
  	if(c !== c_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", c, c_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", c, c_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule