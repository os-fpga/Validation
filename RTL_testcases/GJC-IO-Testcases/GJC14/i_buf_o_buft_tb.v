`timescale 1ns/1ps

module i_buf_o_buft_tb;

    reg data_i;
    reg ctrl_T;
    reg  data_o;

    integer i;

    i_buf_o_buft dut (data_i,ctrl_T,data_o);

    initial begin
        for(i = 0; i < 10; i = i + 1)begin
            data_i = $random;
            ctrl_T = $random;
            #100;
            if(ctrl_T === 0)begin
                if(data_o !== ~data_i)$display("Test %0d Mismatch ctrl_T (%b)",i,ctrl_T);
            end else begin
                if(data_o !== 1'bz)$display("Test %0d Mismatch ctrl_T (%b)",i,ctrl_T);
            end
        end       

        $finish;
    end


endmodule