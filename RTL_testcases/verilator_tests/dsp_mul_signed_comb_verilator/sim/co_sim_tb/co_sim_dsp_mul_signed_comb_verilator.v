
module co_sim_dsp_mul_signed_comb_verilator;
	reg signed [19:0] A;
	reg signed [17:0] B;
	wire signed [37:0] P;

	integer mismatch=0;


`ifdef PNR
    dsp_mul_signed_comb_verilator inst(  
    A[19] ,
    A[18] ,
    A[17] ,
    A[16] ,
    A[15] ,
    A[14] ,
    A[13] ,
    A[12] ,
    A[11] ,
    A[10] ,
    A[9] ,
    A[8] ,
    A[7] ,
    A[6] ,
    A[5] ,
    A[4] ,
    A[3] ,
    A[2] ,
    A[1] ,
    A[0] ,
    B[17] ,
    B[16] ,
    B[15] ,
    B[14] ,
    B[13] ,
    B[12] ,
    B[11] ,
    B[10] ,
    B[9] ,
    B[8] ,
    B[7] ,
    B[6] ,
    B[5] ,
    B[4] ,
    B[3] ,
    B[2] ,
    B[1] ,
    B[0] ,
    P[37] ,
    P[36] ,
    P[35] ,
    P[34] ,
    P[33] ,
    P[32] ,
    P[31] ,
    P[30] ,
    P[29] ,
    P[28] ,
    P[27] ,
    P[26] ,
    P[25] ,
    P[24] ,
    P[23] ,
    P[22] ,
    P[21] ,
    P[20] ,
    P[19] ,
    P[18] ,
    P[17] ,
    P[16] ,
    P[15] ,
    P[14] ,
    P[13] ,
    P[12] ,
    P[11] ,
    P[10] ,
    P[9] ,
    P[8] ,
    P[7] ,
    P[6] ,
    P[5] ,
    P[4] ,
    P[3] ,
    P[2] ,
    P[1] ,
    P[0] );
`else
		dsp_mul_signed_comb_verilator inst(.*);
`endif
initial begin
	A=0;
	B=0;
	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		A = $random( );
		B = $random( );
		#10;
		display_stimulus();
		display_output();
		#10;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	A=0;
	B=0;

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	A = 20'hfffff;
	B = 18'h3ffff;
	#10;
	display_stimulus();
	display_output();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	#100;
	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
	end
	

task display_stimulus();
	$display ($time,," Test stimulus is: A=%0d, B=%0d", A, B );
endtask
task display_output();
	$display ($time,," Output is: %0d" , P);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule