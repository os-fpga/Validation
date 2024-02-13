`timescale 1ns/1ps

module ahb_master_example_simulation_tb;

  // Parameters
localparam C_S_AXI_ID_WIDTH      = 4;
localparam C_S_AXI_DATA_WIDTH    = 32;
localparam C_S_AXI_ADDR_WIDTH    = 32;
localparam int unsigned JTAG_PERIOD = 33;   // a 20MHz TCK clock
localparam int unsigned JTAG_IRLEN = 5;
localparam int unsigned REG1_SIZE = C_S_AXI_DATA_WIDTH + C_S_AXI_ADDR_WIDTH + 4;
localparam int unsigned REG2_SIZE = C_S_AXI_DATA_WIDTH + 2;

localparam IDCODE         = 5'b00010;
localparam AXI_IN         = 5'b00100;
localparam AXI_OUT        = 5'b01000;
localparam BYPASS         = 5'b11111;
  // Ports
    reg  s_ahb_aclk;
    reg  jtag_tms = 0;
    reg  jtag_tdi = 0;
    wire  jtag_tdo;
    reg  s_ahb_aresetn = 0;

    always  #(2.5)     s_ahb_aclk = !s_ahb_aclk;

    reg [C_S_AXI_DATA_WIDTH-1 : 0] dr_out;

    ahb_slave_example_simulation 
    ahb_slave_example_simulation_dut (
      .s_ahb_aclk (s_ahb_aclk ),
      .jtag_tms (jtag_tms ),
      .jtag_tdi (jtag_tdi ),
      .jtag_tdo (jtag_tdo ),
      .s_ahb_aresetn (s_ahb_aresetn )
    );

    initial begin
    integer j,k,file;
        RESET();
        $dumpfile("tb.vcd");
        $dumpvars;

        jtag_hard_rst();
        jtag_rst(); 
      
                                  
        jtag_selectir (AXI_IN); 
       
        jtag_senddr   (REG1_SIZE, {{2'b00}, {32'h00000046}, {32'h02000008}, {2'b11}}, dr_out);  // TCUR set to Value compare
        jtag_selectir (AXI_IN); 
        jtag_senddr   (REG1_SIZE, {{2'b00}, {32'd27637}, {32'h02000010}, {2'b11}}, dr_out);  // Writing value to TDCR register for comparision
        
        jtag_selectir (AXI_IN); 
        jtag_senddr   (REG1_SIZE, {{2'b00}, {32'h00000006}, {32'h0200000C}, {2'b11}}, dr_out); // Setting TMTR register to post trigger and enabling ocla
        
        jtag_selectir (AXI_IN); 
        jtag_senddr   (REG1_SIZE, {{2'b00}, {32'hFFFFFFFF}, {32'h01000004}, {2'b11}}, dr_out);  // start DUT counter
                                  // burst  // 64-bit Data  // 32-bit Addr  // w/r + requests
       
        while(dr_out[0]==0) begin
        jtag_selectir (AXI_IN);
        jtag_senddr   (REG1_SIZE, {{2'b00}, {C_S_AXI_DATA_WIDTH{1'b0}}, {32'h02000000}, {2'b01}}, dr_out);
        jtag_selectir (AXI_OUT);  
        jtag_senddr   (REG2_SIZE, {REG2_SIZE{1'b0}}, dr_out); 
        end

        file = $fopen("ocla_dump.txt","w");
        $fdisplay(file,"%S","1st Run:  Trigger Type = Post Trigger:  Trigger = Value Compare(27637)\n\n");
        
        for (j=0 ; j < 64 ; j=j+1)
        begin
          jtag_selectir (AXI_IN); 
          jtag_senddr   (REG1_SIZE, {{2'b00}, {C_S_AXI_DATA_WIDTH{1'b0}}, {32'h02000004}, {2'b01}}, dr_out);  
          jtag_selectir (AXI_OUT);  
          jtag_senddr   (REG2_SIZE, {REG2_SIZE{1'b0}}, dr_out); 
         
          $fdisplay(file,"%S%d","Buffer Value",dr_out);
        end
      $fdisplay(file,"%S","1st Run Completed  \n");

      end

      // ---------------------------------------------------------------
  // RESET
  // ---------------------------------------------------------------
    task RESET;
    begin
      RESETn <= 'b1;
      #20;
      repeat (2) @(posedge ACLK);
      RESETn <= 'b0;
      #1;
      repeat (2) @(posedge ACLK);
      #20;
      RESETn <= 'b1;
    end
  endtask

        
    initial begin
      $fsdbDumpfile("waves.fsdb");
      $fsdbDumpvars(0,"+struct","+mda","+all");
     end


         
  // **************************** reset ****************************
    task jtag_rst;
    integer halfperiod;
    begin
      if ($test$plusargs("debug"))
        $display("%t: rst start", $time);
      halfperiod = JTAG_PERIOD / 2;
      JTAG_TCK = 1'b0;
      JTAG_TMS = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;    // first posedge on tck
      JTAG_TCK = #halfperiod 1'b0;    // first negedge on tck
      JTAG_TMS = 1'b1; 
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;
      JTAG_TCK = #halfperiod 1'b0;
      if ($test$plusargs("debug"))
        $display("%t: rst done", $time);
    end
  endtask

  // **************************** hard reset ****************************
  task jtag_hard_rst;
    integer halfperiod;
    begin
      if ($test$plusargs("debug"))
        $display("%t: hard rst start", $time);

      halfperiod = JTAG_PERIOD / 2;
      JTAG_TCK  = 1'b0;
      JTAG_TRST = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b1;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TRST = 1'b0;
      JTAG_TCK = #halfperiod 1'b0;
      if ($test$plusargs("debug"))
        $display("%t: hard rst end", $time);

    end
  endtask

  // **************************** select IR ****************************
  task jtag_selectir 
  (
    input [JTAG_IRLEN-1:0] instruction
  );
    integer                 halfperiod;
    integer                 i;
    begin
//      if ($test$plusargs("debug"))
        $display("%t: select ir start, ir=0x%0h", $time, instruction);

      halfperiod = JTAG_PERIOD / 2;
      JTAG_TCK  = 1'b0; // TODO: buggy?
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //selectDR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //selectIR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //captureIR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //shiftIR
      
//      if ($test$plusargs("debug"))
        $display("%t: select ir capture start", $time);
      
      // shifting 5 bits into the IR
      for (i=0 ; i < JTAG_IRLEN ; i=i+1)
        begin
          JTAG_TCK = #halfperiod 1'b1;
          JTAG_TCK = #halfperiod 1'b0;
          if (i == (JTAG_IRLEN - 1) )
            JTAG_TMS = 1'b1;             //exit1IR
          else
            JTAG_TMS = 1'b0;             //shiftIR
          JTAG_TDI = instruction[i];
        end
        
//      if ($test$plusargs("debug"))
        $display("%t: select ir capture end", $time);
        
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //pauseIR
      JTAG_TDI = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //exit2IR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //updateIR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle

      JTAG_TCK = #halfperiod 1'b0;
      
//      if ($test$plusargs("debug"))
        $display("%t: select ir end", $time);
    end
  endtask
  
    // **************************** send DR ****************************
  task jtag_senddr (
    input integer number,   // input size of reg                    // 10, 11, 12
    input [127:0] data,     // input the data to be sent to DR      // 'h11, 'h22, 'h33
    output [127:0] dr_out   // the data received from DR            // 
    );
    integer       halfperiod;
    integer       i;
    logic [127:0] data_out;
    begin
//      if ($test$plusargs("debug"))
        $display("%t: select dr start, dr=0x%0h", $time, data);

      data_out = 0;
      halfperiod = JTAG_PERIOD / 2;
      JTAG_TCK  = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //selectDR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //captureDR
      JTAG_TCK = #halfperiod 1'b1;
      
      // com/uncom
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //shiftDR
      
      for (i=0 ; i < number ; i=i+1)
        begin
          JTAG_TCK = #halfperiod 1'b1;
          if (i > 0)
            data_out[i-1] = JTAG_TDO;
          JTAG_TCK = #halfperiod 1'b0;
          if (i == (number - 1) )
            JTAG_TMS = 1'b1;             //exit1DR
          else
            JTAG_TMS = 1'b0;             //shiftDR
          JTAG_TDI = data[i];
        end
        
      JTAG_TCK = #halfperiod 1'b1;
      data_out[number-1] = JTAG_TDO;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //pauseDR
      JTAG_TDI = 1'b0;
      JTAG_TCK = #halfperiod 1'b1;
      // com/uncom
      
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //exit2DR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b1;             //updateDR
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle
      JTAG_TCK = #halfperiod 1'b1;
      JTAG_TCK = #halfperiod 1'b0;
      JTAG_TMS = 1'b0;             //run-test-idle (his comments not mine)

      JTAG_TCK = #halfperiod 1'b0;
      dr_out = data_out;
//      if ($test$plusargs("debug"))
        $display("%t: data captured from register: 0x%0h", $time, data_out);
    end
  endtask

endmodule

