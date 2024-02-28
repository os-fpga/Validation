module co_sim_signed_a_unsigned_b_comb_mult_dsp19x2;
	reg signed [19:0] a;
	reg [17:0] b;
	wire signed  [37:0] z_out;
	reg [31:0] mult1, mult2;
	reg signed [37:0] expected_out;

	integer mismatch=0;
`ifdef PNR
`else

signed_a_unsigned_b_comb_mult_dsp19x2 golden(.*);
`endif

initial begin
	a=0;
	b=0;
	mult1 = 0;
	mult2 = 0;
	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (600) begin
		a = $random( );
		b = $urandom( );
		mult1 = $signed(a[9:0])*$signed({{1'b0},b[8:0]});
		mult2 = $signed(a[19:10])*$signed({{1'b0},b[17:9]});
		expected_out = {mult2[18:0],mult1[18:0]};
		#10;
		display_stimulus();
		compare();
		#10;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	a = 20'hfffff;
	b = 18'h3ffff;
	mult1 = $signed(a[9:0])*$signed({{1'b0},b[8:0]});
	mult2 = $signed(a[19:10])*$signed({{1'b0},b[17:9]});
	expected_out = {mult2[18:0],mult1[18:0]};
	#10;
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	#100;
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
	end
	

task compare();
 	if ((z_out !== expected_out)) begin
    	$display("Data Mismatch, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched: Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, expected_out, $time);
endtask


task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule