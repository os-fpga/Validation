module invertion
#(
    parameter WIDTH = 32  // Ensure parameter usage is consistent with the design needs
)
(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

    // Temporary variables to store intermediate values for clarity and debuggability
    wire [7:0] bitwise_not_and_or;
    wire [7:0] bitwise_xor;
    wire [15:0] conditional_invert;

    // Process the first 8 bits of data_in
    assign bitwise_not_and_or = (~data_in[7:0]) | (~data_in[15:8]);

    // Process the next 16 bits of data_in for XOR operation
    assign bitwise_xor = data_in[31:24] ^ data_in[23:16];

    // Conditional operation on the upper 16 bits
    assign conditional_invert = (data_in[31:16] == data_in[15:0]) ? ~data_in[15:0] : data_in[31:16];

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 0;  // Reset the entire output vector
        end else begin
            // Combine the processed parts into the final output
            data_out <= {conditional_invert, bitwise_xor, bitwise_not_and_or};
        end
    end

endmodule
