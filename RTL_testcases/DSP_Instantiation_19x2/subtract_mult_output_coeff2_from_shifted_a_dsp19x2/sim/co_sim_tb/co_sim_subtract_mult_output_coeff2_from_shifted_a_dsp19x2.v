`timescale 1ns/1ps
module co_sim_subtract_mult_output_coeff2_from_shifted_a_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	wire  [37:0] z_out;
	reg clk, reset;
	reg [ 5:0] acc_fir;
	reg [31:0] mult1,mult2;
	reg [63:0] add_sub_out, add_sub_in;
	reg  [37:0] expected_out;
	wire  [37:0] z_out_netlist;

	integer mismatch=0;
`ifdef PNR
`else

subtract_mult_output_coeff2_from_shifted_a_dsp19x2 golden(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	
	{reset, a, b, expected_out, acc_fir, mult1, mult2, add_sub_out, add_sub_in} = 'd0;
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
		@(negedge clk);
		a = $urandom( );
		b = $urandom( );
		acc_fir = 5'd2;
		mult1 = 10'h001 * b[8:0];
		mult2 = 10'h000 * b[17:9];
		add_sub_in[31:0] = {{22{1'b0}},a[9:0]}<<acc_fir;
		add_sub_in[63:32] = {{22{1'b0}},a[19:10]}<<acc_fir;
		add_sub_out[31:0] = $signed(add_sub_in[31:0]) - $signed(mult1);
		add_sub_out[63:32] = $signed(add_sub_in[63:32]) - $signed(mult2);;
		saturate();
		#2;
		expected_out = {add_sub_out[50:32], add_sub_out[18:0]};
		display_stimulus();
		compare();
		
	end
	$display ("\n\n***Random Functionality Tests for multiplier with unsigned inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =5'h1;
	mult1 = 10'h001 * b[8:0];
	mult2 = 10'h000 * b[17:9];
	add_sub_in[31:0] = {{22{1'b0}},a[9:0]}<<acc_fir;
	add_sub_in[63:32] = {{22{1'b0}},a[19:10]}<<acc_fir;
	add_sub_out[31:0] = $signed(add_sub_in[31:0]) - $signed(mult1);
	add_sub_out[63:32] = $signed(add_sub_in[63:32]) - $signed(mult2);;
	saturate();
	#2;
	expected_out = {add_sub_out[50:32], add_sub_out[18:0]};
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =5'h1;
	mult1 = 10'h001 * b[8:0];
	mult2 = 10'h000 * b[17:9];
	add_sub_in[31:0] = {{22{1'b0}},a[9:0]}<<acc_fir;
	add_sub_in[63:32] = {{22{1'b0}},a[19:10]}<<acc_fir;
	add_sub_out[31:0] = $signed(add_sub_in[31:0]) - $signed(mult1);
	add_sub_out[63:32] = $signed(add_sub_in[63:32]) - $signed(mult2);;
	saturate();
	#2;
	expected_out = {add_sub_out[50:32], add_sub_out[18:0]};
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir =5'h1;
	mult1 = 10'h001 * b[8:0];
	mult2 = 10'h000 * b[17:9];
	add_sub_in[31:0] = {{22{1'b0}},a[9:0]}<<acc_fir;
	add_sub_in[63:32] = {{22{1'b0}},a[19:10]}<<acc_fir;
	add_sub_out[31:0] = $signed(add_sub_in[31:0]) - $signed(mult1);
	add_sub_out[63:32] = $signed(add_sub_in[63:32]) - $signed(mult2);;
	saturate();
	#2;
	expected_out = {add_sub_out[50:32], add_sub_out[18:0]};
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'hfffff;
	b = 18'h3ffff;
	acc_fir =5'h3;
	mult1 = 10'h001 * b[8:0];
	mult2 = 10'h000 * b[17:9];
	add_sub_in[31:0] = {{22{1'b0}},a[9:0]}<<acc_fir;
	add_sub_in[63:32] = {{22{1'b0}},a[19:10]}<<acc_fir;
	add_sub_out[31:0] = $signed(add_sub_in[31:0]) - $signed(mult1);
	add_sub_out[63:32] = $signed(add_sub_in[63:32]) - $signed(mult2);;
	saturate();
	#2;
	expected_out = {add_sub_out[50:32], add_sub_out[18:0]};
	display_stimulus();
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	@(negedge clk);
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
	end
	
task saturate();
	if ($signed(add_sub_out[31:0]) > 19'h7ffff) begin //Saturation overflow logic	
		add_sub_out[31:0] = 19'h00000;
	end
	if ($signed(add_sub_out[63:32]) > 19'h7ffff) begin //Saturation overflow logic	
		add_sub_out[63:32] = 19'h00000;
	end
endtask	

task compare();
 	if ((z_out !== expected_out)) begin
    	$display("Data Mismatch, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched: Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, expected_out, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, acc_fir=%0d", a, b, acc_fir);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule