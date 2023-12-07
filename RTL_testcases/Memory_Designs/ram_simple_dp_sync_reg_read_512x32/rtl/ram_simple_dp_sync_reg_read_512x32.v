module ram_simple_dp_sync_reg_read_512x32 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [8:0] read_addr, write_addr;
    input [31:0] din;
    output reg [31:0] dout;
    
    reg [8:0] read_addr_reg;
    reg [31:0] ram [511:0];

    always @(posedge clk)
    begin
        if (we) begin
            ram[write_addr] <= din;
            
        end
        else begin
            read_addr_reg <= read_addr;
            dout <= ram[read_addr_reg];
        end
    end


endmodule