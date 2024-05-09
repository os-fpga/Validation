`timescale 1ns/1ps

module testbench;

  reg D = 1'b0;
  reg CLK = 1'b0;
  
  wire Q_full_speed_rtl;
  wire Q_half_speed_rtl;
  wire Q_full_speed_gate;
  wire Q_half_speed_gate;

  fabric_clock_rtl UUT0 (
    .D_full_speed(D),
    .D_half_speed(D),
    .CLK(CLK),
    .Q_full_speed(Q_full_speed_rtl),
    .Q_half_speed(Q_half_speed_rtl)
  );

  fabric_clock_gate UUT1 (
    .D_full_speed(D),
    .D_half_speed(D),
    .CLK(CLK),
    .Q_full_speed(Q_full_speed_gate),
    .Q_half_speed(Q_half_speed_gate)
  );
  
  always
    #5 CLK = ~CLK;

  initial begin
    #100;
    repeat (25) begin
      @(posedge CLK);
      #1 D = $random;
    end
    #100;
    $display ("\n\nSimulation completed at simulation time %t\n", $realtime);
    $finish;
  end
  
  initial begin
    $dumpfile("fabric_clock.vcd");
    $dumpvars(3,testbench);
  end

  initial
    $timeformat(-9,0," ns", 5);
  
  initial
    $monitor("Time: %t: D=%b, Q_full_speed_rtl=%b, Q_full_speed_gate=%b, Q_half_speed_rtl=%b, Q_half_speed_gate=%b", $realtime, D, Q_full_speed_rtl, Q_full_speed_gate, Q_half_speed_rtl, Q_half_speed_gate);
  

endmodule