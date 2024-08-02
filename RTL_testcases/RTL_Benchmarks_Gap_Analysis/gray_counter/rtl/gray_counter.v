//-------------------------------------------------------
//  Functionality: An n-bit gray counter 
//  Author:        Laraib Khan
//-------------------------------------------------------

`timescale 1ns / 1ps

module gray_counter (
    input clk,
    input rst,
    output reg [5:0] out
);

reg [5:0] q; 

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 6'b000000;
    end else begin
        q <= q + 1;
    end
end

always @(*) begin
    out[5] = q[5];
    out[4] = q[5] ^ q[4];
    out[3] = q[4] ^ q[3];
    out[2] = q[3] ^ q[2];
    out[1] = q[2] ^ q[1];
    out[0] = q[1] ^ q[0];
end

endmodule
