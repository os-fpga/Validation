
module rams_sp_reg_addr_1024x128 (clk, we, addr, di, dout);
input clk;
input we;
input [9:0] addr;
input [127:0] di;
output [127:0] dout;

reg [9:0] addr_reg=0;
reg [127:0] RAM [1023:0];
// reg [31:0] dout;

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
            addr_reg <= addr;
        end
    end


assign dout = RAM[addr_reg]; // read with registered addr
endmodule