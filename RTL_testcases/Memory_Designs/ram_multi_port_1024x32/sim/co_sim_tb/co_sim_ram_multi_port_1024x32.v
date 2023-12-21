
module co_sim_ram_multi_port_1024x32;

    input clk, we;
    input [9:0] write_addr, read_addr_a, read_addr_b, read_addr_c;
    input [31:0] din;
    output [31:0] doutA, doutB, doutC, doutA_net, doutB_net, doutC_net;
    wire [31:0] doutA, doutB,

    integer mismatch=0;
    reg [6:0]cycle, i;

    ram_multi_port_1024x32 golden(.*);
    ram_multi_port_1024x32_post_synth netlist(.*, .doutA(doutA_net), .doutB(doutB_net), .doutC(doutC_net));


    always #10 clk = ~clk;
    initial begin
        for(integer i = 0; i<1024; i=i+1) begin 
            golden.mem[i] ='b0;
        end  
    end
    initial begin
        
    {clk,we, write_addr, read_addr_a, read_addr_b, read_addr_c ,din, cycle, i} = 0;

  
 
    repeat (1) @ (negedge clk);
    
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)

        write_addr <= i; read_addr_a <= {$random} % 512; read_addr_b <= i; read_addr_c <= {$random} % 1024; we <=1'b1; din<= {$random}; 
        cycle = cycle +1;
        #1;
        compare(cycle);

    end

     for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
       write_addr <= i; read_addr_a <= {$random} % 512; read_addr_b <= i; read_addr_c <= {$random} % 1024; we <=1'b0; din<= {$random}; 
        cycle = cycle +1;
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