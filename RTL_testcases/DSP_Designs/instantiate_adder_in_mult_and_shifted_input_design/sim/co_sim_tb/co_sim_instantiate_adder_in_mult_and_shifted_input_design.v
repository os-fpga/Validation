module co_sim_instantiate_adder_in_mult_and_shifted_input_design;

	reg signed [19:0] A;
	reg signed [17:0] B;
	reg clk, areset;
	reg [5:0] acc_fir;
	wire signed [37:0] result;

	wire signed [37:0] result_netlist;

	integer mismatch=0;

instantiate_adder_in_mult_and_shifted_input_design golden(.*);
    `ifdef PNR
    `else
    instantiate_adder_in_mult_and_shifted_input_design_post_synth netlist(.*, .result(result_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	areset = 0;
	A=0;
	B=0;
	acc_fir=0;
	@(negedge clk);
	areset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	areset = 0;
	@(negedge clk);
	@(negedge clk);
	$display ("\n\n***Directed Functionality Test is applied***\n\n");
	A = 5;
	B = 2;
	acc_fir = $urandom( );
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test is ended***\n\n");
     
	$display ("\n\n*** Random Functionality Tests with signed inputs are applied***\n\n");
	@(negedge clk);
	repeat (1000) begin
		@(negedge clk);
		A = $random( );
		B = $random( );
		acc_fir = 5; //$urandom( );
		display_stimulus();
		@(negedge clk);
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with signed inputs are ended***\n\n");

	areset =1;
	A=0;
	B=0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	
	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
 	
  	if(result !== result_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", result, result_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", result, result_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: A=%0d, B=%0d", A, B);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule