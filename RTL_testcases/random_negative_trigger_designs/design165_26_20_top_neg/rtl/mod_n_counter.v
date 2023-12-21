module mod_n_counter #(parameter N=256, parameter WIDTH = 32)(
    input clk,
    input rst,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
    );
    
    always @ (negedge clk) begin
        if (rst)
            data_out <= 0;
        else begin
            if (data_in == N-1)
                data_out <= 0;
            else
                data_out <= data_in + 1;     
        end
    end
endmodule
