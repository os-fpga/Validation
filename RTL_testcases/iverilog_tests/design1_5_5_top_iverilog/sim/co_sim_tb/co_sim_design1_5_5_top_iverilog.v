module co_sim_design1_5_5_top_iverilog #(parameter WIDTH=32, CHANNEL=5);
	reg clk, rst;
	reg signed [WIDTH-1:0] in;
	wire signed [WIDTH-1:0] out;

`ifdef PNR
		design1_5_5_top_iverilog inst( clk ,
    rst ,
    in[31] ,
    in[30] ,
    in[29] ,
    in[28] ,
    in[27] ,
    in[26] ,
    in[25] ,
    in[24] ,
    in[23] ,
    in[22] ,
    in[21] ,
    in[20] ,
    in[19] ,
    in[18] ,
    in[17] ,
    in[16] ,
    in[15] ,
    in[14] ,
    in[13] ,
    in[12] ,
    in[11] ,
    in[10] ,
    in[9] ,
    in[8] ,
    in[7] ,
    in[6] ,
    in[5] ,
    in[4] ,
    in[3] ,
    in[2] ,
    in[1] ,
    in[0] ,
    out[30] ,
    out[29] ,
    out[28] ,
    out[27] ,
    out[26] ,
    out[25] ,
    out[24] ,
    out[23] ,
    out[22] ,
    out[21] ,
    out[20] ,
    out[19] ,
    out[18] ,
    out[17] ,
    out[16] ,
    out[8] ,
    out[3] ,
    out[2] ,
    out[1] ,
    out[0] ,
    out[31] ,
    out[14] ,
    out[13] ,
    out[12] ,
    out[11] ,
    out[10] ,
    out[9] ,
    out[7] ,
    out[15] ,
    out[6] ,
    out[5] ,
    out[4]  );
`else
   	design1_5_5_top_iverilog inst(.*);
`endif
//clock initialization
initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end



initial begin
	rst = 1; 
 	in=0; 	 //	rst = 0;
	@(negedge clk);
// 	rst = 1;
// 	in=0;
	$display ("\n\n***rst Test is applied***\n\n");
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***rst Test is ended***\n\n");

	rst = 0;
	@(negedge clk);

	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		in = $random;
		display_stimulus;
		@(negedge clk);
		@(negedge clk);
		display_output;
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	rst =1;
	in=0;
	$display ("\n\n***rst Test is applied***\n\n");
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***rst Test is ended***\n\n");
	
	rst=0;
	@(negedge clk);
	$display ("\n\n***rst Value is set zero again***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	in = 32'habcdefab;
	display_stimulus;
	@(negedge clk);
	@(negedge clk);
	display_output;
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$finish;
end
	

task display_output;
	$display ($time,," Output is: %0d" , out);
endtask

task display_stimulus;
	$display ($time,," Test stimulus is: in=%0d", in);
endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule