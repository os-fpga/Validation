module co_sim_rams_sp_reg_addr_readmem_1024x1;
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [0:0] di;
    wire [0:0] dout, dout_netlist;

    integer mismatch=0;
    reg [6:0]cycle, i;

    rams_sp_reg_addr_readmem_1024x1 golden(.*);
    `ifdef PNR
        rams_sp_reg_addr_readmem_1024x1_post_route netlist(.*, .dout(dout_netlist));
    `else
        rams_sp_reg_addr_readmem_1024x1_post_synth netlist(.*, .dout(dout_netlist));
    `endif


    always #10 clk = ~clk;
    // initial begin
    //     for(integer i = 0; i<1024; i=i+1) begin 
    //         golden.RAM[i] ='b0;
    //     end 
    // end
    initial begin
    {clk, we, addr ,di, cycle, i} = 0;

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (posedge clk)
        addr <= i; we <=0;
        cycle = cycle +1;
      
        compare(cycle);
        $display("Initial Values: memory read dout=%h  netlist dout=%h address=%d", golden.dout, dout_netlist, i);
    end

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(posedge clk); $finish;
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