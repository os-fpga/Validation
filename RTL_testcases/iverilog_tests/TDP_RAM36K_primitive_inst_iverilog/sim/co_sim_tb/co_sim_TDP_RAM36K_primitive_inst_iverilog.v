 
module co_sim_TDP_RAM36K_primitive_inst_iverilog;
   reg WEN_A; // Write-enable port A
  reg WEN_B; // Write-enable port B
  reg REN_A; // Read-enable port A
  reg REN_B; // Read-enable port B
  reg CLK_A; // Clock port A
  reg CLK_B; // Clock port B
  reg [14:0] ADDR_A; // Address port A, align MSBs and connect unused MSBs to logic 0
  reg [14:0] ADDR_B; // Address port B, align MSBs and connect unused MSBs to logic 0
  reg [31:0] WDATA_A; // Write data port A
  reg [31:0] WDATA_B; // Write data port B
  wire [31:0] RDATA_A; // Read data port A
  wire [31:0] RDATA_B; // Read data port B

reg [31:0] RDATA_A_expected;
reg [31:0] RDATA_B_expected;

`ifdef PNR
`else
   	TDP_RAM36K_primitive_inst_iverilog DUT (.*);
`endif
integer mismatch=0,i;


always #10 CLK_A = ~CLK_A;
always #5 CLK_B = ~CLK_B;

initial begin
  WEN_A <= 0; // Write-enable port A
  WEN_B <= 0; // Write-enable port B
  REN_A <= 0; // Read-enable port A
  REN_B <= 0; // Read-enable port B
  CLK_A <= 0; // Clock port A
  CLK_B <= 0; // Clock port B
  ADDR_A <= 0; // Address port A, align MSBs and connect unused MSBs to logic 0
  ADDR_B <= 0; // Address port B, align MSBs and connect unused MSBs to logic 0
  WDATA_A <= 0; // Write data port A
  WDATA_B <= 0; 
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A <= $urandom; 
    WEN_B <= $urandom; 
    REN_A <= $urandom; 
    REN_B <= $urandom;     
    ADDR_A <= $urandom_range(0,512); 
    ADDR_B <= $urandom_range(513,1023); 
    WDATA_A <= $urandom; 
    WDATA_B <= $urandom; 
    @ (negedge CLK_A);
    compare;
  end
  for (i = 0 ; i<500 ; i=i+1) begin
    WEN_A <= $urandom; 
    WEN_B <= $urandom; 
    REN_A <= $urandom; 
    REN_B <= $urandom;     
    ADDR_B <= $urandom_range(0,512); 
    ADDR_A <= $urandom_range(513,1023); 
    WDATA_A <= $urandom; 
    WDATA_B <= $urandom; 
    @ (negedge CLK_A);
    compare;
  end
  if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	$finish;
end

//memory behaviour
reg [31:0] memory [1023:0];
always @(posedge CLK_A)
  begin
      
      if (WEN_A) begin
          memory[ADDR_A] <= WDATA_A;
      end
      if(REN_A)
          if (WEN_A)
              RDATA_A_expected = WDATA_A;
          else
              RDATA_A_expected = memory[ADDR_A];
  end
always @(posedge CLK_B)
  begin
      if (WEN_B) begin
          memory[ADDR_B] <= WDATA_B;
      end
      if(REN_B)
          if (WEN_B)
              RDATA_B_expected = WDATA_B;
          else
              RDATA_B_expected = memory[ADDR_B];
          
  end

task compare;
 	
  	if(RDATA_A !== RDATA_A_expected) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A_expected, RDATA_A, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_A_expected ,RDATA_A, $time);


    if(RDATA_B !== RDATA_B_expected) begin
    	$display("Data Mismatch. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B_expected, RDATA_B, $time);
    	mismatch = mismatch+1;
 	end
  	else
  		$display("Data Matched. Expected Out : %0b, Netlist: %0b, Time: %0t", RDATA_B_expected ,RDATA_B, $time);
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end
endmodule
