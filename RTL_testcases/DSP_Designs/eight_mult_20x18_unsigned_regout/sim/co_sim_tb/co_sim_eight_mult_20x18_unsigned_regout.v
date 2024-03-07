 
module co_sim_eight_mult_20x18_unsigned_regout();

  reg [0:19] A;
  reg [0:17] B;
  wire [0:37] Y;
  reg clock0;
  reg id;
  reg reset;
  wire [0:37]result_netlist;

eight_mult_20x18_unsigned_regout golden(.*);
`ifdef PNR
`else
eight_mult_20x18_unsigned_regout netlist(.* ,. Y(result_netlist));
`endif

	integer mismatch=0;

//clock initialization
initial begin
    clock0 = 1'B1;
    forever #5 clock0 = ~clock0;
end
initial begin
	reset = 0;
	A=0;
    B=0;
    id = 0;
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
	A = 1;
	B = 2;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	A = 18'h1ffff;
	B = 18'h1ffff;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	A = 18'h1ffff;
    B = 18'h1ffff;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	A = 18'h20000;
    B = 18'h20000;
	display_stimulus();
	repeat (4) @(negedge clock0);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");


	$display ("\n\n*** Random Functionality Tests are applied***\n\n");
	repeat (1000) begin
		A = $random( );
		B = $random( );
		@(negedge clock0);
		display_stimulus();
		@(negedge clock0);
		compare();
	end
	$display ("\n\n***Random Functionality Tests are ended***\n\n");

	$display ("\n\n*** Random Functionality Tests are applied***\n\n");
	repeat (1000) begin
		A = $random( );
        B = $random( );
		display_stimulus();
		@(negedge clock0);
		compare();
	end
	$display ("\n\n***Random Functionality Tests are ended***\n\n");

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#100;
	$finish;
end
	

task compare();
 	
  	if(Y !== result_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", Y, result_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", Y, result_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: A=%0d, B=%0d", A, B);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule