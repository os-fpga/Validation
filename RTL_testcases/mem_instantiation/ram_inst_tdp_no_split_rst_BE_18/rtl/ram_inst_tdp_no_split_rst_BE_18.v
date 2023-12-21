module ram_inst_tdp_no_split_rst_BE_18 (
  input rstn, clock0, clock1, weA, weB, 
  input [1:0] beA, beB,
  input [9:0] addrA, addrB,
  input [17:0] dinA, dinB, 
  output reg [17:0] doutA, doutB);

parameter [80:0] MODE_BITS =81'h49200000002490000000;

wire [17:0] doutA_reg, doutB_reg;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 1'h0, addrA, 4'h0 }),
    .ADDR_A2({ addrA, 4'h0 }),
    .ADDR_B1({ 1'h0, addrB, 4'h0 }),
    .ADDR_B2({ addrB, 4'h0 }),
    .BE_A1(beA),
    .BE_A2(0),
    .BE_B1(beB),
    .BE_B2(0),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock1),
    .CLK_B2(clock1),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(doutA_reg[17:0]),
    .RDATA_A2(),
    .RDATA_B1(doutB_reg[17:0]),
    .RDATA_B2(),
    .REN_A1(~weA),
    .REN_A2(0),
    .REN_B1(~weB),
    .REN_B2(0),
    .WDATA_A1(dinA[17:0]),
    .WDATA_A2(0),
    .WDATA_B1(dinB[17:0]),
    .WEN_A1(weA),
    .WEN_A2(0),
    .WEN_B1(weB),
    .WEN_B2(0)
  );
 always @(posedge clock0  or negedge rstn)
        if (rstn == 1'b0)
            doutA <= 1'b0;
        else 
            doutA <= doutA_reg;

always @(posedge clock1  or negedge rstn)
        if (rstn == 1'b0)
            doutB <= 1'b0;
        else 
            doutB <= doutB_reg;
 

endmodule