
module rams_sp_re_we_rf_init_512x16_block (clk, we, re, addr, di, dout);
input clk;
input we, re;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

reg [15:0] dout=0;
(* ram_style = "block" *)
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