 
module co_sim_TDP_RAM18KX2_primitive_inst;
  reg WEN_A1; // Write-enable port A, RAM 1
  reg WEN_B1; // Write-enable port B, RAM 1
  reg REN_A1; // Read-enable port A, RAM 1
  reg REN_B1; // Read-enable port B, RAM 1
  reg CLK_A1; // Clock port A, RAM 1
  reg CLK_B1; // Clock port B, RAM 1
  reg [1:0] BE_A1; // Byte-write enable port A, RAM 1
  reg [1:0] BE_B1; // Byte-write enable port B, RAM 1
  reg [13:0] ADDR_A1; // Address port A, RAM 1
  reg [13:0] ADDR_B1; // Address port B, RAM 1
  reg [15:0] WDATA_A1; // Write data port A, RAM 1
  reg [1:0] WPARITY_A1; // Write parity port A, RAM 1
  reg [15:0] WDATA_B1; // Write data port B, RAM 1
  reg [1:0] WPARITY_B1; // Write parity port B, RAM 1
  wire [15:0] RDATA_A1; // Read data port A, RAM 1
  wire [1:0] RPARITY_A1; // Read parity port A, RAM 1
  wire [15:0] RDATA_B1; // Read data port B, RAM 1
  wire [1:0] RPARITY_B1; // Read parity port B, RAM 1
  reg WEN_A2; // Write-enable port A, RAM 2
  reg WEN_B2; // Write-enable port B, RAM 2
  reg REN_A2; // Read-enable port A, RAM 2
  reg REN_B2; // Read-enable port B, RAM 2
  reg CLK_A2; // Clock port A, RAM 2
  reg CLK_B2; // Clock port B, RAM 2
  reg [1:0] BE_A2; // Byte-write enable port A, RAM 2
  reg [1:0] BE_B2; // Byte-write enable port B, RAM 2
  reg [13:0] ADDR_A2; // Address port A, RAM 2
  reg [13:0] ADDR_B2; // Address port B, RAM 2
  reg [15:0] WDATA_A2; // Write data port A, RAM 2
  reg [1:0] WPARITY_A2; // Write parity port A, RAM 2
  reg [15:0] WDATA_B2; // Write data port B, RAM 2
  reg [1:0] WPARITY_B2; // Write parity port B, RAM 2
  wire [15:0] RDATA_A2; // Read data port A, RAM 2
  wire [1:0] RPARITY_A2; // Read parity port A, RAM 2
  wire [15:0] RDATA_B2; // Read data port B, RAM 2
  wire [1:0] RPARITY_B2;
   // Read parity port B, RAM 2

reg [31:0] RDATA_A1_expected, RDATA_A2_expected;
reg [31:0] RDATA_B1_expected, RDATA_B2_expected;

`ifdef PNR
		TDP_RAM18KX2_primitive_inst DUT (.*); //add ports later
`else
   	TDP_RAM18KX2_primitive_inst DUT (.*);
