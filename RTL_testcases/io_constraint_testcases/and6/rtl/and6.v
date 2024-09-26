module and6#(parameter Total_Instances = 10)(input clock0,input [5:0]a,input [$clog2(Total_Instances-2)-1:0]id,output c);

wire [0:0]c_sub_out[0:Total_Instances-1];
reg [5:0]a_sub_in[0:Total_Instances-1];
reg [0:0]c_sub_out_reg[0:Total_Instances-1];
genvar i;
integer j;
generate 
  for(i=0;i<Total_Instances;i=i+1)begin
    and6_submodule and6_submodule(.a(a_sub_in[i]),.c(c_sub_out[i]));
  end
endgenerate


always@(*)begin
  for(j=0;j<Total_Instances;j=j+1)begin
    a_sub_in[j]='d0;
  end
  a_sub_in[id]=a;
  end
always@(posedge clock0)begin
  for(j=0;j<Total_Instances;j=j+1)begin
    c_sub_out_reg[j]<=c_sub_out[j];
  end
  end
  assign c = c_sub_out_reg[id];

endmodule 
module and6_submodule(
  a,
  c);

input wire [5:0] a;
output wire c;

assign c = a[5] & a[4] & a[3] & a[2] & a[1] & a[0];

endmodule
