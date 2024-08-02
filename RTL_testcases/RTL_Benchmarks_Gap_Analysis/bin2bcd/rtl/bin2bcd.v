//-------------------------------------------------------------------
// Function: Binary to Decimal converter
// Source: 
//   https://verilogcodes.blogspot.com/2015/10/verilog-code-for-8-bit-binary-to-bcd.html
//-------------------------------------------------------------------

module bin2bcd (
    input [7:0] bin,
    output reg [11:0] bcd
);

integer i;

always @(bin) begin
    bcd = 12'd0;

    for (i = 7; i >= 0; i = i - 1) begin
        bcd = {bcd[10:0], bin[i]};

        if (bcd[3:0] >= 5)
            bcd[3:0] = bcd[3:0] + 3;
        if (bcd[7:4] >= 5)
            bcd[7:4] = bcd[7:4] + 3;
        if (bcd[11:8] >= 5)
            bcd[11:8] = bcd[11:8] + 3;
    end
end

endmodule
