 
module co_sim_dffnre_primitive_inst;
  reg D;                // Data Input
  reg R;                // Active-low, asynchronous reset
  reg E;                // Active-high E
  reg C;                // Negedge clock
  wire Q;   // Data Output

  reg expected_out;
dffnre_primitive_inst DUT (.*);

integer mismatch=0;

always #5 C = ~C;
initial begin
  C = 0;
  R = 0;
  E = 0;
  D = 0;
  repeat (5) @(posedge C);
  R = 1;
  compare;
  repeat (5) @(posedge C);
  E = 0;
  D = 1;
  compare;
  @(posedge C);
  E = 1;
  D = 1;
  compare;
  @(posedge C);
  E = 0;
  D = 1;
  compare;
  @(posedge C);
  R = 0;
  E = 1;
  D = 1;
  compare;
  repeat (5) @(posedge C);
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
  $finish;
end

  always @(negedge C, negedge R)
    if (!R)
      expected_out <= 1'b0;
    else if (E)
      expected_out <= D;

task compare;
 	
  	if(Q !== expected_out) begin
    	$display("Data Mismatch. Expected out : %0b, Netlist: %0b, Time: %0t", expected_out, Q, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected out : %0b, Netlist: %0b, Time: %0t", expected_out ,Q, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
