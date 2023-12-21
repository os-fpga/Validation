
module rams_sp_re_we_rf_init_512x16_logic (clk, we, re, addr, di, dout);
input clk;
input we, re;
input [8:0] addr;
input [15:0] di;
output reg [15:0] dout;

(* ram_style = "logic" *)
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