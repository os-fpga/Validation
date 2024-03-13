module co_sim_dsp_fractured_mul_signed_reg_with_accum;
	reg signed [9:0] A, A_fmode;
	reg signed [8:0] B, B_fmode;
	reg clk, reset, subtract_i;
	wire signed [37:0] P;
	wire signed [37:0] P_netlist;

	integer mismatch=0;

dsp_fractured_mul_signed_reg_with_accum golden(.*);
    `ifdef PNR
dsp_fractured_mul_signed_reg_with_accum_post_route netlist(.*, .P(P_netlist));
    `else
    dsp_fractured_mul_signed_reg_with_accum_post_synth netlist(.*, .P(P_netlist));
    `endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	{A, A_fmode, B, B_fmode} = 'd0;
	subtract_i = 0;
	@(negedge clk);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A = 10'h3ff;
	B = 9'h1ff;
	A_fmode = 10'h3ff;
	B_fmode = 9'h1ff;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A = 10'h3ff;
	B = 9'h1ff;
	A_fmode = 10'h3ff;
	B_fmode = 9'h1ff;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied for P = P + A*B***\n\n");
	A = 10'h1ff;
	B = 9'h0ff;
	A_fmode = 10'h1ff;
	B_fmode = 9'h0ff;
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for P = P + A*B is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P + A*B***\n\n");
	@(negedge clk);
	repeat (1000) begin
		{A, B, A_fmode, B_fmode} = $random( );
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests with signed inputs for P = P + A*B are ended***\n\n");

	reset =1;
	A=0;
	B=0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	subtract_i = 1;
	reset=0;
	@(negedge clk);
	$display ("\n\n***Reset Value is set zero again***\n\n");

	$display ("\n\n*** Random Functionality Tests with signed inputs are applied for P = P - A*B***\n\n");
	@(negedge clk);
	repeat (1000) begin
		A = $random( );
		B = $random( );
		A_fmode = $random( );
		B_fmode = $random( );
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
	$display ($time,," Test stimulus is: A=%0d, B=%0d", A, B);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule