`include "../clb_defines.v"
`include "../up_down_counter.v"

module up_down_counter_tb;

  reg  clock0;
  reg  reset;
  reg  dir;
//   wire  load;
//   reg wire [`COUNTER_WIDTH - 1:0] counter_input;
  wire [`COUNTER_WIDTH - 1:0] counter_output;

  reg[31:0] error=0;

  up_down_counter  up_down_counter_inst (
    .clock0(clock0),
    .reset(reset),
    .dir(dir),
    // .load(load),
    // .counter_input(counter_input),
    .counter_output(counter_output)
  );

  always #5  clock0 = !clock0;

  initial begin
    clock0=0;
    reset=0;
    dir =0;

    #50;
    @(negedge clock0);
    $display("Counter reset asserted for 1ns!");
    reset = 1;
    #1 reset = 0;
    if(counter_output !== {`COUNTER_WIDTH{1'b0}})begin
        error+=1;
        $display("Asynchronous reset Failed!");
    end else begin
        $display("Counter reset deasserted successfully!");
    end

  // Testing counter
  $display("Testing counter in <up> mode!");
  dir = 0;
  for (int test_cycles = 0; test_cycles < 50; test_cycles+=1)begin
    @(posedge clock0);
    #1;
    if(counter_output !== test_cycles+1)begin
        error+=1;
        $display("Test %d Failed: Expected %h but counter output %h",test_cycles,test_cycles+1,counter_output);
    end
    else begin
      $display("Test %d Passed: Expected %h but counter output %h",test_cycles,test_cycles+1,counter_output);
    end
  end

  $display("Counter reset asserted for 1ns!");
  reset = 1;
  #1 reset = 0; 
  if(counter_output !== {`COUNTER_WIDTH{1'b0}})begin
      error+=1;
      $display("Asynchronous reset Failed!");
  end else begin
      $display("Counter reset deasserted successfully!");
  end

  $display("Testing counter in <down> mode!");
  dir = 1;
  for (int test_cycles = 0; test_cycles < 50; test_cycles+=1)begin
    @(posedge clock0);
    #1;
    if(counter_output !== (0 - test_cycles-1))begin
        error+=1;
        $display("Test %d Failed: Expected %h but counter output %h",test_cycles,(0 - test_cycles-1),counter_output);
    end
    else begin
      $display("Test %d Passed: Expected %h but counter output %h",test_cycles,(0 - test_cycles-1),counter_output);
    end
  end

  #10;
  $finish;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
end
endmodule 
