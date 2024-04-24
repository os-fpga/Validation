`timescale 1ns / 1ps

module co_sim_and2_or2;

  reg  a;
  reg  b;
  wire  c,c_netlist;
  wire  d,d_netlist;

  integer i=0;
  integer mismatch=0;

  and2_or2 golden (.a(a),.b(b),.c(c),.d(d));
  `ifdef PNR
  and2_or2_post_route netlist (.a(a),.b(b),.c(c_netlist),.d(d_netlist));
  `else
  and2_or2_post_synth netlist (.a(a),.b(b),.c(c_netlist),.d(d_netlist));
  `endif

//   always #1  clk = !clk;

  initial begin
    a<=0;
    b<=0;
    #5;

    for(i=0;i<500;i=i+1)
    begin
        a<=$random();
        b<=$random();
        compare();
        #10; //wait for 10 ns.
    end

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
    #20;
    $finish;
  end

  task compare();
    $display("*** Comparing ***");
    if(c !== c_netlist || d !== d_netlist) begin
        $display("Data Mismatch. Golden c: %0b, Netlist c: %0b, Golden d: %0b, Netlist d: %0b, Time: %0t", c, c_netlist, d, d_netlist, $time);
        mismatch = mismatch+1;
    end
    else
        $display("Data Matched. Golden c: %0b, Netlist c: %0b, Golden d: %0b, Netlist d: %0b, Time: %0t", c, c_netlist, d, d_netlist, $time);
endtask

initial begin
    $dumpfile("and2_or2.vcd");
    $dumpvars;
end

endmodule
