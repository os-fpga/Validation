

module ram_inst_tdp_split_36 (
   input clk1A, clk1B, we1A, we1B, re1A, re1B, out_enable1A,out_enable1B,
  input [9:0] addr1A, addr1B,
  input  [35:0] din1A, din1B, 
  output reg [35:0] dout1A, dout1B,
  input clk2A, clk2B, we2A, we2B, re2A, re2B,out_enable2A,out_enable2B,
  input [9:0] addr2A, addr2B,
  input  [35:0] din2A, din2B, 
  output reg [35:0] dout2A, dout2B);

parameter [80:0] MODE_BITS =81'h10000001B6C0000000DB6;

wire [35:0] dout1A_reg ,dout2A_reg ,dout1B_reg ,dout2B_reg;

 RS_TDP36K  #(.MODE_BITS(81'h10000001B6C0000000DB6))
  inst1(
    .ADDR_A1({ 1'b0, addr1A, 4'h00 }),
    .ADDR_A2({ addr2A, 4'h00 }),
    .ADDR_B1({ 1'b0, addr1B, 4'h00 }),
    .ADDR_B2({ addr2B, 4'h00 }),
    .BE_A1({1, 1}),
    .BE_A2({1, 1}),
    .BE_B1({1, 1}),
    .BE_B2({1, 1}),
    .CLK_A1(clk1A),
    .CLK_A2(clk2A),
    .CLK_B1(clk1B),
    .CLK_B2(clk2B),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(dout1A_reg),
    .RDATA_A2(dout2A_reg),
    .RDATA_B1(dout1B_reg),
    .RDATA_B2(dout2B_reg),
    .REN_A1(re1A),
    .REN_A2(re2A),
    .REN_B1(re1B),
    .REN_B2(re2B),
    .WDATA_A1(din1A),
    .WDATA_A2(din2A),
    .WDATA_B1(din1B),
    .WDATA_B2(din2B),
    .WEN_A1(we1A),
    .WEN_A2(we2A),
    .WEN_B1(we1B),
    .WEN_B2(we2B)
  );
 
    always @(posedge clk1A)
     if (out_enable1A == 1'b1)
        dout1A <= dout1A_reg;
    always @(posedge clk2A)
     if (out_enable2A == 1'b1)
        dout2A <= dout2A_reg;
    always @(posedge clk1B)
     if (out_enable1B == 1'b1)
        dout1B <= dout1B_reg;
    always @(posedge clk2B)
     if (out_enable2B == 1'b1)
        dout2B <= dout2B_reg;
endmodule
