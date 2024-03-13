
module co_sim_signed_multiply_accumulate;

  localparam  WIDTH = 8;

  reg  clk;
  reg  clear;
  reg  clken;
  reg  sload;
  reg signed [WIDTH-1:0] dataa;
  reg signed [WIDTH-1:0] datab;
  wire [2*WIDTH-1:0] adder_out,adder_out_netlist;

  // reg[31:0] error=0;
  // reg [`COUNTER_WIDTH - 1:0] test_cycles;

	integer mismatch=0;

  signed_multiply_accumulate dut (.clk(clk),.clear(clear),.clken(clken),.sload(sload),.dataa(dataa),.datab(datab),.adder_out(adder_out));
  `ifdef PNR
  signed_multiply_accumulate_post_route  netlist (.clk(clk),.clear(clear),.clken(clken),.sload(sload),.dataa(dataa),.datab(datab),.adder_out(adder_out_netlist));
  `else
    signed_multiply_accumulate_post_synth  netlist (.clk(clk),.clear(clear),.clken(clken),.sload(sload),.dataa(dataa),.datab(datab),.adder_out(adder_out_netlist));
  `endif 

  always #1 clk = ~clk;

  initial begin
    clk <= 0;
    clear <= 1;
    clken <= 0;
    sload <= 1;
    dataa <= 0;
    datab <= 0;

    // #20 reset = 1;

    repeat(10)@(negedge clk);
    clear <= 0;
    repeat(5)@(negedge clk);
    sload <= 0;
    repeat(5)@(negedge clk);
    clken <= 1;

    repeat(20)@(negedge clk);
    compare();
    @(negedge clk);
    @(negedge clk);
    compare();

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end
    #10;
    clear <= 1;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 0;
    #10;
    clken <= 1;
    #10;
    sload <= 1;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 0;
    #10;
    clken <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 1;
    #10;
    clken <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 0;
    #10;
    clken <= 1;
    #10;
    sload <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 0;
    #10;
    clken <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 1;
    #10;
    clken <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 1;
    #10;
    clken <= 1;
    #10;
    sload <= 1;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    #10;
    clear <= 0;
    #10;
    sload <= 0;

    repeat(200) @(negedge clk) begin
      dataa <= $random();
      datab <= $random();
      @(negedge clk);
      display_stimulus();
      @(negedge clk);
      compare();
    end

    if(mismatch == 0)
      $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
      $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);

    repeat(10)@(negedge clk);
    $finish;
  end

  task compare();
  	if(adder_out !== adder_out_netlist) begin
    	$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", adder_out, adder_out_netlist, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", adder_out, adder_out_netlist, $time);
  endtask

  task display_stimulus();
  	$display ($time,," Test stimulus is: dataa=%0d, datab=%0d", dataa, datab);
  endtask

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule 
