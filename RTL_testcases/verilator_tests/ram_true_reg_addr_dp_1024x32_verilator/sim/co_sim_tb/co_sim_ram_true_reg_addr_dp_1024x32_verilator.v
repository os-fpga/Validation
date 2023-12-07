
module co_sim_ram_true_reg_addr_dp_1024x32_verilator;

    reg clk, weA, weB;
    reg [9:0] addrA, addrB;
    reg [31:0] dinA, dinB;
    wire [31:0] doutA, doutB;

`ifdef PNR
    ram_true_reg_addr_dp_1024x32_verilator golden( 
    clk ,
    weA ,
    weB ,
    addrB[9] ,
    addrB[8] ,
    addrB[7] ,
    addrB[6] ,
    addrB[5] ,
    addrB[4] ,
    addrB[3] ,
    addrB[2] ,
    addrB[1] ,
    addrB[0] ,
    dinA[31] ,
    dinA[30] ,
    dinA[29] ,
    dinA[28] ,
    dinA[27] ,
    dinA[26] ,
    dinA[25] ,
    dinA[24] ,
    dinA[23] ,
    dinA[22] ,
    dinA[21] ,
    dinA[20] ,
    dinA[19] ,
    dinA[18] ,
    dinA[17] ,
    dinA[16] ,
    dinA[15] ,
    dinA[14] ,
    dinA[13] ,
    dinA[12] ,
    dinA[11] ,
    dinA[10] ,
    dinA[9] ,
    dinA[8] ,
    dinA[7] ,
    dinA[6] ,
    dinA[5] ,
    dinA[4] ,
    dinA[3] ,
    dinA[2] ,
    dinA[1] ,
    dinA[0] ,
    dinB[31] ,
    dinB[30] ,
    dinB[29] ,
    dinB[28] ,
    dinB[27] ,
    dinB[26] ,
    dinB[25] ,
    dinB[24] ,
    dinB[23] ,
    dinB[22] ,
    dinB[21] ,
    dinB[20] ,
    dinB[19] ,
    dinB[18] ,
    dinB[17] ,
    dinB[16] ,
    dinB[15] ,
    dinB[14] ,
    dinB[13] ,
    dinB[12] ,
    dinB[11] ,
    dinB[10] ,
    dinB[9] ,
    dinB[8] ,
    dinB[7] ,
    dinB[6] ,
    dinB[5] ,
    dinB[4] ,
    dinB[3] ,
    dinB[2] ,
    dinB[1] ,
    dinB[0] ,
    addrA[9] ,
    addrA[8] ,
    addrA[7] ,
    addrA[6] ,
    addrA[5] ,
    addrA[4] ,
    addrA[3] ,
    addrA[2] ,
    addrA[1] ,
    addrA[0] ,
    doutB[17] ,
    doutB[16] ,
    doutB[15] ,
    doutB[14] ,
    doutB[13] ,
    doutB[12] ,
    doutB[11] ,
    doutB[10] ,
    doutB[9] ,
    doutB[8] ,
    doutB[7] ,
    doutB[6] ,
    doutB[5] ,
    doutB[4] ,
    doutB[3] ,
    doutB[2] ,
    doutB[1] ,
    doutB[0] ,
    doutA[17] ,
    doutA[16] ,
    doutA[15] ,
    doutA[14] ,
    doutA[13] ,
    doutA[12] ,
    doutA[11] ,
    doutA[10] ,
    doutA[9] ,
    doutA[8] ,
    doutA[7] ,
    doutA[6] ,
    doutA[5] ,
    doutA[4] ,
    doutA[3] ,
    doutA[2] ,
    doutA[1] ,
    doutA[0] ,
    doutA[31] ,
    doutA[30] ,
    doutA[29] ,
    doutA[28] ,
    doutA[27] ,
    doutA[26] ,
    doutA[25] ,
    doutA[24] ,
    doutA[23] ,
    doutA[22] ,
    doutA[21] ,
    doutA[20] ,
    doutA[19] ,
    doutA[18] ,
    doutB[31] ,
    doutB[30] ,
    doutB[29] ,
    doutB[28] ,
    doutB[27] ,
    doutB[26] ,
    doutB[25] ,
    doutB[24] ,
    doutB[23] ,
    doutB[22] ,
    doutB[21] ,
    doutB[20] ,
    doutB[19] ,
    doutB[18] );
`else
     ram_true_reg_addr_dp_1024x32_verilator golden(.*);
`endif
   


    always #10 clk = ~clk;

    initial begin
        
    {clk, weA,weB, addrA,addrB, dinA, dinB} = 0;
    repeat (1) @(negedge clk);
    weA <= 1; addrA = 510; dinA <= 1020;
    $display("NEGEDGE 1: weA = %0d, weB = %0d, addrA = %0d, addrB = %0d, dinA = %0d, dinB = %0d", weA,weB,addrA,addrB,dinA,dinB);
    repeat (1) @(negedge clk);
    $display("NEGEDGE 2: addrA = %0d, doutA = %0d | addrB = %0d, doutB = %0d", addrA,doutA,addrB,doutB);
    $display("\n");

    repeat (1) @(negedge clk);
    weB <= 1; addrB = 10; dinB <= 1245;
    $display("NEGEDGE 3: weA = %0d, weB = %0d, addrA = %0d, addrB = %0d, dinA = %0d, dinB = %0d", weA,weB,addrA,addrB,dinA,dinB);
    repeat (1) @(negedge clk);
    $display("NEGEDGE 4: addrA = %0d, doutA = %0d | addrB = %0d, doutB = %0d", addrA,doutA,addrB,doutB);
    $display("\n");

    repeat (1) @(negedge clk);
    weA <= 0; addrA = 510; dinA <= 2124;
    $display("NEGEDGE 5: weA = %0d, weB = %0d, addrA = %0d, addrB = %0d, dinA = %0d, dinB = %0d", weA,weB,addrA,addrB,dinA,dinB);
    repeat (1) @(negedge clk);
    $display("NEGEDGE 6:  addrA = %0d, doutA = %0d | addrB = %0d, doutB = %0d", addrA,doutA,addrB,doutB);
    $display("\n");

    repeat (1) @(negedge clk);
    weB <= 1; addrB = 1024; dinB <= 5555;
    $display("NEGEDGE 7: weA = %0d, weB = %0d, addrA = %0d, addrB = %0d, dinA = %0d, dinB = %0d", weA,weB,addrA,addrB,dinA,dinB);
    repeat (1) @(negedge clk);
    $display("NEGEDGE 8: addrA = %0d, doutA = %0d | addrB = %0d, doutB = %0d", addrA,doutA,addrB,doutB);
    $display("\n");
    
    $finish;
    end




initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule