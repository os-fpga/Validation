(* blackbox *)
module RS_DSP_MULTACC (
    input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z,

    (* clkbuf_sink *)
    input  wire        clk,
    input  wire        reset,

    input  wire        load_acc,
    input  wire [ 2:0] feedback,
    input  wire        unsigned_a,
    input  wire        unsigned_b,

    input  wire        f_mode,
    input  wire [ 2:0] output_select,
    input  wire        saturate_enable,
    input  wire [ 5:0] shift_right,
    input  wire        round,
    input  wire        subtract,
    input  wire        register_inputs
);

    parameter [79:0] MODE_BITS = 80'd0;

endmodule