
module rams_sp_wf_4x2 (clk, we, addr, di, dout);
input clk;
input we;
input [1:0] addr;
input [1:0] di;
output [1:0] dout;

reg [1:0] RAM [3:0];
reg [1:0] dout;



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
