module ram_simple_dp_async_reg_read_512x16_logic (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [8:0] read_addr, write_addr;
    input [15:0] din;
    output [15:0] dout;
    
    (* ram_style = "logic" *)
    reg [15:0] ram [511:0];
    reg [8:0] read_addr_reg;

    always @(posedge clk)
    begin
        read_addr_reg <= read_addr;
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr_reg];

endmodule