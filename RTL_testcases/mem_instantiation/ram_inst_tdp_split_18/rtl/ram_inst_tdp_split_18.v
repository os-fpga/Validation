

module ram_inst_tdp_split_18 (
  input clock0, clock1, we1A, we1B,
  input [9:0] addr1A, addr1B,
  input  [17:0] din1A, din1B, 
  output [17:0] dout1A, dout1B,
  input clock2, clock3, we2A, we2B,
  input [9:0] addr2A, addr2B,
  input  [17:0] din2A, din2B, 
  output [17:0] dout2A, dout2B);

parameter [80:0] MODE_BITS =81'h49200000002490000001;
wire [17:0] dout1A_reg ,dout2A_reg ,dout1B_reg ,dout2B_reg;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 1'b0, addr1A, 4'h00 }),
    .ADDR_A2({ addr2A, 4'h00 }),
    .ADDR_B1({ 1'b0, addr1B, 4'h00 }),
    .ADDR_B2({ addr2B, 4'h00 }),
    .BE_A1(3),
    .BE_A2(3),
    .BE_B1(3),
    .BE_B2(3),
    .CLK_A1(clock0),
    .CLK_A2(clock2),
    .CLK_B1(clock1),
    .CLK_B2(clock3),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(dout1A),
    .RDATA_A2(dout2A),
    .RDATA_B1(dout1B),
    .RDATA_B2(dout2B),
    .REN_A1(1),
    .REN_A2(1),
    .REN_B1(1),
    .REN_B2(1),
    .WDATA_A1(din1A),
    .WDATA_A2(din2A),
    .WDATA_B1(din1B),
    .WDATA_B2(din2B),
    .WEN_A1(we1A),
    .WEN_A2(we2A),
    .WEN_B1(we1B),
    .WEN_B2(we2B)
  );
 
    // always @(posedge clock0)
    //     dout1A <= dout1A_reg;
    // always @(posedge clock2)
    //     dout2A <= dout2A_reg;
    // always @(posedge clock1)
    //     dout1B <= dout1B_reg;
    // always @(posedge clock3)
    //     dout2B <= dout2B_reg;

endmodule