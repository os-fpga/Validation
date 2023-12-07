 
 
module co_sim_O_DELAY_primitive_inst;
  reg I; // Data Input (Connect to input port or buffer)
  reg DLY_LOAD; // Delay load input
  reg DLY_ADJ; // Delay adjust input
  reg DLY_INCDEC; // Delay increment / decrement input
  wire [5:0] DLY_TAP_VALUE; // Delay tap value output
  reg CLK_IN; // Clock input
  wire O; // Data output

  reg expected_data_output, expected_tap_delay;
O_DELAY_primitive_inst DUT (.*);

integer mismatch=0,i;
always #10 CLK_IN = ~CLK_IN;
initial begin
  CLK_IN = 0;
  for (i=0; i<16; i=i+1) begin
    {I, DLY_LOAD , DLY_ADJ, DLY_INCDEC} = i;
    @(negedge CLK_IN);
    compare;
  end
  
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

///model////
// Adding local variable for delay load
reg dly_ld_0, dly_ld_1;
wire dly_ld_p;

// Adding local variable for delay adjust
reg dly_adj_0, dly_adj_1;
wire dly_adj_p;

// reg counter;
reg [5:0] dly_tap_val = 0;
  
always_ff @(posedge CLK_IN) 
begin
	dly_ld_0 <= DLY_LOAD;
	dly_ld_1 <= dly_ld_0;
	
	dly_adj_0 <= DLY_ADJ;
	dly_adj_1 <= dly_adj_0;
end

// Detecting 0 to 1 transition
assign dly_ld_p = dly_ld_0 && !dly_ld_1;
assign dly_adj_p = dly_adj_0 && !dly_adj_1;

always_ff @(posedge CLK_IN) 
begin
	if (dly_ld_p)
		dly_tap_val <= DELAY;
	else if (dly_adj_p && DLY_INCDEC && dly_tap_val!=63) 
		dly_tap_val <= dly_tap_val + 1;
	else if (dly_adj_p && !DLY_INCDEC && dly_tap_val!=0) 
		dly_tap_val <= dly_tap_val - 1;
end

assign expected_tap_delay = dly_tap_val;
assign #(30.0 + (21.56*dly_tap_val)) expected_data_output = I;			// Adjusted Delay for TT corner

task compare;
 	
  if(O !== expected_data_output) begin
    $display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output, O, $time);
    mismatch = mismatch+1;
  end
  else
    $display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_data_output ,O, $time);

  if(DLY_TAP_VALUE !== expected_tap_delay) begin
    $display("Data Mismatch. Expected : %0b, Actual: %0b, Time: %0t", expected_tap_delay, DLY_TAP_VALUE, $time);
    mismatch = mismatch+1;
  end
  else
    $display("Data Matched. Expected : %0b, Actual: %0b, Time: %0t", expected_tap_delay ,DLY_TAP_VALUE, $time);

endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
