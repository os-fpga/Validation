module shift_register_512bit
    #(parameter WIDTH = 512) (
    input wire clk,
    input wire reset,
    input wire shift_in,
    output reg [WIDTH-1:0] out_reg
    );

    reg [WIDTH-1:0] register;

    always @(posedge clk) begin
    if (reset) begin
        register <= 'b0; 
    end else begin
        register <= {shift_in, register[WIDTH-1:1]}; 
    end
    end

    assign out_reg = register;

endmodule
 
