module ram_inst_tdp_no_split_rst_36 (
  input rstn, clock0, clock1, weA, weB, reA, reB,
  input [9:0] addrA, addrB,
  input [35:0] dinA, dinB, 
  output reg [35:0] doutA, doutB);


parameter [80:0] MODE_BITS =81'hdb600000000000000000;

wire [35:0] doutA_reg, doutB_reg;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ addrA, 5'h00 }),
    .ADDR_A2({ addrA[8:0], 5'h00 }),
    .ADDR_B1({ addrB, 5'h00 }),
    .ADDR_B2({ addrB[8:0], 5'h00 }),
    .BE_A1(3),
    .BE_A2(3),
    .BE_B1(3),
    .BE_B2(3),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock1),
    .CLK_B2(clock1),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1({doutA_reg[33:32],doutA_reg[15:0]}),
    .RDATA_A2({doutA_reg[35:34],doutA_reg[31:16]}),
    .RDATA_B1({doutB_reg[33:32],doutB_reg[15:0]}),
    .RDATA_B2({doutB_reg[35:34],doutB_reg[31:16]}),
    .REN_A1(reA),
    .REN_A2(reA),
    .REN_B1(reB),
    .REN_B2(reB),
    .WDATA_A1({dinA[33:32],dinA[15:0]}),
    .WDATA_A2({dinA[35:34],dinA[31:16]}),
    .WDATA_B1({dinB[33:32],dinB[15:0]}),
    .WDATA_B2({dinB[35:34],dinB[31:16]}),
    .WEN_A1(weA),
    .WEN_A2(weA),
    .WEN_B1(weB),
    .WEN_B2(weB)
  );

always @(posedge clock0)
        if (rstn == 1'b0)
            doutA <= 1'b0;
        else
            doutA <= doutA_reg;

always @(posedge clock1)
        if (rstn == 1'b0)
            doutB <= 1'b0;
        else
            doutB <= doutB_reg;
 

endmodule