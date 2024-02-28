module co_sim_design128_6_3_top_verilator #(parameter WIDTH=32, CHANNEL=6);
	reg clk, rst;
	reg signed [WIDTH-1:0] in;
	wire signed [WIDTH-1:0] out;



`ifdef PNR
`else
   	design128_6_3_top_verilator inst(.*);
`endif

//clock initialization
initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end


// initial begin
//     rst = 1'b1;
//     #10
//     rst = 1'b0;
// end

initial begin
	rst = 1; 
 	in=0; 	 //	rst = 0;
	@(negedge clk);
// 	rst = 1;
// 	in=0;
	$display ("\n\n***rst Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***rst Test is ended***\n\n");

	rst = 0;
	@(negedge clk);

	$display ("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n");
	repeat (1000) begin
		in = $random( );
		display_stimulus();
		@(negedge clk);
		@(negedge clk);
		display_output();
	end
	$display ("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n");

	rst =1;
	in=0;
	$display ("\n\n***rst Test is applied***\n\n");
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***rst Test is ended***\n\n");
	
	rst=0;
	@(negedge clk);
	$display ("\n\n***rst Value is set zero again***\n\n");

	$display ("\n\n***Directed Functionality Test for multiplier is applied***\n\n");
	in = 32'habcdefab;
	display_stimulus();
	@(negedge clk);
	@(negedge clk);
	display_output();
	$display ("\n\n***Directed Functionality Test for multiplier is ended***\n\n");

	$finish;
end
	

task display_output();
	$display ($time,," Output is: %0d" , out);
endtask

task display_stimulus();
	$display ($time,," Test stimulus is: in=%0d", in);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule