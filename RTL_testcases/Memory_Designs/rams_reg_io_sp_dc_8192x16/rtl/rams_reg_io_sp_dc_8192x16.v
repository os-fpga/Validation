 
module rams_reg_io_sp_dc_8192x16 (clkA, clkB, we, addr, di, dout);
input clkA;
input clkB;
input we;
input [12:0] addr;
input [15:0] di;
output [15:0] dout;

reg [12:0] addr_reg;
reg [15:0] RAM [8191:0];
reg [15:0] dout;

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
