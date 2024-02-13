`timescale 1ns/1ns

`include "../../rtl/shift_register_512bit.v"

module shift_register_512bit_tb;

    parameter CLK_PERIOD = 2;
    parameter WIDTH = 1024;

    reg clk;
    reg reset;
    reg shift_in;

    wire [WIDTH-1:0] out_reg;

    shift_register_512bit dut (
        .clk(clk),
        .reset(reset),
        .shift_in(shift_in),
        .out_reg(out_reg)
    );

    always #((CLK_PERIOD/2)) clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        shift_in = 0;
        
        #20 reset = 0;
        $display ($time,," Test stimulus is: shift_in=%0b", shift_in);
        
        repeat(1500)@(negedge clk) begin
            shift_in = $random;
            $display ($time,," Test stimulus is: shift_in=%0b", shift_in);
            $display ($time,," Test stimulus is: out_reg=%0b", out_reg);
        end

        $finish;
    end

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars;
    end

endmodule
