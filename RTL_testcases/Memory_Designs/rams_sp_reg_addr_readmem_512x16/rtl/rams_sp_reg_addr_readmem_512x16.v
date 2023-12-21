module rams_sp_reg_addr_readmem_512x16 (clk, we, addr, di, dout);
input clk;
input we;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

// reg [9:0] addr_reg;
reg [15:0] RAM [511:0];
reg [15:0] dout=0;

initial begin
    $readmemh("mem.init", RAM);
    end

always @(posedge clk)
    begin
        if (we)
        begin
            RAM[addr] <= di;
            dout <= di;
        end
        else dout <= RAM[addr];
    end
endmodule