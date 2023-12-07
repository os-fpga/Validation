
module rams_sp_re_we_rf_init_1024x32 (clk, we, re, addr, di, dout);
input clk;
input we, re;
input [9:0] addr;
input [31:0] di;
output reg [31:0] dout=0;

// initial dout = 'h1234;


reg [31:0] RAM [1023:0];
// reg [31:0] dout;
initial begin
    $readmemh("mem.init", RAM);
end

always @(posedge clk)
    begin
        if (we)
            RAM[addr] <= di;
        if (re)
            dout <= RAM[addr];
    end

endmodule