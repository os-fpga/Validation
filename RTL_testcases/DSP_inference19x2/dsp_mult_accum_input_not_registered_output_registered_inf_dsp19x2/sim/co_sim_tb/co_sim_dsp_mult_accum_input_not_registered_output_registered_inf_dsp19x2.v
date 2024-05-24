 
`timescale 1ns/1ps
module co_sim_dsp_mult_accum_input_not_registered_output_registered_inf_dsp19x2;
	reg signed [9:0] A1, A2;
	reg signed [8:0] B1, B2;
	reg clk, reset, subtract;
	wire signed [37:0] P;
	wire signed [37:0] P_netlist;

	integer mismatch=0;

dsp_mult_accum_input_not_registered_output_registered_inf_dsp19x2 golden(.*);
    `ifdef PNR
    `else
    dsp_mult_accum_input_not_registered_output_registered_inf_dsp19x2_post_synth netlist(.*, .P(P_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	{A1, A2, B1, B2} = 'd0;
	subtract = 0;
	@(negedge clk);
	reset = 0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 1;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h3f;
	B1 = 9'h1f;
	A2 = 10'h3f;
	B2 = 9'h1f;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h3;
	B1 = 9'h1f;
	A2 = 10'hf;
	B2 = 9'hf;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A1 = 10'h1f;
	B1 = 9'hf;
	A2  = 10'hf;
	B2  = 9'h0f;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P + A*B***\n\n");
	{A1, B1, A2, B2} = $random( );
	@(negedge clk);
	repeat (600) begin
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with signed inputs for P = P + A*B are ended***\n\n");

	reset =0;
	A1=0;
	B1=0;
    A2=0;
    B2=0;
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
	A1 = $random( );
	B1 = $random( );
	A2 = $random( );
	B2 = $random( );
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
	$display ($time,," Test stimulus is: A1=%0d, B1=%0d", A1, B1);
	$display ($time,," Test stimulus is: A2=%0d, B2=%0d", A2, B2);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule