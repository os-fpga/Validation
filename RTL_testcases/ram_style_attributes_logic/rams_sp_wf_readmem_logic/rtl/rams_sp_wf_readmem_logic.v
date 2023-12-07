
module rams_sp_wf_readmem_logic (clk, we, addr, di, dout);
input clk;
input we;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];
reg [15:0] dout;

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
        else
            dout <= RAM[addr];
    end
endmodule
