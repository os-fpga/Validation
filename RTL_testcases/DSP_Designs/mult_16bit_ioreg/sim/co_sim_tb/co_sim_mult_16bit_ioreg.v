
`timescale 1ns/1ps
module co_sim_mult_16bit_ioreg();

  reg [15:0] a;
  reg [15:0] b;
  reg clock0;
  wire [31:0] out;
  reg reset;
  wire [31:0]result_netlist;

mult_16bit_ioreg golden(.*);
`ifdef PNR
mult_16bit_ioreg_post_route netlist(.* ,. out(result_netlist));
`else
	mult_16bit_ioreg_post_synth netlist(.* ,. out(result_netlist));
`endif 

	integer mismatch=0;

//clock initialization
initial begin
    clock0 = 1'b1;
    forever #5 clock0 = ~clock0;
end
initial begin
	reset = 0;
	a=0;
    b=0;
	@(negedge clock0);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clock0);
	@(negedge clock0);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clock0);

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 1;
	b = 2;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 16'h1fff;
	b = 16'h1fff;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 16'h1fff;
    b = 16'h1fff;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 16'h2000;
    b = 16'h2000;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");


	$display ("\n\n*** Random Functionality Tests are applied***\n\n");
	repeat (1000) begin
		a = $random( );
		b = $random( );
		@(negedge clock0);
		display_stimulus();
		@(negedge clock0);
		compare();
	end
	$display ("\n\n***Random Functionality Tests are ended***\n\n");

	$display ("\n\n*** Random Functionality Tests are applied***\n\n");
	repeat (1000) begin
		a = $random( );
        b = $random( );
		@(negedge clock0);
		display_stimulus();
		@(negedge clock0);
		compare();
	end
	$display ("\n\n***Random Functionality Tests are ended***\n\n");

	if(mismatch == 0)
        $display("\n**** all Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#100;
	$finish;
end
	

task compare();
 	
  	if(out !== result_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", out, result_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", out, result_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule