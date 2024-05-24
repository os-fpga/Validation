`timescale 1ns/1ps
module co_sim_signed_a_unsigned_b_comb_mult;
	reg signed [19:0] a;
	reg [17:0] b;
	wire signed  [37:0] z_out;
	reg signed [37:0] expected_out;
	wire signed [37:0] z_out_netlist;

	integer mismatch=0;

signed_a_unsigned_b_comb_mult golden(.*);
    `ifdef PNR
    `else
    signed_a_unsigned_b_comb_mult_post_synth netlist(.*, .z_out(z_out_netlist));
    `endif

initial begin
	a=0;
	b=0;
	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (600) begin
		a = $random( );
		b = $urandom( );
		expected_out = a * $signed({1'b0,b});
		#10;
		display_stimulus();
		compare();
		#10;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	a = 20'hfffff;
	b = 18'h3ffff;
	expected_out = a * $signed({1'b0,b});
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
 	
  	if ((z_out !== z_out_netlist) || (z_out_netlist !== expected_out) || (z_out !== expected_out)) begin
    	$display("Data Mismatch. Golden RTL: %0d, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else begin
  		$display("Data Matched. Golden RTL: %0d, Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
	end
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d", a, b);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule