
module co_sim_dsp_mul_signed_comb_iverilog;
	reg signed [19:0] A;
	reg signed [17:0] B;
	wire signed [37:0] P;

	integer mismatch=0;


`ifdef PNR
`else
		dsp_mul_signed_comb_iverilog inst(.*);
`endif
initial begin
	A=0;
	B=0;
	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		A = $random;
		B = $random;
		#10;
		display_stimulus;
		display_output;
		#10;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	A=0;
	B=0;

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	A = 20'hfffff;
	B = 18'h3ffff;
	#10;
	display_stimulus;
	display_output;
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	#100;
	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
	end
	

task display_stimulus;
	$display ($time,," Test stimulus is: A=%0d, B=%0d", A, B );
endtask
task display_output;
	$display ($time,," Output is: %0d" , P);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule