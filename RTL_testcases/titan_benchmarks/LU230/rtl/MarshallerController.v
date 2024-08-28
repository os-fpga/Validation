module MarshallerController (clk, start, done, input_N, offset,
	comp_start, block_m, block_n, loop, mode, comp_done, cur_mem_sel, left_mem_sel,
	dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done, left_sel);

parameter BLOCKM = 230, BLOCKN = 230;
parameter BLOCKMDIVK = 1;
parameter MEMBLOCKM = 64, MEMBLOCKN = 64;
parameter NWIDTH = 20, BLOCKWIDTH = 8;
parameter DDRSIZEWIDTH = 24, RAMSIZEWIDTH = 8;

input clk;
input start;
output done;
input [NWIDTH-1:0] input_N;
input [DDRSIZEWIDTH-1:0] offset;

// for computation section
output comp_start;
output [BLOCKWIDTH-1:0] block_m, block_n, loop;
output [1:0] mode;
input comp_done;
output cur_mem_sel, left_mem_sel;

// for data marshaller section
output dtu_write_req,	dtu_read_req;
output [DDRSIZEWIDTH-1:0] dtu_mem_addr;
output [RAMSIZEWIDTH-1:0] dtu_ram_addr;
output [BLOCKWIDTH-1:0] dtu_size;
input dtu_ack, dtu_done;
output left_sel;

parameter START = 0,  SETUP = 1, FIRST = 2, MODE0_SETUP = 3, MODE0_WAIT = 4, MODE0 = 5,  MODE1_SETUP = 6, MODE1_WAIT = 7, MODE1 = 8, 
	MODE2_SETUP = 9, MODE2_WAIT = 10, MODE2 = 11, MODE3_SETUP = 12, MODE3_WAIT = 13, MODE3 = 14, STALL = 15, STALL_WAIT = 16, WAIT = 17,
	FINAL_WRITE = 18, FINAL_WAIT = 19, IDLE = 20, LAST_SETUP = 21, LAST_SETUP_WAIT = 22, LAST = 23, LAST_WAIT = 24;
parameter MEM_IDLE = 0, MEM_WRITE = 1, MEM_WRITE_WAIT = 2, MEM_CHECK_DONE = 3, MEM_READ = 4, MEM_READ_WAIT = 5, MEM_DONE = 6, MEM_WAIT_DONE = 7;

reg [4:0] cur_state, next_state;
reg [NWIDTH-1:0] comp_N, N, mcount, ncount, Ndivk, mem_N;
reg [1:0] mode;
reg [BLOCKWIDTH-1:0] block_m, block_n, loop, read_n;
reg [BLOCKWIDTH-1:0] write_n, write_n_buf;
reg left_mem_sel, cur_mem_sel, no_left_switch;

reg [3:0] cur_mem_state, next_mem_state;
reg [RAMSIZEWIDTH-1:0] ram_addr;
reg [DDRSIZEWIDTH-1:0] mem_addr;
reg [DDRSIZEWIDTH-1:0] mem_base, mem_top, mem_write, mem_left, mem_cur;
reg [DDRSIZEWIDTH-1:0] mem_write_buf;
reg [BLOCKWIDTH-1:0] mem_count;
reg [1:0] mem_read;
reg [BLOCKWIDTH-1:0] mem_write_size, mem_write_size_buf, mem_read_size;
wire mem_done;

assign done = (cur_state == IDLE);
assign dtu_ram_addr = ram_addr;
assign dtu_mem_addr = mem_addr;
assign dtu_size = (cur_mem_state == MEM_WRITE) ? mem_write_size : mem_read_size;
assign comp_start = (cur_state == MODE0)||(cur_state == MODE1)||(cur_state == MODE2)||(cur_state == MODE3)||(cur_state == FIRST)||(cur_state == LAST);
assign dtu_write_req = (cur_mem_state == MEM_WRITE);
assign dtu_read_req = (cur_mem_state == MEM_READ);
assign mem_done = (cur_mem_state == MEM_DONE)&&(dtu_done == 1);
assign left_sel = mem_read == 1 && (cur_mem_state == MEM_READ || cur_mem_state == MEM_READ_WAIT || cur_mem_state == MEM_WAIT_DONE);

// FSM to produce memory instructions to DTU
always @ (*)
begin
	case (cur_mem_state)
	MEM_IDLE:
	begin
		if (cur_state == START)
			next_mem_state <= MEM_CHECK_DONE;
		else
			next_mem_state <= MEM_IDLE;
	end
	MEM_DONE:
	begin
		if (cur_state == MODE0 || cur_state == MODE1 || cur_state == MODE2 || 
			cur_state == MODE3 || cur_state == FINAL_WRITE || cur_state == LAST_SETUP)
			next_mem_state <= MEM_WRITE;
		else if (cur_state == FIRST)
			next_mem_state <= MEM_CHECK_DONE;
		else
			next_mem_state <= MEM_DONE;
	end
	MEM_WRITE:
	begin
		next_mem_state <= MEM_WRITE_WAIT;
	end
	MEM_WRITE_WAIT:
	begin
		if (dtu_ack == 1)
		begin
			if (mem_count == write_n)
				next_mem_state <= MEM_WAIT_DONE;
			else 
				next_mem_state <= MEM_WRITE;
		end
		else
			next_mem_state <= MEM_WRITE_WAIT;
	end
	MEM_WAIT_DONE:
	begin
		if (dtu_done == 1)
			next_mem_state <= MEM_CHECK_DONE;
		else
			next_mem_state <= MEM_WAIT_DONE;
	end
	MEM_CHECK_DONE:
	begin
		if (mem_read == 0)
			next_mem_state <= MEM_DONE;
		else
			next_mem_state <= MEM_READ;
	end
	MEM_READ:
	begin
		next_mem_state <= MEM_READ_WAIT;
	end
	MEM_READ_WAIT:
	begin
		if (dtu_ack == 1)
		begin
			if (mem_count == read_n)
				next_mem_state <= MEM_WAIT_DONE;
			else
				next_mem_state <= MEM_READ;
		end
		else
			next_mem_state <= MEM_READ_WAIT;
	end
	default:
		next_mem_state <= MEM_IDLE;
	endcase
end

always @ (posedge clk)
begin
	if (cur_mem_state == MEM_DONE || cur_mem_state == MEM_IDLE)
	begin
		ram_addr <= 0;
		mem_addr <= mem_write;
		if (next_state == LAST_WAIT || next_state == FINAL_WAIT || next_state == STALL)
			mem_read <= 0;
		else if (next_state == MODE0_SETUP || next_state == SETUP || cur_state == MODE0 || next_state == LAST_SETUP_WAIT)
			mem_read <= 1;
		else
			mem_read <= 2;
		mem_count <= 0;
	end
	else if (cur_mem_state == MEM_CHECK_DONE)
	begin
		if (mem_read == 2)
		begin
			mem_addr <= mem_left;
			read_n <= loop;
		end
		else
		begin
			mem_addr <= mem_cur;
			read_n <= block_n;
		end
		mem_read <= mem_read - 1;
		mem_count <= 0;
		ram_addr <= 0;
	end
	else if (cur_mem_state == MEM_WRITE || cur_mem_state == MEM_READ)
	begin
		ram_addr <= ram_addr + BLOCKMDIVK;
		mem_addr <= mem_addr + Ndivk;
		mem_count <= mem_count + 1;
	end
	
end

// FSM to determine the block LU factorization algorithm
always @ (*)
begin
	case (cur_state)
	START:
	begin
		next_state <= SETUP;
	end
	SETUP:
	begin
		next_state <= WAIT;
	end
	WAIT:
	begin
		if (mem_done == 1)
			next_state <= FIRST;
		else
			next_state <= WAIT;

	end
	FIRST:
	begin
		if (mcount < comp_N)
			next_state <= MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= MODE2_SETUP;
		else
			next_state <= LAST_WAIT;
	end
	MODE0_SETUP:
	begin
		next_state <= MODE0_WAIT;
	end
	MODE0_WAIT:
	begin
		if (mem_done == 1 && comp_done == 1)
			next_state <= MODE0;
		else
			next_state <= MODE0_WAIT;

	end
	MODE0:
	begin
		if (mcount < comp_N)
			next_state <= MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= MODE2_SETUP;
		else
		begin
			next_state <= LAST_WAIT;
		end
	end
	MODE1_SETUP:
	begin
		next_state <= MODE1_WAIT;
	end
	MODE1_WAIT:
	begin
		if (mem_done == 1 && comp_done == 1)
			next_state <= MODE1;
		else
			next_state <= MODE1_WAIT;

	end
	MODE1:
	begin
		if (mcount < comp_N)
			next_state <= MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= MODE2_SETUP;
		else if (comp_N <= BLOCKN + BLOCKN)
			next_state <= STALL;
		else
			next_state <= MODE0_SETUP;
	end
	MODE2_SETUP:
	begin
		next_state <= MODE2_WAIT;
	end
	MODE2_WAIT:
	begin
		if (mem_done == 1 && comp_done == 1)
			next_state <= MODE2;
		else
			next_state <= MODE2_WAIT;
	end
	MODE2:
	begin
		if (mcount < comp_N)
			next_state <= MODE3_SETUP;
		else if (ncount < comp_N)
			next_state <= MODE2_SETUP;
		else if (comp_N <= BLOCKN + BLOCKN)
			next_state <= STALL;
		else
			next_state <= MODE0_SETUP;
	end
	MODE3_SETUP:
	begin
		next_state <= MODE3_WAIT;
	end
	MODE3_WAIT:
	begin
		if (mem_done == 1 && comp_done == 1)
			next_state <= MODE3;
		else
			next_state <= MODE3_WAIT;
	end
	MODE3:
	begin
		if (mcount < comp_N)
			next_state <= MODE3_SETUP;
		else if (ncount < comp_N)
			next_state <= MODE2_SETUP;
		else if (comp_N <= BLOCKN + BLOCKN)
			next_state <= STALL;
		else
			next_state <= MODE0_SETUP;
	end
	STALL:
		next_state <= STALL_WAIT;
	STALL_WAIT:
		if (mem_done == 1 && comp_done == 1)
			next_state <= LAST_SETUP;
		else
			next_state <= STALL_WAIT;
	LAST_SETUP:
		next_state <= LAST_SETUP_WAIT;
	LAST_SETUP_WAIT:
		if (mem_done == 1 && comp_done == 1)
			next_state <= LAST;
		else
			next_state <= LAST_SETUP_WAIT;
	LAST:
		next_state <= LAST_WAIT;
	LAST_WAIT:
		if (mem_done == 1 && comp_done == 1)
			next_state <= FINAL_WRITE;
		else
			next_state <= LAST_WAIT;
	FINAL_WRITE:
		next_state <= FINAL_WAIT;
	FINAL_WAIT:
		if (mem_done == 1)
			next_state <= IDLE;
		else
			next_state <= FINAL_WAIT;
	IDLE:
		if (start)
			next_state <= SETUP;
		else
			next_state <= IDLE;
	default:
		next_state <= START;
	endcase
end

always @ (posedge clk)
begin
	if (start)
	begin
		cur_state <= START;
		cur_mem_state <= MEM_IDLE;
	end
	else
	begin
		cur_state <= next_state;
		cur_mem_state <= next_mem_state;
	end
end

always @ (*)
begin
	case (cur_state)
	MODE1:
		mode = 1;
	MODE2:
		mode = 2;
	MODE3:
		mode = 3;
	default:
		mode = 0;
	endcase
end

