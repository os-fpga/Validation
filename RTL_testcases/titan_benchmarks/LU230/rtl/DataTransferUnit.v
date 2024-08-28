
module DataTransferUnit (clk, phy_clk, dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done,
		ram_read_addr, ram_read_data, ram_write_byte_en, ram_write_data, ram_write_addr, ram_write_en,
		mem_rdata, mem_rdata_valid, mem_ready, mem_wdata_req, reset_n,
		burst_begin, mem_local_addr, mem_be, mem_read_req, mem_size, mem_wdata, mem_write_req);

parameter BURSTLEN = 2, BURSTWIDTH = 2;
parameter DATAWIDTH = 8192, DATANUMBYTES = 1024;
parameter MEMCONWIDTH = 128, MEMCONNUMBYTES = 16, DDRSIZEWIDTH = 24;
parameter FIFOSIZE = 16, FIFOSIZEWIDTH = 4;
parameter RAMWIDTH = 7360, RAMNUMBYTES = 920, RAMSIZEWIDTH = 8;
parameter RATIO = 64, RAMLAT = 5;

output burst_begin;
output [DDRSIZEWIDTH-1:0] mem_local_addr;
output [MEMCONNUMBYTES-1: 0] mem_be;
output mem_read_req;
output [BURSTWIDTH-1:0] mem_size;
output [MEMCONWIDTH-1:0] mem_wdata;
output mem_write_req;
input clk, phy_clk;
input [MEMCONWIDTH-1:0] mem_rdata;
input mem_rdata_valid;
input mem_ready;
input mem_wdata_req;
input reset_n;

input dtu_write_req;
input dtu_read_req;
input [DDRSIZEWIDTH-1:0] dtu_mem_addr;
input [RAMSIZEWIDTH-1:0] dtu_ram_addr;
input [7:0] dtu_size;
output dtu_ack;
output dtu_done;

output[RAMWIDTH-1:0] ram_write_data;
input[RAMWIDTH-1:0] ram_read_data;
output[RAMSIZEWIDTH-1:0] ram_write_addr, ram_read_addr;
output[RAMNUMBYTES-1:0] ram_write_byte_en;
output ram_write_en;

parameter IDLE = 0, WRITE = 1, READ = 2;
reg [DDRSIZEWIDTH-1:0] mem_addr[RAMLAT:0];
reg [2:0] state;
wire [DATAWIDTH-1:0] rdata, ram_write_dataw, ram_read_dataw;

wire [RAMSIZEWIDTH-1:0] rfifo_addr;
reg fifo_write_reg[RAMLAT-1:0];
reg write_req_reg[RAMLAT-1:0];
reg read_req_reg[RAMLAT-1:0];
reg fifo_read_reg[0:0];
reg rdata_valid;
reg test_complete_reg[1:0];
reg [BURSTWIDTH-1:0] size_count[RAMLAT-1:0];
reg [RAMSIZEWIDTH-1:0] size;
reg [RAMSIZEWIDTH-1:0] ram_addr[RAMLAT-1:0];
reg [6:0] data_count;
reg ram_write_en_reg;

wire read_req;
wire write_req;
wire [FIFOSIZEWIDTH-1:0] wfifo_count;
wire rfull, wempty, rempty, rdcmd_empty, wrcmd_full, wrcmd_empty, rdata_empty;
wire [DATAWIDTH-1:0] mem_data;
wire not_stall;
wire fifo_write, fifo_read;
wire rdata_req;
wire [BURSTWIDTH+DDRSIZEWIDTH+1:0] wrmem_cmd, rdmem_cmd;
wire mem_cmd_ready, mem_cmd_issue;

// FIFOs to interact with off-chip memory
memcmd_fifo cmd_store(
	.aclr(~reset_n),
	.rdclk(phy_clk),
	.wrclk(clk),
	.data(wrmem_cmd),
	.rdreq(mem_cmd_ready),
	.rdempty(rdcmd_empty),
	.wrreq(mem_cmd_issue),
	.wrfull(wrcmd_full),
	.wrempty(wrcmd_empty),
	.q(rdmem_cmd));

wfifo wdata_store(
	.rdclk(phy_clk),
	.wrclk(clk),
	.data(mem_data),
	.rdreq(mem_wdata_req),
	.wrreq(fifo_write),
	.wrempty(wempty),
	.q(mem_wdata),
	.wrusedw(wfifo_count));

