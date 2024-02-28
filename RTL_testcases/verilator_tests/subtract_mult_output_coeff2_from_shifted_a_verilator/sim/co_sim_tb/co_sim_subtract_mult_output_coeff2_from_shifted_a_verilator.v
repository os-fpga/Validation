module co_sim_subtract_mult_output_coeff2_from_shifted_a_verilator;
	reg  [19:0] a;
	reg  [17:0] b;
	wire  [37:0] z_out;
	reg clk, reset;
	reg [ 5:0] acc_fir;
	reg  [37:0] expected_out;
	wire  [37:0] z_out_netlist;

	integer mismatch=0;

subtract_mult_output_coeff2_from_shifted_a_verilator golden(.*);
    `ifdef PNR
    `else
    subtract_mult_output_coeff2_from_shifted_a_verilator_post_synth netlist(.*, .z_out(z_out_netlist));
    `endif
//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	
	{reset, a, b, expected_out, acc_fir} = 'd0;
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
	@(negedge clk);
	
	
	$display ("\n\n*** Random Functionality Tests for multiplier with unsigned inputs are applied***\n\n");
	repeat (600) begin
		a = $urandom( );
		b = $urandom( );
		acc_fir = $urandom( );
		@(posedge clk);
		expected_out = (a<<acc_fir) - (16*b);
		display_stimulus();
		#10;
		compare();
		
	end
	$display ("\n\n***Random Functionality Tests for multiplier with unsigned inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	@(posedge clk);
	expected_out = (a<<acc_fir) - (16*b);
	display_stimulus();
	#10;
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	@(posedge clk);
	expected_out = (a<<acc_fir) - (16*b);
	display_stimulus();
	#10;
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =6'h1;
	@(posedge clk);
	expected_out = (a<<acc_fir) - (16*b);
	display_stimulus();
	#10;
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'hfffff;
	b = 18'h3ffff;
	acc_fir =6'h3f;
	@(posedge clk);
	expected_out = (a<<acc_fir) - (16*b);
	
	display_stimulus();
	#10;
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");
	@(negedge clk);
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
	$display ($time,," Test stimulus is: a=%0d, b=%0d, acc_fir=%0d", a, b, acc_fir);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule