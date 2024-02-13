`timescale 1ns / 1ps

module down_counter_32bit_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds
    
    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire [31:0] count;
    
    // Instantiate the down_counter module
    down_counter_32bit dut (
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
        $monitor("Time=%0t, Count=%h", $time, count);
        
        // Simulate for 40 clock cycles
        #40;
        
        // End simulation
        $stop;
    end

endmodule
 
