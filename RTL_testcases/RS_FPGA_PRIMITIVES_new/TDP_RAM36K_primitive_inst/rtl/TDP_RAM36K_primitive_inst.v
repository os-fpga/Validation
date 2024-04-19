
module TDP_RAM36K_primitive_inst (
  input WEN_A, // Write-enable port A
  input WEN_B, // Write-enable port B
  input REN_A, // Read-enable port A
  input REN_B, // Read-enable port B
  input CLK_A, // Clock port A
  input CLK_B, // Clock port B
  input [14:0] ADDR_A, // Address port A, align MSBs and connect unused MSBs to logic 0
  input [14:0] ADDR_B, // Address port B, align MSBs and connect unused MSBs to logic 0
  input [31:0] WDATA_A, // Write data port A
  input [31:0] WDATA_B, // Write data port B
  output [31:0] RDATA_A, // Read data port A
  output [31:0] RDATA_B // Read data port B
);
wire temp1,temp2;
TDP_RAM36K #(
  .INIT({32768{1'b0}}), // Initial Contents of memory
  .INIT_PARITY({2048{1'b0}}), // Initial Contents of memory
  .WRITE_WIDTH_A(36), // Write data width on port A (1-36)
  .READ_WIDTH_A(36), // Read data width on port A (1-36)
  .WRITE_WIDTH_B(36), // Write data width on port B (1-36)
  .READ_WIDTH_B(36) // Read data width on port B (1-36)
)inst (
  .WEN_A(WEN_A), // Write-enable port A
  .WEN_B(WEN_B), // Write-enable port B
  .REN_A(REN_A), // Read-enable port A
  .REN_B(REN_B), // Read-enable port B
  .CLK_A(CLK_A), // Clock port A
  .CLK_B(CLK_B), // Clock port B
  .BE_A({WEN_A,WEN_A,WEN_A, WEN_A}), // Byte-write enable port A
  .BE_B({WEN_B,WEN_B,WEN_B, WEN_B}), // Byte-write enable port B
  .ADDR_A(ADDR_A), // Address port A, align MSBs and connect unused MSBs to logic 0
  .ADDR_B(ADDR_B), // Address port B, align MSBs and connect unused MSBs to logic 0
  .WDATA_A(WDATA_A), // Write data port A
  .WPARITY_A(0), // Write parity data port A
  .WDATA_B(WDATA_B), // Write data port B
  .WPARITY_B(0), // Write parity port B
  .RDATA_A(RDATA_A), // Read data port A
  .RPARITY_A(temp1), // Read parity port A
  .RDATA_B(RDATA_B), // Read data port B
  .RPARITY_B(temp2)
);
endmodule