always @ (posedge clk)
begin
	if (start)
	begin
		comp_N <= input_N;
		N <= input_N;
	end
	else if (next_state == MODE0)
	begin
		comp_N <= comp_N - BLOCKN;
	end

	Ndivk <= ((N+BLOCKM-1)/BLOCKM)*MEMBLOCKM;
	mem_N <= Ndivk*BLOCKN;

	if (start)
	begin
		mem_base <= offset;
		mem_top <= offset;
		mem_left <= offset;
		mem_cur <= offset;
	end
	else if (cur_state == MODE0_SETUP)
	begin
		mem_base <= mem_base + mem_N+MEMBLOCKN;
		mem_top <= mem_base + mem_N+MEMBLOCKN;
		mem_cur <= mem_base + mem_N+MEMBLOCKN;
		mem_left <= mem_base + mem_N+MEMBLOCKN;
	end
	else if (cur_state == MODE1_SETUP)
	begin
		mem_cur <= mem_cur + MEMBLOCKM;
	end	
	else if (cur_state == MODE3_SETUP)
	begin
		mem_cur <= mem_cur + MEMBLOCKM;
		mem_left <= mem_left + MEMBLOCKM;
	end
	else if (cur_state == MODE2_SETUP)
	begin
		mem_cur <= mem_top + mem_N;
		mem_top <= mem_top + mem_N;
		mem_left <= mem_base;
	end

	if (cur_state == SETUP)
	begin
		mem_write <= 0;
		mem_write_buf <= 0;
		mem_write_size <= BLOCKMDIVK;
		mem_write_size_buf <= BLOCKMDIVK;
		write_n <= block_n;
		write_n_buf <= block_n;
	end
	else if (cur_mem_state == MEM_CHECK_DONE && mem_read == 0)
	begin
		mem_write <= mem_write_buf;
		mem_write_buf <= mem_cur;
		mem_write_size <= mem_write_size_buf;
		mem_write_size_buf <= mem_read_size;
		write_n <= write_n_buf;
		write_n_buf <= block_n;
	end

	mem_read_size <= BLOCKMDIVK;

	if (start)
		loop <= BLOCKN;
	else if (next_state == LAST)
		loop <= comp_N[8:0] - BLOCKN;
	
	if (cur_state == MODE0_SETUP || cur_state == MODE2_SETUP || start)
		mcount <= BLOCKM;
	else if (cur_state == MODE1_SETUP || cur_state == MODE3_SETUP)
		mcount <= mcount+BLOCKM;

	if (cur_state == MODE0_SETUP || start)
		ncount <= BLOCKN;
	else if (cur_state == MODE2_SETUP)
		ncount <= ncount+BLOCKN;

	if (mcount < comp_N)
		block_m <= BLOCKM;
	else
		block_m <= comp_N - mcount + BLOCKM;
	
	if (ncount < comp_N)
		block_n <= BLOCKN;
	else
		block_n <= comp_N - ncount + BLOCKN;

	if (start)
		cur_mem_sel <= 0;
	else if ((cur_state == MODE0)||(cur_state == MODE1)||(cur_state == MODE2)||(cur_state == MODE3)||
		 (cur_state == FIRST)||(cur_state == FINAL_WRITE)||(cur_state == LAST_SETUP)||(cur_state == LAST))
		cur_mem_sel <= !cur_mem_sel;
	
	if (start)
		no_left_switch <= 0;
	else if ((cur_state == MODE0)||(cur_state == FIRST))
		no_left_switch <= 1;
	else if ((cur_state == MODE1)||(cur_state == MODE2)||(cur_state == MODE3)||
		 (cur_state == FINAL_WRITE)||(cur_state == LAST_SETUP))
		no_left_switch <= 0;

	if (start)
		left_mem_sel <= 0;
	else if (((cur_state == MODE0)||(cur_state == MODE1)||(cur_state == MODE2)||(cur_state == MODE3)||
		 (cur_state == FIRST)||(cur_state == FINAL_WRITE)||(cur_state == LAST_SETUP))&&(no_left_switch == 0))
		left_mem_sel <= !left_mem_sel;
end

endmodule
