
module rams_sp_wf_rst_en_512x16_logic (clk, we, en, rst, addr, di, dout);
input clk;
input we;
input en;
input rst;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];
reg [15:0] dout;

always @(posedge clk)
    begin
        if(en) begin
            if (rst)
                dout <= 0;
            else if (we)
            begin
                RAM[addr] <= di;
                dout <= di;
            end
            else
                dout <= RAM[addr];
        end
    end
endmodule
