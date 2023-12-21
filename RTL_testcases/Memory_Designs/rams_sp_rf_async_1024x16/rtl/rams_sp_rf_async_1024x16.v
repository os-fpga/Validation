module rams_sp_rf_async_1024x16 (clk, we, addr, di, dout);
input clk;
input we;
input [9:0] addr;
input [15:0] di;
output [15:0] dout;

reg [15:0] RAM [1023:0];

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
        end
    end

assign dout = RAM[addr];
endmodule
