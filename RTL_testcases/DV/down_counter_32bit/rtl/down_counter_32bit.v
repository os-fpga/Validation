module down_counter_32bit (
    input wire clk,
    input wire rst,
    output reg [19:0] count
);

// Reset the counter to all 1's when the reset signal is active
always @(posedge clk or posedge rst)
begin
    if (rst)
        count <= 20'hFFFFFFFF;
    else if (count != 0)
        count <= count - 1;
end

endmodule

