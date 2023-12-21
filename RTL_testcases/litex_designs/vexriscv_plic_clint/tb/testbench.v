`timescale 1ns/1ps 

module Tb;
    reg   clock;
    reg   reset;
    initial begin
        reset = 1'b1;
        clock = 1'b0;
        #5;
        reset = 1'b0;
    end
    always  #(2.5)     clock = !clock;

        initial begin
            $dumpfile("tb.vcd");
            $dumpvars;
            #40000;
            $display("SoC Simulation Completed");
            $finish;
        end
    vex_soc soc(.clock(clock),
                .reset(reset));
endmodule