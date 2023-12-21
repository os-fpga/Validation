
module I_BUF_DS_primitive_inst_old #(
    parameter SLEW_RATE = "SLOW",
    parameter DELAY = 0
)(
    input  logic OE,
    input  logic C,
    input  logic I_N,
    input  logic I_P,
    output logic O
);

    I_BUF_DS #(
        .SLEW_RATE(SLEW_RATE),
        .DELAY(DELAY)
    ) I_BUF_DS_primitive (
        .OE(OE),
        .C(C),
        .I_N(I_N),
        .I_P(I_P),
        .O(O)
    );

endmodule
