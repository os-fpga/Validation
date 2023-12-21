module rams_sp_rf_async_512x16_block (clk, we, addr, di, dout);
input clk;
input we;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "block" *)
reg [15:0] RAM [511:0];

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
        end
    end

assign dout = RAM[addr];
endmodule
