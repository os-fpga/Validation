`timescale 1ns/1ps

module i_buf_o_buft_tb;

    reg data_i;
    reg ctrl_T;
    reg  data_o_P;
    reg  data_o_N;


    integer i;

    i_buf_o_buft_ds dut (data_i,ctrl_T,data_o_P,data_o_N);

    initial begin
        for(i = 0; i < 10; i = i + 1)begin
            data_i = $random;
            ctrl_T = $random;
            #100;
            if(ctrl_T === 0)begin
                if(data_o_P !== ~data_i && data_o_N !== data_i)$display("Test %0d Mismatch",i);
            end else begin
                if(data_o_P !== 1'bz && data_o_N !== 1'bz)$display("Test %0d Mismatch",i);
            end
        end       

        $finish;
    end


endmodule