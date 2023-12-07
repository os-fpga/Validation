
module rams_sp_rf_rst_async_1024x16 (clk, we, rst, addr, di, dout);
input clk;
input we;
input rst;
input [9:0] addr;
input [15:0] di;
output [15:0] dout;

reg [15:0] RAM [1023:0];

always @(posedge clk)
    begin
        if (we)
            RAM[addr] <= di;
    end
assign dout = rst ? 0 :RAM[addr];
endmodule