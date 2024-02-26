
module co_sim_rams_sp_wf_1024x7;
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [6:0] di;
    wire [6:0] dout, dout_net;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_wf_1024x7 golden(.*);
    `ifdef PNR
        rams_sp_wf_1024x7_post_route netlist(    clk ,
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
    dout_net[4] ,
    dout_net[0] ,
    dout_net[1] ,
    dout_net[2] ,
    dout_net[3] ,
    dout_net[5] ,
    dout_net[6] 
);
    `else
        rams_sp_wf_1024x7_post_synth netlist(.*, .dout(dout_net));
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

    //write, but will read the being written value (read through)
    for (integer i=0; i<1024; i=i+1)begin
        addr <= i; we <=1; di<= $random;
        cycle = cycle +1;
        repeat (1) @ (negedge clk)
        // $display ("%0t", $time);
        compare(cycle);

    end

    //not writing and reading from the addr of rams
    for (integer i=0; i<1024; i=i+1)begin
        addr <= i; we <=0;
        cycle = cycle +1;
        repeat (1) @ (negedge clk)
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
        $display("dout mismatch. Golden: %0h, Netlist: %0h, Time: %0t, we=%b", dout, dout_net,$time,golden.we);
        mismatch = mismatch+1;
    end
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
