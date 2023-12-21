
module rams_sp_rf_rst_en_async_512x16_logic (clk, we, en, rst, addr, di, dout);
input clk;
input we;
input en;
input rst;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];

always @(posedge clk)
    begin
        if (en)
        begin
            if (we)
                RAM[addr] <= di;
        end
    end

assign dout = rst ? 0 : RAM[addr];
endmodule