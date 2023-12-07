module ram_true_dp_dc_65536x2 (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [15:0] addrA, addrB;
    input [1:0] dinA, dinB;
    output reg [1:0] doutA, doutB;
    
    reg [1:0] ram [65535:0];
    always @(posedge clkA)
    begin
        if (weA)
            ram[addrA] <= dinA;
        else
            doutA <= ram[addrA];
    end
    always @(posedge clkB)
    begin
        if (weB)
            ram[addrB] <= dinB;
        else
            doutB <= ram[addrB];
    end

endmodule