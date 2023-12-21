module ram_simple_dp_async_read_131072x1 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [16:0] read_addr, write_addr;
    input din;
    output dout;
    
    reg ram [131071:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr];

endmodule