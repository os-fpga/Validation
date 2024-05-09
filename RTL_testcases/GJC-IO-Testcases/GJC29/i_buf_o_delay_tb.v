`timescale 1ns/1ps

module i_buf_o_delay_tb;

    // reg data_i;
    reg dly_ld;
    reg dly_adj;
    reg dly_incdec;
    reg clk_i;
    wire data_o_delayed;
    wire data_o_ref;

    reg [5:0] dly_val;
    reg ref_data_delayed;
    bit error;

    integer i;

    i_buf_o_delay dut (clk_i,dly_incdec,dly_ld,dly_adj,data_o_delayed,data_o_ref,dly_val);
    
    // i_buf_o_delay dut(data_i,dly_ld,dly_adj,dly_incdec,clk_i,data_o_delayed,data_o_ref,dly_val);

    assign #(30.0  + (21.56*(~dly_val))) ref_data_delayed = data_o_ref;

    assign error = ref_data_delayed ^ data_o_delayed;


    initial begin
        $monitor("ERROR %b: Unspecified delay detected at time (%7d)",error,$time);
    end
    initial begin
        forever begin
            clk_i = 0;
            #500;
            clk_i = 1;
            #500;
        end
    end


    initial begin
        // data_i  = 0;
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

endmodule
