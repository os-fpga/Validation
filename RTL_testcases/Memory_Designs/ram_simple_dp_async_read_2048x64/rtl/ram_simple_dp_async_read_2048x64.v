module ram_simple_dp_async_read_2048x64 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [10:0] read_addr, write_addr;
    input [63:0] din;
    output [63:0] dout;
    
    reg [63:0] ram [2047:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule