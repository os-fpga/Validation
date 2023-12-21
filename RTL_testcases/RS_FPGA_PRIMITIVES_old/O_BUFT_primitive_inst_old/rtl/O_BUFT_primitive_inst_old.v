
module O_BUFT_primitive_inst_old #(
    parameter SLEW_RATE = "SLOW",
    parameter DELAY = 0
)(
    input  logic I,
    input  logic OE,
    output logic O
);

    O_BUFT #(
        .SLEW_RATE(SLEW_RATE),
        .DELAY(DELAY)
    ) O_BUFT_primitive (
        .I(I),
        .OE(OE),
        .O(O)
    );

endmodule
