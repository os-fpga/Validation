
module co_sim_ram_simple_dp_sync_reg_read_1024x32;

    reg clk, we;
    reg [9:0] read_addr, write_addr;
    reg [31:0] din;
    wire [31:0] dout, dout_netlist;

    integer mismatch=0, match=0;
    reg [6:0]cycle, i;

    ram_simple_dp_sync_reg_read_1024x32 golden(.*);

`ifdef PNR
`else
   	ram_simple_dp_sync_reg_read_1024x32_post_route netlist(.*, .dout(dout_netlist));
`endif
    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<1024; i=i+1) begin 
            golden.ram[i] ='b0;
        end 
    end
    initial begin
    {clk, we, read_addr, write_addr, din, cycle, i} = 0;
    repeat (1) @ (negedge clk);
     
    repeat (1) @ (negedge clk)
    read_addr <= 1; write_addr <= 0; we <=1'b1; din<= $random;

    repeat (1) @ (negedge clk)
    for (integer i=1; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        read_addr <= 0; write_addr <= i; we <=1'b1; din<= $random;
        

    end
    
   
    //not writing and reading simulatneously from last registered addr during we high
    for (integer i=0; i<1024; i=i+1)begin
        
        write_addr <= $urandom_range(0,511); read_addr <= $urandom_range(512,1023); we <=0;
        cycle = cycle +1;
        repeat (1) @ (negedge clk)
        compare(cycle);

    end

    //random registtered addr
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        write_addr <= $urandom_range(0,511); read_addr <= $urandom_range(512,1023); we <=1'b1; din<= $random;
        cycle = cycle +1;
       
        compare(cycle);

    end

    //read from only last registered addr
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        read_addr <= $urandom_range(0,511); write_addr <= $urandom_range(512,1023); we <=0;
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