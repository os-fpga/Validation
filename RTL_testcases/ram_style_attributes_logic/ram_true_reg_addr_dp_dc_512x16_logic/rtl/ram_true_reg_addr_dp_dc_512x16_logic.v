module ram_true_reg_addr_dp_dc_512x16_logic (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output [15:0] doutA, doutB;
    
    reg [8:0] reg_addrA, reg_addrB;
    (* ram_style = "logic" *)
    reg [15:0] ram [511:0];
    always @(posedge clkA)
    begin
        if (weA)
            ram[addrA] <= dinA;
            reg_addrA <= addrA;
    end


    always @(posedge clkB)
    begin
        if (weB)
            ram[addrB] <= dinB;
            reg_addrB <= addrB;
    end
        

    assign doutA = ram[reg_addrA];
    assign doutB = ram[reg_addrB];

endmodule