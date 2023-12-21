
module rams_sp_re_we_asynch_rst_1024x32_neg (clk, rst, we, re, addr, di, dout);
input clk, rst;
input we, re;
input [9:0] addr;
input [31:0] di;
output reg [31:0] dout;

reg [31:0] RAM [1023:0];
// reg [31:0] dout;


always @(negedge clk)
    begin
        if (we)
            RAM[addr] <= di;
    end

always @(negedge clk, posedge rst)
    begin
        if (rst)
            dout <= 0;
        else if (re)
            dout <= RAM[addr];
    end

endmodule