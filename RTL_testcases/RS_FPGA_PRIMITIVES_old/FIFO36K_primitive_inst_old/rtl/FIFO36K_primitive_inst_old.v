module FIFO36K_primitive_inst_old #(
// Parameters
parameter   DATA_WIDTH          = 6'd36,
parameter   SYNC_FIFO           = 1'b1,
parameter   PROG_FULL_THRESH    = 12'b100000000000,
parameter   PROG_EMPTY_THRESH   = 12'b111111111100
)
(
// Input/Output
input wire  [DATA_WIDTH-1:0] WR_DATA,
output wire [DATA_WIDTH-1:0] RD_DATA,
output wire EMPTY,
output wire FULL,
output wire OVERFLOW,
output wire UNDERFLOW,
input wire  RDEN,
input wire  WREN,
output wire ALMOST_EMPTY,
output wire ALMOST_FULL,
output wire PROG_EMPTY,
output wire PROG_FULL,
input wire  WRCLK,
input wire  RDCLK,
input wire  RESET
);

FIFO36K prim_inst(.*);
endmodule
