`include "../gray_to_bin.v"

`define DATA_WIDTH 32

module gray_to_bin_tb;

  // Parameters

  //Ports
  reg [`DATA_WIDTH - 1:0] gray;
  wire [`DATA_WIDTH - 1:0] binary;
  reg  [`DATA_WIDTH - 1:0] expected_val;

  reg [31:0] error=0;

  gray_to_bin  gray_to_bin_inst (
    .gray(gray),
    .binary(binary)
  );

  // always #5  clk = ! clk ;

  initial begin
  for(int test_cycle = 0; test_cycle < 200; test_cycle+=1)begin
      gray = {$urandom,$urandom,$urandom,$urandom,$urandom,$urandom,$urandom}[`DATA_WIDTH-1:0];
      for(int i = 0; i < `DATA_WIDTH; i=i+1)begin
          expected_val[i] = ^(gray >> i);
      end
      #10;
      if(binary !== expected_val)begin
          $display("Error: Output %h but expected %h",binary,expected_val);
          error+=1;
      end
      else begin
        $display("Test Passed: Output %h but expected %h",binary,expected_val);
      end
      end
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end
endmodule 
