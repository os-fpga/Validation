module ram_simple_dp_reg_addr_512x32_block (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [8:0] read_addr, write_addr;
    input [31:0] din;
    output [31:0] dout;
    
    reg [8:0] read_addr_reg;
    (* ram_style = "block" *)
    reg [31:0] ram [511:0];

    always @(posedge clk)
    begin
        if (we) begin
            ram[write_addr] <= din;
            read_addr_reg <= read_addr;
        end
    end

    assign dout = ram[read_addr_reg];

endmodule