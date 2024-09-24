module ram_true_dp_rf_wre_512x16 (clk, weA, weB,reA, reB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clk, weA, weB, reA, reB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output reg [15:0] doutA=0;
    output reg [15:0] doutB=0;
    
    reg [15:0] ram [511:0];
    always @(posedge clk)
    begin
        if (weA)
            ram[addrA] <= dinA;
        if (reA)
            doutA <= ram[addrA];
    end

    always @(posedge clk)
    begin
        if (weB)
            ram[addrB] <= dinB;
        if (reB)
            doutB <= ram[addrB];
    end

endmodule