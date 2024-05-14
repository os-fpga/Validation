`timescale 1ns/1ps

module GJC7 #(
  parameter DATA_WIDTH = 36,
  parameter ADDR_WIDTH = 9
) (
  input CLKA,
  input CLKB,
  input WE,
  input RE,
  input [DATA_WIDTH-1:0] DIN,
  input [ADDR_WIDTH-1:0] ADDRA,
  input [ADDR_WIDTH-1:0] ADDRB,

  output reg [DATA_WIDTH-1:0] DOUT=0
);

  reg [DATA_WIDTH-1:0] RAM [2**ADDR_WIDTH-1:0];

  always @(posedge CLKA) begin
    if (WE)
      RAM[ADDRA] <= DIN;
  end

    always @(posedge CLKB) begin
    if (RE)
      DOUT <= RAM[ADDRB];
  end

endmodule
