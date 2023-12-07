module ram_true_dp_out_reg_512x16_block (clk, weA, weB,reA, reB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clk, weA, weB, reA, reB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output reg [15:0] doutA, doutB;
    
    (* ram_style = "block" *)
    reg [15:0] ram [511:0];
    always @(posedge clk)
    begin
        if (weA)
            ram[addrA] <= dinA;
        else
            doutA <= ram[addrA];
    end

    always @(posedge clk)
    begin
        if (weB)
            ram[addrB] <= dinB;
        else
            doutB <= ram[addrB];
    end

endmodule