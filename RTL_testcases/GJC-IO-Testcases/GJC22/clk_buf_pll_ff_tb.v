`timescale 1ns/1ps

module clk_buf_ff_tb;



    reg  data_i;
    reg clk;
    reg  enable;
    reg data_o;
    reg pll_clk_in;

    integer i;
    reg prv;

    clk_buf_pll_ff dut(data_i,pll_clk_in,enable,data_o);

    initial begin
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5;
        end
    end

    initial begin
        forever begin
            pll_clk_in = 1;
            #10
            pll_clk_in = 0;
            #10;
        end
    end

    initial begin
        repeat(500)@(negedge clk);
        for(i=0; i<10; i=i+1)begin
            @(negedge clk);
            data_i = $random;
            enable = $random;
            @(negedge clk);
            if(enable) begin
                if(data_o !== data_i)$display("Mismatch Detected!");
            end
        end
        $finish;
    end

endmodule