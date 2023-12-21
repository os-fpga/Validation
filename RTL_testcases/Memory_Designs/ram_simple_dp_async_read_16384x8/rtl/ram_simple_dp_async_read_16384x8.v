module ram_simple_dp_async_read_16384x8 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [13:0] read_addr, write_addr;
    input [7:0] din;
    output [7:0] dout;
    
    reg [7:0] ram [16383:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule