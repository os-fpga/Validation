module ram_true_dp_dc_512x16_new_tdp (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output reg [15:0] doutA, doutB;
    
    reg [15:0] ram [511:0];
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