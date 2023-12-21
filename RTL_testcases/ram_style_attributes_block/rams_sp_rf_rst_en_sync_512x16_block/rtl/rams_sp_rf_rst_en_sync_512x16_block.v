
module rams_sp_rf_rst_en_sync_512x16_block (clk, we, en, rst, addr, di, dout);
input clk;
input we;
input en;
input rst;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "block" *)
reg [15:0] RAM [511:0];
reg [15:0] dout;

always @(posedge clk)
    begin
        if (en)
        begin
            if (rst)
                dout <= 0;
            else if (we)
                RAM[addr] <= di;
         
            dout <= RAM[addr];
        end
    end
endmodule