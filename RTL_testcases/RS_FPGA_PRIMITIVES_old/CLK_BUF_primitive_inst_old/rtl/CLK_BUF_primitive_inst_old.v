module CLK_BUF_primitive_inst_old (
    input  logic I,
    output logic O
);

    CLK_BUF CLK_BUF_primitive (
        .I(I),
        .O(O)
    );

endmodule
