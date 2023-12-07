module offset_remove_comb
#(
parameter AW = 32  // AXI address width
    )

(
input wire [AW-1:0]  in_addr,   // Input AXI address
    output wire [AW-1:0] out_addr   // Output address with offset removed
    );
assign out_addr = in_addr - 4;  // Assuming 32-bit data width and 4-byte offset
endmodule 
