//parameter WIDTH=32;

module register_2 
(
input clk,
input rst,
input [1:0] data_in,
output reg [1:0] data_out);


always@(posedge clk)
begin 
    if(rst)
        data_out<=0;
    else
        data_out<=data_in;
end

endmodule


