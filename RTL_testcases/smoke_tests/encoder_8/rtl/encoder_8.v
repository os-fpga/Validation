
module encoder_8 
(
input clk,
input rst,
input [7:0] data_in,
output reg [7:0] data_out
);

reg [7:0 ] data_out_wire;

always@(posedge clk)
begin 
if(rst)
data_out<=0;
else
data_out<=data_out_wire;
end


always@(*)
begin

if (data_in==8'd0)
data_out_wire=8'd14;
else
if (data_in==8'd123)
data_out_wire=~8'd100;
else
if (data_in==8'd13)
data_out_wire=8'd23 + 8'b00000111;
else
if (data_in==8'd10023)
data_out_wire=8'd23 - 8'b00100000;
else
if (data_in==8'd3)
data_out_wire=~8'd40;
else
data_out_wire=0;
end


endmodule


 







