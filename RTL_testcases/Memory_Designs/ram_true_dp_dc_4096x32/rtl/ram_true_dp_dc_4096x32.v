module ram_true_dp_dc_4096x32 (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [11:0] addrA, addrB;
    input [31:0] dinA, dinB;
    output reg [31:0] doutA, doutB;
    
    reg [31:0] ram [4095:0];
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