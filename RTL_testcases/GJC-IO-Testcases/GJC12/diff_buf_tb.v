`timescale 1ns/1ps


module diff_buf_tb;

    reg in_P;
    reg in_N;
    reg out_P;
    reg out_N;

    integer i;

    diff_buf dut (in_P,in_N,out_P,out_N);

    initial begin
        for(i = 0; i < 10; i = i + 1)begin
            in_P = i[0];
            in_N = ~i[0];
            #100;
            if(out_P !== ~in_P)$display("Test %2d: in_P (%0d) not equal to out_P (%0d)",i,in_P,out_P);
            if(out_N !== ~in_N)$display("Test %2d: in_N (%0d) not equal to out_N (%0d)",i,in_N,out_N);
            #100;
        end
        $finish;
    end

endmodule