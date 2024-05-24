
`timescale 1ns/1ps
module co_sim_rams_sp_rf_rst_en_sync_512x16_block;
    reg clk;
    reg we;
    reg rst;
    reg en;
    reg [8:0] addr;
    reg [15:0] di;
    wire [15:0] dout, dout_netlist;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_rf_rst_en_sync_512x16_block golden(.*);
    `ifdef PNR
    `else
        rams_sp_rf_rst_en_sync_512x16_block_post_synth netlist(.*, .dout(dout_netlist));
    `endif


    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<512; i=i+1) begin 
            golden.RAM[i] ='b0;
        end  
    end
    initial begin
        {clk, we, rst, en, addr ,di, cycle, i} = 0;
  

        repeat (1) @ (negedge clk);
        rst = 1'b1;

        repeat (1) @ (negedge clk);
        rst = 1'b0;
        repeat (1) @ (negedge clk)
        addr <= i; en <=1; we <=1; di<= $random;
        //write, but will read zero as those locations are not written yet and are initialized to zero (always reading irrespective of we)
        for (integer i=0; i<1024; i=i+1)begin
            repeat (1) @ (negedge clk)
            addr <= i; en <=1; we <=1; di<= $random;
            cycle = cycle +1;

            compare(cycle);

        end

        //not writing
        for (integer i=0; i<1024; i=i+1)begin
            repeat (1) @ (negedge clk)
            addr <= i; en <=1; we <=0;
            cycle = cycle +1;

            compare(cycle);
        end

            //with en = 0
        for (integer i=0; i<1024; i=i+1)begin
            repeat (1) @ (negedge clk)
            addr <= i; en <=0; we <=0;
            cycle = cycle +1;

            compare(cycle);

    end


    //random
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        we<=$random;  rst<=$random; en<=$random; addr<=$random; di<=$random;
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
    if(dout !== dout_netlist) begin
        $display("dout mismatch. Golden: %0h, Netlist: %0h, Time: %0t", dout, dout_netlist,$time);
        mismatch = mismatch+1;
    end
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule