
module co_sim_ram_true_reg_addr_dp_1024x32_readmem;

    reg clk, weA, weB;
    reg [9:0] addrA, addrB;
    reg [31:0] dinA, dinB;
    wire [31:0] doutA, doutB, doutA_net, doutB_net;

    integer mismatch=0;
    reg [6:0]cycle, i;

    ram_true_reg_addr_dp_1024x32_readmem golden(.*);
    `ifdef PNR
        ram_true_reg_addr_dp_1024x32_readmem_post_route  netlist(  clk ,
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
    addrA[9] ,
    addrB[0] ,
    addrB[1] ,
    addrB[2] ,
    addrB[3] ,
    addrB[4] ,
    addrB[5] ,
    addrB[6] ,
    addrB[7] ,
    addrB[8] ,
    addrB[9] ,
    dinA[0] ,
    dinA[1] ,
    dinA[2] ,
    dinA[3] ,
    dinA[4] ,
    dinA[5] ,
    dinA[6] ,
    dinA[7] ,
    dinA[8] ,
    dinA[9] ,
    dinA[10] ,
    dinA[11] ,
    dinA[12] ,
    dinA[13] ,
    dinA[14] ,
    dinA[15] ,
    dinA[16] ,
    dinA[17] ,
    dinA[18] ,
    dinA[19] ,
    dinA[20] ,
    dinA[21] ,
    dinA[22] ,
    dinA[23] ,
    dinA[24] ,
    dinA[25] ,
    dinA[26] ,
    dinA[27] ,
    dinA[28] ,
    dinA[29] ,
    dinA[30] ,
    dinA[31] ,
    dinB[0] ,
    dinB[1] ,
    dinB[2] ,
    dinB[3] ,
    dinB[4] ,
    dinB[5] ,
    dinB[6] ,
    dinB[7] ,
    dinB[8] ,
    dinB[9] ,
    dinB[10] ,
    dinB[11] ,
    dinB[12] ,
    dinB[13] ,
    dinB[14] ,
    dinB[15] ,
    dinB[16] ,
    dinB[17] ,
    dinB[18] ,
    dinB[19] ,
    dinB[20] ,
    dinB[21] ,
    dinB[22] ,
    dinB[23] ,
    dinB[24] ,
    dinB[25] ,
    dinB[26] ,
    dinB[27] ,
    dinB[28] ,
    dinB[29] ,
    dinB[30] ,
    dinB[31] ,
    doutB_net[0] ,
    doutB_net[1] ,
    doutB_net[2] ,
    doutB_net[3] ,
    doutB_net[4] ,
    doutB_net[5] ,
    doutB_net[6] ,
    doutB_net[7] ,
    doutB_net[8] ,
    doutB_net[9] ,
    doutB_net[10] ,
    doutB_net[11] ,
    doutB_net[12] ,
    doutB_net[13] ,
    doutB_net[14] ,
    doutB_net[15] ,
    doutA_net[0] ,
    doutB_net[16] ,
    doutB_net[17] ,
    doutB_net[18] ,
    doutB_net[19] ,
    doutB_net[20] ,
    doutB_net[21] ,
    doutB_net[22] ,
    doutB_net[23] ,
    doutB_net[24] ,
    doutB_net[25] ,
    doutB_net[26] ,
    doutB_net[27] ,
    doutB_net[28] ,
    doutB_net[29] ,
    doutB_net[30] ,
    doutB_net[31] ,
    doutA_net[1] ,
    doutA_net[2] ,
    doutA_net[3] ,
    doutA_net[4] ,
    doutA_net[5] ,
    doutA_net[6] ,
    doutA_net[7] ,
    doutA_net[8] ,
    doutA_net[9] ,
    doutA_net[10] ,
    doutA_net[11] ,
    doutA_net[12] ,
    doutA_net[13] ,
    doutA_net[14] ,
    doutA_net[15] ,
    doutA_net[16] ,
    doutA_net[17] ,
    doutA_net[18] ,
    doutA_net[19] ,
    doutA_net[20] ,
    doutA_net[21] ,
    doutA_net[22] ,
    doutA_net[23] ,
    doutA_net[24] ,
    doutA_net[25] ,
    doutA_net[26] ,
    doutA_net[27] ,
    doutA_net[28] ,
    doutA_net[29] ,
    doutA_net[30] ,
    doutA_net[31] );
    `else
        ram_true_reg_addr_dp_1024x32_readmem_post_synth netlist(.*, .doutA(doutA_net), .doutB(doutB_net));
    `endif
    
    


    always #10 clk = ~clk;
    // initial begin
    //     for(integer i = 0; i<1024; i=i+1) begin 
    //         golden.ram[i] ='b0;
    //     end 
    // end
    initial begin
        
    {clk, weA,weB, addrA,addrB, dinA, dinB, cycle, i} = 0;

  
 
    repeat (1) @ (negedge clk);
    
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)

        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <=1'b0; weB <=1'b0; 
        cycle = cycle +1;
       
        compare(cycle);

    end

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)

        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <=1'b1; weB <=1'b1; dinA<= {$random}; dinB<= {$random};
        cycle = cycle +1;
       
        compare(cycle);

    end

     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <=1'b1; weB <=1'b0; dinA<= {$random}; dinB<= {$random};
        cycle = cycle +1;
       
        compare(cycle);
    end

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <=1'b1; weB <=1'b1; dinA<= {$random}; dinB<= {$random};
        cycle = cycle +1;
       
        compare(cycle);
    end

   for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <=1'b0; weB <=1'b0; dinA<= {$random}; dinB<= {$random};
        cycle = cycle +1;
       
        compare(cycle);
    end

     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addrA <= $urandom_range(0,511);; addrB <= $urandom_range(512,1023); weA <={$random}; weB <={$random}; dinA<= {$random}; dinB<= {$random};
        cycle = cycle +1;
       
        compare(cycle);
    end
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(negedge clk); $finish;
    end

    task compare(input integer cycle);
    //$display("\n Comparison at cycle %0d", cycle);
    if(doutA !== doutA_net) begin
        $display("doutA mismatch. Golden: %0h, Netlist: %0h, Time: %0t", doutA, doutA_net,$time);
        mismatch = mismatch+1;
    end

     if(doutB !== doutB_net) begin
        $display("doutB mismatch. Golden: %0h, Netlist: %0h, Time: %0t", doutB, doutB_net,$time);
        mismatch = mismatch+1;
    end
    
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule