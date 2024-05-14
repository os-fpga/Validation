`timescale 1ns/1ps
module co_sim_GJC7;
// Clock signals
    reg			CLKA;
    reg			CLKB;
    reg 		[35:0] 		DIN;
    reg 		[8:0] 		ADDRA;
    reg 		[8:0] 		ADDRB;
    wire 		[35:0] 		DOUT	,	DOUT_netlist;
    reg 		RE;
    reg 		WE;
	integer		mismatch	=	0;

GJC7	golden (.*);

`ifdef PNR
	GJC7_post_route route_net (.*, .DOUT(DOUT_netlist) );
`else
	GJC7_post_synth synth_net (.*, .DOUT(DOUT_netlist) );
`endif

// clock initialization for CLKA
initial begin
	CLKA = 1'b0;
	forever #1 CLKA = ~CLKA;
end
// clock initialization for CLKB
initial begin
	CLKB = 1'b0;
	forever #1 CLKB = ~CLKB;
end

// Initialize values to zero 
initial	begin
	
// Initialization for RAM
	for (integer i = 0; i < 512; i++)  begin
		golden.RAM[i] = 'b0;
	end

	{DIN, ADDRA, ADDRB, RE, WE } <= 'd0;
	 repeat (2) @ (negedge CLKA); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLKA) begin
		DIN			 <= $urandom();
		ADDRA			 <= $urandom();
		ADDRB			 <= $urandom();
		RE			 <= $urandom();
		WE			 <= $urandom();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	DIN <= 68719476735;
	ADDRA <= 511;
	ADDRB <= 511;
	RE <= 1;
	WE <= 1;
	repeat (2) @ (negedge CLKA);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end


// Initialize values to zero 
initial	begin
	
// Initialization for RAM
	for (integer i = 0; i < 512; i++)  begin
		golden.RAM[i] = 'b0;
	end

repeat (2) @ (negedge CLKB);
	{DIN, ADDRA, ADDRB, RE, WE } <= 'd0;
	 repeat (2) @ (negedge CLKB); 
	compare();
	//Random stimulus generation
	repeat(100) @ (negedge CLKB) begin
		DIN			 <= $urandom();
		ADDRA			 <= $urandom();
		ADDRB			 <= $urandom();
		RE			 <= $urandom();
		WE			 <= $urandom();

		compare();
	end

	// ----------- Corner Case stimulus generation -----------
	DIN <= 68719476735;
	ADDRA <= 511;
	ADDRB <= 511;
	RE <= 1;
	WE <= 1;
	repeat (2) @ (negedge CLKB);
	compare();
	if(mismatch == 0)
		$display("**** All Comparison Matched *** \n		Simulation Passed\n");
	else
		$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	#200;
	$finish;
end

task compare();
	if ( DOUT !== DOUT_netlist ) begin
		$display("Data Mismatch: Actual output: %0d, Netlist Output %0d, Time: %0t ", DOUT, DOUT_netlist,  $time);
		mismatch = mismatch+1;
	end
	else
		$display("Data Matched: Actual output: %0d, Netlist Output %0d, Time: %0t ", DOUT, DOUT_netlist,  $time);
endtask

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

endmodule
