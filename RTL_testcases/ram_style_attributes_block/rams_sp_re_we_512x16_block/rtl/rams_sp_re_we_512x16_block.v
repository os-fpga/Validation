
module rams_sp_re_we_512x16_block (clk, we, re, addr, di, dout);
input clk;
input we, re;
input [8:0] addr;
input [15:0] di;
output reg [15:0] dout=0;

(* ram_style = "block" *)
reg [15:0] RAM [511:0];
// reg [31:0] dout;

always @(posedge clk)
    begin
        if (we)
            RAM[addr] <= di;
        else if (re)
            dout <= RAM[addr];
    end

endmodule