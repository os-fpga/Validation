
module co_sim_rams_sp_rf_sync_1024x64;
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [63:0] di;
    wire [63:0] dout, dout_net;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_rf_sync_1024x64 golden(.*);
    `ifdef PNR
        rams_sp_rf_sync_1024x64_post_route netlist(  clk ,
    we ,
    addr[0] ,
    addr[1] ,
    addr[2] ,
    addr[3] ,
    addr[4] ,
    addr[5] ,
    addr[6] ,
    addr[7] ,
    addr[8] ,
    addr[9] ,
    di[0] ,
    di[1] ,
    di[2] ,
    di[3] ,
    di[4] ,
    di[5] ,
    di[6] ,
    di[7] ,
    di[8] ,
    di[9] ,
    di[10] ,
    di[11] ,
    di[12] ,
    di[13] ,
    di[14] ,
    di[15] ,
    di[16] ,
    di[17] ,
    di[18] ,
    di[19] ,
    di[20] ,
    di[21] ,
    di[22] ,
    di[23] ,
    di[24] ,
    di[25] ,
    di[26] ,
    di[27] ,
    di[28] ,
    di[29] ,
    di[30] ,
    di[31] ,
    di[32] ,
    di[33] ,
    di[34] ,
    di[35] ,
    di[36] ,
    di[37] ,
    di[38] ,
    di[39] ,
    di[40] ,
    di[41] ,
    di[42] ,
    di[43] ,
    di[44] ,
    di[45] ,
    di[46] ,
    di[47] ,
    di[48] ,
    di[49] ,
    di[50] ,
    di[51] ,
    di[52] ,
    di[53] ,
    di[54] ,
    di[55] ,
    di[56] ,
    di[57] ,
    di[58] ,
    di[59] ,
    di[60] ,
    di[61] ,
    di[62] ,
    di[63] ,
    dout_net[0] ,
    dout_net[1] ,
    dout_net[2] ,
    dout_net[3] ,
    dout_net[4] ,
    dout_net[5] ,
    dout_net[6] ,
    dout_net[7] ,
    dout_net[8] ,
    dout_net[9] ,
    dout_net[10] ,
    dout_net[11] ,
    dout_net[12] ,
    dout_net[13] ,
    dout_net[14] ,
    dout_net[15] ,
    dout_net[32] ,
    dout_net[33] ,
    dout_net[36] ,
    dout_net[37] ,
    dout_net[38] ,
    dout_net[39] ,
    dout_net[40] ,
    dout_net[41] ,
    dout_net[42] ,
    dout_net[43] ,
    dout_net[44] ,
    dout_net[45] ,
    dout_net[46] ,
    dout_net[47] ,
    dout_net[48] ,
    dout_net[49] ,
    dout_net[50] ,
    dout_net[51] ,
    dout_net[16] ,
    dout_net[17] ,
    dout_net[18] ,
    dout_net[19] ,
    dout_net[20] ,
    dout_net[21] ,
    dout_net[22] ,
    dout_net[23] ,
    dout_net[24] ,
    dout_net[25] ,
    dout_net[26] ,
    dout_net[27] ,
    dout_net[28] ,
    dout_net[29] ,
    dout_net[30] ,
    dout_net[31] ,
    dout_net[34] ,
    dout_net[35] ,
    dout_net[52] ,
    dout_net[53] ,
    dout_net[54] ,
    dout_net[55] ,
    dout_net[56] ,
    dout_net[57] ,
    dout_net[58] ,
    dout_net[59] ,
    dout_net[60] ,
    dout_net[61] ,
    dout_net[62] ,
    dout_net[63] );
    `else
        rams_sp_rf_sync_1024x64_post_synth netlist(.*, .dout(dout_net));
    `endif


    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<1024; i=i+1) begin 
            golden.RAM[i] ='b0;
        end 
    end
    initial begin
    {clk, we, addr ,di, cycle, i} = 0;

     repeat (1) @ (negedge clk);

    //write, but will read zero as those locations are not written yet and are initialized to zero (always reading irrespective of we)
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addr <= i; we <=1; di<= $random;
        cycle = cycle +1;
 
        compare(cycle);

    end

    //not writing
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addr <= i; we <=0;
        cycle = cycle +1;

        compare(cycle);

    end

    //random
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        we<=$random;  addr<=$random; di<=$random;
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
    if(dout !== dout_net) begin
        $display("dout mismatch. Golden: %0h, Netlist: %0h, Time: %0t", dout, dout_net,$time);
        mismatch = mismatch+1;
    end
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
