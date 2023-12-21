
module I_SERDES_primitive_inst_old #(
    parameter DATA_RATE = "SDR",
    parameter WIDTH = 4,
    parameter DPA_MODE = "NONE",
    parameter DELAY = 0
)(
    input logic D,
    input logic RST,
    input logic DPA_RST,
    input logic FIFO_RST,
    input logic DLY_LOAD,
    input logic DLY_ADJ,
    input logic DLY_INCDEC,
    input logic BITSLIP_ADJ,
    input logic EN,
    input logic CLK_IN,
    input logic PLL_FAST_CLK,
    input logic [3:0] FAST_PHASE_CLK,
    input logic PLL_LOCK,
    output logic CLK_OUT,
    output logic CDR_CORE_CLK,
    output logic [WIDTH-1 : 0] Q,
    output logic DATA_VALID,
    output logic [5:0] DLY_TAP_VALUE,
    output logic DPA_LOCK,
    output logic DPA_ERROR
);

    I_SERDES #(
        .DATA_RATE(DATA_RATE),
        .WIDTH(WIDTH),
        .DPA_MODE(DPA_MODE),
        .DELAY(DELAY)
    ) I_SERDES_primitive (
        .D(D),
        .RST(RST),
        .DPA_RST(DPA_RST),
        .FIFO_RST(FIFO_RST),
        .DLY_LOAD(DLY_LOAD),
        .DLY_ADJ(DLY_ADJ),
        .DLY_INCDEC(DLY_INCDEC),
        .BITSLIP_ADJ(BITSLIP_ADJ),
        .EN(EN),
        .CLK_IN(CLK_IN),
        .PLL_FAST_CLK(PLL_FAST_CLK),
        .FAST_PHASE_CLK(FAST_PHASE_CLK),
        .PLL_LOCK(PLL_LOCK),
        .CLK_OUT(CLK_OUT),
        .CDR_CORE_CLK(CDR_CORE_CLK),
        .Q(Q),
        .DATA_VALID(DATA_VALID),
        .DLY_TAP_VALUE(DLY_TAP_VALUE),
        .DPA_LOCK(DPA_LOCK),
        .DPA_ERROR(DPA_ERROR)
    );

endmodule

