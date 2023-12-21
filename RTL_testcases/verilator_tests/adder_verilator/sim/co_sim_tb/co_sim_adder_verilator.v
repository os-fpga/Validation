module co_sim_adder_verilator;

  reg clock;
  reg reset;
  reg [3:0] a;
  reg [3:0] b;
  wire [4:0] sum;
  
  integer mismatch=0;

`ifdef PNR
		adder_verilator inst(
		clock ,
    reset ,
    b[3] ,
    b[2] ,
    b[1] ,
    b[0] ,
    a[3] ,
    a[2] ,
    a[1] ,
    a[0] ,
    sum[4] ,
    sum[3] ,
    sum[2] ,
    sum[1] ,
    sum[0] );
`else
   	adder_verilator inst(.*);
`endif
   
//clock initialization
initial begin
    clock = 1'b0;
    forever #5 clock = ~clock;
end
initial begin
	reset = 0;
  a = 0;
  b = 0;
	@ (negedge clock);
	reset = 1;
	$display ("\n\n***Reset Test is applied***\n\n");
	@ (negedge clock);
	display_stimulus();

	@ (negedge clock);
	$display ("\n\n***Reset Test is ended***\n\n");

	reset = 0;
	@ (negedge clock);

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 0;
  b = 0;
	@ (negedge clock);
	display_stimulus();

	$display ("\n\n***Directed Functionality Test is ended***\n\n");

	$display ("\n\n***Directed Functionality Test is applied ***\n\n");
	a = 4'd5;
  b = 4'd10;
	@ (negedge clock);
	display_stimulus();

	$display ("\n\n***Directed Functionality Test is ended***\n\n");


	$display ("\n\n*** Random Functionality Tests are applied***\n\n");
  a = $random();
  b = $random();
	@ (negedge clock);
	display_stimulus();
	$display ("\n\n***Random Functionality Tests are ended***\n\n");

	@ (negedge clock);
	$finish;
end
	


task display_stimulus();
	$display ($time,," Test stimulus is: a=%0d, b=%0d, sum=%0d", a, b, sum);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
