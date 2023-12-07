module ram_simple_dp_synch_undefined_collision_512x16_block (clk, we,re, read_addr, write_addr, din, dout);
    input clk, we, re;
    input [8:0] read_addr, write_addr;
    input [15:0] din;
    output reg [15:0] dout;
    
    (* ram_style = "block" *) 
    reg [15:0] ram [511:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
        if (re) begin
            dout <= ram[read_addr];
            if (we && read_addr == write_addr)
                dout <= 'bx;
        end
    end

endmodule