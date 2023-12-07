module ram_simple_dp_async_read_8192x16 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [12:0] read_addr, write_addr;
    input [15:0] din;
    output [15:0] dout;
    
    reg [15:0] ram [8191:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule