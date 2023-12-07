module ram_simple_dp_async_read_32768x4 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [14:0] read_addr, write_addr;
    input [3:0] din;
    output [3:0] dout;
    
    reg [3:0] ram [32767:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule