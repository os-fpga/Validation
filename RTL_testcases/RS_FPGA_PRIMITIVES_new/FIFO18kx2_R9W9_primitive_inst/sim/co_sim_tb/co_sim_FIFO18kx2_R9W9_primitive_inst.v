 
module co_sim_FIFO18kx2_R9W9_primitive_inst;
  reg clock0, clock2, clock1, clock3, we1, we2, re1, re2, rst_ptr1, rst_ptr2;
  reg [8:0] din1, din2;
  wire [8:0] dout1, dout2;
  wire empty1; // FIFO empty flag
  wire full1; // FIFO full flag
  wire almost_empty1; // FIFO almost empty flag
  wire almost_full1; // FIFO almost full flag
  wire prog_empty1; // FIFO programmable empty flag
  wire prog_full1; // FIFO programmable full flag
  wire overflow1; // FIFO overflow error flag
  wire underflow1; // FIFO underflow error flag
  wire empty2; // FIFO empty flag
  wire full2; // FIFO full flag
  wire almost_empty2; // FIFO almost empty flag
  wire almost_full2; // FIFO almost full flag
  wire prog_empty2; // FIFO programmable empty flag
  wire prog_full2; // FIFO programmable full flag
  wire overflow2; // FIFO overflow error flag
  wire underflow2; // FIFO underflow error flag

reg [35:0] pop_expected1;
reg empty_expected1;
reg full_expected1;
reg almost_empty_expected1;
reg almost_full_expected1;
reg prog_empty_expected1;
reg prog_full_expected1;
reg overflow_expected1;
reg underflow_expected1;
reg [35:0] pop_expected2;
reg empty_expected2;
reg full_expected2;
reg almost_empty_expected2;
reg almost_full_expected2;
reg prog_empty_expected2;
reg prog_full_expected2;
reg overflow_expected2;
reg underflow_expected2;


`ifdef PNR
		FIFO18kx2_R9W9_primitive_inst DUT (.*); //add ports later
`else
   	FIFO18kx2_R9W9_primitive_inst DUT (.*);
`endif
integer mismatch=0,i;


always #5  clock0 = ~clock0;
always #10 clock1 = ~clock1;
always #15 clock2 = ~clock2;
always #20 clock3 = ~clock3;

initial begin
  rst_ptr1 <= 1;
  rst_ptr2 <= 1;
  clock0 <= 0;
  clock1 <= 0;
  clock2 <= 0;
  clock3 <= 0;
  wr_en1 <= 0;
  rd_en1 <= 0;
  push1 <= 0;
  wr_en2 <= 0;
  rd_en2 <= 0;
  push2 <= 0;
  repeat(5) @ (posedge clock3);
  rst_ptr1 <= 0;
  rst_ptr2 <= 0;
  repeat(5) @ (posedge clock3);
  for (i = 0 ; i<2000 ; i=i+1) begin
    wr_en1 <= 1;
    rd_en1 <= 0;
    push <= $urandom;
    @ (posedge clock0);
    compare;
  end
  for (i = 0 ; i<500 ; i=i+1) begin
    wr_en1 <= 0;
    rd_en1 <= 1;
    push <= $urandom;
    @ (posedge clock1);
    compare;
  end
   for (i = 0 ; i<2000 ; i=i+1) begin
    wr_en2 <= 1;
    rd_en2 <= 0;
    push <= $urandom;
    @ (posedge clock2);
    compare;
  end
  for (i = 0 ; i<500 ; i=i+1) begin
    wr_en2 <= 0;
    rd_en2 <= 1;
    push <= $urandom;
    @ (posedge clock3);
    compare;
  end
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

wire [8:0] open_wire1, open_wire2;
 RS_TDP36K  #(.MODE_BITS(81'h09248800ffc4924400ffd))
  inst1(
    .ADDR_A1(0),
    .ADDR_A2(0),
    .ADDR_B1(0),
    .ADDR_B2(0),
    .BE_A1(0),
    .BE_A2(0),
    .BE_B1(0),
    .BE_B2(0),
    .CLK_A1(clock0),
    .CLK_A2(clock2),
    .CLK_B1(clock1),
    .CLK_B2(clock3),
    .FLUSH1(rst_ptr1),
    .FLUSH2(rst_ptr2),
    .RDATA_A1({empty_expected1,almost_empty_expected1,prog_empty_expected1,underflow_expected1,full_expected1,almost_full_expected1,prog_full_expected1,overflow_expected1}),
    .RDATA_A2({empty_expected2,almost_empty_expected2,prog_empty_expected2,underflow_expected2,full_expected2,almost_full_expected2,prog_full_expected2,overflow_expected2}),
    .RDATA_B1({open_wire1[8],pop_expected1[8],open_wire1[7:0],pop_expected1[7:0]}),
    .RDATA_B2({open_wire2[8],pop_expected2[8],open_wire2[7:0],pop_expected2[7:0]}),
    .REN_A1(0),
    .REN_A2(0),
    .REN_B1(re1),
    .REN_B2(re2),
    .WDATA_A1({1'b0,din1[8],8'b0,din1[7:0]}),
    .WDATA_A2({1'b0,din2[8],8'b0,din2[7:0]}),
    .WDATA_B1(0),
    .WDATA_B2(0),
    .WEN_A1(we1),
    .WEN_A2(we2),
    .WEN_B1(0),
    .WEN_B2(0)
  );
task compare;
 	
  	if(pop1 !== pop_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", pop_expected1, pop1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", pop_expected1 ,pop1, $time);


    if(full1 !== full_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", full_expected1, full1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", full_expected1 ,full1, $time);

    if(empty1 !== empty_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", empty_expected1, empty1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", empty_expected1 ,empty1, $time);


    if(almost_empty1 !== almost_empty_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_empty_expected1, almost_empty1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_empty_expected1 ,almost_empty1, $time);

    if(almost_full1 !== almost_full_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_full_expected1, almost_full1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_full_expected1 ,almost_full1, $time);


    if(prog_empty1 !== prog_empty_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_empty_expected1, prog_empty1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_empty_expected1 ,prog_empty1, $time);
  
   if(prog_full1 !== prog_full_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_full_expected1, prog_full1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_full_expected1 ,prog_full1, $time);

  if(overflow1 !== overflow_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", overflow_expected1, overflow1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", overflow_expected1 ,overflow1, $time);

  if(underflow1 !== underflow_expected1) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", underflow_expected1, underflow1, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", underflow_expected1 ,underflow1, $time);
    if(pop2 !== pop_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", pop_expected2, pop2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", pop_expected2 ,pop2, $time);


    if(full2 !== full_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", full_expected2, full2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", full_expected2 ,full2, $time);

    if(empty2 !== empty_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", empty_expected2, empty2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", empty_expected2 ,empty2, $time);


    if(almost_empty2 !== almost_empty_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_empty_expected2, almost_empty2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_empty_expected2 ,almost_empty2, $time);

    if(almost_full2 !== almost_full_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_full_expected2, almost_full2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", almost_full_expected2 ,almost_full2, $time);


    if(prog_empty2 !== prog_empty_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_empty_expected2, prog_empty2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_empty_expected2 ,prog_empty2, $time);
  
   if(prog_full2 !== prog_full_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_full_expected2, prog_full2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", prog_full_expected2 ,prog_full2, $time);

  if(overflow2 !== overflow_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", overflow_expected2, overflow2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", overflow_expected2 ,overflow2, $time);

  if(underflow2 !== underflow_expected2) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", underflow_expected2, underflow2, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", underflow_expected2 ,underflow2, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
