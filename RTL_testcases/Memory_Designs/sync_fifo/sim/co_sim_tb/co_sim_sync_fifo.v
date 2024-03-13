
module co_sim_sync_fifo;
  reg clk;
  reg reset;
  reg push;
  reg pop;
  reg [31:0] data_in;
  wire [31:0] data_out,data_out_netlist;
  wire empty,empty_netlist;
  wire full,full_netlist;

    integer mismatch=0;
    reg [6:0] i;

    sync_fifo golden(.*);
    `ifdef PNR
        sync_fifo_post_route netlist(.*, .data_out(data_out_netlist), .empty(empty_netlist), .full(full_netlist));
    `else
        sync_fifo_post_synth netlist(.*, .data_out(data_out_netlist), .empty(empty_netlist), .full(full_netlist));
    `endif


    always #10 clk = ~clk;
    
    initial begin
    reset=1;
    {clk, push, pop ,data_in, i} = 0;
    repeat (5) @ (negedge clk);
    reset=0;
    @ (negedge clk);

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        push <= 1; pop <=0; data_in<= $random;

        compare();

    end

    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        push <= 0; pop <=1; data_in<= $random;
      
        compare();

    end


    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        push <= 1; pop <=1; data_in<= $random;
      
        compare();

    end

    
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        push <= $random; pop <=$random; data_in<= $random;
      
        compare();

    end
    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(negedge clk); $finish;
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