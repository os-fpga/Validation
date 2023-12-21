module ram_true_dp_dc_excl_rw_512x32_logic (clkA, clkB, weA, weB, reA, reB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB, reA, reB;
    input [8:0] addrA, addrB;
    input [31:0] dinA, dinB;
    output reg [31:0] doutA, doutB;
    
    (* ram_style = "logic" *)
    reg [31:0] ram [511:0];
    always @(posedge clkA)
    begin
        if (weA)
            ram[addrA] <= dinA;
        else if (reA)
            doutA <= ram[addrA];
    end
    always @(posedge clkB)
    begin
        if (weB)
            ram[addrB] <= dinB;
        else if (reB)
            doutB <= ram[addrB];
    end

endmodule