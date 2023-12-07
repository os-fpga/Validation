
module rams_sp_wf_512x7_block (clk, we, addr, di, dout);
input clk;
input we;
input [8:0] addr;
input [6:0] di;
output [6:0] dout;

(* ram_style = "block" *)
reg [6:0] RAM [511:0];
reg [6:0] dout;



always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
            dout <= di;
        end
        else
            dout <= RAM[addr];
    end
endmodule
