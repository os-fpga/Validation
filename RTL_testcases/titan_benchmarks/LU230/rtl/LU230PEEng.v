//auto-generated top.v
//top level module of LU factorization
//by Wei Zhang

module LU230PEEng (clk, ref_clk, global_reset_n, start, N, offset, done, ready,
		mem_addr, mem_ba, mem_cas_n, mem_cke, mem_clk, mem_clk_n, mem_cs_n,
		mem_dm, mem_dq, mem_dqs, mem_dqsn, mem_odt, mem_ras_n, mem_we_n);

parameter NWIDTH = 20, BLOCKWIDTH = 8;
parameter DDRWIDTH = 64, DDRNUMDQS = 8, DDRSIZEWIDTH = 24;
parameter BURSTLEN = 2;
parameter MEMCONWIDTH = 128, MEMCONNUMBYTES = 16;
parameter RAMWIDTH = 7360, RAMNUMBYTES = 920, RAMSIZEWIDTH = 8;

input start;
input[NWIDTH-1:0] N;
input[DDRSIZEWIDTH-1:0] offset;
output done;
output [12:0] mem_addr;
output [1:0] mem_ba;
output mem_cas_n;
output [0:0] mem_cke;
inout [0:0] mem_clk;
inout [0:0] mem_clk_n;
output [0:0] mem_cs_n;
output [DDRNUMDQS-1:0] mem_dm;
inout [DDRWIDTH-1:0] mem_dq;
inout [DDRNUMDQS-1:0] mem_dqs;
inout [DDRNUMDQS-1:0] mem_dqsn;
output [0:0] mem_odt;
output mem_ras_n;
output mem_we_n;
input clk, ref_clk;
input global_reset_n;
output ready;

wire phy_clk;
wire[BLOCKWIDTH-1:0] m, n, loop;
wire[1:0] mode;
wire comp_start, comp_done;
wire dtu_write_req, dtu_read_req, dtu_ack, dtu_done;
wire [DDRSIZEWIDTH-1:0] dtu_mem_addr;
wire [RAMSIZEWIDTH-1:0] dtu_ram_addr;
wire [BLOCKWIDTH-1:0] dtu_size;
wire left_sel;

wire[RAMWIDTH-1:0] curWriteDataMem, curReadDataMem;
wire[RAMSIZEWIDTH-1:0] curWriteAddrMem, curReadAddrMem;
wire[RAMNUMBYTES-1:0] curWriteByteEnMem;
wire curWriteEnMem;
wire[RAMWIDTH-1:0] leftWriteDataMem;
wire[RAMSIZEWIDTH-1:0] leftWriteAddrMem;
wire[RAMNUMBYTES-1:0] leftWriteByteEnMem;
wire leftWriteEnMem;
wire curMemSel, leftMemSel;

wire burst_begin;
wire [MEMCONNUMBYTES-1:0] mem_local_be;
wire mem_local_read_req;
wire [BURSTLEN-1:0] mem_local_size;
wire [MEMCONWIDTH-1:0] mem_local_wdata;
wire mem_local_write_req;
wire [MEMCONWIDTH-1:0] mem_local_rdata;
wire mem_local_rdata_valid;
wire mem_local_ready;
wire mem_local_wdata_req;
wire reset_n;
wire [DDRSIZEWIDTH-1:0] mem_local_addr;

wire[RAMWIDTH-1:0] ram_write_data, ram_read_data;
wire[RAMSIZEWIDTH-1:0] ram_write_addr, ram_read_addr;
wire[RAMNUMBYTES-1:0] ram_write_byte_en;
wire ram_write_en;

MarshallerController MC (clk, start, done, N, offset,
	comp_start, m, n, loop, mode, comp_done, curMemSel, leftMemSel,
	dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done, left_sel);

// block that computes the LU factorization, with answer stored back into ram block
LU compBlock (clk, comp_start, m, n, loop, mode, comp_done,
			curReadAddrMem, curReadDataMem, curWriteByteEnMem, curWriteDataMem, curWriteAddrMem, curWriteEnMem, curMemSel,
			leftWriteByteEnMem, leftWriteDataMem, leftWriteAddrMem, leftWriteEnMem, leftMemSel);

DataTransferUnit DTU (clk, phy_clk, dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done,
		ram_read_addr, ram_read_data, ram_write_byte_en, ram_write_data, ram_write_addr, ram_write_en,
		mem_local_rdata, mem_local_rdata_valid, mem_local_ready, mem_local_wdata_req, reset_n,
		burst_begin, mem_local_addr, mem_local_be, mem_local_read_req, mem_local_size,
		mem_local_wdata, mem_local_write_req);

ddr2_24x64_8 memController (
	.global_reset_n (global_reset_n),
	.local_address (mem_local_addr),
	.local_be (mem_local_be),
	.local_init_done (ready),
	.local_rdata (mem_local_rdata),
	.local_rdata_valid (mem_local_rdata_valid),
	.local_read_req (mem_local_read_req),
	.local_ready (mem_local_ready),
	.local_refresh_ack (),
	.local_size (mem_local_size),
	.local_wdata (mem_local_wdata),
	.local_wdata_req (mem_local_wdata_req),
	.local_write_req (mem_local_write_req),
	.mem_addr (mem_addr),
	.mem_ba (mem_ba),
	.mem_cas_n (mem_cas_n),
	.mem_cke (mem_cke),
	.mem_clk (mem_clk),
	.mem_clk_n (mem_clk_n),
	.mem_cs_n (mem_cs_n),
	.mem_dm (mem_dm),
	.mem_dq (mem_dq),
	.mem_dqs (mem_dqs),
	.mem_odt (mem_odt),
	.mem_ras_n (mem_ras_n),
	.mem_we_n (mem_we_n),
	.mem_dqsn (mem_dqsn),
	.oct_ctl_rs_value (0),
	.oct_ctl_rt_value (0),
	.phy_clk (phy_clk),
	.pll_ref_clk (ref_clk),
	.reset_phy_clk_n (reset_n),
	.soft_reset_n (1)
	);

assign curReadAddrMem = ram_read_addr;
assign curWriteByteEnMem = ram_write_byte_en;
assign curWriteDataMem = ram_write_data;
assign curWriteAddrMem = ram_write_addr;
assign curWriteEnMem = ram_write_en && (left_sel == 0);
assign leftWriteByteEnMem = ram_write_byte_en;
assign leftWriteDataMem = ram_write_data;
assign leftWriteAddrMem = ram_write_addr;
assign leftWriteEnMem = ram_write_en && (left_sel == 1);
assign ram_read_data = curReadDataMem;
endmodule
