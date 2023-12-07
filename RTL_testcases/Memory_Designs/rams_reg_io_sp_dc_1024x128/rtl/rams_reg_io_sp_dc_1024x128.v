
module rams_reg_io_sp_dc_1024x128 (clkA, clkB, we, addr, di, dout);
input clkA;
input clkB;
input we;
input [9:0] addr;
input [127:0] di;
output [127:0] dout;

reg [9:0] addr_reg;
reg [127:0] RAM [1023:0];
reg [127:0] dout;

always @(posedge clkA)
    begin
        if (we)
        begin
            RAM[addr] <= di;
            addr_reg <= addr;
        end
    end

always @ (posedge clkB) 
    begin
        dout <= RAM[addr_reg]; 
    end
endmodule
