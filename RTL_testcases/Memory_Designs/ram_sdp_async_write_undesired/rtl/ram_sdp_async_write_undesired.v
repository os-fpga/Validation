module ram_sdp_async_write_undesired (clk, we,re, read_addr, write_addr, din, dout);
    input clk, we, re;
    input [9:0] read_addr, write_addr;
    input [31:0] din;
    output [31:0] dout;
    
    reg [31:0] ram [511:0];

    always @*
    begin
        if (we)
            ram[write_addr] = din;
    end
    assign dout = ram[read_addr];
endmodule