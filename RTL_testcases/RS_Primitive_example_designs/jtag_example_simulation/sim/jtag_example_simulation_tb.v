
module jtag_example_tb;

  //Ports
reg  clk;
wire  tdi;
reg  tdo;
wire  tms;
wire  reset_n;
reg  en;

jtag_example_simulation  jtag_example_simulation_inst (
  .clock(clk),
  .tdi(tdi),
  .tdo(tdo),
  .tms(tms),
  .reset_n(reset_n),
  .en(en)
);

  always #1  clk = ! clk;

  initial begin
    clk = 0;
    en = 0;
    reset_n = 0;
    
    $display("Starting testbench");

    #5
    reset_n = 1;
    en = 1;
      
    //ensure initial state
    tms = 1'b1; #1 #1

   //run test idle
    tms = 1'b0; #1 #1
    tms = 1'b0; #1 #1
    //move to shift IR
    tms = 1'b1; #1 #1
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1
    tms = 1'b0; #1 #1
    // shifting in IR value
    tdi = 1'b0; #1 #1
    tdi = 1'b0; #1 #1
    tdi = 1'b1; #1 #1
    tdi = 1'b0; 
    // move into latch IR
    tms = 1'b1; #1 #1
    //move into shift DR
    tms = 1'b1; #1 #1
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1
    //shift 32 bits
    tdi = 1'b1;
    `DELAY_31
    `DELAY_31
    //go into exit1 DR
    tms = 1'b1; #1 #1
    //return to run test idle
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1

    //<-Change IR and set val to write->
     //run test idle
    tms = 1'b0; #1 #1
    tms = 1'b0; #1 #1
    //move to shift IR
    tms = 1'b1; #1 #1
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1
    tms = 1'b0; #1 #1
    // shifting in IR value
    tdi = 1'b0; #1 #1
    tdi = 1'b0; #1 #1
    tdi = 1'b1; #1 #1
    tdi = 1'b1; 
    // move into latch IR
    tms = 1'b1; #1 #1
    //move into shift DR
    tms = 1'b1; #1 #1
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1
    //shift 32 bits
    tdi = 1'b1;
    #31;
    #31;
    //go into exit1 DR
    tms = 1'b1; #1 #1
    //return to run test idle
    tms = 1'b1; #1 #1
    tms = 1'b0; #1 #1

    $display("Starting completed");

    #100;

    $finish;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

endmodule 

