(* blackbox *)
module RS_DSP_MULTADD_REGIN_REGOUT (
    input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z,
    output wire[17:0] dly_b,

    (* clkbuf_sink *)
    input  wire        clk,
    input  wire        reset,

    input  wire [ 2:0] feedback,
    input  wire [ 5:0] acc_fir,
    input  wire        load_acc,
    input  wire        unsigned_a,
    input  wire        unsigned_b,

    input  wire        saturate_enable,
    input  wire [ 5:0] shift_right,
    input  wire        round,
    input  wire        subtract
);

parameter [79:0] MODE_BITS = 80'h10000000000000000;

endmodule