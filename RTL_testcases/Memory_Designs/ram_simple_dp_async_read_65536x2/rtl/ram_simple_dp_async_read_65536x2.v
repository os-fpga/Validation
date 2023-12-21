module ram_simple_dp_async_read_65536x2 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [15:0] read_addr, write_addr;
    input [1:0] din;
    output [1:0] dout;
    
    reg [1:0] ram [65535:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule