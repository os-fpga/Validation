module up_counter_32bit (
    input wire clk,
    input wire rst,
    output reg [19:0] count
);

// Reset the counter to 0 when the reset signal is active
always @(posedge clk or posedge rst)
begin
    if (rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
