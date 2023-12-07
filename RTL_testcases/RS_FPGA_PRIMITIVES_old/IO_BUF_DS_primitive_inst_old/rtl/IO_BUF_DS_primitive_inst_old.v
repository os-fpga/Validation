
module IO_BUF_DS_primitive_inst_old (
    input  logic I,
    input  logic T,
    inout  wire IOP,
    inout  wire ION,
    output logic O
);

    IO_BUF_DS IO_BUF_DS_primitive (
        .I(I),
        .T(T),
        .IOP(IOP),
        .ION(ION),
        .O(O)
    );

endmodule
