
module co_sim_rams_sp_re_we_rst_512x16_block;
    reg clk, rst;
    reg we, re;
    reg [8:0] addr;
    reg [15:0] di;
    wire [15:0] dout, dout_netlist;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_re_we_rst_512x16_block golden(.*);
    `ifdef PNR
    `else
        rams_sp_re_we_rst_512x16_block_post_synth netlist(.*, .dout(dout_netlist));
    `endif


    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<513; i=i+1) begin 
            golden.RAM[i] ='b0;
        end 
    end
    initial begin
    {clk,  we, re, addr ,di, cycle, i} = 0;
    rst = 1; 

    repeat (5) @ (negedge clk);
    rst = 0;
    //write and simulatnously reads from registered address
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addr <= i; we <=1; re<=0; di<= $random;
        cycle = cycle +1;
        #1;
        compare(cycle);

    end

    //not writing and reading from the last registered addr
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addr <= i; we <=0; re<=1; 
        cycle = cycle +1;
        #1;
        compare(cycle);

    end

//write and simulatnously reads from registered address when we was 1
     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        addr <= i; we <=1; re<=0; di<= $random;
        repeat (1) @ (negedge clk)
        addr <= i; we <=0; re<=1; di<= $random;
        cycle = cycle +2;
        #1;
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