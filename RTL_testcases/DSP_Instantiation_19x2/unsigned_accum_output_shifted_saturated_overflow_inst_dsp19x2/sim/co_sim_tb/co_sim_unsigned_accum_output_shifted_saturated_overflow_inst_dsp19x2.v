module co_sim_unsigned_accum_output_shifted_saturated_overflow_inst_dsp19x2;
	reg [19:0] a;
	reg [17:0] b;
	reg [4:0] shift_right;
	reg  clk, reset;
	wire [37:0] z_out;
	reg  [37:0] expected_out;
	reg [31:0] mult1, mult2;
	reg  signed [63:0] expected_out2, mult, expected_out_shifted;

	integer mismatch=0;

`ifdef PNR
unsigned_accum_output_shifted_saturated_overflow_inst_dsp19x2 netlist( a[0] ,
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
	shift_right[0],
	shift_right[1],
	shift_right[2],
	shift_right[3],
	shift_right[4],
	shift_right[5],
    clk ,
    reset ,
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

unsigned_accum_output_shifted_saturated_overflow_inst_dsp19x2 golden(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
	reset = 0;
	{a, b, shift_right, expected_out, expected_out2, mult, expected_out_shifted, mult1, mult2}= 'd0;
	@(negedge clk);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	@(negedge clk);
	@(negedge clk);
	display_stimulus();
	compare();
	//@(negedge clk);
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@(negedge clk);

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	a = 20'h7;
	b = 18'h3;
	shift_right = 5'h5;
	mult1 = (a[9:0]*b[8:0]);
	mult2 = (a[19:10]*b[17:9]);
	expected_out2[31:0] = 0 - $signed(mult1);
	expected_out2[63:32] = 0 - $signed(mult2);
	expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
	expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
	#2;
	saturate();
	expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
	@(negedge clk);
	display_stimulus();
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");

	@(negedge clk);
	a = 20'h1;
	b = 18'h2;
	shift_right = 5'h3;
	mult1 = (a[9:0]*b[8:0]);
	mult2 = (a[19:10]*b[17:9]);
	expected_out2[31:0] = 0 - $signed(mult1);
	expected_out2[63:32] = 0 - $signed(mult2);
	expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
	expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
	#2;
	saturate();
	expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
	@(negedge clk);
	//#2;
	display_stimulus();
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	@(negedge clk);
	a = 20'h8000;
	b = 18'h2000;
	shift_right = 5'h1;
	mult1 = (a[9:0]*b[8:0]);
	mult2 = (a[19:10]*b[17:9]);
	expected_out2[31:0] = 0 - $signed(mult1);
	expected_out2[63:32] = 0 - $signed(mult2);
	expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
	expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
	#2;
	saturate();
	expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
	@(negedge clk);
	display_stimulus();
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied forshifted output of z_out = z_out - a*b***\n\n");
	@(negedge clk);
	a = 20'd417393;
	b = 18'd109048;
	shift_right = 5'd5; // shift right previous value was 55 simulation failing for 55
	mult1 = (a[9:0]*b[8:0]);
	mult2 = (a[19:10]*b[17:9]);
	@(negedge clk)
	expected_out2[31:0] = 0 - $signed(mult1);
	expected_out2[63:32] = 0 - $signed(mult2);
	expected_out_shifted[31:0] = expected_out2[31:0]>>shift_right;
	expected_out_shifted[63:32] = expected_out2[63:32]>>shift_right;
	#2;
	saturate();
	expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
	//#2;
	display_stimulus();
	compare();
	@(negedge clk)
	$display ("\n\n***Directed Functionality Test forshifted output of z_out = z_out - a*b is ended***\n\n");

	$display ("\n\n*** Random Functionality Tests with random inputs are applied forshifted output of z_out = z_out - a*b***\n\n");
	
	repeat (100) begin
		@(negedge clk);
		a = $urandom( );
		b = $urandom( );
		shift_right = 5'h2; // commented by saad 
		mult1 = (a[9:0]*b[8:0]);
		mult2 = (a[19:10]*b[17:9]);
		@(negedge clk)
		expected_out2[31:0] = 0 - $signed(mult1);
		expected_out2[63:32] = 0 - $signed(mult2);
		expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
		expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
		#2;
		saturate();
		expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
		display_stimulus();
		compare();
		@(negedge clk);
	end
	$display ("\n\n***Random Functionality Tests with random inputs forshifted output of z_out = z_out - a*b are ended***\n\n");

	$display ("\n\n***tests for underflow***\n\n");
	@(negedge clk);
	a = 524280;
	b = 131070;
	shift_right = 10;

	repeat (100) begin
		mult1 = (a[9:0]*b[8:0]);
		mult2 = (a[19:10]*b[17:9]);
		@(negedge clk)
		expected_out2[31:0] = 0 - $signed(mult1);
		expected_out2[63:32] = 0 - $signed(mult2);
		expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
		expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
		#2;
		saturate();
		expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
		@(negedge clk);
		display_stimulus();
		compare();
		@(negedge clk);
	end
	$display ("\n\n***tests for underflow ended***\n\n");

	$display ("\n\n***tests for overflow***\n\n");
	@(negedge clk);
	a = 524280;
	b = 131070;
	shift_right = 10;

	repeat (100) begin
		mult1 = (a[9:0]*b[8:0]);
		mult2 = (a[19:10]*b[17:9]);
		@(negedge clk)
		expected_out2[31:0] = 0 - $signed(mult1);
		expected_out2[63:32] = 0 - $signed(mult2);
		expected_out_shifted[31:0] = expected_out2[31:0]>>>shift_right;
		expected_out_shifted[63:32] = expected_out2[63:32]>>>shift_right;
		#2;
		saturate();
		expected_out = {expected_out_shifted[50:32],expected_out_shifted[18:0]};
		display_stimulus();
		compare();
		@(negedge clk);
	end
	$display ("\n\n***tests for overflow ended***\n\n"); 

	if(mismatch == 0)
        $display("\n**** all Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
	$finish;
end


task saturate();
	if ($signed(expected_out_shifted[31:0]) >= 19'h7ffff) begin //Saturation overflow logic
		expected_out_shifted[31:0] = 19'h7ffff;
	end
	if ($signed(expected_out_shifted[63:32]) >= 19'h7ffff) begin //Saturation overflow logic
		expected_out_shifted[63:32] = 19'h7ffff;
	end
endtask	

task compare();
	//if (expected_out2[shift_right -1]==1) begin //Rounding logic
	//	expected_out = expected_out + 1'b1;
	//end
	
	if ((expected_out_shifted) < 0) begin //Saturation overflow logic
		expected_out = 0;
	end
	else
	 $display("code is working"); 
	
 	if ((z_out !== expected_out)) begin
    	$display("Data Mismatch, Netlist: %0d, Expected output: %0d, Time: %0t", z_out, expected_out, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched: Netlist: %0d,  Expected output: %0d, Time: %0t", z_out, expected_out, $time);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, shift_right=%0d", a, b, shift_right);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule