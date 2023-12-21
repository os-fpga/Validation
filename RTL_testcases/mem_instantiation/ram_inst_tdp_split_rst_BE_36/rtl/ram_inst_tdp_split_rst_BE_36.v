

module ram_inst_tdp_split_rst_BE_36 (
  input clkA, clkB, weA, weB, rstn, outA_enable, outB_enable,
  input [1:0] beA, beB,
  input [9:0] addrA, addrB,
  input [35:0] dinA, dinB, 
  output reg [35:0] doutA, doutB);

parameter [80:0] MODE_BITS =81'h10000001B6C0000000DB6;

wire [35:0] doutA_reg, doutB_reg;

 RS_TDP36K  #(.MODE_BITS(81'h10000001B6C0000000DB6))
  inst1(
    .ADDR_A1({ 1'b0, addrA, 4'h00 }),
    .ADDR_A2({ addrA, 4'h00 }),
    .ADDR_B1({ 1'b0, addrB, 4'h00 }),
    .ADDR_B2({ addrB, 4'h00 }),
    .BE_A1(beA),
    .BE_A2(beA),
    .BE_B1(beB),
    .BE_B2(beB),
    .CLK_A1(clkA),
    .CLK_A2(clkA),
    .CLK_B1(clkB),
    .CLK_B2(clkB),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1({doutA_reg[33:32],doutA_reg[15:0]}),
    .RDATA_A2({doutA_reg[35:34],doutA_reg[31:16]}),
    .RDATA_B1({doutB_reg[33:32],doutB_reg[15:0]}),
    .RDATA_B2({doutB_reg[35:34],doutB_reg[31:16]}),
    .REN_A1(1),
    .REN_A2(1),
    .REN_B1(1),
    .REN_B2(1),
    .WDATA_A1({dinA[33:32],dinA[15:0]}),
    .WDATA_A2({dinA[35:34],dinA[31:16]}),
    .WDATA_B1({dinB[33:32],dinB[15:0]}),
    .WDATA_B2({dinB[35:34],dinB[31:16]}),
    .WEN_A1(weA),
    .WEN_A2(weA),
    .WEN_B1(weB),
    .WEN_B2(weB)
  );
 
 always @(posedge clkA )
        if (rstn == 1'b0)
            doutA <= 1'b0;
        else if (outA_enable)
            doutA <= doutA_reg;

always @(posedge clkB )
        if (rstn == 1'b0)
            doutB <= 1'b0;
        else if (outB_enable)
            doutB <= doutB_reg;
endmodule
