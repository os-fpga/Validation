`timescale 1ns/1ps
module tb;

reg  reset; // asynchronous active high
reg  enable_n; // active low enable
bit  data_i;
reg [2:0] data_o;
reg ready;
reg  bitslip_ctrl_n;
bit test_data;
bit act_data;
integer i;

i_buf_i_delay_i_serdes_x3_dpa dut (
    reset, // asynchronous active high
    enable_n, // active low enable
    data_i,
    bitslip_ctrl_n,
    data_o,
    ready
);

initial begin
    test_data = 0;
    forever begin
        #1ns test_data = ~test_data;
    end
end

initial begin
    act_data = 0;
    forever begin
        #3ns act_data = ~act_data;
    end
end

assign data_i = ready? act_data : test_data;


initial begin
    $display("start %d",$time);
    reset = 1;
    enable_n = 1;
    bitslip_ctrl_n = 1;
    #1000;
    reset = 0;
    enable_n = 0;
    @(posedge ready);
    for(i = 0; i < 100; i = i + 1)begin
        @(data_o);
        if(data_o == 3'hf || data_o == 3'h0)begin
            bitslip_ctrl_n = 1;
        end else bitslip_ctrl_n = 0;
    end
    $finish;
end

initial begin
    #5000;
    $finish;
end


initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);
end

endmodule