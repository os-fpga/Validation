
module O_BUFT_DS_primitive_inst_old #(
    parameter SLEW_RATE = "SLOW",
    parameter DELAY = 0
)(
    input  logic OE,
    input  logic I,
    input  logic C,
    output logic O_N,
    output logic O_P
);

    O_BUFT_DS #(
        .SLEW_RATE(SLEW_RATE),
        .DELAY(DELAY)
    ) O_BUFT_DS_primitive (
        .OE(OE),
        .I(I),
        .C(C),
        .O_N(O_N),
        .O_P(O_P)
    );

endmodule
