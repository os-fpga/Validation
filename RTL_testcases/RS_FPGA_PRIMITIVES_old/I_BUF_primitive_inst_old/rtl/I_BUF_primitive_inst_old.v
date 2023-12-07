
module I_BUF_primitive_inst_old #(
    parameter PULL_UP_DOWN = "NONE",
    parameter SLEW_RATE = "SLOW",
    parameter REG_EN = "TRUE",
    parameter DELAY = 0
)(
    input  logic I,
    input  logic C,
    output logic O
);

    I_BUF #(
        .PULL_UP_DOWN(PULL_UP_DOWN),
        .SLEW_RATE(SLEW_RATE),
        .REG_EN(REG_EN),
        .DELAY(DELAY)
    ) I_BUF_primitive (
        .I(I),
        .C(C),
        .O(O)
    );

endmodule
