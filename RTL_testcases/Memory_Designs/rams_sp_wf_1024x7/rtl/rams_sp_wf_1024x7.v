
module rams_sp_wf_1024x7 (clk, we, addr, di, dout);
input clk;
input we;
input [9:0] addr;
input [6:0] di;
output [6:0] dout;

reg [6:0] RAM [1023:0];
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
