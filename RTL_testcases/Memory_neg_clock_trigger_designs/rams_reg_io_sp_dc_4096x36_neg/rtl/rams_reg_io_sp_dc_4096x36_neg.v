
module rams_reg_io_sp_dc_4096x36_neg (clkA, clkB, we, addr, di, dout);
input clkA;
input clkB;
input we;
input [11:0] addr;
input [35:0] di;
output [35:0] dout;

reg [11:0] addr_reg;
reg [35:0] RAM [4095:0];
reg [35:0] dout;

always @(negedge clkA)
    begin
        if (we)
        begin
            RAM[addr] <= di;
            addr_reg <= addr;
        end
    end

always @ (negedge clkB) 
    begin
        dout <= RAM[addr_reg]; 
    end
endmodule
