module decoder_top #(parameter WIDTH=32) (clk,rst,data_in,data_out);
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

    decoder #(.WIDTH(WIDTH)) decoder_inst (.clk(clk),.rst(rst),.data_in(data_in),.data_out(d_out),.en(enable));

    assign data_out=d_out;
endmodule


module decoder #(parameter WIDTH=32)(
    input [WIDTH-1:0] data_in,
    input en,
    input rst,
    input clk,
    output reg [WIDTH-1:0] data_out
    );
    reg [WIDTH-1:0 ] data_out_w;
    
    always @ (posedge clk) begin
        if (rst)
            data_out <= 0;
        else
            if (!en)
                data_out <= 0;
            else
                data_out <= data_out_w;
    end
    
    always @ (data_in) begin
        case(data_in) // synopsys full_case
            32'b00000000000000000000000000000000: data_out_w = 32'd11111110;
            32'b00000000000000000000000000000001: data_out_w = 32'd11111101;
            32'b00000000000000000000000000000010: data_out_w = 32'd11111011;
            32'b00000000000000000000000000000011: data_out_w = 32'd11110111;
            32'b00000000000000000000000000000100: data_out_w = 32'd11101111;
            32'b00000000000000000000000000000101: data_out_w = 32'd11011111;
            32'b00000000000000000000000000000110: data_out_w = 32'd10111111;
            32'b00000000000000000000000000000111: data_out_w = 32'd01111111;
 	 	 	default: data_out_w = 32'd11111111;
         endcase
    end
    
endmodule