addr_fifo raddress_store (
	.clock(clk),
	.data(ram_addr[RAMLAT-2]),
	.rdreq(rdata_req),
	.wrreq(fifo_read),
	.empty(rempty),
	.full(rfull),
	.q(rfifo_addr));

rfifo rdata_store(
	.data(mem_rdata),
	.rdclk(clk),
	.rdreq(rdata_req),
	.wrclk(phy_clk),
	.wrreq(mem_rdata_valid),
	.q(rdata),
	.rdempty(rdata_empty));

assign mem_cmd_ready = (mem_ready == 1) && (rdcmd_empty == 0);
assign mem_cmd_issue = (wrcmd_full == 0) && (write_req == 1 || read_req == 1 || wrcmd_empty == 1);
assign wrmem_cmd[BURSTWIDTH+DDRSIZEWIDTH+1:DDRSIZEWIDTH+2] = size_count[0];
assign wrmem_cmd[DDRSIZEWIDTH+1:2] = mem_addr[0];
assign wrmem_cmd[1] = read_req;
assign wrmem_cmd[0] = write_req;
assign mem_write_req = rdmem_cmd[0] && rdcmd_empty == 0;
assign mem_read_req = rdmem_cmd[1] && rdcmd_empty == 0;
assign mem_local_addr = rdmem_cmd[DDRSIZEWIDTH+1:2];
assign burst_begin = 0;
assign mem_size = rdmem_cmd[BURSTWIDTH+DDRSIZEWIDTH+1:DDRSIZEWIDTH+2];
assign mem_be = ~0;
assign fifo_write = fifo_write_reg[0];
assign write_req = (not_stall) ? write_req_reg[0] : 0;
assign read_req = (not_stall) ? read_req_reg[0] : 0;
assign fifo_read = (not_stall) ? fifo_read_reg[0] : 0;
assign not_stall = (wfifo_count < FIFOSIZE-5) && (rfull == 0) && (wrcmd_full == 0);
assign dtu_ack = (state == IDLE);
assign dtu_done = (state == IDLE) && wempty && rempty;

