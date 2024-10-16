module invertion #(parameter WIDTH = 32)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

    wire [7:0] bitwise_not_and_or;
    wire [7:0] bitwise_xor;
    wire [15:0] conditional_invert;

    assign bitwise_not_and_or = (~data_in[7:0]) | (~data_in[15:8]);

    assign bitwise_xor = data_in[31:24] ^ data_in[23:16];

    assign conditional_invert = (data_in[31:16] == data_in[15:0]) ? data_in[15:0] : ~data_in[31:16];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
        end else begin
            data_out <= {conditional_invert, bitwise_xor, bitwise_not_and_or};
        end
    end

endmodule
