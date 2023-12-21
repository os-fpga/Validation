module ram_true_dp_wf_512x16_logic (clk, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clk, weA, weB;
    input [8:0] addrA, addrB;
    input [15:0] dinA, dinB;
    output reg [15:0] doutA, doutB;
    
    (* ram_style = "logic" *)
    reg [15:0] ram [511:0];
    always @(posedge clk)
    begin
        if (weA) begin
            ram[addrA] <= dinA;
            doutA <= dinA;
        end
        else
            doutA <= ram[addrA];
    end

    always @(posedge clk)
    begin
        if (weB) begin
            ram[addrB] <= dinB;
            doutB <= dinB;
        end
        else
            doutB <= ram[addrB];
    end

endmodule