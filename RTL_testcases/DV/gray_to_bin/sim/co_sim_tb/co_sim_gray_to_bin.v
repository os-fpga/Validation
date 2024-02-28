
module co_sim_gray_to_bin;

  parameter WIDTH = 32;

  reg [WIDTH - 1:0] gray;
  wire [WIDTH - 1:0] binary, binary_netlist;
  // reg clk;

  integer mismatch=0;

  gray_to_bin golden (.gray(gray),.binary(binary));
  `ifdef PNR
  `else
    gray_to_bin_post_synth netlist (.gray(gray),.binary(binary_netlist));
  `endif 
  // always #1 clk = ~clk;

  initial begin
    gray = 0;

    display_stimulus();

    // repeat(50)@(negedge clk) begin
    repeat (1000) begin
      gray = $urandom( );
      // B = $urandom( );
      #10;
      display_stimulus();
      compare();
      #10;
    end

    // repeat(10)@(negedge clk);

    if(mismatch == 0)
      $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
      $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);

    $finish;
  end

  task compare();
  	if(binary !== binary_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", binary, binary_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", binary, binary_netlist, $time);
  endtask

  task display_stimulus();
  	$display ($time,," Test stimulus is: inpt=%0d", binary);
  endtask

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule 
