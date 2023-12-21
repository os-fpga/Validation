
module rams_sp_reg_addr_512x16_block (clk, we, addr, di, dout);
input clk;
input we;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

reg [8:0] addr_reg;
(* ram_style = "block" *)
reg [15:0] RAM [511:0];
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