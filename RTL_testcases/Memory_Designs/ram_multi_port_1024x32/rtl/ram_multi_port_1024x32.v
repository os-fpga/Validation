module ram_multi_port_1024x32 (clk, we,  write_addr, read_addr_a, read_addr_b, read_addr_c, din, doutA, doutB, doutC);
    input clk, we;
    input [9:0] write_addr, read_addr_a, read_addr_b, read_addr_c;
    input [31:0] din;
    output [31:0] doutA, doutB, doutC;
    
    reg [31:0] mem [1023:0];
   
    always @(posedge clk) begin
        if (we)
                mem[write_addr] <= din;
    end

    assign doutA = mem[read_addr_a];
    assign doutB = mem[read_addr_b];
    assign doutC = mem[read_addr_c];

endmodule