
module O_SERDES_primitive_inst_old #(
    parameter DATA_RATE="DDR",
    parameter CLOCK_PHASE = 0,
    parameter WIDTH = 4,
    parameter DELAY = 0
)(
    input logic [WIDTH-1:0] D,
    input logic RST,
    input logic LOAD_WORD,
    input logic DLY_LOAD,
    input logic DLY_ADJ,
    input logic DLY_INCDEC,
    input logic CLK_EN,
    input logic CLK_IN,
    input logic PLL_LOCK,
    input logic PLL_FAST_CLK,
    input logic [3:0] FAST_PHASE_CLK,
    input logic OE,
    output logic CLK_OUT,
    output logic Q,
    output logic [5:0] DLY_TAP_VALUE,
    input logic CHANNEL_BOND_SYNC_IN,
    output logic CHANNEL_BOND_SYNC_OUT
);

    O_SERDES #(
        .DATA_RATE(DATA_RATE),
        .CLOCK_PHASE(CLOCK_PHASE),
        .WIDTH(WIDTH),
        .DELAY(DELAY)
    ) O_SERDES_primitive (
        .D(D),
        .RST(RST),
        .LOAD_WORD(LOAD_WORD),
        .DLY_LOAD(DLY_LOAD),
        .DLY_ADJ(DLY_ADJ),
        .DLY_INCDEC(DLY_INCDEC),
        .CLK_EN(CLK_EN),
        .CLK_IN(CLK_IN),
        .PLL_LOCK(PLL_LOCK),
        .PLL_FAST_CLK(PLL_FAST_CLK),
        .FAST_PHASE_CLK(FAST_PHASE_CLK),
        .OE(OE),
        .CLK_OUT(CLK_OUT),
        .Q(Q),
        .DLY_TAP_VALUE(DLY_TAP_VALUE),
        .CHANNEL_BOND_SYNC_IN(CHANNEL_BOND_SYNC_IN),
        .CHANNEL_BOND_SYNC_OUT(CHANNEL_BOND_SYNC_OUT)
    );

endmodule
