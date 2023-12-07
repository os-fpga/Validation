
module rams_sp_rf_rst_async_512x16_logic (clk, we, rst, addr, di, dout);
input clk;
input we;
input rst;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];

always @(posedge clk)
    begin
        if (we)
            RAM[addr] <= di;
    end
assign dout = rst ? 0 :RAM[addr];
endmodule