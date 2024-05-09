`timescale 1ns/1ps

module i_delay_o_buf_tb;

    reg clk_i;
    reg data_i;
    reg dly_incdec;
    reg dly_ld;
    reg dly_adj;
    reg  data_o_inv_delayed;
    reg  [5:0] dly_tap_val;

    wire ref_data_delayed;
    bit error;
    integer i;

    i_delay_o_buf dut (clk_i,data_i,dly_incdec,dly_ld,dly_adj,data_o_inv_delayed,dly_tap_val);

    

    assign #(30.0  + (21.56*(~dly_tap_val))) ref_data_delayed = ~data_i;

    assign error = ref_data_delayed ^ data_o_inv_delayed;


    initial begin
        $monitor("ERROR %b: Unspecified delay detected at time (%7d)",error,$time);
    end

    initial begin
        forever begin
            clk_i = 0;
            data_i = 1;
            #500;
            clk_i = 1;
            data_i = 0;
            #500;
        end
    end


    initial begin
        dly_ld  = 1;
        dly_adj = 1;
        dly_incdec = 1;
        repeat(2)@(negedge clk_i);
        dly_ld = 0;
        @(negedge clk_i);
        dly_ld = 1;

        for(i=0; i < 10; i=i+1)begin
            repeat(2)@(negedge clk_i);
            dly_adj = 0;
            dly_incdec = 0;
            repeat(2)@(negedge clk_i);
            dly_adj = 1;
            dly_incdec = 1;
        end
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,i_delay_o_buf_tb);
    end

endmodule
