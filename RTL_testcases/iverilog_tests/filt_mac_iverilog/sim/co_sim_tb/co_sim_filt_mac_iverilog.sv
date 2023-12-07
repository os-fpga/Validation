// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`timescale 1ns/1ps
// -------------------------------------------------------------------
`define DIV2(N) ((N/2)+(N%2))
`define NULL 
module co_sim_filt_mac_iverilog;

  // Parameters
  parameter gp_inp_width        = 8;
  parameter gp_coeff_length     = 17;
  parameter gp_coeff_width      = 12;
  parameter gp_symm             = 1;
  parameter gp_oup_width        = gp_inp_width + gp_coeff_width + gp_coeff_length;

  // Inputs
  reg i_rst_an;
  reg i_ena;
  reg i_clk;
  reg signed [gp_inp_width-1:0] i_data;

  // Outputs
  wire signed [gp_oup_width-1:0] o_data;
  wire o_done;

`ifdef PNR
    filt_mac_iverilog dut (    i_rst_an ,
    i_ena ,
    i_clk ,
    o_done ,
    o_data[0] ,
    o_data[1] ,
    o_data[2] ,
    o_data[3] ,
    o_data[4] ,
    o_data[5] ,
    o_data[6] ,
    o_data[7] ,
    o_data[8] ,
    o_data[9] ,
    o_data[10] ,
    o_data[11] ,
    o_data[12] ,
    o_data[13] ,
    o_data[14] ,
    o_data[15] ,
    o_data[16] ,
    o_data[17] ,
    o_data[18] ,
    o_data[19] ,
    o_data[20] ,
    o_data[21] ,
    o_data[22] ,
    o_data[23] ,
    o_data[24] ,
    o_data[25] ,
    o_data[26] ,
    o_data[27] ,
    o_data[28] ,
    o_data[29] ,
    o_data[30] ,
    o_data[31] ,
    o_data[32] ,
    o_data[33] ,
    o_data[34] ,
    o_data[35] ,
    o_data[36]  );
`else
     filt_mac_iverilog dut (.*);
`endif    
  
  // Clock generation
  always begin
    #5 i_clk = ~i_clk;
  end

  // Initialize signals
  initial begin
    i_rst_an = 0;
    i_ena = 0;
    i_clk = 0;
    i_data = 0;
    #10 i_rst_an = 1;  // Release reset
    #20 i_ena = 1;    // Enable filter
    #30 i_data = 128;   // Example input data
    #150;
    for (integer i=0; i<10; i=i+1)begin
      i_data = $random;   // Example input data
      repeat (1) @ (negedge i_clk)
        if (o_done) begin
          $display("Output Data: %d", o_data);
        end else begin
          $display("Error: Filter did not complete");
        end
    end
    $finish;         // End simulation
  end
  

`ifdef VCD
  initial
     begin
       $sformat(filename_vcd,"%s%0d%s","filt_mac_",`TESTCASE,".vcd");
       $dumpfile(filename_vcd);
       $dumpvars(0,filt_mac_tb);
     end
`endif
    
endmodule
