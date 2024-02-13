`define DATA_WIDTH 32

module gray_to_bin(
    input wire [`DATA_WIDTH - 1:0] gray,
    output wire [`DATA_WIDTH - 1:0] binary
);
    genvar i;
    for(i = 0; i < `DATA_WIDTH; i=i+1)begin
        assign binary[i] = ^(gray >> i);
    end

endmodule