assign ram_write_dataw[127:0] = rdata[8191:8064];
assign mem_data[127:0] = ram_read_dataw[8191:8064];
assign ram_write_dataw[255:128] = rdata[8063:7936];
assign mem_data[255:128] = ram_read_dataw[8063:7936];
assign ram_write_dataw[383:256] = rdata[7935:7808];
assign mem_data[383:256] = ram_read_dataw[7935:7808];
assign ram_write_dataw[511:384] = rdata[7807:7680];
assign mem_data[511:384] = ram_read_dataw[7807:7680];
assign ram_write_dataw[639:512] = rdata[7679:7552];
assign mem_data[639:512] = ram_read_dataw[7679:7552];
assign ram_write_dataw[767:640] = rdata[7551:7424];
assign mem_data[767:640] = ram_read_dataw[7551:7424];
assign ram_write_dataw[895:768] = rdata[7423:7296];
assign mem_data[895:768] = ram_read_dataw[7423:7296];
assign ram_write_dataw[1023:896] = rdata[7295:7168];
assign mem_data[1023:896] = ram_read_dataw[7295:7168];
assign ram_write_dataw[1151:1024] = rdata[7167:7040];
assign mem_data[1151:1024] = ram_read_dataw[7167:7040];
assign ram_write_dataw[1279:1152] = rdata[7039:6912];
assign mem_data[1279:1152] = ram_read_dataw[7039:6912];
assign ram_write_dataw[1407:1280] = rdata[6911:6784];
assign mem_data[1407:1280] = ram_read_dataw[6911:6784];
assign ram_write_dataw[1535:1408] = rdata[6783:6656];
assign mem_data[1535:1408] = ram_read_dataw[6783:6656];
assign ram_write_dataw[1663:1536] = rdata[6655:6528];
assign mem_data[1663:1536] = ram_read_dataw[6655:6528];
assign ram_write_dataw[1791:1664] = rdata[6527:6400];
assign mem_data[1791:1664] = ram_read_dataw[6527:6400];
assign ram_write_dataw[1919:1792] = rdata[6399:6272];
assign mem_data[1919:1792] = ram_read_dataw[6399:6272];
assign ram_write_dataw[2047:1920] = rdata[6271:6144];
assign mem_data[2047:1920] = ram_read_dataw[6271:6144];
assign ram_write_dataw[2175:2048] = rdata[6143:6016];
assign mem_data[2175:2048] = ram_read_dataw[6143:6016];
assign ram_write_dataw[2303:2176] = rdata[6015:5888];
assign mem_data[2303:2176] = ram_read_dataw[6015:5888];
assign ram_write_dataw[2431:2304] = rdata[5887:5760];
assign mem_data[2431:2304] = ram_read_dataw[5887:5760];
assign ram_write_dataw[2559:2432] = rdata[5759:5632];
assign mem_data[2559:2432] = ram_read_dataw[5759:5632];
assign ram_write_dataw[2687:2560] = rdata[5631:5504];
assign mem_data[2687:2560] = ram_read_dataw[5631:5504];
assign ram_write_dataw[2815:2688] = rdata[5503:5376];
assign mem_data[2815:2688] = ram_read_dataw[5503:5376];
assign ram_write_dataw[2943:2816] = rdata[5375:5248];
assign mem_data[2943:2816] = ram_read_dataw[5375:5248];
assign ram_write_dataw[3071:2944] = rdata[5247:5120];
assign mem_data[3071:2944] = ram_read_dataw[5247:5120];
assign ram_write_dataw[3199:3072] = rdata[5119:4992];
assign mem_data[3199:3072] = ram_read_dataw[5119:4992];
assign ram_write_dataw[3327:3200] = rdata[4991:4864];
assign mem_data[3327:3200] = ram_read_dataw[4991:4864];
assign ram_write_dataw[3455:3328] = rdata[4863:4736];
assign mem_data[3455:3328] = ram_read_dataw[4863:4736];
assign ram_write_dataw[3583:3456] = rdata[4735:4608];
assign mem_data[3583:3456] = ram_read_dataw[4735:4608];
assign ram_write_dataw[3711:3584] = rdata[4607:4480];
assign mem_data[3711:3584] = ram_read_dataw[4607:4480];
assign ram_write_dataw[3839:3712] = rdata[4479:4352];
assign mem_data[3839:3712] = ram_read_dataw[4479:4352];
assign ram_write_dataw[3967:3840] = rdata[4351:4224];
assign mem_data[3967:3840] = ram_read_dataw[4351:4224];
assign ram_write_dataw[4095:3968] = rdata[4223:4096];
assign mem_data[4095:3968] = ram_read_dataw[4223:4096];
assign ram_write_dataw[4223:4096] = rdata[4095:3968];
assign mem_data[4223:4096] = ram_read_dataw[4095:3968];
assign ram_write_dataw[4351:4224] = rdata[3967:3840];
assign mem_data[4351:4224] = ram_read_dataw[3967:3840];
assign ram_write_dataw[4479:4352] = rdata[3839:3712];
assign mem_data[4479:4352] = ram_read_dataw[3839:3712];
assign ram_write_dataw[4607:4480] = rdata[3711:3584];
assign mem_data[4607:4480] = ram_read_dataw[3711:3584];
assign ram_write_dataw[4735:4608] = rdata[3583:3456];
assign mem_data[4735:4608] = ram_read_dataw[3583:3456];
assign ram_write_dataw[4863:4736] = rdata[3455:3328];
assign mem_data[4863:4736] = ram_read_dataw[3455:3328];
assign ram_write_dataw[4991:4864] = rdata[3327:3200];
assign mem_data[4991:4864] = ram_read_dataw[3327:3200];
assign ram_write_dataw[5119:4992] = rdata[3199:3072];
assign mem_data[5119:4992] = ram_read_dataw[3199:3072];
assign ram_write_dataw[5247:5120] = rdata[3071:2944];
assign mem_data[5247:5120] = ram_read_dataw[3071:2944];
assign ram_write_dataw[5375:5248] = rdata[2943:2816];
assign mem_data[5375:5248] = ram_read_dataw[2943:2816];
assign ram_write_dataw[5503:5376] = rdata[2815:2688];
assign mem_data[5503:5376] = ram_read_dataw[2815:2688];
assign ram_write_dataw[5631:5504] = rdata[2687:2560];
assign mem_data[5631:5504] = ram_read_dataw[2687:2560];
assign ram_write_dataw[5759:5632] = rdata[2559:2432];
assign mem_data[5759:5632] = ram_read_dataw[2559:2432];
assign ram_write_dataw[5887:5760] = rdata[2431:2304];
assign mem_data[5887:5760] = ram_read_dataw[2431:2304];
assign ram_write_dataw[6015:5888] = rdata[2303:2176];
assign mem_data[6015:5888] = ram_read_dataw[2303:2176];
assign ram_write_dataw[6143:6016] = rdata[2175:2048];
assign mem_data[6143:6016] = ram_read_dataw[2175:2048];
assign ram_write_dataw[6271:6144] = rdata[2047:1920];
assign mem_data[6271:6144] = ram_read_dataw[2047:1920];
assign ram_write_dataw[6399:6272] = rdata[1919:1792];
assign mem_data[6399:6272] = ram_read_dataw[1919:1792];
assign ram_write_dataw[6527:6400] = rdata[1791:1664];
assign mem_data[6527:6400] = ram_read_dataw[1791:1664];
assign ram_write_dataw[6655:6528] = rdata[1663:1536];
assign mem_data[6655:6528] = ram_read_dataw[1663:1536];
assign ram_write_dataw[6783:6656] = rdata[1535:1408];
assign mem_data[6783:6656] = ram_read_dataw[1535:1408];
assign ram_write_dataw[6911:6784] = rdata[1407:1280];
assign mem_data[6911:6784] = ram_read_dataw[1407:1280];
assign ram_write_dataw[7039:6912] = rdata[1279:1152];
assign mem_data[7039:6912] = ram_read_dataw[1279:1152];
assign ram_write_dataw[7167:7040] = rdata[1151:1024];
assign mem_data[7167:7040] = ram_read_dataw[1151:1024];
assign ram_write_dataw[7295:7168] = rdata[1023:896];
assign mem_data[7295:7168] = ram_read_dataw[1023:896];
assign ram_write_dataw[7423:7296] = rdata[895:768];
assign mem_data[7423:7296] = ram_read_dataw[895:768];
assign ram_write_dataw[7551:7424] = rdata[767:640];
assign mem_data[7551:7424] = ram_read_dataw[767:640];
assign ram_write_dataw[7679:7552] = rdata[639:512];
assign mem_data[7679:7552] = ram_read_dataw[639:512];
assign ram_write_dataw[7807:7680] = rdata[511:384];
assign mem_data[7807:7680] = ram_read_dataw[511:384];
assign ram_write_dataw[7935:7808] = rdata[383:256];
assign mem_data[7935:7808] = ram_read_dataw[383:256];
assign ram_write_dataw[8063:7936] = rdata[255:128];
assign mem_data[8063:7936] = ram_read_dataw[255:128];
assign ram_write_dataw[8191:8064] = rdata[127:0];
assign mem_data[8191:8064] = ram_read_dataw[127:0];
assign ram_write_data = ram_write_dataw[8191:832];
assign ram_read_dataw[8191:832] = ram_read_data;
assign ram_read_dataw[831:0] = 0;
assign ram_write_addr = rfifo_addr;
assign ram_read_addr = ram_addr[RAMLAT-1];
assign ram_write_byte_en = ~0;
assign ram_write_en = ram_write_en_reg;
assign rdata_req = !rdata_empty;

