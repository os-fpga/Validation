`define MAC_32 2

module co_sim_mac_32;

   // Inputs
   reg clock0;
   reg reset;
   reg signed [15:0] a;
   reg signed [15:0] b;
   reg [0:`MAC_32-1] id;

   // Outputs
   wire signed [31:0] out;
   wire signed [31:0] result_netlist;

   integer mismatch=0;

   // Instantiate the mac_32 module
   mac_32 golden(
      .clock0(clock0),
      .reset(reset),
      .a(a),
      .b(b),
      .out(out)
   );
   `ifdef PNR
   `else
   mac_32 netlist(
      .clock0(clock0),
      .reset(reset),
      .a(a),
      .b(b),
      .id(id),
      .out(result_netlist)
   );
   `endif

   // Clock initialization
   initial begin
      clock0 = 1;
      forever #5 clock0 = ~clock0;
   end

   // Test procedure
   initial begin
      reset = 0;
      a = 0;
      b = 0;
      id = 0;

      @(negedge clock0);
      reset = 1;
      $display ("\n\n***Reset Test is applied***\n\n");
      display_stimulus();
      @(negedge clock0);
      @(negedge clock0);
      compare();
      $display ("\n\n***Reset Test is ended***\n\n");

      reset = 0;
      @(negedge clock0);

      $display ("\n\n***Directed Functionality Test is applied ***\n\n");
      a = 8;
      b = 4;
      display_stimulus();
      repeat (4) @(negedge clock0);
      compare();
      $display ("\n\n***Directed Functionality Test is ended***\n\n");

      $display ("\n\n***Directed Functionality Test is applied ***\n\n");
      a = -5;
      b = 3;
      display_stimulus();
      repeat (4) @(negedge clock0);
      compare();
      $display ("\n\n***Directed Functionality Test is ended***\n\n");

      // Add more directed functionality tests as needed

      $display ("\n\n*** Random Functionality Tests are applied***\n\n");
      repeat (1000) begin
         a = $random;
         b = $random;
         display_stimulus();
         @(negedge clock0);
         compare();
      end
      $display ("\n\n***Random Functionality Tests are ended***\n\n");

      if (mismatch == 0)
         $display("\n**** All Comparison Matched ***\nSimulation Passed");
      else
         $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);

      #100;
      $finish;
   end

   // Task to compare outputs
   task compare();
      if (out !== result_netlist) begin
         $display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", out, result_netlist, $time);
         mismatch = mismatch + 1;
      end
      else
         $display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", out, result_netlist, $time);
   endtask

   // Task to display stimulus
   task display_stimulus();
      $display($time,, " Test stimulus is: a=%0d, b=%0d, id=%0d", a, b, id);
   endtask

   // Dump VCD file
   initial begin
      $dumpfile("tb.vcd");
      $dumpvars;
   end
endmodule