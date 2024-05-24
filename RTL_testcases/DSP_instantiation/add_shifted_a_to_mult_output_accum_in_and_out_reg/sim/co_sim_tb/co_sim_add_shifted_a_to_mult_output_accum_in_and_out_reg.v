`timescale 1ns/1ps
module co_sim_add_shifted_a_to_mult_output_accum_in_and_out_reg;
	reg  [19:0] a;
	reg  [17:0] b;
	reg clk, reset;
	wire [37:0] z_out;
	reg  [5:0] acc_fir;
	reg  [37:0] expected_out;
	wire [37:0] z_out_netlist;

	integer mismatch=0;

add_shifted_a_to_mult_output_accum_in_and_out_reg golden(.*);
    `ifdef PNR
    `else
    add_shifted_a_to_mult_output_accum_in_and_out_reg_post_synth netlist(.*, .z_out(z_out_netlist));
    `endif

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	{a, b, reset, acc_fir, expected_out} = 0;
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

	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	@(negedge clk);
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	@(negedge clk);
	//@(negedge clk);
	display_stimulus();
	compare();
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is applied***\n\n");
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	@(negedge clk);
	display_stimulus();
	compare();
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	@(negedge clk);
	display_stimulus();
	compare();
	expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
	$display ("\n\n***Directed Functionality Test for multiplier and acc_fir is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied for multiplier and acc_fir***\n\n");
	repeat (600) begin
		//expected_out = (a<<acc_fir) + (expected_out[19:0]*b);
		a = $urandom( );
		b = $urandom( );
		acc_fir = $urandom( );
		//@(negedge clk);
		@(negedge clk);
		display_stimulus();
		compare();
		expected_out = (a<<acc_fir) + (expected_out[19:0]*b); //calculate the result at every negedge
		@(negedge clk);
		display_stimulus();
		compare();
		expected_out = (a<<acc_fir) + (expected_out[19:0]*b); //calculate the result at every negedge

	end
	$display ("\n\n***Random Functionality Tests with random inputs for multiplier and acc_fir are ended***\n\n");

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
	

task compare();
 	
  	if ((z_out !== z_out_netlist) || (z_out_netlist !== expected_out) || (z_out !== z_out_netlist)) begin
    	$display("Data Mismatch. Golden RTL: %0d, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else begin
  		$display("Data Matched. Golden RTL: %0d, Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, z_out_netlist, expected_out, $time);
	end
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, acc_fir=%0d", a, b, acc_fir);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule