
module rams_reg_io_sp_dc_512x16_logic (clkA, clkB, we, addr, di, dout);
input clkA;
input clkB;
input we;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

reg [8:0] addr_reg;
(* ram_style = "logic" *)
reg [15:0] RAM [511:0];
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
