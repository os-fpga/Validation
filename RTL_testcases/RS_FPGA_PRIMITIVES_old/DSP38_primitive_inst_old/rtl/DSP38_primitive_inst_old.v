module DSP38_primitive_inst_old #(
    parameter [19:0] COEFF_0        = 20'h0,
    parameter [19:0] COEFF_1        = 20'h0,
    parameter [19:0] COEFF_2        = 20'h0,
    parameter [19:0] COEFF_3        = 20'h0,
    parameter        OUTPUT_REG_EN  = "TRUE",
    parameter        INPUT_REG_EN   = "TRUE",
    parameter        DSP_MODE       = "MULTIPLY_ACCUMULATE" // (MULTIPLY, MULTIPLY_ADD_SUB)
) (
    input  wire [19:0] A,
    input  wire [17:0] B,
    input  wire  [5:0] ACC_FIR,
    output wire [37:0] Z,
    output wire [17:0] DLY_B,
    input wire       CLK,
    input wire       RESET,
    input wire       UNSIGNED_A,
    input wire       UNSIGNED_B,
    input wire [2:0] FEEDBACK,
    input wire       LOAD_ACC,
    input wire       SATURATE,
    input wire [5:0] SHIFT_RIGHT,
    input wire       ROUND,
    input wire       SUBTRACT
);

DSP38 inst (.*);

endmodule