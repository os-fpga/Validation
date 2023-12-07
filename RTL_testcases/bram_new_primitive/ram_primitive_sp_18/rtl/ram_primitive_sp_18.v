

module ram_primitive_sp_18 (
  input clock0, we,
  input [9:0] addr, 
  input [17:0] din, 
  output [17:0] dout);

TDP_RAM36K #(.INIT({32768{1'b0}}), // Initial Contents of memory
  .INIT_PARITY({2048{1'b0}}), // Initial Contents of memory
  .WRITE_WIDTH_A(18), // Write data width on port A (1-36)
  .READ_WIDTH_A(18), // Read data width on port A (1-36)
  .WRITE_WIDTH_B(0), // Write data width on port B (1-36)
  .READ_WIDTH_B(0) // Read data width on port B (1-36)
) inst ( 
  .WEN_A(we), // Write-enable port A
  .WEN_B(0), // Write-enable port B
  .REN_A(1), // Read-enable port A
  .REN_B(0), // Read-enable port B
  .CLK_A(clock0), // Clock port A
  .CLK_B(0), // Clock port B
  .BE_A(4'b1111), // Byte-write enable port A
  .BE_B(0), // Byte-write enable port B
  .ADDR_A(addr), // Address port A, align MSBs and connect unused MSBs to logic 0
  .ADDR_B(0), // Address port B, align MSBs and connect unused MSBs to logic 0
  .WDATA_A(din), // Write data port A
  .WPARITY_A(0), // Write parity data port A
  .WDATA_B(0), // Write data port B
  .WPARITY_B(0), // Write parity port B
  .RDATA_A(dout), // Read data port A
  .RPARITY_A(), // Read parity port A
  .RDATA_B(), // Read data port B
  .RPARITY_B() // Read parity port B
);

 

endmodule
