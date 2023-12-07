
module I_DDR_primitive_inst_old #(
    parameter SLEW_RATE = "SLOW",
    parameter DELAY = 0
)(
    input  logic D,
    input  logic R,
    input  logic DLY_ADJ,
    input  logic DLY_LD,
    input  logic DLY_INC,
    input  logic C,
    output logic [1:0] Q
);

    I_DDR #(
        .SLEW_RATE(SLEW_RATE),
        .DELAY(DELAY)
    ) I_DDR_primitive (
        .D(D),
        .R(R),
        .DLY_ADJ(DLY_ADJ),
        .DLY_LD(DLY_LD),
        .DLY_INC(DLY_INC),
        .C(C),
        .Q(Q)
    );

endmodule

