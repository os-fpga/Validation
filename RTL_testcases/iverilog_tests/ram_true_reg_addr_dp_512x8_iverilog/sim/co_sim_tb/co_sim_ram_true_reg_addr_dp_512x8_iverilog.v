
module co_sim_ram_true_reg_addr_dp_512x8_iverilog;

    reg clk, weA, weB;
    reg [8:0] addrA, addrB;
    reg [7:0] dinA, dinB;
    wire [7:0] doutA, doutB;

`ifdef PNR
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