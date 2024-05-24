
`timescale 1ns/1ps
module co_sim_async_fifo;
  reg clk_read, clk_write;
  reg reset;
  reg push;
  reg pop;
  reg [31:0] data_in;
  wire [31:0] data_out,data_out_netlist;
  wire empty,empty_netlist;
  wire full,full_netlist;

    integer mismatch=0;
    reg [6:0] i;

    async_fifo golden(.*);
    `ifdef PNR
        async_fifo_post_route netlist(.*, .data_out(data_out_netlist), .empty(empty_netlist), .full(full_netlist));
    `else
        async_fifo_post_synth netlist(.*, .data_out(data_out_netlist), .empty(empty_netlist), .full(full_netlist));
    `endif


    // Generate clock signals
    always #5 clk_read = ~clk_read;
    always #10 clk_write = ~clk_write;
    initial begin
        for(integer i = 0; i<256; i=i+1) begin 
            golden.fifo[i] ='b0;
        end  
    end
    initial begin
    reset=1;
    {clk_read, clk_write, push, pop ,data_in, i} = 0;
    repeat (5) @ (negedge clk_read);
    reset=0;
    @ (negedge clk_read);

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk_read)
        push <= 1; pop <=0; data_in<= $random;

        compare();

    end

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk_read)
        push <= 0; pop <=1; data_in<= $random;
      
        compare();

    end


    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk_read)
        push <= 1; pop <=1; data_in<= $random;
      
        compare();

    end

    
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk_read)
        push <= $random; pop <=$random; data_in<= $random;
      
        compare();

    end
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(negedge clk_write); $finish;
    end

    task compare;
    //$display("\n Comparison at cycle %0d", cycle);
    if(data_out !== data_out_netlist) begin
        $display("data_out mismatch. Golden: %0h, Netlist: %0h, Time: %0t", data_out, data_out_netlist,$time);
        mismatch = mismatch+1;
    end

    if(empty !== empty_netlist) begin
        $display("empty mismatch. Golden: %0h, Netlist: %0h, Time: %0t", empty, empty_netlist,$time);
        mismatch = mismatch+1;
    end

    if(full !== full_netlist) begin
        $display("full mismatch. Golden: %0h, Netlist: %0h, Time: %0t", full, full_netlist,$time);
        mismatch = mismatch+1;
    end
    
    endtask


initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule