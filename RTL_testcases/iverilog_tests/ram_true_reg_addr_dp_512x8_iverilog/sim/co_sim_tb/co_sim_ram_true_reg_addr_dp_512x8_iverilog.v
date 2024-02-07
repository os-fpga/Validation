
module co_sim_ram_true_reg_addr_dp_512x8_iverilog;

    reg clk, weA, weB;
    reg [8:0] addrA, addrB;
    reg [7:0] dinA, dinB;
    wire [7:0] doutA, doutB;

`ifdef PNR
    // ram_true_reg_addr_dp_512x8_iverilog golden(.*);
    ram_true_reg_addr_dp_512x8_iverilog golden( 
   clk ,
    weA ,
    weB ,
    addrA[0] ,
    addrA[1] ,
    addrA[2] ,
    addrA[3] ,
    addrA[4] ,
    addrA[5] ,
    addrA[6] ,
    addrA[7] ,
    addrA[8] ,
    addrB[0] ,
    addrB[1] ,
    addrB[2] ,
    addrB[3] ,
    addrB[4] ,
    addrB[5] ,
    addrB[6] ,
    addrB[7] ,
    addrB[8] ,
    dinA[0] ,
    dinA[1] ,
    dinA[2] ,
    dinA[3] ,
    dinA[4] ,
    dinA[5] ,
    dinA[6] ,
    dinA[7] ,
    dinB[0] ,
    dinB[1] ,
    dinB[2] ,
    dinB[3] ,
    dinB[4] ,
    dinB[5] ,
    dinB[6] ,
    dinB[7] ,
    doutA[0] ,
    doutA[1] ,
    doutA[2] ,
    doutA[3] ,
    doutA[4] ,
    doutA[5] ,
    doutA[6] ,
    doutA[7] ,
    doutB[0] ,
    doutB[1] ,
    doutB[2] ,
    doutB[3] ,
    doutB[4] ,
    doutB[5] ,
    doutB[6] ,
    doutB[7] );
`else
     ram_true_reg_addr_dp_512x8_iverilog golden(.*);
`endif
   


    always #10 clk = ~clk;

    initial begin
        
    {clk, weA,weB, addrA,addrB, dinA, dinB} = 0;
    repeat (1) @(negedge clk);
    weA <= 1; addrA = 256; dinA <= 1020;
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
    weA <= 0; addrA = 256; dinA <= 2124;
    $display("NEGEDGE 5: weA = %0d, weB = %0d, addrA = %0d, addrB = %0d, dinA = %0d, dinB = %0d", weA,weB,addrA,addrB,dinA,dinB);
    repeat (1) @(negedge clk);
    $display("NEGEDGE 6:  addrA = %0d, doutA = %0d | addrB = %0d, doutB = %0d", addrA,doutA,addrB,doutB);
    $display("\n");

    repeat (1) @(negedge clk);
    weB <= 1; addrB = 512; dinB <= 5555;
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