// FSM to produce off-chip memory commands
always @ (posedge clk)
begin
	if (reset_n == 0)
	begin
		state <= IDLE;
	end
	else
	begin
		case (state)
		IDLE:
		begin
			if (dtu_write_req)
				state <= WRITE;
			else if (dtu_read_req)
				state <= READ;
			else
				state <= IDLE;
		end
		WRITE:
		begin
			if (not_stall && size == 0 && data_count < BURSTLEN)
				state <= IDLE;
			else
				state <= WRITE;
		end
		READ:
		begin
			if (not_stall && size == 0 && data_count < BURSTLEN)
				state <= IDLE;
			else
				state <= READ;
		end
		default:
		begin
			state <= IDLE;
		end
		endcase
	end
end

always @ (posedge clk)
begin

	if (reset_n == 0)
	begin
		size <= 0;
		data_count <= 0;
		size_count[RAMLAT-1] <= 1;
		mem_addr[RAMLAT] <= 0;
		ram_addr[RAMLAT-1] <= 0;
		fifo_write_reg[RAMLAT-1] <= 0;
		write_req_reg[RAMLAT-1] <= 0;
		fifo_read_reg[0] <= 0;
		read_req_reg[RAMLAT-1] <= 0;
	end
	else if (state == IDLE)
	begin
		size <= dtu_size;
		size_count[RAMLAT-1] <= BURSTLEN;
		mem_addr[RAMLAT] <= dtu_mem_addr;
		ram_addr[RAMLAT-1] <= dtu_ram_addr;
		fifo_write_reg[RAMLAT-1] <= 0;
		write_req_reg[RAMLAT-1] <= 0;
		fifo_read_reg[0] <= 0;
		read_req_reg[RAMLAT-1] <= 0;
		data_count <= 0;
	end
	else if (data_count >= BURSTLEN && not_stall)
	begin
		data_count <= data_count - BURSTLEN;
		mem_addr[RAMLAT] <= mem_addr[RAMLAT] + BURSTLEN;
		fifo_write_reg[RAMLAT-1] <= 0;
		write_req_reg[RAMLAT-1] <= state == WRITE;
		fifo_read_reg[0] <= 0;
		read_req_reg[RAMLAT-1] <= state == READ;
	end
	else if (size == 0 && data_count == 0 && not_stall)
	begin
		fifo_write_reg[RAMLAT-1] <= 0;
		write_req_reg[RAMLAT-1] <= 0;
		fifo_read_reg[0] <= 0;
		read_req_reg[RAMLAT-1] <= 0;
	end
	else if (size == 0 && not_stall)
	begin
		size_count[RAMLAT-1] <= data_count[BURSTWIDTH-1:0];
		fifo_write_reg[RAMLAT-1] <= 0;
		write_req_reg[RAMLAT-1] <= state == WRITE;
		fifo_read_reg[0] <= 0;
		read_req_reg[RAMLAT-1] <= state == READ;
	end
	else if (not_stall)
	begin
		size <= size - 1;
		data_count <= data_count + RATIO - BURSTLEN;
		mem_addr[RAMLAT] <= mem_addr[RAMLAT] + BURSTLEN;
		ram_addr[RAMLAT-1] <= ram_addr[RAMLAT-1]+1;
		fifo_write_reg[RAMLAT-1] <= state == WRITE;
		write_req_reg[RAMLAT-1] <= state == WRITE;
		fifo_read_reg[0] <= state == READ;
		read_req_reg[RAMLAT-1] <= state == READ;
	end
	else
	begin
		fifo_write_reg[RAMLAT-1] <= 0;
	end
