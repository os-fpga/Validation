
`timescale 1ns/1ps
module co_sim_ram_pipeline_logic;

    reg clk1;
    reg clk2;
    reg we, en1, en2;
    reg [8:0] addr1;
    reg [8:0] addr2;
    reg [15:0] di;
    wire [15:0] res1, res1_netlist;
    wire [15:0] res2, res2_netlist;

    integer mismatch=0;
    reg [6:0]cycle, i;

    ram_pipeline_logic golden(.*);
    `ifdef PNR
    `else
        ram_pipeline_logic_post_synth netlist(.*, .res1(res1_netlist), .res2(res2_netlist));
    `endif


    //clock//
    initial begin
        clk1 = 1'b0;
        forever #10 clk1 = ~clk1;
    end
    initial begin
        clk2 = 1'b0;
        forever #5 clk2 = ~clk2;
    end

    initial begin
        
    {we,en1, en2,addr1, addr2, di, cycle, i} = 0;
 
 
    repeat (1) @ (negedge clk1);
    
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk1)

        addr1 <= $urandom_range(0,255); addr2 <= $urandom_range(256,511); en1<=1'b1; en2<=1'b1; we <=1'b1;  di<= {$random};
        cycle = cycle +1;
      
        compare(cycle);

    end

     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk2)
        addr1 <= $urandom_range(0,255); addr2 <= $urandom_range(256,511); we <=1'b0; 
        cycle = cycle +1;
      
        compare(cycle);
    end
    repeat (1) @ (negedge clk1)
    en1<=1'b0; en2<=1'b0;
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk1)
        addr1 <= $urandom_range(0,255); addr2 <= $urandom_range(256,511); we <=1'b0; 
        cycle = cycle +1;
      
        compare(cycle);
    end

     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk2)
        addr1 <= $urandom_range(256,511); addr2 <= $urandom_range(0,255); en1<={$random}; en2<={$random}; we <={$random}; di<= {$random}; 
        cycle = cycle +1;
      
        compare(cycle);
    end

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk2)
        addr1 <= $urandom_range(0,255); addr2 <= $urandom_range(256,511); en1<={$random}; en2<={$random}; we <={$random}; di<= {$random}; 
        cycle = cycle +1;
      
        compare(cycle);
    end
   
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(negedge clk1); $finish;
    end

    task compare(input integer cycle);
    //$display("\n Comparison at cycle %0d", cycle);
    if(res1 !== res1_netlist) begin
        $display("res1 mismatch. Golden: %0h, Netlist: %0h, Time: %0t", res1, res1_netlist,$time);
        mismatch = mismatch+1;
    end

     if(res2 !== res2_netlist) begin
        $display("res2 mismatch. Golden: %0h, Netlist: %0h, Time: %0t", res2, res2_netlist,$time);
        mismatch = mismatch+1;
    end
    
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule