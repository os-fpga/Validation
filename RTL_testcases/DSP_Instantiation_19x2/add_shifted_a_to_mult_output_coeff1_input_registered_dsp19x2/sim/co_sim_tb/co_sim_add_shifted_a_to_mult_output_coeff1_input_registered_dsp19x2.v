module co_sim_add_shifted_a_to_mult_output_coeff1_input_registered_dsp19x2;
	reg  [19:0] a;
	reg  [17:0] b;
	reg  clk,reset;
	wire [37:0] z_out;
	reg  [4:0] acc_fir;
	reg  [31:0] mult1, mult2;
	reg  [63:0] add_sub_in, add_sub_out;
	reg  [37:0] expected_out;

	integer mismatch=0;
`ifdef PNR
add_shifted_a_to_mult_output_coeff1_input_registered_dsp19x2 netlist( a[0] ,
    a[1] ,
    a[2] ,
    a[3] ,
    a[4] ,
    a[5] ,
    a[6] ,
    a[7] ,
    a[8] ,
    a[9] ,
    a[10] ,
    a[11] ,
    a[12] ,
    a[13] ,
    a[14] ,
    a[15] ,
    a[16] ,
    a[17] ,
    a[18] ,
    a[19] ,
    b[0] ,
    b[1] ,
    b[2] ,
    b[3] ,
    b[4] ,
    b[5] ,
    b[6] ,
    b[7] ,
    b[8] ,
    b[9] ,
    b[10] ,
    b[11] ,
    b[12] ,
    b[13] ,
    b[14] ,
    b[15] ,
    b[16] ,
    b[17] ,
    clk ,
    reset ,
	acc_fir [0] ,
	acc_fir [1] ,
	acc_fir [2] ,
	acc_fir [3] ,
	acc_fir [4] ,
    z_out[0] ,
    z_out[1] ,
    z_out[2] ,
    z_out[3] ,
    z_out[4] ,
    z_out[5] ,
    z_out[6] ,
    z_out[7] ,
    z_out[8] ,
    z_out[9] ,
    z_out[10] ,
    z_out[11] ,
    z_out[12] ,
    z_out[13] ,
    z_out[14] ,
    z_out[15] ,
    z_out[16] ,
    z_out[17] ,
    z_out[18] ,
    z_out[19] ,
    z_out[20] ,
    z_out[21] ,
    z_out[22] ,
    z_out[23] ,
    z_out[24] ,
    z_out[25] ,
    z_out[26] ,
    z_out[27] ,
    z_out[28] ,
    z_out[29] ,
    z_out[30] ,
    z_out[31] ,
    z_out[32] ,
    z_out[33] ,
    z_out[34] ,
    z_out[35] ,
    z_out[36] ,
    z_out[37] );
`else

add_shifted_a_to_mult_output_coeff1_input_registered_dsp19x2 golden(.*);
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
	{a, b, expected_out,acc_fir,mult1, mult2, add_sub_in, add_sub_out}= 'd0;
	$display ("\n\n***Reset Test is applied***\n\n");
	@(negedge clk);
	@(negedge clk);
	display_stimulus();
	#2;
	compare();
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	
	$display ("\n\n*** Random Functionality Tests for multiplier with unsigned inputs are applied***\n\n");
	repeat (600) begin
	        @(negedge clk);
		a = $urandom( );
		b = $urandom( );
		acc_fir = 4'd2;
		mult1 = 10'h000*b[8:0];
		mult2 = 10'h001*b[17:9];
		add_sub_in[31:0] = a[9:0]<<acc_fir;
		add_sub_in[63:32] = a[19:10]<<acc_fir;
		add_sub_out[31:0] = add_sub_in[31:0] + mult1; 
		add_sub_out[63:32] = add_sub_in[63:32] + mult2;
		expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
		display_stimulus();
		@(negedge clk);
		compare();
	end
	$display ("\n\n***Random Functionality Tests for multiplier with unsigned inputs are ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir = 4'd2;
	mult1 = 10'h000*b[8:0];
	mult2 = 10'h001*b[17:9];
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_out[31:0] = add_sub_in[31:0] + mult1; 
	add_sub_out[63:32] = add_sub_in[63:32] + mult2;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

		$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir = 4'd2;
	mult1 = 10'h000*b[8:0];
	mult2 = 10'h001*b[17:9];
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_out[31:0] = add_sub_in[31:0] + mult1; 
	add_sub_out[63:32] = add_sub_in[63:32] + mult2;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'd255;
	b = 18'd1;
	acc_fir = 4'd2;
	mult1 = 10'h000*b[8:0];
	mult2 = 10'h001*b[17:9];
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_out[31:0] = add_sub_in[31:0] + mult1; 
	add_sub_out[63:32] = add_sub_in[63:32] + mult2;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
	compare();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	@(negedge clk);
	a = 20'hfffff;
	b = 18'h3ffff;
	acc_fir = 4'd2;
	mult1 = 10'h000*b[8:0];
	mult2 = 10'h001*b[17:9];
	add_sub_in[31:0] = a[9:0]<<acc_fir;
	add_sub_in[63:32] = a[19:10]<<acc_fir;
	add_sub_out[31:0] = add_sub_in[31:0] + mult1; 
	add_sub_out[63:32] = add_sub_in[63:32] + mult2;
	expected_out = {add_sub_out[50:32],add_sub_out[18:0]};
	display_stimulus();
	@(negedge clk);
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
	$display ($time,," Test stimulus is: a=%0d, b=%0d, acc_fir=%0d", a, b, acc_fir);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule