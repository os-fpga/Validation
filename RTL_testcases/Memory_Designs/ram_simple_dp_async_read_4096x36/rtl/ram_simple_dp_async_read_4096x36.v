module ram_simple_dp_async_read_4096x36 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [11:0] read_addr, write_addr;
    input [35:0] din;
    output [35:0] dout;
    
    reg [35:0] ram [4095:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule