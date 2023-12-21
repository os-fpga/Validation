module ram_true_reg_addr_dp_512x64 (clk, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clk, weA, weB;
    input [8:0] addrA, addrB;
    input [63:0] dinA, dinB;
    output [63:0] doutA, doutB;
    
    reg [8:0] reg_addrA, reg_addrB;
    reg [63:0] ram [511:0];
    always @(posedge clk)
    begin
        if (weA)
            ram[addrA] <= dinA;
            reg_addrA <= addrA;
        if (weB)
            ram[addrB] <= dinB;
            reg_addrB <= addrB;
    end

    assign doutA = ram[reg_addrA];
    assign doutB = ram[reg_addrB];

endmodule