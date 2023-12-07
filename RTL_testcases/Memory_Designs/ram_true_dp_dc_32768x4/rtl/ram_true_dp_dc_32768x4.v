module ram_true_dp_dc_32768x4 (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [15:0] addrA, addrB;
    input [3:0] dinA, dinB;
    output reg [3:0] doutA, doutB;
    
    reg [3:0] ram [32767:0];
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