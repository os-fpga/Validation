module co_sim_unsigned_comb_mult_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	wire  [37:0] z_out;
	reg  [37:0] expected_out;
	reg [31:0] mult1, mult2;
	wire  [37:0] z_out_netlist;

	integer mismatch=0;
`ifdef PNR
`else

unsigned_comb_mult_dsp19x2 golden(.*);
`endif

initial begin
	a=0;
	b=0;
	mult1 = 32'd0;
	mult2 = 32'd0;
	$display ("\n\n*** Random Functionality Tests for multiplier with unsigned inputs are applied***\n\n");
	repeat (600) begin
		a = $urandom( );
		b = $urandom( );
		mult1 = a[9:0]*b[8:0];
		mult2 = a[19:10]*b[17:9];
		expected_out = {mult2[18:0],mult1[18:0]};
		#10;
		display_stimulus();
		compare();
		#10;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with unsigned inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	a = 20'hfffff;
	b = 18'h3ffff;
	mult1 = a[9:0]*b[8:0];
	mult2 = a[19:10]*b[17:9];
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