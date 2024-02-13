
module co_sim_shift_register_512bit;

  parameter CLK_PERIOD = 2;
  parameter WIDTH = 512;

  reg clk;
  reg reset;
  reg shift_in;

  wire [WIDTH-1:0] out_reg,out_reg_netlist;

  integer mismatch=0;

  shift_register_512bit golden (.clk(clk),.reset(reset),.shift_in(shift_in),.out_reg(out_reg));
  shift_register_512bit_post_synth netlist (.clk(clk),.reset(reset),.shift_in(shift_in),.out_reg(out_reg_netlist));

  always #((CLK_PERIOD/2)) clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    shift_in = 0;

    #20 reset = 0;
    display_stimulus();

    repeat(1500)@(negedge clk) begin
        shift_in = $random;
        @(negedge clk);
        display_stimulus();
        @(negedge clk);
        compare();
    end

    repeat(10)@(negedge clk);

    if(mismatch == 0)
      $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
      $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);

    $finish;
  end

  task compare();
  	if(out_reg !== out_reg_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", out_reg, out_reg_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", out_reg, out_reg_netlist, $time);
  endtask

  task display_stimulus();
  	$display ($time,," Test stimulus is: inpt=%0d", out_reg);
  endtask

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule 