end


always @ (posedge clk)
begin
	if (reset_n == 0)
	begin
		fifo_write_reg[0] <= 0;
		fifo_write_reg[1] <= 0;
		fifo_write_reg[2] <= 0;
		fifo_write_reg[3] <= 0;
	end
	else
	begin
		fifo_write_reg[0] <= fifo_write_reg[1];
		fifo_write_reg[1] <= fifo_write_reg[2];
		fifo_write_reg[2] <= fifo_write_reg[3];
		fifo_write_reg[3] <= fifo_write_reg[4];
	end

	if (reset_n == 0)
	begin
		mem_addr[0] <= 0;
		ram_addr[0] <= 0;
		size_count[0] <= 1;
		write_req_reg[0] <= 0;
		read_req_reg[0] <= 0;
		mem_addr[1] <= 0;
		ram_addr[1] <= 0;
		size_count[1] <= 1;
		write_req_reg[1] <= 0;
		read_req_reg[1] <= 0;
		mem_addr[2] <= 0;
		ram_addr[2] <= 0;
		size_count[2] <= 1;
		write_req_reg[2] <= 0;
		read_req_reg[2] <= 0;
		mem_addr[3] <= 0;
		ram_addr[3] <= 0;
		size_count[3] <= 1;
		write_req_reg[3] <= 0;
		read_req_reg[3] <= 0;
		mem_addr[4] <= 0;
	end
	else if (not_stall)
	begin
		size_count[0] <= size_count[1];
		mem_addr[0] <= mem_addr[1];
		ram_addr[0] <= ram_addr[1];
		write_req_reg[0] <= write_req_reg[1];
		read_req_reg[0] <= read_req_reg[1];
		size_count[1] <= size_count[2];
		mem_addr[1] <= mem_addr[2];
		ram_addr[1] <= ram_addr[2];
		write_req_reg[1] <= write_req_reg[2];
		read_req_reg[1] <= read_req_reg[2];
		size_count[2] <= size_count[3];
		mem_addr[2] <= mem_addr[3];
		ram_addr[2] <= ram_addr[3];
		write_req_reg[2] <= write_req_reg[3];
		read_req_reg[2] <= read_req_reg[3];
		size_count[3] <= size_count[4];
		mem_addr[3] <= mem_addr[4];
		ram_addr[3] <= ram_addr[4];
		write_req_reg[3] <= write_req_reg[4];
		read_req_reg[3] <= read_req_reg[4];
		mem_addr[4] <= mem_addr[5];
	end
	
	ram_write_en_reg  <= rdata_req;
end

endmodule
