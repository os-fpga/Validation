

module TDP_RAM18KX2_primitive_inst (
  input WEN_A1, // Write-enable port A, RAM 1
  input WEN_B1, // Write-enable port B, RAM 1
  input REN_A1, // Read-enable port A, RAM 1
  input REN_B1, // Read-enable port B, RAM 1
  input CLK_A1, // Clock port A, RAM 1
  input CLK_B1, // Clock port B, RAM 1
  input [1:0] BE_A1, // Byte-write enable port A, RAM 1
  input [1:0] BE_B1, // Byte-write enable port B, RAM 1
  input [13:0] ADDR_A1, // Address port A, RAM 1
  input [13:0] ADDR_B1, // Address port B, RAM 1
  input [15:0] WDATA_A1, // Write data port A, RAM 1
  input [1:0] WPARITY_A1, // Write parity port A, RAM 1
  input [15:0] WDATA_B1, // Write data port B, RAM 1
  input [1:0] WPARITY_B1, // Write parity port B, RAM 1
  output reg [15:0] RDATA_A1, // Read data port A, RAM 1
  output reg [1:0] RPARITY_A1, // Read parity port A, RAM 1
  output reg [15:0] RDATA_B1, // Read data port B, RAM 1
  output reg [1:0] RPARITY_B1, // Read parity port B, RAM 1
  input WEN_A2, // Write-enable port A, RAM 2
  input WEN_B2, // Write-enable port B, RAM 2
  input REN_A2, // Read-enable port A, RAM 2
  input REN_B2, // Read-enable port B, RAM 2
  input CLK_A2, // Clock port A, RAM 2
  input CLK_B2, // Clock port B, RAM 2
  input [1:0] BE_A2, // Byte-write enable port A, RAM 2
  input [1:0] BE_B2, // Byte-write enable port B, RAM 2
  input [13:0] ADDR_A2, // Address port A, RAM 2
  input [13:0] ADDR_B2, // Address port B, RAM 2
  input [15:0] WDATA_A2, // Write data port A, RAM 2
  input [1:0] WPARITY_A2, // Write parity port A, RAM 2
  input [15:0] WDATA_B2, // Write data port B, RAM 2
  input [1:0] WPARITY_B2, // Write parity port B, RAM 2
  output reg [15:0] RDATA_A2, // Read data port A, RAM 2
  output reg [1:0] RPARITY_A2, // Read parity port A, RAM 2
  output reg [15:0] RDATA_B2, // Read data port B, RAM 2
  output reg [1:0] RPARITY_B2 // Read parity port B, RAM 2
);
	

  TDP_RAM18KX2 #(
    .INIT1({16384{1'b0}}), // Initial Contents of data memory, RAM 1
    .INIT1_PARITY({2048{1'b0}}), // Initial Contents of parity memory, RAM 1
    .WRITE_WIDTH_A1(18), // Write data width on port A, RAM 1 (1-18)
    .WRITE_WIDTH_B1(18), // Write data width on port B, RAM 1 (1-18)
    .READ_WIDTH_A1(18), // Read data width on port A, RAM 1 (1-18)
    .READ_WIDTH_B1(18), // Read data width on port B, RAM 1 (1-18)
    .INIT2({16384{1'b0}}), // Initial Contents of memory, RAM 2
    .INIT2_PARITY({2048{1'b0}}), // Initial Contents of memory, RAM 2
    .WRITE_WIDTH_A2(18), // Write data width on port A, RAM 2 (1-18)
    .WRITE_WIDTH_B2(18), // Write data width on port B, RAM 2 (1-18)
    .READ_WIDTH_A2(18), // Read data width on port A, RAM 2 (1-18)
    .READ_WIDTH_B2(18) // Read data width on port B, RAM 2 (1-18)
  ) inst (
    .WEN_A1(WEN_A1), // Write-enable port A, RAM 1
    .WEN_B1(WEN_B1), // Write-enable port B, RAM 1
    .REN_A1(REN_A1), // Read-enable port A, RAM 1
    .REN_B1(REN_B1), // Read-enable port B, RAM 1
    .CLK_A1(CLK_A1), // Clock port A, RAM 1
    .CLK_B1(CLK_B1), // Clock port B, RAM 1
    .BE_A1(BE_A1), // Byte-write enable port A, RAM 1
    .BE_B1(BE_B1), // Byte-write enable port B, RAM 1
    .ADDR_A1(ADDR_A1), // Address port A, RAM 1
    .ADDR_B1(ADDR_B1), // Address port B, RAM 1
    .WDATA_A1(WDATA_A1), // Write data port A, RAM 1
    .WPARITY_A1(WPARITY_A1), // Write parity port A, RAM 1
    .WDATA_B1(WDATA_B1), // Write data port B, RAM 1
    .WPARITY_B1(WPARITY_B1), // Write parity port B, RAM 1
    .RDATA_A1(RDATA_A1), // Read data port A, RAM 1
    .RPARITY_A1(RPARITY_A1), // Read parity port A, RAM 1
    .RDATA_B1(RDATA_B1), // Read data port B, RAM 1
    .RPARITY_B1(RPARITY_B1), // Read parity port B, RAM 1
    .WEN_A2(WEN_A2), // Write-enable port A, RAM 2
    .WEN_B2(WEN_B2), // Write-enable port B, RAM 2
    .REN_A2(REN_A2), // Read-enable port A, RAM 2
    .REN_B2(REN_B2), // Read-enable port B, RAM 2
    .CLK_A2(CLK_A2), // Clock port A, RAM 2
    .CLK_B2(CLK_B2), // Clock port B, RAM 2
    .BE_A2(BE_A2), // Byte-write enable port A, RAM 2
    .BE_B2(BE_B2), // Byte-write enable port B, RAM 2
    .ADDR_A2(ADDR_A2), // Address port A, RAM 2
    .ADDR_B2(ADDR_B2), // Address port B, RAM 2
    .WDATA_A2(WDATA_A2), // Write data port A, RAM 2
    .WPARITY_A2(WPARITY_A2), // Write parity port A, RAM 2
    .WDATA_B2(WDATA_B2), // Write data port B, RAM 2
    .WPARITY_B2(WPARITY_B2), // Write parity port B, RAM 2
    .RDATA_A2(RDATA_A2), // Read data port A, RAM 2
    .RPARITY_A2(RPARITY_A2), // Read parity port A, RAM 2
    .RDATA_B2(RDATA_B2), // Read data port B, RAM 2
    .RPARITY_B2(RPARITY_B2) // Read parity port B, RAM 2
  );

  endmodule