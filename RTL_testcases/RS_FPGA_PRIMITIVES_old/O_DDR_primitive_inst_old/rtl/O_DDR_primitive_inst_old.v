
module O_DDR_primitive_inst_old #(
    parameter SLEW_RATE = "SLOW",
    parameter DELAY = 0
)(
    input  logic [1:0] D,
    input  logic R,
    input  logic E,
    input  logic DLY_ADJ,
    input  logic DLY_LD,
    input  logic DLY_INC,
    input  logic C,
    output logic Q
);

    O_DDR #(
        .SLEW_RATE(SLEW_RATE),
        .DELAY(DELAY)
    ) O_DDR_primitive (
        .D(D),
        .R(R),
        .E(E),
        .DLY_ADJ(DLY_ADJ),
        .DLY_LD(DLY_LD),
        .DLY_INC(DLY_INC),
        .C(C),
        .Q(Q)
    );

endmodule
