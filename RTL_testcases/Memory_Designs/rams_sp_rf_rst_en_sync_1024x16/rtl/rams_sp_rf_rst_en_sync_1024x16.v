
module rams_sp_rf_rst_en_sync_1024x16 (clk, we, en, rst, addr, di, dout);
input clk;
input we;
input en;
input rst;
input [9:0] addr;
input [15:0] di;
output [15:0] dout;

reg [15:0] RAM [1023:0];
reg [15:0] dout=0;

always @(posedge clk)
    begin
        if (en)
        begin
            if (rst)
                dout <= 0;
            else if (we)
                RAM[addr] <= di;
         
            dout <= RAM[addr];
        end
    end
endmodule