`endif
integer mismatch=0,i;


always #10 CLK_A1 = ~CLK_A1;
always #5 CLK_B1 = ~CLK_B1;

always #10 CLK_A2 = ~CLK_A2;
always #5 CLK_B2 = ~CLK_B2;

initial begin
  WEN_A1 <= 0; // Write-enable port A
  WEN_B1 <= 0; // Write-enable port B
  REN_A1 <= 0; // Read-enable port A
  REN_B1 <= 0; // Read-enable port B
  CLK_A1 <= 0; // Clock port A
  CLK_B1 <= 0; // Clock port B
  ADDR_A1 <= 0; // Address port A, align MSBs and connect unused MSBs to logic 0
  ADDR_B1 <= 0; // Address port B, align MSBs and connect unused MSBs to logic 0
  WDATA_A1 <= 0; // Write data port A
  WDATA_B1 <= 0; 
  WEN_A2 <= 0; // Write-enable port A
  WEN_B2 <= 0; // Write-enable port B
  REN_A2 <= 0; // Read-enable port A
  REN_B2 <= 0; // Read-enable port B
  CLK_A2 <= 0; // Clock port A
  CLK_B2 <= 0; // Clock port B
  ADDR_A2 <= 0; // Address port A, align MSBs and connect unused MSBs to logic 0
  ADDR_B2 <= 0; // Address port B, align MSBs and connect unused MSBs to logic 0
  WDATA_A2 <= 0; // Write data port A
  WDATA_B2 <= 0; 
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A1 <= $urandom; 
    WEN_B1 <= $urandom; 
    REN_A1 <= $urandom; 
    REN_B1 <= $urandom;     
    ADDR_A1 <= $urandom_range(0,512); 
    ADDR_B1 <= $urandom_range(513,1023); 
    WDATA_A1 <= $urandom; 
    WDATA_B1 <= $urandom; 
    @ (negedge CLK_A1);
    compare;
  end
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A1 <= $urandom; 
    WEN_B1 <= $urandom; 
    REN_A1 <= $urandom; 
    REN_B1 <= $urandom;     
    ADDR_B1 <= $urandom_range(0,512); 
    ADDR_A1 <= $urandom_range(513,1023); 
    WDATA_A1 <= $urandom; 
    WDATA_B1 <= $urandom; 
    @ (negedge CLK_A1);
    compare;
  end
  repeat (10) @ (negedge CLK_A1)
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end
initial begin
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A2 <= $urandom; 
    WEN_B2 <= $urandom; 
    REN_A2 <= $urandom; 
    REN_B2 <= $urandom;     
    ADDR_A2 <= $urandom_range(0,512); 
    ADDR_B2 <= $urandom_range(513,1023); 
    WDATA_A2 <= $urandom; 
    WDATA_B2 <= $urandom; 
    @ (negedge CLK_B2);
    compare;
  end
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A2 <= $urandom; 
    WEN_B2 <= $urandom; 
    REN_A2 <= $urandom; 
    REN_B2 <= $urandom;     
    ADDR_B2 <= $urandom_range(0,512); 
    ADDR_A2 <= $urandom_range(513,1023); 
    WDATA_A2 <= $urandom; 
    WDATA_B2 <= $urandom; 
    @ (negedge CLK_B2);
    compare;
  end
end

//memory behaviour
reg [15:0] memory1 [1023:0];
reg [15:0] memory2 [1023:0];
always @(posedge CLK_A1)
  begin
      
      if (WEN_A1) begin
          memory1[ADDR_A1] <= WDATA_A1;
      end
      if(REN_A1)
          if (WEN_A1)
              RDATA_A1_expected = WDATA_A1;
          else
              RDATA_A1_expected = memory1[ADDR_A1];
  end
always @(posedge CLK_B1)
  begin
      if (WEN_B1) begin
          memory1[ADDR_B1] <= WDATA_B1;
      end
      if(REN_B1)
          if (WEN_B1)
              RDATA_B1_expected = WDATA_B1;
          else
              RDATA_B1_expected = memory1[ADDR_B1];
          
  end
always @(posedge CLK_A2)
  begin
      
      if (WEN_A2) begin
          memory2[ADDR_A2] <= WDATA_A2;
      end
      if(REN_A2)
          if (WEN_A2)
              RDATA_A2_expected = WDATA_A2;
          else
              RDATA_A2_expected = memory2[ADDR_A2];
  end
always @(posedge CLK_B2)
  begin
      if (WEN_B2) begin
          memory2[ADDR_B2] <= WDATA_B2;
      end
      if(REN_B2)
          if (WEN_B2)
              RDATA_B2_expected = WDATA_B2;
          else
              RDATA_B2_expected = memory2[ADDR_B2];
          
  end

task compare;
 	
  if(RDATA_A1 !== RDATA_A1_expected) begin
    $display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A1_expected, RDATA_A1, $time);
    mismatch = mismatch+1;
  end
  else
    $display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A1_expected ,RDATA_A1, $time);


  if(RDATA_B1 !== RDATA_B1_expected) begin
    $display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B1_expected, RDATA_B1, $time);
    mismatch = mismatch+1;
  end
  else
    $display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B1_expected ,RDATA_B1, $time);

  if(RDATA_A2 !== RDATA_A2_expected) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A2_expected, RDATA_A2, $time);
    	mismatch = mismatch+1;
 	end
  else
    $display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A2_expected ,RDATA_A2, $time);


  if(RDATA_B2 !== RDATA_B2_expected) begin
    $display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B2_expected, RDATA_B2, $time);
    mismatch = mismatch+1;
  end
  else
    $display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B2_expected ,RDATA_B2, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
