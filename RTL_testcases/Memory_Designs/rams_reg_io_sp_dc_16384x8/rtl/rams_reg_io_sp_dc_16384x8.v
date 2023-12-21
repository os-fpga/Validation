
module rams_reg_io_sp_dc_16384x8 (clkA, clkB, we, addr, di, dout);
input clkA;
input clkB;
input we;
input [13:0] addr;
input [7:0] di;
output [7:0] dout;

reg [13:0] addr_reg;
reg [7:0] RAM [16383:0];
reg [7:0] dout;

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
