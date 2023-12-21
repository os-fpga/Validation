module asym_ram_sdp_wide_async_read (
input clk, write_enable,
input [8:0] write_addr,
input [5:0] read_addr,
input [7:0] write_data,
output [63:0] read_data
);

reg [7:0] mem [0:511];

always @(posedge clk) begin
    if (write_enable)
        mem[write_addr] <= write_data;
end

assign read_data[7:0] = mem[{read_addr, 3'b000}];
assign read_data[15:8] = mem[{read_addr, 3'b001}];
assign read_data[23:16] = mem[{read_addr, 3'b010}];
assign read_data[31:24] = mem[{read_addr, 3'b011}];
assign read_data[39:32] = mem[{read_addr, 3'b100}];
assign read_data[47:40] = mem[{read_addr, 3'b101}];
assign read_data[55:48] = mem[{read_addr, 3'b110}];
assign read_data[63:56] = mem[{read_addr, 3'b111}];


endmodule