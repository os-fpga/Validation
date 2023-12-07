module d_latch_top #(parameter WIDTH=32) (clk,rst,data_in,data_out);
    input clk;
    input rst;
    input [WIDTH-1:0] data_in;
    output [WIDTH-1:0] data_out;

    reg enable;
    wire [WIDTH-1:0] d_out;
    
    always @ (negedge clk) begin
        if (rst)
            enable <= 0;
        else
            enable <= 1;
    end

    d_latch #(.WIDTH(WIDTH)) d_latch_inst (.clk(clk),.rst(rst),.data_in(data_in),.data_out(d_out),.en(enable));

    assign data_out=d_out;
endmodule

module d_latch #(parameter WIDTH=32) (clk,rst,data_in,data_out,en);
    input [WIDTH-1:0] data_in;
    input en;
    input clk;
    input rst;
    output reg [WIDTH-1:0] data_out;
    
    always @ (en or rst or data_in)
        if (rst)
            data_out <= 0;
        else if (!en)
            data_out <= 0;
        else    
            data_out <= data_in;
endmodule