module ram_true_dp_512x16_block (clk, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clk, weA, weB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output [15:0] doutA, doutB;
    
    (* ram_style = "block" *)
    reg [15:0] ram [511:0];
    always @(posedge clk)
    begin
        if (weA)
            ram[addrA] <= dinA;
        if (weB)
            ram[addrB] <= dinB;
    end

    assign doutA = ram[addrA];
    assign doutB = ram[addrB];

endmodule