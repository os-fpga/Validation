module shift_reg_top #(parameter WIDTH=32) (clk,rst,data_in,data_out);
    input clk;
    input rst;
    input [WIDTH-1:0] data_in;
    output [WIDTH-1:0] data_out;

    reg enable;
    wire [WIDTH-1:0] d_out;
    
    always @ (posedge clk) begin
        if (rst)
            enable <= 0;
        else
            enable <= 1;
    end

    shift_reg #(.WIDTH(WIDTH)) shift_reg_inst (.clk(clk),.rst(rst),.data_in(data_in),.data_out(d_out),.en(enable));

    assign data_out=d_out;
endmodule


module shift_reg #(parameter WIDTH=32) (
    input clk,
    input rst,
    input en,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
    );
//    wire d;
//    assign d=1;
    always @ (posedge clk) begin
        if (rst)
            data_out <= 0;
        else begin
            if (en)
                data_out <= {data_out[WIDTH-1:0],data_in[WIDTH-16:0]};
            else
                data_out <= data_in;
        end
    end
endmodule
