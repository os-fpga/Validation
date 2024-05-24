
`timescale 1ns/1ps
module co_sim_rams_sp_wf_4x2;
    reg clk;
    reg we;
    reg [1:0] addr;
    reg [1:0] di;
    wire [1:0] dout, dout_netlist;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_wf_4x2 golden(.*);
    `ifdef PNR
    `else
        rams_sp_wf_4x2_post_synth netlist(.*, .dout(dout_netlist));
    `endif


    always #10 clk = ~clk;

    initial begin
    {clk, we, addr ,di, cycle, i} = 0;

    for(integer i = 0; i<4; i=i+1) begin 
        golden.RAM[i] ='b0;
    end    

    repeat (1) @ (negedge clk);

    //write, but will read the being written value (read through)
    for (integer i=0; i<4; i=i+1)begin
        addr <= i; we <=1; di<= $random;
        cycle = cycle +1;
        repeat (1) @ (negedge clk)
        // $display ("%0t", $time);
        compare(cycle);

    end

    //not writing and reading from the addr of rams
    for (integer i=0; i<4; i=i+1)begin
        addr <= i; we <=0;
        cycle = cycle +1;
        repeat (1) @ (negedge clk)
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
        $display("dout mismatch. Golden: %0h, Netlist: %0h, Time: %0t, we=%b", dout, dout_netlist,$time,golden.we);
        mismatch = mismatch+1;
    end
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
