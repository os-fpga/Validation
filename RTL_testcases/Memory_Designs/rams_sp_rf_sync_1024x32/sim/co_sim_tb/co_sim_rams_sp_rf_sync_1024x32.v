
module co_sim_rams_sp_rf_sync_1024x32;
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [31:0] di;
    wire [31:0] dout, dout_net;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_rf_sync_1024x32 golden(.*);
    `ifdef PNR
        rams_sp_rf_sync_1024x32_post_route netlist(  clk ,
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
    dout_net[31] );
    `else
        rams_sp_rf_sync_1024x32_post_synth netlist(.*, .dout(dout_net));
    `endif


    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<1024; i=i+1) begin 
            golden.RAM[i] ='b0;
        end 
    end
    initial begin
    {clk, we, addr ,di, cycle, i} = 0;


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
