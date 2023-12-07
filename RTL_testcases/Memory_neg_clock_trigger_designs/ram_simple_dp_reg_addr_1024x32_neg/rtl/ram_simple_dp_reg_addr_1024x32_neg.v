module ram_simple_dp_reg_addr_1024x32_neg (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [9:0] read_addr, write_addr;
    input [31:0] din;
    output [31:0] dout;
    
    reg [9:0] read_addr_reg;
    reg [31:0] ram [1023:0];

    always @(negedge clk)
    begin
        if (we) begin
            ram[write_addr] <= din;
            read_addr_reg <= read_addr;
        end
    end

    assign dout = ram[read_addr_reg];

endmodule