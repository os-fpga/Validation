module co_sim_complex_multiplier_verilator #(parameter A_WIDTH = 20, B_WIDTH = 18);
	reg clk, reset;
 	reg signed [ 19:0] ar, ai;
 	reg signed [ 17:0] br, bi;
 	wire signed [38:0] pr, pi;

	integer mismatch=0;

`ifdef PNR
		complex_multiplier_verilator inst( clk ,
    reset ,
    ar[0] ,
    ar[1] ,
    ar[2] ,
    ar[3] ,
    ar[4] ,
    ar[5] ,
    ar[6] ,
    ar[7] ,
    ar[8] ,
    ar[9] ,
    ar[10] ,
    ar[11] ,
    ar[12] ,
    ar[13] ,
    ar[14] ,
    ar[15] ,
    ar[16] ,
    ar[17] ,
    ar[18] ,
    ar[19] ,
    ai[0] ,
    ai[1] ,
    ai[2] ,
    ai[3] ,
    ai[4] ,
    ai[5] ,
    ai[6] ,
    ai[7] ,
    ai[8] ,
    ai[9] ,
    ai[10] ,
    ai[11] ,
    ai[12] ,
    ai[13] ,
    ai[14] ,
    ai[15] ,
    ai[16] ,
    ai[17] ,
    ai[18] ,
    ai[19] ,
    br[0] ,
    br[1] ,
    br[2] ,
    br[3] ,
    br[4] ,
    br[5] ,
    br[6] ,
    br[7] ,
    br[8] ,
    br[9] ,
    br[10] ,
    br[11] ,
    br[12] ,
    br[13] ,
    br[14] ,
    br[15] ,
    br[16] ,
    br[17] ,
    bi[0] ,
    bi[1] ,
    bi[2] ,
    bi[3] ,
    bi[4] ,
    bi[5] ,
    bi[6] ,
    bi[7] ,
    bi[8] ,
    bi[9] ,
    bi[10] ,
    bi[11] ,
    bi[12] ,
    bi[13] ,
    bi[14] ,
    bi[15] ,
    bi[16] ,
    bi[17] ,
    pr[0] ,
    pr[1] ,
    pr[2] ,
    pr[3] ,
    pr[4] ,
    pr[5] ,
    pr[6] ,
    pr[7] ,
    pr[8] ,
    pr[9] ,
    pr[10] ,
    pr[11] ,
    pr[12] ,
    pr[13] ,
    pr[14] ,
    pr[15] ,
    pr[16] ,
    pr[17] ,
    pr[18] ,
    pr[19] ,
    pr[20] ,
    pr[21] ,
    pr[22] ,
    pr[23] ,
    pr[24] ,
    pr[25] ,
    pr[26] ,
    pr[27] ,
    pr[28] ,
    pr[29] ,
    pr[30] ,
    pr[31] ,
    pr[32] ,
    pr[33] ,
    pr[34] ,
    pr[35] ,
    pr[36] ,
    pr[37] ,
    pr[38] ,
    pi[0] ,
    pi[1] ,
    pi[2] ,
    pi[3] ,
    pi[4] ,
    pi[5] ,
    pi[6] ,
    pi[7] ,
    pi[8] ,
    pi[9] ,
    pi[10] ,
    pi[11] ,
    pi[12] ,
    pi[13] ,
    pi[14] ,
    pi[15] ,
    pi[16] ,
    pi[17] ,
    pi[18] ,
    pi[19] ,
    pi[20] ,
    pi[21] ,
    pi[22] ,
    pi[23] ,
    pi[24] ,
    pi[25] ,
    pi[26] ,
    pi[27] ,
    pi[28] ,
    pi[29] ,
    pi[30] ,
    pi[31] ,
    pi[32] ,
    pi[33] ,
    pi[34] ,
    pi[35] ,
    pi[36] ,
    pi[37] ,
    pi[38] );
`else
		complex_multiplier_verilator inst(.*);
`endif
//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	@(negedge clk);
	reset = 1;
	ar=0;
	ai=0;
	bi=0;
	br=0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		ar = $random( );
		br = $random( );
		ai = $random( );
		bi = $random( );
		display_stimulus();
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		display_output();
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	reset =1;
	ar=0;
	br=0;
	ai=0;
	bi=0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Reset Test is ended***\n\n");
	
	reset=0;
	@(negedge clk);
	$display ("\n\n***Reset Value is set zero again***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'h7ffff;
	br = 18'h1ffff;
	ai = 20'h7ffff;
	bi = 18'h1ffff;
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'h80000;
	br = 18'h20000;
	ai = 20'h80000;
	bi = 18'h20000;
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'hfffff;
	br = 18'h3ffff;
	ai = 20'hfffff;
	bi = 18'h3ffff;
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	

	$finish;
end
	


task display_stimulus();
	$display ($time,," Test stimulus is: ar=%0d, br=%0d, ai=%0d, bi=%0d", ar, br, ai, bi);
endtask
task display_output();
	$display ($time,," Output is: pr=%0d, pi=%0d" , pr, pi);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule