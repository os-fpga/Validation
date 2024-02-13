`include "../../rtl/up_counter_32bit.v"

`timescale 1ns / 1ps

module up_counter_32bit_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds
    
    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire [63:0] count;
    
    // Instantiate the counter32 module
    up_counter_32bit dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;
    
    // Initial stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        
        // Reset for a few clock cycles
        #20 rst = 1;
        #20 rst = 0;
        
        // Monitor the count value
        $monitor("Time=%0t, Count=%d", $time, count);
        
        // Simulate for 100 clock cycles
        #18446744073709551616;
        
        // End simulation
        $finish;
    end

    initial begin
      $dumpfile("tb.vcd");
      $dumpvars;
    end

endmodule
