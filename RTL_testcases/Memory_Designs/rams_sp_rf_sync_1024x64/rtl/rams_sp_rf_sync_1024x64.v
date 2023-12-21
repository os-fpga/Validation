
module rams_sp_rf_sync_1024x64 (clk, we, addr, di, dout);
input clk;
input we;
input [9:0] addr;
input [63:0] di;
output [63:0] dout;

reg [63:0] RAM [1023:0];
reg [63:0] dout;

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
        end
            dout <= RAM[addr];
    end
endmodule