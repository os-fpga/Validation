`timescale 1ns/1ps

module clk_buf_ff_tb;



    reg  data_i;
    reg clk;
    reg  enable;
    reg data_o;

    integer i;
    reg prv;

    clk_buf_ff(data_i,clk,enable,data_o);

    initial begin
        forever begin
            clk = 0;
            #10
            clk = 1;
            #10;
        end
    end

    initial begin
        
        for(i=0; i<10; i=i+1)begin
            @(negedge clk);
            data_i = $random;
            enable = $random;
            @(negedge clk);
            if(enable) begin
                if(data_o !== data_i)$display("Mismatch Detected!");
            end
        end
    end

endmodule