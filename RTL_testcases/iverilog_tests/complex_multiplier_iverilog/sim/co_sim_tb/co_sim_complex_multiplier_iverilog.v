module co_sim_complex_multiplier_iverilog #(parameter A_WIDTH = 20, B_WIDTH = 18);
	reg clk, reset;
 	reg signed [ 19:0] ar, ai;
 	reg signed [ 17:0] br, bi;
 	wire signed [38:0] pr, pi;

	integer mismatch=0;

`ifdef PNR
`else
		complex_multiplier_iverilog inst(.*);
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
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		ar = $random;
		br = $random;
		ai = $random;
		bi = $random;
		display_stimulus;
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		display_output;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	reset =1;
	ar=0;
	br=0;
	ai=0;
	bi=0;
	$display ("\n\n***Reset Test is applied***\n\n");
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Reset Test is ended***\n\n");
	
	reset=0;
	@(negedge clk);
	$display ("\n\n***Reset Value is set zero again***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'h7ffff;
	br = 18'h1ffff;
	ai = 20'h7ffff;
	bi = 18'h1ffff;
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'h80000;
	br = 18'h20000;
	ai = 20'h80000;
	bi = 18'h20000;
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	ar = 20'hfffff;
	br = 18'h3ffff;
	ai = 20'hfffff;
	bi = 18'h3ffff;
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	

	$finish;
end
	


task display_stimulus;
	$display ($time,," Test stimulus is: ar=%0d, br=%0d, ai=%0d, bi=%0d", ar, br, ai, bi);
endtask
task display_output;
	$display ($time,," Output is: pr=%0d, pi=%0d" , pr, pi);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule