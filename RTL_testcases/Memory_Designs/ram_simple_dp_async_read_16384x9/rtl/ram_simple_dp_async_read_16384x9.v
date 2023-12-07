module ram_simple_dp_async_read_16384x9 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [13:0] read_addr, write_addr;
    input [8:0] din;
    output [8:0] dout;
    
    reg [8:0] ram [16383:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule