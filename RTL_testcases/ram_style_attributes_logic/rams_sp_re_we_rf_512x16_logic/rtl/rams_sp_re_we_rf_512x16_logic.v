
module rams_sp_re_we_rf_512x16_logic (clk, we, re, addr, di, dout);
input clk;
input we, re;
input [8:0] addr;
input [15:0] di;
output reg [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];
// reg [31:0] dout;

always @(posedge clk)
    begin
        if (we)
            RAM[addr] <= di;
        if (re)
            dout <= RAM[addr];
    end

endmodule