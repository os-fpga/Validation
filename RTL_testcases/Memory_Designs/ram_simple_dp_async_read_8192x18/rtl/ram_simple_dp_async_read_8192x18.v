module ram_simple_dp_async_read_8192x18 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [12:0] read_addr, write_addr;
    input [17:0] din;
    output [17:0] dout;
    
    reg [17:0] ram [8191:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule