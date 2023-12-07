
module IO_BUF_primitive_inst_old (
    input  logic I,
    input  logic T,
    inout  wire  IO,
    output logic O
);

    IO_BUF IO_BUF_primitive (
        .I(I),
        .T(T),
        .IO(IO),
        .O(O)
    );

endmodule
