
module rams_sp_rf_sync_256x8_logic (clk, we, addr, di, dout);
input clk;
input we;
input [7:0] addr;
input [7:0] di;
output [7:0] dout;

(* ram_style = "logic" *)
reg [7:0] RAM [255:0];
reg [7:0] dout;

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
        end
            dout <= RAM[addr];
    end
endmodule