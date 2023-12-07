
module rams_sp_reg_addr_2048x18 (clk, we, addr, di, dout);
input clk;
input we;
input [10:0] addr;
input [17:0] di;
output [17:0] dout;

reg [10:0] addr_reg=0;
reg [17:0] RAM [2047:0];
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