module co_sim_dsp_mult_add_shifted_saturated_rounded_inf_dsp19x2;
	reg [9:0] A1, A2;
	reg [8:0] B1, B2;
	reg clk, reset, subtract, round, saturate;
	reg [4:0] shift_right;
	wire [37:0] P;
	wire [37:0] P_netlist;

	integer mismatch=0;

dsp_mult_add_shifted_saturated_rounded_inf_dsp19x2 golden(.*);
    `ifdef PNR
    `else
    dsp_mult_add_shifted_saturated_rounded_inf_dsp19x2_post_synth netlist(.*, .P(P_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	{A1, A2, B1, B2, shift_right} = 'd0;
	subtract = 0;
	round = 0;
	saturate = 0;
	reset = 0;
	@(negedge clk);
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	$display ("\n\n***Reset Test is ended***\n\n");
	@(negedge clk);
	compare();
	reset = 1;
	subtract = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h3ff;
	B1 = 9'h1ff;
	A2 = 10'h3ff;
	B2 = 9'h1ff;
	shift_right = 5'h1;
	round = 1;
	saturate = 1;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h3ff;
	B1 = 9'h1ff;
	A2 = 10'h3ff;
	B2 = 9'h1ff;
	shift_right = 5'h3f;
	round = 1;
	saturate = 1;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h1ff;
	B1 = 9'h0ff;
	A2 = 10'h1ff;
	B2 = 9'h0ff;
	round = 1;
	saturate = 1;
	shift_right = 5'h0f;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P + A*B***\n\n");
	{A1, B1, A2, B2} = $urandom( );
	shift_right = 5'h2;
	round = 1;
	saturate = 1;
	@(negedge clk);
	repeat (600) begin
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with signed inputs for P = P + A*B are ended***\n\n");

	{A1, A2, B1, B2, shift_right} = 'd0;
	round = 0;
	saturate = 0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	subtract = 1;
	reset=1;
	@(negedge clk);
	$display ("\n\n***Reset Value is set zero again***\n\n");

	$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P - A*B***\n\n");
	A1 = $urandom( );
	B1 = $urandom( );
	A2 = $urandom( );
	B2 = $urandom( );
	shift_right = 5'h2;
	round = 1;
	saturate = 1;
	@(negedge clk);
	repeat (600) begin
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
 	
  	if(P !== P_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", P, P_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", P, P_netlist, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: A1=%0d, B1=%0d, shift_right=%0d", A1, B1, shift_right);
	$display ($time,," Test stimulus is: A2=%0d, B2=%0d, shift_right=%0d", A2, B2, shift_right);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule