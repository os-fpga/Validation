`include "clb_defines.v"

module up_down_counter_tb;

  // Parameters

  //Ports
  reg  clock0;
  reg  reset;
  reg  dir;
  bit  load;
  bit [`COUNTER_WIDTH - 1:0] counter_input;
  wire [32-1:0] counter_output;

  reg[31:0] error=0;

  up_down_counter  up_down_counter_inst (
    clock0,
    reset,
    dir,
    load,
    counter_input[0] ,
counter_input[1] ,
counter_input[2] ,
counter_input[3] ,
counter_input[4] ,
counter_input[5] ,
counter_input[6] ,
counter_input[7] ,
counter_input[8] ,
counter_input[9] ,
counter_input[10] ,
counter_input[11] ,
counter_input[12] ,
counter_input[13] ,
counter_input[14] ,
counter_input[15] ,
counter_input[16] ,
counter_input[17] ,
counter_input[18] ,
counter_input[19] ,
counter_input[20] ,
counter_input[21] ,
counter_input[22] ,
counter_input[23] ,
counter_input[24] ,
counter_input[25] ,
counter_input[26] ,
counter_input[27] ,
counter_input[28] ,
counter_input[29] ,
counter_input[30] ,
counter_input[31] ,
counter_input[32] ,
counter_input[33] ,
counter_input[34] ,
counter_input[35] ,
counter_input[36] ,
counter_input[37] ,
counter_input[38] ,
counter_input[39] ,
counter_input[40] ,
counter_input[41] ,
counter_input[42] ,
counter_input[43] ,
counter_input[44] ,
counter_input[45] ,
counter_input[46] ,
counter_input[47] ,
counter_output[0] ,
counter_output[1] ,
counter_output[2] ,
counter_output[3] ,
counter_output[4] ,
counter_output[5] ,
counter_output[6] ,
counter_output[7] ,
counter_output[8] ,
counter_output[9] ,
counter_output[10] ,
counter_output[11] ,
counter_output[12] ,
counter_output[13] ,
counter_output[14] ,
counter_output[15] ,
counter_output[16] ,
counter_output[17] ,
counter_output[18] ,
counter_output[19] ,
counter_output[20] ,
counter_output[21] ,
counter_output[22] ,
counter_output[23] ,
counter_output[24] ,
counter_output[25] ,
counter_output[26] ,
counter_output[27] ,
counter_output[28] ,
counter_output[29] ,
counter_output[30] ,
counter_output[31] 
// counter_output[32] ,
// counter_output[33] ,
// counter_output[34] ,
// counter_output[35] ,
// counter_output[36] ,
// counter_output[37] ,
// counter_output[38] ,
// counter_output[39] ,
// counter_output[40] ,
// counter_output[41] ,
// counter_output[42] ,
// counter_output[43] ,
// counter_output[44] ,
// counter_output[45] ,
// counter_output[46] ,
// counter_output[47] 
  );

  always #5  clock0 = !clock0;

  initial begin
    clock0=0;
    reset=0;
    dir =0;
    // load=0;
    // counter_input=0;

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
  // @(posedge clock0);
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
