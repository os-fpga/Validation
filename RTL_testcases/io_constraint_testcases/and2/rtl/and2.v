/////////////////////////////////////////
//  Functionality: 2-input AND 
//  Author:        Xifan Tang
////////////////////////////////////////
`timescale 1ns / 1ps
module and2#(parameter Total_Instances = 10)(input clock0,input a,input b,output c,input [$clog2(Total_Instances)-1:0]id);
wire [0:0]c_sub_out[0:Total_Instances-1];
reg [0:0]a_sub_in[0:Total_Instances-1];
reg [0:0]b_sub_in[0:Total_Instances-1];
reg [0:0]c_sub_out_reg[0:Total_Instances-1];
genvar i;
integer j;
generate 
  for(i=0;i<Total_Instances;i=i+1)begin
    and2_submodule and2_submodule(.a(a_sub_in[i]),.b(b_sub_in[i]),.c(c_sub_out[i]));
  end
endgenerate

  always @* begin
    for (j = 0; j < 16; j = j + 1) begin
      if (j == id) begin
        a_sub_in[j] = a;
        b_sub_in[j] = b;
      end else begin
        a_sub_in[j] = 'd0;
        b_sub_in[j] = 'd0;
      end
    end
  end
always@(posedge clock0)begin
for(j=0;j<Total_Instances;j=j+1)begin
  c_sub_out_reg[j]<=c_sub_out[j];
end
end

assign c = (id >= 0 && id < 10) ? c_sub_out_reg[id] : 0;
endmodule

module and2_submodule(
  a,
  b,
  c);

input wire a;
input wire b;
output wire c;

assign c = a & b;

endmodule