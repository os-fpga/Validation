module ram_simple_dp_async_read_512x32 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [8:0] read_addr, write_addr;
    input [31:0] din;
    output [31:0] dout;
    
    reg [31:0] ram [511:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule