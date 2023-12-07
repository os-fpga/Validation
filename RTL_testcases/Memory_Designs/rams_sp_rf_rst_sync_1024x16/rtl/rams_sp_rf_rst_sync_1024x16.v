
module rams_sp_rf_rst_sync_1024x16 (clk, we, rst, addr, di, dout);
input clk;
input we;
input rst;
input [9:0] addr;
input [15:0] di;
output [15:0] dout;

reg [15:0] RAM [1023:0];
reg [15:0] dout;

always @(posedge clk)
    begin
        if (rst)
            dout <= 0;
        else if (we)
            RAM[addr] <= di;
        dout <= RAM[addr];
    end
endmodule