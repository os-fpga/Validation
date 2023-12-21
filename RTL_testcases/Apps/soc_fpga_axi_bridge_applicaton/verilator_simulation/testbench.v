`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2023 09:01:50 PM
// Design Name: 
// Module Name: tb2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb2(

    );
    reg clk;
    reg reset_n;
    reg m00_axi_init_axi_txn_0_1;
    reg reset_rtl_0_1;
    reg [31:0] C_M_TARGET_SLAVE_BASE_ADDR_0_1;
    
    top m1
   (.clk(clk),
   .reset_n(reset_n),
    .m00_axi_init_axi_txn_0_1(m00_axi_init_axi_txn_0_1),
    .C_M_TARGET_SLAVE_BASE_ADDR_0_1(C_M_TARGET_SLAVE_BASE_ADDR_0_1),
    .reset_rtl_0_1 (reset_rtl_0_1)
    );    
    always #5 clk =!clk;
    initial 
    begin
       clk =0;
       reset_rtl_0_1 =0;
       reset_n       =1;
       C_M_TARGET_SLAVE_BASE_ADDR_0_1 = 32'h000000ff;
       m00_axi_init_axi_txn_0_1=0;
       #50;
       reset_rtl_0_1 =1;
       reset_n    =0;
       #50;
       reset_rtl_0_1 =0;
       reset_n =1;
       #10;
       m00_axi_init_axi_txn_0_1=1;
       #50; 
       m00_axi_init_axi_txn_0_1 =1;
       #2080 ;
       m00_axi_init_axi_txn_0_1 =0;
       C_M_TARGET_SLAVE_BASE_ADDR_0_1 = 32'h010000ff;
       #50 ;
       m00_axi_init_axi_txn_0_1=1;
       //C_M_TARGET_SLAVE_BASE_ADDR_0 = 32'h001000ff;
       end
    initial begin
            $dumpfile("tb.vcd");
            $dumpvars;
            #7000  $finish;
            $display("SoC Simulation Completed");
        end
    
endmodule


/*

Copyright (c) 2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module axi_ram #
(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 16,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 8,
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
)
(
    input  wire                   clk,
    input  wire                   rst,

    input  wire [ID_WIDTH-1:0]    s_axi_awid,
    input  wire [ADDR_WIDTH-1:0]  s_axi_awaddr,
    input  wire [7:0]             s_axi_awlen,
    input  wire [2:0]             s_axi_awsize,
    input  wire [1:0]             s_axi_awburst,
    input  wire                   s_axi_awlock,
    input  wire [3:0]             s_axi_awcache,
    input  wire [2:0]             s_axi_awprot,
    input  wire                   s_axi_awvalid,
    output wire                   s_axi_awready,

    input  wire [DATA_WIDTH-1:0]  s_axi_wdata,
    input  wire [STRB_WIDTH-1:0]  s_axi_wstrb,
    input  wire                   s_axi_wlast,
    input  wire                   s_axi_wvalid,
    output wire                   s_axi_wready,

    output wire [ID_WIDTH-1:0]    s_axi_bid,
    output wire [1:0]             s_axi_bresp,
    output wire                   s_axi_bvalid,
    input  wire                   s_axi_bready,

    input  wire [ID_WIDTH-1:0]    s_axi_arid,
    input  wire [ADDR_WIDTH-1:0]  s_axi_araddr,
    input  wire [7:0]             s_axi_arlen,
    input  wire [2:0]             s_axi_arsize,
    input  wire [1:0]             s_axi_arburst,
    input  wire                   s_axi_arlock,
    input  wire [3:0]             s_axi_arcache,
    input  wire [2:0]             s_axi_arprot,
    input  wire                   s_axi_arvalid,
    output wire                   s_axi_arready,
    
    output wire [ID_WIDTH-1:0]    s_axi_rid,
    output wire [DATA_WIDTH-1:0]  s_axi_rdata,
    output wire [1:0]             s_axi_rresp,
    output wire                   s_axi_rlast,
    output wire                   s_axi_rvalid,
    input  wire                   s_axi_rready
);

parameter VALID_ADDR_WIDTH = ADDR_WIDTH - $clog2(STRB_WIDTH);
parameter WORD_WIDTH = STRB_WIDTH;
parameter WORD_SIZE = DATA_WIDTH/WORD_WIDTH;

// bus width assertions
initial begin
    if (WORD_SIZE * STRB_WIDTH != DATA_WIDTH) begin
        $error("Error: AXI data width not evenly divisble (instance %m)");
        $finish;
    end

    if (2**$clog2(WORD_WIDTH) != WORD_WIDTH) begin
        $error("Error: AXI word width must be even power of two (instance %m)");
        $finish;
    end
end

localparam [0:0]
    READ_STATE_IDLE = 1'd0,
    READ_STATE_BURST = 1'd1;

reg [0:0] read_state_reg = READ_STATE_IDLE, read_state_next;

localparam [1:0]
    WRITE_STATE_IDLE = 2'd0,
    WRITE_STATE_BURST = 2'd1,
    WRITE_STATE_RESP = 2'd2;

reg [1:0] write_state_reg = WRITE_STATE_IDLE, write_state_next;

reg mem_wr_en;
reg mem_rd_en;

reg [ID_WIDTH-1:0] read_id_reg = {ID_WIDTH{1'b0}}, read_id_next;
reg [ADDR_WIDTH-1:0] read_addr_reg = {ADDR_WIDTH{1'b0}}, read_addr_next;
reg [7:0] read_count_reg = 8'd0, read_count_next;
reg [2:0] read_size_reg = 3'd0, read_size_next;
reg [1:0] read_burst_reg = 2'd0, read_burst_next;
reg [ID_WIDTH-1:0] write_id_reg = {ID_WIDTH{1'b0}}, write_id_next;
reg [ADDR_WIDTH-1:0] write_addr_reg = {ADDR_WIDTH{1'b0}}, write_addr_next;
reg [7:0] write_count_reg = 8'd0, write_count_next;
reg [2:0] write_size_reg = 3'd0, write_size_next;
reg [1:0] write_burst_reg = 2'd0, write_burst_next;

reg s_axi_awready_reg = 1'b0, s_axi_awready_next;
reg s_axi_wready_reg = 1'b0, s_axi_wready_next;
reg [ID_WIDTH-1:0] s_axi_bid_reg = {ID_WIDTH{1'b0}}, s_axi_bid_next;
reg s_axi_bvalid_reg = 1'b0, s_axi_bvalid_next;
reg s_axi_arready_reg = 1'b0, s_axi_arready_next;
reg [ID_WIDTH-1:0] s_axi_rid_reg = {ID_WIDTH{1'b0}}, s_axi_rid_next;
reg [DATA_WIDTH-1:0] s_axi_rdata_reg = {DATA_WIDTH{1'b0}}, s_axi_rdata_next;
reg s_axi_rlast_reg = 1'b0, s_axi_rlast_next;
reg s_axi_rvalid_reg = 1'b0, s_axi_rvalid_next;
reg [ID_WIDTH-1:0] s_axi_rid_pipe_reg = {ID_WIDTH{1'b0}};
reg [DATA_WIDTH-1:0] s_axi_rdata_pipe_reg = {DATA_WIDTH{1'b0}};
reg s_axi_rlast_pipe_reg = 1'b0;
reg s_axi_rvalid_pipe_reg = 1'b0;

// (* RAM_STYLE="BLOCK" *)
reg [DATA_WIDTH-1:0] mem[(2**VALID_ADDR_WIDTH)-1:0];

wire [VALID_ADDR_WIDTH-1:0] s_axi_awaddr_valid = s_axi_awaddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
wire [VALID_ADDR_WIDTH-1:0] s_axi_araddr_valid = s_axi_araddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
wire [VALID_ADDR_WIDTH-1:0] read_addr_valid = read_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
wire [VALID_ADDR_WIDTH-1:0] write_addr_valid = write_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);

assign s_axi_awready = s_axi_awready_reg;
assign s_axi_wready = s_axi_wready_reg;
assign s_axi_bid = s_axi_bid_reg;
assign s_axi_bresp = 2'b00;
assign s_axi_bvalid = s_axi_bvalid_reg;
assign s_axi_arready = s_axi_arready_reg;
assign s_axi_rid = PIPELINE_OUTPUT ? s_axi_rid_pipe_reg : s_axi_rid_reg;
assign s_axi_rdata = PIPELINE_OUTPUT ? s_axi_rdata_pipe_reg : s_axi_rdata_reg;
assign s_axi_rresp = 2'b00;
assign s_axi_rlast = PIPELINE_OUTPUT ? s_axi_rlast_pipe_reg : s_axi_rlast_reg;
assign s_axi_rvalid = PIPELINE_OUTPUT ? s_axi_rvalid_pipe_reg : s_axi_rvalid_reg;

integer i, j;

initial begin
    // two nested loops for smaller number of iterations per loop
    // workaround for synthesizer complaints about large loop counts
    for (i = 0; i < 2**VALID_ADDR_WIDTH; i = i + 2**(VALID_ADDR_WIDTH/2)) begin
        for (j = i; j < i + 2**(VALID_ADDR_WIDTH/2); j = j + 1) begin
            mem[j] = 0;
        end
    end
end

always @* begin
    write_state_next = WRITE_STATE_IDLE;

    mem_wr_en = 1'b0;

    write_id_next = write_id_reg;
    write_addr_next = write_addr_reg;
    write_count_next = write_count_reg;
    write_size_next = write_size_reg;
    write_burst_next = write_burst_reg;

    s_axi_awready_next = 1'b0;
    s_axi_wready_next = 1'b0;
    s_axi_bid_next = s_axi_bid_reg;
    s_axi_bvalid_next = s_axi_bvalid_reg && !s_axi_bready;

    case (write_state_reg)
        WRITE_STATE_IDLE: begin
            s_axi_awready_next = 1'b1;

            if (s_axi_awready && s_axi_awvalid) begin
                write_id_next = s_axi_awid;
                write_addr_next = s_axi_awaddr;
                write_count_next = s_axi_awlen;
                write_size_next = s_axi_awsize < $clog2(STRB_WIDTH) ? s_axi_awsize : $clog2(STRB_WIDTH);
                write_burst_next = s_axi_awburst;

                s_axi_awready_next = 1'b0;
                s_axi_wready_next = 1'b1;
                write_state_next = WRITE_STATE_BURST;
            end else begin
                write_state_next = WRITE_STATE_IDLE;
            end
        end
        WRITE_STATE_BURST: begin
            s_axi_wready_next = 1'b1;

            if (s_axi_wready && s_axi_wvalid) begin
                mem_wr_en = 1'b1;
                if (write_burst_reg != 2'b00) begin
                    write_addr_next = write_addr_reg + (1 << write_size_reg);
                end
                write_count_next = write_count_reg - 1;
                if (write_count_reg > 0) begin
                    write_state_next = WRITE_STATE_BURST;
                end else begin
                    s_axi_wready_next = 1'b0;
                    if (s_axi_bready || !s_axi_bvalid) begin
                        s_axi_bid_next = write_id_reg;
                        s_axi_bvalid_next = 1'b1;
                        s_axi_awready_next = 1'b1;
                        write_state_next = WRITE_STATE_IDLE;
                    end else begin
                        write_state_next = WRITE_STATE_RESP;
                    end
                end
            end else begin
                write_state_next = WRITE_STATE_BURST;
            end
        end
        WRITE_STATE_RESP: begin
            if (s_axi_bready || !s_axi_bvalid) begin
                s_axi_bid_next = write_id_reg;
                s_axi_bvalid_next = 1'b1;
                s_axi_awready_next = 1'b1;
                write_state_next = WRITE_STATE_IDLE;
            end else begin
                write_state_next = WRITE_STATE_RESP;
            end
        end
    endcase
end

always @(posedge clk) begin
    write_state_reg <= write_state_next;

    write_id_reg <= write_id_next;
    write_addr_reg <= write_addr_next;
    write_count_reg <= write_count_next;
    write_size_reg <= write_size_next;
    write_burst_reg <= write_burst_next;

    s_axi_awready_reg <= s_axi_awready_next;
    s_axi_wready_reg <= s_axi_wready_next;
    s_axi_bid_reg <= s_axi_bid_next;
    s_axi_bvalid_reg <= s_axi_bvalid_next;

    for (i = 0; i < WORD_WIDTH; i = i + 1) begin
        if (mem_wr_en & s_axi_wstrb[i]) begin
            mem[write_addr_valid][WORD_SIZE*i +: WORD_SIZE] <= s_axi_wdata[WORD_SIZE*i +: WORD_SIZE];
        end
    end

    if (rst) begin
        write_state_reg <= WRITE_STATE_IDLE;

        s_axi_awready_reg <= 1'b0;
        s_axi_wready_reg <= 1'b0;
        s_axi_bvalid_reg <= 1'b0;
    end
end

always @* begin
    read_state_next = READ_STATE_IDLE;

    mem_rd_en = 1'b0;

    s_axi_rid_next = s_axi_rid_reg;
    s_axi_rlast_next = s_axi_rlast_reg;
    s_axi_rvalid_next = s_axi_rvalid_reg && !(s_axi_rready || (PIPELINE_OUTPUT && !s_axi_rvalid_pipe_reg));

    read_id_next = read_id_reg;
    read_addr_next = read_addr_reg;
    read_count_next = read_count_reg;
    read_size_next = read_size_reg;
    read_burst_next = read_burst_reg;

    s_axi_arready_next = 1'b0;

    case (read_state_reg)
        READ_STATE_IDLE: begin
            s_axi_arready_next = 1'b1;

            if (s_axi_arready && s_axi_arvalid) begin
                read_id_next = s_axi_arid;
                read_addr_next = s_axi_araddr;
                read_count_next = s_axi_arlen;
                read_size_next = s_axi_arsize < $clog2(STRB_WIDTH) ? s_axi_arsize : $clog2(STRB_WIDTH);
                read_burst_next = s_axi_arburst;

                s_axi_arready_next = 1'b0;
                read_state_next = READ_STATE_BURST;
            end else begin
                read_state_next = READ_STATE_IDLE;
            end
        end
        READ_STATE_BURST: begin
            if (s_axi_rready || (PIPELINE_OUTPUT && !s_axi_rvalid_pipe_reg) || !s_axi_rvalid_reg) begin
                mem_rd_en = 1'b1;
                s_axi_rvalid_next = 1'b1;
                s_axi_rid_next = read_id_reg;
                s_axi_rlast_next = read_count_reg == 0;
                if (read_burst_reg != 2'b00) begin
                    read_addr_next = read_addr_reg + (1 << read_size_reg);
                end
                read_count_next = read_count_reg - 1;
                if (read_count_reg > 0) begin
                    read_state_next = READ_STATE_BURST;
                end else begin
                    s_axi_arready_next = 1'b1;
                    read_state_next = READ_STATE_IDLE;
                end
            end else begin
                read_state_next = READ_STATE_BURST;
            end
        end
    endcase
end

always @(posedge clk) begin
    read_state_reg <= read_state_next;

    read_id_reg <= read_id_next;
    read_addr_reg <= read_addr_next;
    read_count_reg <= read_count_next;
    read_size_reg <= read_size_next;
    read_burst_reg <= read_burst_next;

    s_axi_arready_reg <= s_axi_arready_next;
    s_axi_rid_reg <= s_axi_rid_next;
    s_axi_rlast_reg <= s_axi_rlast_next;
    s_axi_rvalid_reg <= s_axi_rvalid_next;

    if (mem_rd_en) begin
        s_axi_rdata_reg <= mem[read_addr_valid];
    end

    if (!s_axi_rvalid_pipe_reg || s_axi_rready) begin
        s_axi_rid_pipe_reg <= s_axi_rid_reg;
        s_axi_rdata_pipe_reg <= s_axi_rdata_reg;
        s_axi_rlast_pipe_reg <= s_axi_rlast_reg;
        s_axi_rvalid_pipe_reg <= s_axi_rvalid_reg;
    end

    if (rst) begin
        read_state_reg <= READ_STATE_IDLE;

        s_axi_arready_reg <= 1'b0;
        s_axi_rvalid_reg <= 1'b0;
        s_axi_rvalid_pipe_reg <= 1'b0;
    end
end

endmodule

`resetall


// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : axi_ram_wrapper.v
// Device     : gemini
// LiteX sha1 : --------
// Date       : 2023-05-30 09:34:12
//------------------------------------------------------------------------------
// This file is Copyright (c) 2022 RapidSilicon
//--------------------------------------------------------------------------------

`timescale 1ns / 1ps

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module axi_ram_wrapper (
    input  wire          clk,
    input  wire          rst,
    input  wire          s_axi_awvalid,
    output wire          s_axi_awready,
    input  wire   [31:0] s_axi_awaddr,
    input  wire    [1:0] s_axi_awburst,
    input  wire    [7:0] s_axi_awlen,
    input  wire    [2:0] s_axi_awsize,
    input  wire          s_axi_awlock,
    input  wire    [2:0] s_axi_awprot,
    input  wire    [3:0] s_axi_awcache,
    input  wire    [3:0] s_axi_awqos,
    input  wire    [3:0] s_axi_awregion,
    input  wire    [7:0] s_axi_awid,
    input  wire          s_axi_awuser,
    input  wire          s_axi_wvalid,
    output wire          s_axi_wready,
    input  wire          s_axi_wlast,
    input  wire   [31:0] s_axi_wdata,
    input  wire    [3:0] s_axi_wstrb,
    input  wire          s_axi_wuser,
    output wire          s_axi_bvalid,
    input  wire          s_axi_bready,
    output wire    [1:0] s_axi_bresp,
    output wire    [7:0] s_axi_bid,
    output wire          s_axi_buser,
    input  wire          s_axi_arvalid,
    output wire          s_axi_arready,
    input  wire   [31:0] s_axi_araddr,
    input  wire    [1:0] s_axi_arburst,
    input  wire    [7:0] s_axi_arlen,
    input  wire    [2:0] s_axi_arsize,
    input  wire          s_axi_arlock,
    input  wire    [2:0] s_axi_arprot,
    input  wire    [3:0] s_axi_arcache,
    input  wire    [3:0] s_axi_arqos,
    input  wire    [3:0] s_axi_arregion,
    input  wire    [7:0] s_axi_arid,
    input  wire          s_axi_aruser,
    output wire          s_axi_rvalid,
    input  wire          s_axi_rready,
    output wire          s_axi_rlast,
    output wire    [1:0] s_axi_rresp,
    output wire   [31:0] s_axi_rdata,
    output wire    [7:0] s_axi_rid,
    output wire          s_axi_ruser
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

wire          sys_clk;
wire          sys_rst;
wire          aw_valid;
wire          aw_ready;
wire   [15:0] aw_payload_addr;
wire    [1:0] aw_payload_burst;
wire    [7:0] aw_payload_len;
wire    [2:0] aw_payload_size;
wire          aw_payload_lock;
wire    [2:0] aw_payload_prot;
wire    [3:0] aw_payload_cache;
wire    [3:0] aw_payload_qos;
wire    [3:0] aw_payload_region;
wire    [7:0] aw_param_id;
wire          aw_param_user;
wire          w_valid;
wire          w_ready;
wire          w_last;
wire   [63:0] w_payload_data;
wire    [7:0] w_payload_strb;
wire          w_param_user;
wire          b_valid;
wire          b_ready;
wire    [1:0] b_payload_resp;
wire    [7:0] b_param_id;
reg           b_param_user = 1'd0;
wire          ar_valid;
wire          ar_ready;
wire   [15:0] ar_payload_addr;
wire    [1:0] ar_payload_burst;
wire    [7:0] ar_payload_len;
wire    [2:0] ar_payload_size;
wire          ar_payload_lock;
wire    [2:0] ar_payload_prot;
wire    [3:0] ar_payload_cache;
wire    [3:0] ar_payload_qos;
wire    [3:0] ar_payload_region;
wire    [7:0] ar_param_id;
wire          ar_param_user;
wire          r_valid;
wire          r_ready;
wire          r_last;
wire    [1:0] r_payload_resp;
wire   [63:0] r_payload_data;
wire    [7:0] r_param_id;
reg           r_param_user = 1'd0;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign sys_clk = clk;
assign sys_rst = rst;
assign aw_valid = s_axi_awvalid;
assign aw_payload_addr = s_axi_awaddr;
assign aw_payload_burst = s_axi_awburst;
assign aw_payload_len = s_axi_awlen;
assign aw_payload_size = s_axi_awsize;
assign aw_payload_lock = s_axi_awlock;
assign aw_payload_prot = s_axi_awprot;
assign aw_payload_cache = s_axi_awcache;
assign aw_payload_qos = s_axi_awqos;
assign aw_payload_region = s_axi_awregion;
assign aw_param_id = s_axi_awid;
assign aw_param_user = s_axi_awuser;
assign s_axi_awready = aw_ready;
assign w_valid = s_axi_wvalid;
assign w_payload_data = s_axi_wdata;
assign w_payload_strb = s_axi_wstrb;
assign w_param_user = s_axi_wuser;
assign w_last = s_axi_wlast;
assign s_axi_wready = w_ready;
assign s_axi_bvalid = b_valid;
assign s_axi_bresp = b_payload_resp;
assign s_axi_bid = b_param_id;
assign s_axi_buser = b_param_user;
assign b_ready = s_axi_bready;
assign ar_valid = s_axi_arvalid;
assign ar_payload_addr = s_axi_araddr;
assign ar_payload_burst = s_axi_arburst;
assign ar_payload_len = s_axi_arlen;
assign ar_payload_size = s_axi_arsize;
assign ar_payload_lock = s_axi_arlock;
assign ar_payload_prot = s_axi_arprot;
assign ar_payload_cache = s_axi_arcache;
assign ar_payload_qos = s_axi_arqos;
assign ar_payload_region = s_axi_arregion;
assign ar_param_id = s_axi_arid;
assign ar_param_user = s_axi_aruser;
assign s_axi_arready = ar_ready;
assign s_axi_rvalid = r_valid;
assign s_axi_rresp = r_payload_resp;
assign s_axi_rdata = r_payload_data;
assign s_axi_rid = r_param_id;
assign s_axi_ruser = r_param_user;
assign s_axi_rlast = r_last;
assign r_ready = s_axi_rready;


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

axi_ram #(
	.ADDR_WIDTH(16),
	.DATA_WIDTH(64),
	.ID_WIDTH(8),
	.PIPELINE_OUTPUT(1'd0)
) axi_ram (
	.clk(sys_clk),
	.rst(sys_rst),
	.s_axi_araddr(ar_payload_addr),
	.s_axi_arburst(ar_payload_burst),
	.s_axi_arcache(ar_payload_cache),
	.s_axi_arid(ar_param_id),
	.s_axi_arlen(ar_payload_len),
	.s_axi_arlock(ar_payload_lock),
	.s_axi_arprot(ar_payload_prot),
	.s_axi_arsize(ar_payload_size),
	.s_axi_arvalid(ar_valid),
	.s_axi_awaddr(aw_payload_addr),
	.s_axi_awburst(aw_payload_burst),
	.s_axi_awcache(aw_payload_cache),
	.s_axi_awid(aw_param_id),
	.s_axi_awlen(aw_payload_len),
	.s_axi_awlock(aw_payload_lock),
	.s_axi_awprot(aw_payload_prot),
	.s_axi_awsize(aw_payload_size),
	.s_axi_awvalid(aw_valid),
	.s_axi_bready(b_ready),
	.s_axi_rready(r_ready),
	.s_axi_wdata(w_payload_data),
	.s_axi_wlast(w_last),
	.s_axi_wstrb(w_payload_strb),
	.s_axi_wvalid(w_valid),
	.s_axi_arready(ar_ready),
	.s_axi_awready(aw_ready),
	.s_axi_bid(b_param_id),
	.s_axi_bresp(b_payload_resp),
	.s_axi_bvalid(b_valid),
	.s_axi_rdata(r_payload_data),
	.s_axi_rid(r_param_id),
	.s_axi_rlast(r_last),
	.s_axi_rresp(r_payload_resp),
	.s_axi_rvalid(r_valid),
	.s_axi_wready(w_ready)
);

endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2023-05-30 09:34:12.
//------------------------------------------------------------------------------


// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:axi_interconnect_wrapper:1.0
// IP Revision: 1

//(* X_CORE_INFO = "axi_interconnect_wrapper,Vivado 2022.1" *)
//(* CHECK_LICENSE_TYPE = "design_1_axi_interconnect_wra_0_0,axi_interconnect_wrapper,{}" *)
//(* CORE_GENERATION_INFO = "design_1_axi_interconnect_wra_0_0,axi_interconnect_wrapper,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=axi_interconnect_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
//(* IP_DEFINITION_SOURCE = "module_ref" *)
//(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_axi_interconnect_wra_0_0 (
  clk,
  rst,
  s00_axi_awvalid,
  s00_axi_awready,
  s00_axi_awaddr,
  s00_axi_awburst,
  s00_axi_awlen,
  s00_axi_awsize,
  s00_axi_awlock,
  s00_axi_awprot,
  s00_axi_awcache,
  s00_axi_awqos,
  s00_axi_awregion,
  s00_axi_awid,
  s00_axi_awuser,
  s00_axi_wvalid,
  s00_axi_wready,
  s00_axi_wlast,
  s00_axi_wdata,
  s00_axi_wstrb,
  s00_axi_wuser,
  s00_axi_bvalid,
  s00_axi_bready,
  s00_axi_bresp,
  s00_axi_bid,
  s00_axi_buser,
  s00_axi_arvalid,
  s00_axi_arready,
  s00_axi_araddr,
  s00_axi_arburst,
  s00_axi_arlen,
  s00_axi_arsize,
  s00_axi_arlock,
  s00_axi_arprot,
  s00_axi_arcache,
  s00_axi_arqos,
  s00_axi_arregion,
  s00_axi_arid,
  s00_axi_aruser,
  s00_axi_rvalid,
  s00_axi_rready,
  s00_axi_rlast,
  s00_axi_rresp,
  s00_axi_rdata,
  s00_axi_rid,
  s00_axi_ruser,
  s01_axi_awvalid,
  s01_axi_awready,
  s01_axi_awaddr,
  s01_axi_awburst,
  s01_axi_awlen,
  s01_axi_awsize,
  s01_axi_awlock,
  s01_axi_awprot,
  s01_axi_awcache,
  s01_axi_awqos,
  s01_axi_awregion,
  s01_axi_awid,
  s01_axi_awuser,
  s01_axi_wvalid,
  s01_axi_wready,
  s01_axi_wlast,
  s01_axi_wdata,
  s01_axi_wstrb,
  s01_axi_wuser,
  s01_axi_bvalid,
  s01_axi_bready,
  s01_axi_bresp,
  s01_axi_bid,
  s01_axi_buser,
  s01_axi_arvalid,
  s01_axi_arready,
  s01_axi_araddr,
  s01_axi_arburst,
  s01_axi_arlen,
  s01_axi_arsize,
  s01_axi_arlock,
  s01_axi_arprot,
  s01_axi_arcache,
  s01_axi_arqos,
  s01_axi_arregion,
  s01_axi_arid,
  s01_axi_aruser,
  s01_axi_rvalid,
  s01_axi_rready,
  s01_axi_rlast,
  s01_axi_rresp,
  s01_axi_rdata,
  s01_axi_rid,
  s01_axi_ruser,
  s02_axi_awvalid,
  s02_axi_awready,
  s02_axi_awaddr,
  s02_axi_awburst,
  s02_axi_awlen,
  s02_axi_awsize,
  s02_axi_awlock,
  s02_axi_awprot,
  s02_axi_awcache,
  s02_axi_awqos,
  s02_axi_awregion,
  s02_axi_awid,
  s02_axi_awuser,
  s02_axi_wvalid,
  s02_axi_wready,
  s02_axi_wlast,
  s02_axi_wdata,
  s02_axi_wstrb,
  s02_axi_wuser,
  s02_axi_bvalid,
  s02_axi_bready,
  s02_axi_bresp,
  s02_axi_bid,
  s02_axi_buser,
  s02_axi_arvalid,
  s02_axi_arready,
  s02_axi_araddr,
  s02_axi_arburst,
  s02_axi_arlen,
  s02_axi_arsize,
  s02_axi_arlock,
  s02_axi_arprot,
  s02_axi_arcache,
  s02_axi_arqos,
  s02_axi_arregion,
  s02_axi_arid,
  s02_axi_aruser,
  s02_axi_rvalid,
  s02_axi_rready,
  s02_axi_rlast,
  s02_axi_rresp,
  s02_axi_rdata,
  s02_axi_rid,
  s02_axi_ruser,
  s03_axi_awvalid,
  s03_axi_awready,
  s03_axi_awaddr,
  s03_axi_awburst,
  s03_axi_awlen,
  s03_axi_awsize,
  s03_axi_awlock,
  s03_axi_awprot,
  s03_axi_awcache,
  s03_axi_awqos,
  s03_axi_awregion,
  s03_axi_awid,
  s03_axi_awuser,
  s03_axi_wvalid,
  s03_axi_wready,
  s03_axi_wlast,
  s03_axi_wdata,
  s03_axi_wstrb,
  s03_axi_wuser,
  s03_axi_bvalid,
  s03_axi_bready,
  s03_axi_bresp,
  s03_axi_bid,
  s03_axi_buser,
  s03_axi_arvalid,
  s03_axi_arready,
  s03_axi_araddr,
  s03_axi_arburst,
  s03_axi_arlen,
  s03_axi_arsize,
  s03_axi_arlock,
  s03_axi_arprot,
  s03_axi_arcache,
  s03_axi_arqos,
  s03_axi_arregion,
  s03_axi_arid,
  s03_axi_aruser,
  s03_axi_rvalid,
  s03_axi_rready,
  s03_axi_rlast,
  s03_axi_rresp,
  s03_axi_rdata,
  s03_axi_rid,
  s03_axi_ruser,
  m00_axi_awvalid,
  m00_axi_awready,
  m00_axi_awaddr,
  m00_axi_awburst,
  m00_axi_awlen,
  m00_axi_awsize,
  m00_axi_awlock,
  m00_axi_awprot,
  m00_axi_awcache,
  m00_axi_awqos,
  m00_axi_awregion,
  m00_axi_awid,
  m00_axi_awuser,
  m00_axi_wvalid,
  m00_axi_wready,
  m00_axi_wlast,
  m00_axi_wdata,
  m00_axi_wstrb,
  m00_axi_wuser,
  m00_axi_bvalid,
  m00_axi_bready,
  m00_axi_bresp,
  m00_axi_bid,
  m00_axi_buser,
  m00_axi_arvalid,
  m00_axi_arready,
  m00_axi_araddr,
  m00_axi_arburst,
  m00_axi_arlen,
  m00_axi_arsize,
  m00_axi_arlock,
  m00_axi_arprot,
  m00_axi_arcache,
  m00_axi_arqos,
  m00_axi_arregion,
  m00_axi_arid,
  m00_axi_aruser,
  m00_axi_rvalid,
  m00_axi_rready,
  m00_axi_rlast,
  m00_axi_rresp,
  m00_axi_rdata,
  m00_axi_rid,
  m00_axi_ruser,
  m01_axi_awvalid,
  m01_axi_awready,
  m01_axi_awaddr,
  m01_axi_awburst,
  m01_axi_awlen,
  m01_axi_awsize,
  m01_axi_awlock,
  m01_axi_awprot,
  m01_axi_awcache,
  m01_axi_awqos,
  m01_axi_awregion,
  m01_axi_awid,
  m01_axi_awuser,
  m01_axi_wvalid,
  m01_axi_wready,
  m01_axi_wlast,
  m01_axi_wdata,
  m01_axi_wstrb,
  m01_axi_wuser,
  m01_axi_bvalid,
  m01_axi_bready,
  m01_axi_bresp,
  m01_axi_bid,
  m01_axi_buser,
  m01_axi_arvalid,
  m01_axi_arready,
  m01_axi_araddr,
  m01_axi_arburst,
  m01_axi_arlen,
  m01_axi_arsize,
  m01_axi_arlock,
  m01_axi_arprot,
  m01_axi_arcache,
  m01_axi_arqos,
  m01_axi_arregion,
  m01_axi_arid,
  m01_axi_aruser,
  m01_axi_rvalid,
  m01_axi_rready,
  m01_axi_rlast,
  m01_axi_rresp,
  m01_axi_rdata,
  m01_axi_rid,
  m01_axi_ruser,
  m02_axi_awvalid,
  m02_axi_awready,
  m02_axi_awaddr,
  m02_axi_awburst,
  m02_axi_awlen,
  m02_axi_awsize,
  m02_axi_awlock,
  m02_axi_awprot,
  m02_axi_awcache,
  m02_axi_awqos,
  m02_axi_awregion,
  m02_axi_awid,
  m02_axi_awuser,
  m02_axi_wvalid,
  m02_axi_wready,
  m02_axi_wlast,
  m02_axi_wdata,
  m02_axi_wstrb,
  m02_axi_wuser,
  m02_axi_bvalid,
  m02_axi_bready,
  m02_axi_bresp,
  m02_axi_bid,
  m02_axi_buser,
  m02_axi_arvalid,
  m02_axi_arready,
  m02_axi_araddr,
  m02_axi_arburst,
  m02_axi_arlen,
  m02_axi_arsize,
  m02_axi_arlock,
  m02_axi_arprot,
  m02_axi_arcache,
  m02_axi_arqos,
  m02_axi_arregion,
  m02_axi_arid,
  m02_axi_aruser,
  m02_axi_rvalid,
  m02_axi_rready,
  m02_axi_rlast,
  m02_axi_rresp,
  m02_axi_rdata,
  m02_axi_rid,
  m02_axi_ruser,
  m03_axi_awvalid,
  m03_axi_awready,
  m03_axi_awaddr,
  m03_axi_awburst,
  m03_axi_awlen,
  m03_axi_awsize,
  m03_axi_awlock,
  m03_axi_awprot,
  m03_axi_awcache,
  m03_axi_awqos,
  m03_axi_awregion,
  m03_axi_awid,
  m03_axi_awuser,
  m03_axi_wvalid,
  m03_axi_wready,
  m03_axi_wlast,
  m03_axi_wdata,
  m03_axi_wstrb,
  m03_axi_wuser,
  m03_axi_bvalid,
  m03_axi_bready,
  m03_axi_bresp,
  m03_axi_bid,
  m03_axi_buser,
  m03_axi_arvalid,
  m03_axi_arready,
  m03_axi_araddr,
  m03_axi_arburst,
  m03_axi_arlen,
  m03_axi_arsize,
  m03_axi_arlock,
  m03_axi_arprot,
  m03_axi_arcache,
  m03_axi_arqos,
  m03_axi_arregion,
  m03_axi_arid,
  m03_axi_aruser,
  m03_axi_rvalid,
  m03_axi_rready,
  m03_axi_rlast,
  m03_axi_rresp,
  m03_axi_rdata,
  m03_axi_rid,
  m03_axi_ruser
);

//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m00_axi:m01_axi:m02_axi:m03_axi:s00_axi:s01_axi:s02_axi:s03_axi, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *)
input wire s00_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *)
output wire s00_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *)
input wire [31 : 0] s00_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWBURST" *)
input wire [1 : 0] s00_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWLEN" *)
input wire [7 : 0] s00_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWSIZE" *)
input wire [2 : 0] s00_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWLOCK" *)
input wire s00_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *)
input wire [2 : 0] s00_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWCACHE" *)
input wire [3 : 0] s00_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWQOS" *)
input wire [3 : 0] s00_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREGION" *)
input wire [3 : 0] s00_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWID" *)
input wire [7 : 0] s00_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWUSER" *)
input wire s00_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *)
input wire s00_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *)
output wire s00_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WLAST" *)
input wire s00_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *)
input wire [31 : 0] s00_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *)
input wire [3 : 0] s00_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WUSER" *)
input wire s00_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *)
output wire s00_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *)
input wire s00_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *)
output wire [1 : 0] s00_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BID" *)
output wire [7 : 0] s00_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BUSER" *)
output wire s00_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *)
input wire s00_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *)
output wire s00_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *)
input wire [31 : 0] s00_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARBURST" *)
input wire [1 : 0] s00_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARLEN" *)
input wire [7 : 0] s00_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARSIZE" *)
input wire [2 : 0] s00_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARLOCK" *)
input wire s00_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *)
input wire [2 : 0] s00_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARCACHE" *)
input wire [3 : 0] s00_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARQOS" *)
input wire [3 : 0] s00_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREGION" *)
input wire [3 : 0] s00_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARID" *)
input wire [7 : 0] s00_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARUSER" *)
input wire s00_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *)
output wire s00_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *)
input wire s00_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RLAST" *)
output wire s00_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *)
output wire [1 : 0] s00_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *)
output wire [31 : 0] s00_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RID" *)
output wire [7 : 0] s00_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RUSER" *)
output wire s00_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWVALID" *)
input wire s01_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWREADY" *)
output wire s01_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWADDR" *)
input wire [31 : 0] s01_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWBURST" *)
input wire [1 : 0] s01_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWLEN" *)
input wire [7 : 0] s01_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWSIZE" *)
input wire [2 : 0] s01_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWLOCK" *)
input wire s01_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWPROT" *)
input wire [2 : 0] s01_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWCACHE" *)
input wire [3 : 0] s01_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWQOS" *)
input wire [3 : 0] s01_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWREGION" *)
input wire [3 : 0] s01_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWID" *)
input wire [7 : 0] s01_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi AWUSER" *)
input wire s01_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WVALID" *)
input wire s01_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WREADY" *)
output wire s01_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WLAST" *)
input wire s01_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WDATA" *)
input wire [31 : 0] s01_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WSTRB" *)
input wire [3 : 0] s01_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi WUSER" *)
input wire s01_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi BVALID" *)
output wire s01_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi BREADY" *)
input wire s01_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi BRESP" *)
output wire [1 : 0] s01_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi BID" *)
output wire [7 : 0] s01_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi BUSER" *)
output wire s01_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARVALID" *)
input wire s01_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARREADY" *)
output wire s01_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARADDR" *)
input wire [31 : 0] s01_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARBURST" *)
input wire [1 : 0] s01_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARLEN" *)
input wire [7 : 0] s01_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARSIZE" *)
input wire [2 : 0] s01_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARLOCK" *)
input wire s01_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARPROT" *)
input wire [2 : 0] s01_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARCACHE" *)
input wire [3 : 0] s01_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARQOS" *)
input wire [3 : 0] s01_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARREGION" *)
input wire [3 : 0] s01_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARID" *)
input wire [7 : 0] s01_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi ARUSER" *)
input wire s01_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RVALID" *)
output wire s01_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RREADY" *)
input wire s01_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RLAST" *)
output wire s01_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RRESP" *)
output wire [1 : 0] s01_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RDATA" *)
output wire [31 : 0] s01_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RID" *)
output wire [7 : 0] s01_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s01_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s01_axi RUSER" *)
output wire s01_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWVALID" *)
input wire s02_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWREADY" *)
output wire s02_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWADDR" *)
input wire [31 : 0] s02_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWBURST" *)
input wire [1 : 0] s02_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWLEN" *)
input wire [7 : 0] s02_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWSIZE" *)
input wire [2 : 0] s02_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWLOCK" *)
input wire s02_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWPROT" *)
input wire [2 : 0] s02_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWCACHE" *)
input wire [3 : 0] s02_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWQOS" *)
input wire [3 : 0] s02_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWREGION" *)
input wire [3 : 0] s02_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWID" *)
input wire [7 : 0] s02_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi AWUSER" *)
input wire s02_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WVALID" *)
input wire s02_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WREADY" *)
output wire s02_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WLAST" *)
input wire s02_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WDATA" *)
input wire [31 : 0] s02_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WSTRB" *)
input wire [3 : 0] s02_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi WUSER" *)
input wire s02_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi BVALID" *)
output wire s02_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi BREADY" *)
input wire s02_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi BRESP" *)
output wire [1 : 0] s02_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi BID" *)
output wire [7 : 0] s02_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi BUSER" *)
output wire s02_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARVALID" *)
input wire s02_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARREADY" *)
output wire s02_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARADDR" *)
input wire [31 : 0] s02_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARBURST" *)
input wire [1 : 0] s02_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARLEN" *)
input wire [7 : 0] s02_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARSIZE" *)
input wire [2 : 0] s02_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARLOCK" *)
input wire s02_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARPROT" *)
input wire [2 : 0] s02_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARCACHE" *)
input wire [3 : 0] s02_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARQOS" *)
input wire [3 : 0] s02_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARREGION" *)
input wire [3 : 0] s02_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARID" *)
input wire [7 : 0] s02_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi ARUSER" *)
input wire s02_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RVALID" *)
output wire s02_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RREADY" *)
input wire s02_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RLAST" *)
output wire s02_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RRESP" *)
output wire [1 : 0] s02_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RDATA" *)
output wire [31 : 0] s02_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RID" *)
output wire [7 : 0] s02_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s02_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s02_axi RUSER" *)
output wire s02_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWVALID" *)
input wire s03_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWREADY" *)
output wire s03_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWADDR" *)
input wire [31 : 0] s03_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWBURST" *)
input wire [1 : 0] s03_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWLEN" *)
input wire [7 : 0] s03_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWSIZE" *)
input wire [2 : 0] s03_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWLOCK" *)
input wire s03_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWPROT" *)
input wire [2 : 0] s03_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWCACHE" *)
input wire [3 : 0] s03_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWQOS" *)
input wire [3 : 0] s03_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWREGION" *)
input wire [3 : 0] s03_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWID" *)
input wire [7 : 0] s03_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi AWUSER" *)
input wire s03_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WVALID" *)
input wire s03_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WREADY" *)
output wire s03_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WLAST" *)
input wire s03_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WDATA" *)
input wire [31 : 0] s03_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WSTRB" *)
input wire [3 : 0] s03_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi WUSER" *)
input wire s03_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi BVALID" *)
output wire s03_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi BREADY" *)
input wire s03_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi BRESP" *)
output wire [1 : 0] s03_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi BID" *)
output wire [7 : 0] s03_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi BUSER" *)
output wire s03_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARVALID" *)
input wire s03_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARREADY" *)
output wire s03_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARADDR" *)
input wire [31 : 0] s03_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARBURST" *)
input wire [1 : 0] s03_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARLEN" *)
input wire [7 : 0] s03_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARSIZE" *)
input wire [2 : 0] s03_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARLOCK" *)
input wire s03_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARPROT" *)
input wire [2 : 0] s03_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARCACHE" *)
input wire [3 : 0] s03_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARQOS" *)
input wire [3 : 0] s03_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARREGION" *)
input wire [3 : 0] s03_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARID" *)
input wire [7 : 0] s03_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi ARUSER" *)
input wire s03_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RVALID" *)
output wire s03_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RREADY" *)
input wire s03_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RLAST" *)
output wire s03_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RRESP" *)
output wire [1 : 0] s03_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RDATA" *)
output wire [31 : 0] s03_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RID" *)
output wire [7 : 0] s03_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s03_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s03_axi RUSER" *)
output wire s03_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWVALID" *)
output wire m00_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWREADY" *)
input wire m00_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWADDR" *)
output wire [31 : 0] m00_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWBURST" *)
output wire [1 : 0] m00_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWLEN" *)
output wire [7 : 0] m00_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWSIZE" *)
output wire [2 : 0] m00_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWLOCK" *)
output wire m00_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWPROT" *)
output wire [2 : 0] m00_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWCACHE" *)
output wire [3 : 0] m00_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWQOS" *)
output wire [3 : 0] m00_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWREGION" *)
output wire [3 : 0] m00_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWID" *)
output wire [7 : 0] m00_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWUSER" *)
output wire m00_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WVALID" *)
output wire m00_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WREADY" *)
input wire m00_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WLAST" *)
output wire m00_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WDATA" *)
output wire [31 : 0] m00_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WSTRB" *)
output wire [3 : 0] m00_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WUSER" *)
output wire m00_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BVALID" *)
input wire m00_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BREADY" *)
output wire m00_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BRESP" *)
input wire [1 : 0] m00_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BID" *)
input wire [7 : 0] m00_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BUSER" *)
input wire m00_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARVALID" *)
output wire m00_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARREADY" *)
input wire m00_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARADDR" *)
output wire [31 : 0] m00_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARBURST" *)
output wire [1 : 0] m00_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARLEN" *)
output wire [7 : 0] m00_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARSIZE" *)
output wire [2 : 0] m00_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARLOCK" *)
output wire m00_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARPROT" *)
output wire [2 : 0] m00_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARCACHE" *)
output wire [3 : 0] m00_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARQOS" *)
output wire [3 : 0] m00_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARREGION" *)
output wire [3 : 0] m00_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARID" *)
output wire [7 : 0] m00_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARUSER" *)
output wire m00_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RVALID" *)
input wire m00_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RREADY" *)
output wire m00_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RLAST" *)
input wire m00_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RRESP" *)
input wire [1 : 0] m00_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RDATA" *)
input wire [31 : 0] m00_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RID" *)
input wire [7 : 0] m00_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RUSER" *)
input wire m00_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWVALID" *)
output wire m01_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWREADY" *)
input wire m01_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWADDR" *)
output wire [31 : 0] m01_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWBURST" *)
output wire [1 : 0] m01_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWLEN" *)
output wire [7 : 0] m01_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWSIZE" *)
output wire [2 : 0] m01_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWLOCK" *)
output wire m01_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWPROT" *)
output wire [2 : 0] m01_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWCACHE" *)
output wire [3 : 0] m01_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWQOS" *)
output wire [3 : 0] m01_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWREGION" *)
output wire [3 : 0] m01_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWID" *)
output wire [7 : 0] m01_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWUSER" *)
output wire m01_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WVALID" *)
output wire m01_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WREADY" *)
input wire m01_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WLAST" *)
output wire m01_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WDATA" *)
output wire [31 : 0] m01_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WSTRB" *)
output wire [3 : 0] m01_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WUSER" *)
output wire m01_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BVALID" *)
input wire m01_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BREADY" *)
output wire m01_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BRESP" *)
input wire [1 : 0] m01_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BID" *)
input wire [7 : 0] m01_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BUSER" *)
input wire m01_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARVALID" *)
output wire m01_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARREADY" *)
input wire m01_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARADDR" *)
output wire [31 : 0] m01_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARBURST" *)
output wire [1 : 0] m01_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARLEN" *)
output wire [7 : 0] m01_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARSIZE" *)
output wire [2 : 0] m01_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARLOCK" *)
output wire m01_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARPROT" *)
output wire [2 : 0] m01_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARCACHE" *)
output wire [3 : 0] m01_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARQOS" *)
output wire [3 : 0] m01_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARREGION" *)
output wire [3 : 0] m01_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARID" *)
output wire [7 : 0] m01_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARUSER" *)
output wire m01_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RVALID" *)
input wire m01_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RREADY" *)
output wire m01_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RLAST" *)
input wire m01_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RRESP" *)
input wire [1 : 0] m01_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RDATA" *)
input wire [31 : 0] m01_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RID" *)
input wire [7 : 0] m01_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m01_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RUSER" *)
input wire m01_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWVALID" *)
output wire m02_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWREADY" *)
input wire m02_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWADDR" *)
output wire [31 : 0] m02_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWBURST" *)
output wire [1 : 0] m02_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWLEN" *)
output wire [7 : 0] m02_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWSIZE" *)
output wire [2 : 0] m02_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWLOCK" *)
output wire m02_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWPROT" *)
output wire [2 : 0] m02_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWCACHE" *)
output wire [3 : 0] m02_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWQOS" *)
output wire [3 : 0] m02_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWREGION" *)
output wire [3 : 0] m02_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWID" *)
output wire [7 : 0] m02_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi AWUSER" *)
output wire m02_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WVALID" *)
output wire m02_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WREADY" *)
input wire m02_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WLAST" *)
output wire m02_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WDATA" *)
output wire [31 : 0] m02_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WSTRB" *)
output wire [3 : 0] m02_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi WUSER" *)
output wire m02_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi BVALID" *)
input wire m02_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi BREADY" *)
output wire m02_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi BRESP" *)
input wire [1 : 0] m02_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi BID" *)
input wire [7 : 0] m02_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi BUSER" *)
input wire m02_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARVALID" *)
output wire m02_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARREADY" *)
input wire m02_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARADDR" *)
output wire [31 : 0] m02_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARBURST" *)
output wire [1 : 0] m02_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARLEN" *)
output wire [7 : 0] m02_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARSIZE" *)
output wire [2 : 0] m02_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARLOCK" *)
output wire m02_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARPROT" *)
output wire [2 : 0] m02_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARCACHE" *)
output wire [3 : 0] m02_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARQOS" *)
output wire [3 : 0] m02_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARREGION" *)
output wire [3 : 0] m02_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARID" *)
output wire [7 : 0] m02_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi ARUSER" *)
output wire m02_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RVALID" *)
input wire m02_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RREADY" *)
output wire m02_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RLAST" *)
input wire m02_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RRESP" *)
input wire [1 : 0] m02_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RDATA" *)
input wire [31 : 0] m02_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RID" *)
input wire [7 : 0] m02_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m02_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m02_axi RUSER" *)
input wire m02_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWVALID" *)
output wire m03_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWREADY" *)
input wire m03_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWADDR" *)
output wire [31 : 0] m03_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWBURST" *)
output wire [1 : 0] m03_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWLEN" *)
output wire [7 : 0] m03_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWSIZE" *)
output wire [2 : 0] m03_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWLOCK" *)
output wire m03_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWPROT" *)
output wire [2 : 0] m03_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWCACHE" *)
output wire [3 : 0] m03_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWQOS" *)
output wire [3 : 0] m03_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWREGION" *)
output wire [3 : 0] m03_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWID" *)
output wire [7 : 0] m03_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi AWUSER" *)
output wire m03_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WVALID" *)
output wire m03_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WREADY" *)
input wire m03_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WLAST" *)
output wire m03_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WDATA" *)
output wire [31 : 0] m03_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WSTRB" *)
output wire [3 : 0] m03_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi WUSER" *)
output wire m03_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi BVALID" *)
input wire m03_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi BREADY" *)
output wire m03_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi BRESP" *)
input wire [1 : 0] m03_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi BID" *)
input wire [7 : 0] m03_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi BUSER" *)
input wire m03_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARVALID" *)
output wire m03_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARREADY" *)
input wire m03_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARADDR" *)
output wire [31 : 0] m03_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARBURST" *)
output wire [1 : 0] m03_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARLEN" *)
output wire [7 : 0] m03_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARSIZE" *)
output wire [2 : 0] m03_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARLOCK" *)
output wire m03_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARPROT" *)
output wire [2 : 0] m03_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARCACHE" *)
output wire [3 : 0] m03_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARQOS" *)
output wire [3 : 0] m03_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARREGION" *)
output wire [3 : 0] m03_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARID" *)
output wire [7 : 0] m03_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi ARUSER" *)
output wire m03_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RVALID" *)
input wire m03_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RREADY" *)
output wire m03_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RLAST" *)
input wire m03_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RRESP" *)
input wire [1 : 0] m03_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RDATA" *)
input wire [31 : 0] m03_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RID" *)
input wire [7 : 0] m03_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m03_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, \
//RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m03_axi RUSER" *)
input wire m03_axi_ruser;

  axi_interconnect_wrapper inst (
    .clk(clk),
    .rst(rst),
    .s00_axi_awvalid(s00_axi_awvalid),
    .s00_axi_awready(s00_axi_awready),
    .s00_axi_awaddr(s00_axi_awaddr),
    .s00_axi_awburst(s00_axi_awburst),
    .s00_axi_awlen(s00_axi_awlen),
    .s00_axi_awsize(s00_axi_awsize),
    .s00_axi_awlock(s00_axi_awlock),
    .s00_axi_awprot(s00_axi_awprot),
    .s00_axi_awcache(s00_axi_awcache),
    .s00_axi_awqos(s00_axi_awqos),
    .s00_axi_awregion(s00_axi_awregion),
    .s00_axi_awid(s00_axi_awid),
    .s00_axi_awuser(s00_axi_awuser),
    .s00_axi_wvalid(s00_axi_wvalid),
    .s00_axi_wready(s00_axi_wready),
    .s00_axi_wlast(s00_axi_wlast),
    .s00_axi_wdata(s00_axi_wdata),
    .s00_axi_wstrb(s00_axi_wstrb),
    .s00_axi_wuser(s00_axi_wuser),
    .s00_axi_bvalid(s00_axi_bvalid),
    .s00_axi_bready(s00_axi_bready),
    .s00_axi_bresp(s00_axi_bresp),
    .s00_axi_bid(s00_axi_bid),
    .s00_axi_buser(s00_axi_buser),
    .s00_axi_arvalid(s00_axi_arvalid),
    .s00_axi_arready(s00_axi_arready),
    .s00_axi_araddr(s00_axi_araddr),
    .s00_axi_arburst(s00_axi_arburst),
    .s00_axi_arlen(s00_axi_arlen),
    .s00_axi_arsize(s00_axi_arsize),
    .s00_axi_arlock(s00_axi_arlock),
    .s00_axi_arprot(s00_axi_arprot),
    .s00_axi_arcache(s00_axi_arcache),
    .s00_axi_arqos(s00_axi_arqos),
    .s00_axi_arregion(s00_axi_arregion),
    .s00_axi_arid(s00_axi_arid),
    .s00_axi_aruser(s00_axi_aruser),
    .s00_axi_rvalid(s00_axi_rvalid),
    .s00_axi_rready(s00_axi_rready),
    .s00_axi_rlast(s00_axi_rlast),
    .s00_axi_rresp(s00_axi_rresp),
    .s00_axi_rdata(s00_axi_rdata),
    .s00_axi_rid(s00_axi_rid),
    .s00_axi_ruser(s00_axi_ruser),
    .s01_axi_awvalid(s01_axi_awvalid),
    .s01_axi_awready(s01_axi_awready),
    .s01_axi_awaddr(s01_axi_awaddr),
    .s01_axi_awburst(s01_axi_awburst),
    .s01_axi_awlen(s01_axi_awlen),
    .s01_axi_awsize(s01_axi_awsize),
    .s01_axi_awlock(s01_axi_awlock),
    .s01_axi_awprot(s01_axi_awprot),
    .s01_axi_awcache(s01_axi_awcache),
    .s01_axi_awqos(s01_axi_awqos),
    .s01_axi_awregion(s01_axi_awregion),
    .s01_axi_awid(s01_axi_awid),
    .s01_axi_awuser(s01_axi_awuser),
    .s01_axi_wvalid(s01_axi_wvalid),
    .s01_axi_wready(s01_axi_wready),
    .s01_axi_wlast(s01_axi_wlast),
    .s01_axi_wdata(s01_axi_wdata),
    .s01_axi_wstrb(s01_axi_wstrb),
    .s01_axi_wuser(s01_axi_wuser),
    .s01_axi_bvalid(s01_axi_bvalid),
    .s01_axi_bready(s01_axi_bready),
    .s01_axi_bresp(s01_axi_bresp),
    .s01_axi_bid(s01_axi_bid),
    .s01_axi_buser(s01_axi_buser),
    .s01_axi_arvalid(s01_axi_arvalid),
    .s01_axi_arready(s01_axi_arready),
    .s01_axi_araddr(s01_axi_araddr),
    .s01_axi_arburst(s01_axi_arburst),
    .s01_axi_arlen(s01_axi_arlen),
    .s01_axi_arsize(s01_axi_arsize),
    .s01_axi_arlock(s01_axi_arlock),
    .s01_axi_arprot(s01_axi_arprot),
    .s01_axi_arcache(s01_axi_arcache),
    .s01_axi_arqos(s01_axi_arqos),
    .s01_axi_arregion(s01_axi_arregion),
    .s01_axi_arid(s01_axi_arid),
    .s01_axi_aruser(s01_axi_aruser),
    .s01_axi_rvalid(s01_axi_rvalid),
    .s01_axi_rready(s01_axi_rready),
    .s01_axi_rlast(s01_axi_rlast),
    .s01_axi_rresp(s01_axi_rresp),
    .s01_axi_rdata(s01_axi_rdata),
    .s01_axi_rid(s01_axi_rid),
    .s01_axi_ruser(s01_axi_ruser),
    .s02_axi_awvalid(s02_axi_awvalid),
    .s02_axi_awready(s02_axi_awready),
    .s02_axi_awaddr(s02_axi_awaddr),
    .s02_axi_awburst(s02_axi_awburst),
    .s02_axi_awlen(s02_axi_awlen),
    .s02_axi_awsize(s02_axi_awsize),
    .s02_axi_awlock(s02_axi_awlock),
    .s02_axi_awprot(s02_axi_awprot),
    .s02_axi_awcache(s02_axi_awcache),
    .s02_axi_awqos(s02_axi_awqos),
    .s02_axi_awregion(s02_axi_awregion),
    .s02_axi_awid(s02_axi_awid),
    .s02_axi_awuser(s02_axi_awuser),
    .s02_axi_wvalid(s02_axi_wvalid),
    .s02_axi_wready(s02_axi_wready),
    .s02_axi_wlast(s02_axi_wlast),
    .s02_axi_wdata(s02_axi_wdata),
    .s02_axi_wstrb(s02_axi_wstrb),
    .s02_axi_wuser(s02_axi_wuser),
    .s02_axi_bvalid(s02_axi_bvalid),
    .s02_axi_bready(s02_axi_bready),
    .s02_axi_bresp(s02_axi_bresp),
    .s02_axi_bid(s02_axi_bid),
    .s02_axi_buser(s02_axi_buser),
    .s02_axi_arvalid(s02_axi_arvalid),
    .s02_axi_arready(s02_axi_arready),
    .s02_axi_araddr(s02_axi_araddr),
    .s02_axi_arburst(s02_axi_arburst),
    .s02_axi_arlen(s02_axi_arlen),
    .s02_axi_arsize(s02_axi_arsize),
    .s02_axi_arlock(s02_axi_arlock),
    .s02_axi_arprot(s02_axi_arprot),
    .s02_axi_arcache(s02_axi_arcache),
    .s02_axi_arqos(s02_axi_arqos),
    .s02_axi_arregion(s02_axi_arregion),
    .s02_axi_arid(s02_axi_arid),
    .s02_axi_aruser(s02_axi_aruser),
    .s02_axi_rvalid(s02_axi_rvalid),
    .s02_axi_rready(s02_axi_rready),
    .s02_axi_rlast(s02_axi_rlast),
    .s02_axi_rresp(s02_axi_rresp),
    .s02_axi_rdata(s02_axi_rdata),
    .s02_axi_rid(s02_axi_rid),
    .s02_axi_ruser(s02_axi_ruser),
    .s03_axi_awvalid(s03_axi_awvalid),
    .s03_axi_awready(s03_axi_awready),
    .s03_axi_awaddr(s03_axi_awaddr),
    .s03_axi_awburst(s03_axi_awburst),
    .s03_axi_awlen(s03_axi_awlen),
    .s03_axi_awsize(s03_axi_awsize),
    .s03_axi_awlock(s03_axi_awlock),
    .s03_axi_awprot(s03_axi_awprot),
    .s03_axi_awcache(s03_axi_awcache),
    .s03_axi_awqos(s03_axi_awqos),
    .s03_axi_awregion(s03_axi_awregion),
    .s03_axi_awid(s03_axi_awid),
    .s03_axi_awuser(s03_axi_awuser),
    .s03_axi_wvalid(s03_axi_wvalid),
    .s03_axi_wready(s03_axi_wready),
    .s03_axi_wlast(s03_axi_wlast),
    .s03_axi_wdata(s03_axi_wdata),
    .s03_axi_wstrb(s03_axi_wstrb),
    .s03_axi_wuser(s03_axi_wuser),
    .s03_axi_bvalid(s03_axi_bvalid),
    .s03_axi_bready(s03_axi_bready),
    .s03_axi_bresp(s03_axi_bresp),
    .s03_axi_bid(s03_axi_bid),
    .s03_axi_buser(s03_axi_buser),
    .s03_axi_arvalid(s03_axi_arvalid),
    .s03_axi_arready(s03_axi_arready),
    .s03_axi_araddr(s03_axi_araddr),
    .s03_axi_arburst(s03_axi_arburst),
    .s03_axi_arlen(s03_axi_arlen),
    .s03_axi_arsize(s03_axi_arsize),
    .s03_axi_arlock(s03_axi_arlock),
    .s03_axi_arprot(s03_axi_arprot),
    .s03_axi_arcache(s03_axi_arcache),
    .s03_axi_arqos(s03_axi_arqos),
    .s03_axi_arregion(s03_axi_arregion),
    .s03_axi_arid(s03_axi_arid),
    .s03_axi_aruser(s03_axi_aruser),
    .s03_axi_rvalid(s03_axi_rvalid),
    .s03_axi_rready(s03_axi_rready),
    .s03_axi_rlast(s03_axi_rlast),
    .s03_axi_rresp(s03_axi_rresp),
    .s03_axi_rdata(s03_axi_rdata),
    .s03_axi_rid(s03_axi_rid),
    .s03_axi_ruser(s03_axi_ruser),
    .m00_axi_awvalid(m00_axi_awvalid),
    .m00_axi_awready(m00_axi_awready),
    .m00_axi_awaddr(m00_axi_awaddr),
    .m00_axi_awburst(m00_axi_awburst),
    .m00_axi_awlen(m00_axi_awlen),
    .m00_axi_awsize(m00_axi_awsize),
    .m00_axi_awlock(m00_axi_awlock),
    .m00_axi_awprot(m00_axi_awprot),
    .m00_axi_awcache(m00_axi_awcache),
    .m00_axi_awqos(m00_axi_awqos),
    .m00_axi_awregion(m00_axi_awregion),
    .m00_axi_awid(m00_axi_awid),
    .m00_axi_awuser(m00_axi_awuser),
    .m00_axi_wvalid(m00_axi_wvalid),
    .m00_axi_wready(m00_axi_wready),
    .m00_axi_wlast(m00_axi_wlast),
    .m00_axi_wdata(m00_axi_wdata),
    .m00_axi_wstrb(m00_axi_wstrb),
    .m00_axi_wuser(m00_axi_wuser),
    .m00_axi_bvalid(m00_axi_bvalid),
    .m00_axi_bready(m00_axi_bready),
    .m00_axi_bresp(m00_axi_bresp),
    .m00_axi_bid(m00_axi_bid),
    .m00_axi_buser(m00_axi_buser),
    .m00_axi_arvalid(m00_axi_arvalid),
    .m00_axi_arready(m00_axi_arready),
    .m00_axi_araddr(m00_axi_araddr),
    .m00_axi_arburst(m00_axi_arburst),
    .m00_axi_arlen(m00_axi_arlen),
    .m00_axi_arsize(m00_axi_arsize),
    .m00_axi_arlock(m00_axi_arlock),
    .m00_axi_arprot(m00_axi_arprot),
    .m00_axi_arcache(m00_axi_arcache),
    .m00_axi_arqos(m00_axi_arqos),
    .m00_axi_arregion(m00_axi_arregion),
    .m00_axi_arid(m00_axi_arid),
    .m00_axi_aruser(m00_axi_aruser),
    .m00_axi_rvalid(m00_axi_rvalid),
    .m00_axi_rready(m00_axi_rready),
    .m00_axi_rlast(m00_axi_rlast),
    .m00_axi_rresp(m00_axi_rresp),
    .m00_axi_rdata(m00_axi_rdata),
    .m00_axi_rid(m00_axi_rid),
    .m00_axi_ruser(m00_axi_ruser),
    .m01_axi_awvalid(m01_axi_awvalid),
    .m01_axi_awready(m01_axi_awready),
    .m01_axi_awaddr(m01_axi_awaddr),
    .m01_axi_awburst(m01_axi_awburst),
    .m01_axi_awlen(m01_axi_awlen),
    .m01_axi_awsize(m01_axi_awsize),
    .m01_axi_awlock(m01_axi_awlock),
    .m01_axi_awprot(m01_axi_awprot),
    .m01_axi_awcache(m01_axi_awcache),
    .m01_axi_awqos(m01_axi_awqos),
    .m01_axi_awregion(m01_axi_awregion),
    .m01_axi_awid(m01_axi_awid),
    .m01_axi_awuser(m01_axi_awuser),
    .m01_axi_wvalid(m01_axi_wvalid),
    .m01_axi_wready(m01_axi_wready),
    .m01_axi_wlast(m01_axi_wlast),
    .m01_axi_wdata(m01_axi_wdata),
    .m01_axi_wstrb(m01_axi_wstrb),
    .m01_axi_wuser(m01_axi_wuser),
    .m01_axi_bvalid(m01_axi_bvalid),
    .m01_axi_bready(m01_axi_bready),
    .m01_axi_bresp(m01_axi_bresp),
    .m01_axi_bid(m01_axi_bid),
    .m01_axi_buser(m01_axi_buser),
    .m01_axi_arvalid(m01_axi_arvalid),
    .m01_axi_arready(m01_axi_arready),
    .m01_axi_araddr(m01_axi_araddr),
    .m01_axi_arburst(m01_axi_arburst),
    .m01_axi_arlen(m01_axi_arlen),
    .m01_axi_arsize(m01_axi_arsize),
    .m01_axi_arlock(m01_axi_arlock),
    .m01_axi_arprot(m01_axi_arprot),
    .m01_axi_arcache(m01_axi_arcache),
    .m01_axi_arqos(m01_axi_arqos),
    .m01_axi_arregion(m01_axi_arregion),
    .m01_axi_arid(m01_axi_arid),
    .m01_axi_aruser(m01_axi_aruser),
    .m01_axi_rvalid(m01_axi_rvalid),
    .m01_axi_rready(m01_axi_rready),
    .m01_axi_rlast(m01_axi_rlast),
    .m01_axi_rresp(m01_axi_rresp),
    .m01_axi_rdata(m01_axi_rdata),
    .m01_axi_rid(m01_axi_rid),
    .m01_axi_ruser(m01_axi_ruser),
    .m02_axi_awvalid(m02_axi_awvalid),
    .m02_axi_awready(m02_axi_awready),
    .m02_axi_awaddr(m02_axi_awaddr),
    .m02_axi_awburst(m02_axi_awburst),
    .m02_axi_awlen(m02_axi_awlen),
    .m02_axi_awsize(m02_axi_awsize),
    .m02_axi_awlock(m02_axi_awlock),
    .m02_axi_awprot(m02_axi_awprot),
    .m02_axi_awcache(m02_axi_awcache),
    .m02_axi_awqos(m02_axi_awqos),
    .m02_axi_awregion(m02_axi_awregion),
    .m02_axi_awid(m02_axi_awid),
    .m02_axi_awuser(m02_axi_awuser),
    .m02_axi_wvalid(m02_axi_wvalid),
    .m02_axi_wready(m02_axi_wready),
    .m02_axi_wlast(m02_axi_wlast),
    .m02_axi_wdata(m02_axi_wdata),
    .m02_axi_wstrb(m02_axi_wstrb),
    .m02_axi_wuser(m02_axi_wuser),
    .m02_axi_bvalid(m02_axi_bvalid),
    .m02_axi_bready(m02_axi_bready),
    .m02_axi_bresp(m02_axi_bresp),
    .m02_axi_bid(m02_axi_bid),
    .m02_axi_buser(m02_axi_buser),
    .m02_axi_arvalid(m02_axi_arvalid),
    .m02_axi_arready(m02_axi_arready),
    .m02_axi_araddr(m02_axi_araddr),
    .m02_axi_arburst(m02_axi_arburst),
    .m02_axi_arlen(m02_axi_arlen),
    .m02_axi_arsize(m02_axi_arsize),
    .m02_axi_arlock(m02_axi_arlock),
    .m02_axi_arprot(m02_axi_arprot),
    .m02_axi_arcache(m02_axi_arcache),
    .m02_axi_arqos(m02_axi_arqos),
    .m02_axi_arregion(m02_axi_arregion),
    .m02_axi_arid(m02_axi_arid),
    .m02_axi_aruser(m02_axi_aruser),
    .m02_axi_rvalid(m02_axi_rvalid),
    .m02_axi_rready(m02_axi_rready),
    .m02_axi_rlast(m02_axi_rlast),
    .m02_axi_rresp(m02_axi_rresp),
    .m02_axi_rdata(m02_axi_rdata),
    .m02_axi_rid(m02_axi_rid),
    .m02_axi_ruser(m02_axi_ruser),
    .m03_axi_awvalid(m03_axi_awvalid),
    .m03_axi_awready(m03_axi_awready),
    .m03_axi_awaddr(m03_axi_awaddr),
    .m03_axi_awburst(m03_axi_awburst),
    .m03_axi_awlen(m03_axi_awlen),
    .m03_axi_awsize(m03_axi_awsize),
    .m03_axi_awlock(m03_axi_awlock),
    .m03_axi_awprot(m03_axi_awprot),
    .m03_axi_awcache(m03_axi_awcache),
    .m03_axi_awqos(m03_axi_awqos),
    .m03_axi_awregion(m03_axi_awregion),
    .m03_axi_awid(m03_axi_awid),
    .m03_axi_awuser(m03_axi_awuser),
    .m03_axi_wvalid(m03_axi_wvalid),
    .m03_axi_wready(m03_axi_wready),
    .m03_axi_wlast(m03_axi_wlast),
    .m03_axi_wdata(m03_axi_wdata),
    .m03_axi_wstrb(m03_axi_wstrb),
    .m03_axi_wuser(m03_axi_wuser),
    .m03_axi_bvalid(m03_axi_bvalid),
    .m03_axi_bready(m03_axi_bready),
    .m03_axi_bresp(m03_axi_bresp),
    .m03_axi_bid(m03_axi_bid),
    .m03_axi_buser(m03_axi_buser),
    .m03_axi_arvalid(m03_axi_arvalid),
    .m03_axi_arready(m03_axi_arready),
    .m03_axi_araddr(m03_axi_araddr),
    .m03_axi_arburst(m03_axi_arburst),
    .m03_axi_arlen(m03_axi_arlen),
    .m03_axi_arsize(m03_axi_arsize),
    .m03_axi_arlock(m03_axi_arlock),
    .m03_axi_arprot(m03_axi_arprot),
    .m03_axi_arcache(m03_axi_arcache),
    .m03_axi_arqos(m03_axi_arqos),
    .m03_axi_arregion(m03_axi_arregion),
    .m03_axi_arid(m03_axi_arid),
    .m03_axi_aruser(m03_axi_aruser),
    .m03_axi_rvalid(m03_axi_rvalid),
    .m03_axi_rready(m03_axi_rready),
    .m03_axi_rlast(m03_axi_rlast),
    .m03_axi_rresp(m03_axi_rresp),
    .m03_axi_rdata(m03_axi_rdata),
    .m03_axi_rid(m03_axi_rid),
    .m03_axi_ruser(m03_axi_ruser)
  );
endmodule


// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:axi_ram_wrapper:1.0
// IP Revision: 1

//(* X_CORE_INFO = "axi_ram_wrapper,Vivado 2022.1" *)
//(* CHECK_LICENSE_TYPE = "design_1_axi_ram_wrapper_0_1,axi_ram_wrapper,{}" *)
//(* CORE_GENERATION_INFO = "design_1_axi_ram_wrapper_0_1,axi_ram_wrapper,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=axi_ram_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
//(* IP_DEFINITION_SOURCE = "module_ref" *)
//(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_axi_ram_wrapper_0_1 (
  clk,
  rst,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_awaddr,
  s_axi_awburst,
  s_axi_awlen,
  s_axi_awsize,
  s_axi_awlock,
  s_axi_awprot,
  s_axi_awcache,
  s_axi_awqos,
  s_axi_awregion,
  s_axi_awid,
  s_axi_awuser,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_wlast,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wuser,
  s_axi_bvalid,
  s_axi_bready,
  s_axi_bresp,
  s_axi_bid,
  s_axi_buser,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_araddr,
  s_axi_arburst,
  s_axi_arlen,
  s_axi_arsize,
  s_axi_arlock,
  s_axi_arprot,
  s_axi_arcache,
  s_axi_arqos,
  s_axi_arregion,
  s_axi_arid,
  s_axi_aruser,
  s_axi_rvalid,
  s_axi_rready,
  s_axi_rlast,
  s_axi_rresp,
  s_axi_rdata,
  s_axi_rid,
  s_axi_ruser
);

//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *)
input wire s_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *)
output wire s_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *)
input wire [31 : 0] s_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *)
input wire [1 : 0] s_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN" *)
input wire [7 : 0] s_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE" *)
input wire [2 : 0] s_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLOCK" *)
input wire s_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *)
input wire [2 : 0] s_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWCACHE" *)
input wire [3 : 0] s_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWQOS" *)
input wire [3 : 0] s_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREGION" *)
input wire [3 : 0] s_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWID" *)
input wire [7 : 0] s_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWUSER" *)
input wire s_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *)
input wire s_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *)
output wire s_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST" *)
input wire s_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *)
input wire [31 : 0] s_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *)
input wire [3 : 0] s_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WUSER" *)
input wire s_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *)
output wire s_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *)
input wire s_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *)
output wire [1 : 0] s_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BID" *)
output wire [7 : 0] s_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BUSER" *)
output wire s_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *)
input wire s_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *)
output wire s_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *)
input wire [31 : 0] s_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *)
input wire [1 : 0] s_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN" *)
input wire [7 : 0] s_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE" *)
input wire [2 : 0] s_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLOCK" *)
input wire s_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *)
input wire [2 : 0] s_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARCACHE" *)
input wire [3 : 0] s_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARQOS" *)
input wire [3 : 0] s_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREGION" *)
input wire [3 : 0] s_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARID" *)
input wire [7 : 0] s_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARUSER" *)
input wire s_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *)
output wire s_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *)
input wire s_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST" *)
output wire s_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *)
output wire [1 : 0] s_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *)
output wire [31 : 0] s_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RID" *)
output wire [7 : 0] s_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RU\
//SER_BITS_PER_BYTE 0 0, WU//SER_BITS_PER_BYTE 0 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RUSER" *)
output wire s_axi_ruser;

  axi_ram_wrapper inst (
    .clk(clk),
    .rst(rst),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awburst(s_axi_awburst),
    .s_axi_awlen(s_axi_awlen),
    .s_axi_awsize(s_axi_awsize),
    .s_axi_awlock(s_axi_awlock),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awcache(s_axi_awcache),
    .s_axi_awqos(s_axi_awqos),
    .s_axi_awregion(s_axi_awregion),
    .s_axi_awid(s_axi_awid),
    .s_axi_awuser(s_axi_awuser),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_wlast(s_axi_wlast),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wuser(s_axi_wuser),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bid(s_axi_bid),
    .s_axi_buser(s_axi_buser),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arburst(s_axi_arburst),
    .s_axi_arlen(s_axi_arlen),
    .s_axi_arsize(s_axi_arsize),
    .s_axi_arlock(s_axi_arlock),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arcache(s_axi_arcache),
    .s_axi_arqos(s_axi_arqos),
    .s_axi_arregion(s_axi_arregion),
    .s_axi_arid(s_axi_arid),
    .s_axi_aruser(s_axi_aruser),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .s_axi_rlast(s_axi_rlast),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rid(s_axi_rid),
    .s_axi_ruser(s_axi_ruser)
  );
endmodule


// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:axi_ram_wrapper:1.0
// IP Revision: 1

//(* X_CORE_INFO = "axi_ram_wrapper,Vivado 2022.1" *)
//(* CHECK_LICENSE_TYPE = "design_1_axi_ram_wrapper_1_0,axi_ram_wrapper,{}" *)
//(* CORE_GENERATION_INFO = "design_1_axi_ram_wrapper_1_0,axi_ram_wrapper,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=axi_ram_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
//(* IP_DEFINITION_SOURCE = "module_ref" *)
//(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_axi_ram_wrapper_1_0 (
  clk,
  rst,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_awaddr,
  s_axi_awburst,
  s_axi_awlen,
  s_axi_awsize,
  s_axi_awlock,
  s_axi_awprot,
  s_axi_awcache,
  s_axi_awqos,
  s_axi_awregion,
  s_axi_awid,
  s_axi_awuser,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_wlast,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wuser,
  s_axi_bvalid,
  s_axi_bready,
  s_axi_bresp,
  s_axi_bid,
  s_axi_buser,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_araddr,
  s_axi_arburst,
  s_axi_arlen,
  s_axi_arsize,
  s_axi_arlock,
  s_axi_arprot,
  s_axi_arcache,
  s_axi_arqos,
  s_axi_arregion,
  s_axi_arid,
  s_axi_aruser,
  s_axi_rvalid,
  s_axi_rready,
  s_axi_rlast,
  s_axi_rresp,
  s_axi_rdata,
  s_axi_rid,
  s_axi_ruser
);

//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *)
input wire s_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *)
output wire s_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *)
input wire [31 : 0] s_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *)
input wire [1 : 0] s_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN" *)
input wire [7 : 0] s_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE" *)
input wire [2 : 0] s_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLOCK" *)
input wire s_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *)
input wire [2 : 0] s_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWCACHE" *)
input wire [3 : 0] s_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWQOS" *)
input wire [3 : 0] s_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREGION" *)
input wire [3 : 0] s_axi_awregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWID" *)
input wire [7 : 0] s_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWUSER" *)
input wire s_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *)
input wire s_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *)
output wire s_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST" *)
input wire s_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *)
input wire [31 : 0] s_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *)
input wire [3 : 0] s_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WUSER" *)
input wire s_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *)
output wire s_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *)
input wire s_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *)
output wire [1 : 0] s_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BID" *)
output wire [7 : 0] s_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BUSER" *)
output wire s_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *)
input wire s_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *)
output wire s_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *)
input wire [31 : 0] s_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *)
input wire [1 : 0] s_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN" *)
input wire [7 : 0] s_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE" *)
input wire [2 : 0] s_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLOCK" *)
input wire s_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *)
input wire [2 : 0] s_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARCACHE" *)
input wire [3 : 0] s_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARQOS" *)
input wire [3 : 0] s_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREGION" *)
input wire [3 : 0] s_axi_arregion;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARID" *)
input wire [7 : 0] s_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARUSER" *)
input wire s_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *)
output wire s_axi_rvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *)
input wire s_axi_rready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST" *)
output wire s_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *)
output wire [1 : 0] s_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *)
output wire [31 : 0] s_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RID" *)
output wire [7 : 0] s_axi_rid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RU\
//SER_BITS_PER_BYTE 0 0, WU//SER_BITS_PER_BYTE 0 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RUSER" *)
output wire s_axi_ruser;

  axi_ram_wrapper inst (
    .clk(clk),
    .rst(rst),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awburst(s_axi_awburst),
    .s_axi_awlen(s_axi_awlen),
    .s_axi_awsize(s_axi_awsize),
    .s_axi_awlock(s_axi_awlock),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awcache(s_axi_awcache),
    .s_axi_awqos(s_axi_awqos),
    .s_axi_awregion(s_axi_awregion),
    .s_axi_awid(s_axi_awid),
    .s_axi_awuser(s_axi_awuser),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_wlast(s_axi_wlast),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wuser(s_axi_wuser),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bid(s_axi_bid),
    .s_axi_buser(s_axi_buser),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arburst(s_axi_arburst),
    .s_axi_arlen(s_axi_arlen),
    .s_axi_arsize(s_axi_arsize),
    .s_axi_arlock(s_axi_arlock),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arcache(s_axi_arcache),
    .s_axi_arqos(s_axi_arqos),
    .s_axi_arregion(s_axi_arregion),
    .s_axi_arid(s_axi_arid),
    .s_axi_aruser(s_axi_aruser),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .s_axi_rlast(s_axi_rlast),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rid(s_axi_rid),
    .s_axi_ruser(s_axi_ruser)
  );
endmodule


// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: khazanapk.com:user:myip:1.0
// IP Revision: 5

//(* X_CORE_INFO = "myip_v1_0,Vivado 2022.1" *)
//(* CHECK_LICENSE_TYPE = "design_1_myip_0_0,myip_v1_0,{}" *)
//(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_myip_0_0 (
  C_M_TARGET_SLAVE_BASE_ADDR_0,
  m00_axi_init_axi_txn,
  m00_axi_txn_done,
  m00_axi_error,
  m00_axi_aclk,
  m00_axi_aresetn,
  m00_axi_awid,
  m00_axi_awaddr,
  m00_axi_awlen,
  m00_axi_awsize,
  m00_axi_awburst,
  m00_axi_awlock,
  m00_axi_awcache,
  m00_axi_awprot,
  m00_axi_awqos,
  m00_axi_awuser,
  m00_axi_awvalid,
  m00_axi_awready,
  m00_axi_wdata,
  m00_axi_wstrb,
  m00_axi_wlast,
  m00_axi_wuser,
  m00_axi_wvalid,
  m00_axi_wready,
  m00_axi_bid,
  m00_axi_bresp,
  m00_axi_buser,
  m00_axi_bvalid,
  m00_axi_bready,
  m00_axi_arid,
  m00_axi_araddr,
  m00_axi_arlen,
  m00_axi_arsize,
  m00_axi_arburst,
  m00_axi_arlock,
  m00_axi_arcache,
  m00_axi_arprot,
  m00_axi_arqos,
  m00_axi_aruser,
  m00_axi_arvalid,
  m00_axi_arready,
  m00_axi_rid,
  m00_axi_rdata,
  m00_axi_rresp,
  m00_axi_rlast,
  m00_axi_ruser,
  m00_axi_rvalid,
  m00_axi_rready
);

input wire [31 : 0] C_M_TARGET_SLAVE_BASE_ADDR_0;
input wire m00_axi_init_axi_txn;
output wire m00_axi_txn_done;
output wire m00_axi_error;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI_CLK, ASSOCIATED_BUSIF M00_AXI, ASSOCIATED_RESET m00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXI_CLK CLK" *)
input wire m00_axi_aclk;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXI_RST RST" *)
input wire m00_axi_aresetn;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWID" *)
output wire [0 : 0] m00_axi_awid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *)
output wire [31 : 0] m00_axi_awaddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN" *)
output wire [7 : 0] m00_axi_awlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE" *)
output wire [2 : 0] m00_axi_awsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST" *)
output wire [1 : 0] m00_axi_awburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK" *)
output wire m00_axi_awlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE" *)
output wire [3 : 0] m00_axi_awcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *)
output wire [2 : 0] m00_axi_awprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS" *)
output wire [3 : 0] m00_axi_awqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER" *)
output wire [0 : 0] m00_axi_awuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *)
output wire m00_axi_awvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *)
input wire m00_axi_awready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *)
output wire [31 : 0] m00_axi_wdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *)
output wire [3 : 0] m00_axi_wstrb;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WLAST" *)
output wire m00_axi_wlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WUSER" *)
output wire [0 : 0] m00_axi_wuser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *)
output wire m00_axi_wvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *)
input wire m00_axi_wready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BID" *)
input wire [0 : 0] m00_axi_bid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *)
input wire [1 : 0] m00_axi_bresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BUSER" *)
input wire [0 : 0] m00_axi_buser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *)
input wire m00_axi_bvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *)
output wire m00_axi_bready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARID" *)
output wire [0 : 0] m00_axi_arid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *)
output wire [31 : 0] m00_axi_araddr;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN" *)
output wire [7 : 0] m00_axi_arlen;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE" *)
output wire [2 : 0] m00_axi_arsize;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST" *)
output wire [1 : 0] m00_axi_arburst;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK" *)
output wire m00_axi_arlock;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE" *)
output wire [3 : 0] m00_axi_arcache;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *)
output wire [2 : 0] m00_axi_arprot;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS" *)
output wire [3 : 0] m00_axi_arqos;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER" *)
output wire [0 : 0] m00_axi_aruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *)
output wire m00_axi_arvalid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *)
input wire m00_axi_arready;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RID" *)
input wire [0 : 0] m00_axi_rid;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *)
input wire [31 : 0] m00_axi_rdata;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *)
input wire [1 : 0] m00_axi_rresp;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RLAST" *)
input wire m00_axi_rlast;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RUSER" *)
input wire [0 : 0] m00_axi_ruser;
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *)
input wire m00_axi_rvalid;
//(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NU\
//M_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
//(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *)
output wire m00_axi_rready;

  myip_v1_0 #(
    .C_M00_AXI_BURST_LEN(16),  // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    .C_M00_AXI_ID_WIDTH(1),  // Thread ID Width
    .C_M00_AXI_ADDR_WIDTH(32),  // Width of Address Bus
    .C_M00_AXI_DATA_WIDTH(32),  // Width of Data Bus
    .C_M00_AXI_AWUSER_WIDTH(1),  // Width of User Write Address Bus
    .C_M00_AXI_ARUSER_WIDTH(1),  // Width of User Read Address Bus
    .C_M00_AXI_WUSER_WIDTH(1),  // Width of User Write Data Bus
    .C_M00_AXI_RUSER_WIDTH(1),  // Width of User Read Data Bus
    .C_M00_AXI_BUSER_WIDTH(1)  // Width of User Response Bus
  ) inst (
    .C_M_TARGET_SLAVE_BASE_ADDR_0(C_M_TARGET_SLAVE_BASE_ADDR_0),
    .m00_axi_init_axi_txn(m00_axi_init_axi_txn),
    .m00_axi_txn_done(m00_axi_txn_done),
    .m00_axi_error(m00_axi_error),
    .m00_axi_aclk(m00_axi_aclk),
    .m00_axi_aresetn(m00_axi_aresetn),
    .m00_axi_awid(m00_axi_awid),
    .m00_axi_awaddr(m00_axi_awaddr),
    .m00_axi_awlen(m00_axi_awlen),
    .m00_axi_awsize(m00_axi_awsize),
    .m00_axi_awburst(m00_axi_awburst),
    .m00_axi_awlock(m00_axi_awlock),
    .m00_axi_awcache(m00_axi_awcache),
    .m00_axi_awprot(m00_axi_awprot),
    .m00_axi_awqos(m00_axi_awqos),
    .m00_axi_awuser(m00_axi_awuser),
    .m00_axi_awvalid(m00_axi_awvalid),
    .m00_axi_awready(m00_axi_awready),
    .m00_axi_wdata(m00_axi_wdata),
    .m00_axi_wstrb(m00_axi_wstrb),
    .m00_axi_wlast(m00_axi_wlast),
    .m00_axi_wuser(m00_axi_wuser),
    .m00_axi_wvalid(m00_axi_wvalid),
    .m00_axi_wready(m00_axi_wready),
    .m00_axi_bid(m00_axi_bid),
    .m00_axi_bresp(m00_axi_bresp),
    .m00_axi_buser(m00_axi_buser),
    .m00_axi_bvalid(m00_axi_bvalid),
    .m00_axi_bready(m00_axi_bready),
    .m00_axi_arid(m00_axi_arid),
    .m00_axi_araddr(m00_axi_araddr),
    .m00_axi_arlen(m00_axi_arlen),
    .m00_axi_arsize(m00_axi_arsize),
    .m00_axi_arburst(m00_axi_arburst),
    .m00_axi_arlock(m00_axi_arlock),
    .m00_axi_arcache(m00_axi_arcache),
    .m00_axi_arprot(m00_axi_arprot),
    .m00_axi_arqos(m00_axi_arqos),
    .m00_axi_aruser(m00_axi_aruser),
    .m00_axi_arvalid(m00_axi_arvalid),
    .m00_axi_arready(m00_axi_arready),
    .m00_axi_rid(m00_axi_rid),
    .m00_axi_rdata(m00_axi_rdata),
    .m00_axi_rresp(m00_axi_rresp),
    .m00_axi_rlast(m00_axi_rlast),
    .m00_axi_ruser(m00_axi_ruser),
    .m00_axi_rvalid(m00_axi_rvalid),
    .m00_axi_rready(m00_axi_rready)
  );
endmodule



`timescale 1 ns / 1 ps

	module myip_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface M00_AXI
	//	parameter  C_M00_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M00_AXI_BURST_LEN	= 16,
		parameter integer C_M00_AXI_ID_WIDTH	= 1,
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M00_AXI_DATA_WIDTH	= 32,
		parameter integer C_M00_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_WUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_RUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        input wire [31 : 0]C_M_TARGET_SLAVE_BASE_ADDR_0,

		// Ports of Axi Master Bus Interface M00_AXI
		input wire  m00_axi_init_axi_txn,
		output wire  m00_axi_txn_done,
		output wire  m00_axi_error,
		input wire  m00_axi_aclk,
		input wire  m00_axi_aresetn,
		output wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_awid,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_awaddr,
		output wire [7 : 0] m00_axi_awlen,
		output wire [2 : 0] m00_axi_awsize,
		output wire [1 : 0] m00_axi_awburst,
		output wire  m00_axi_awlock,
		output wire [3 : 0] m00_axi_awcache,
		output wire [2 : 0] m00_axi_awprot,
		output wire [3 : 0] m00_axi_awqos,
		output wire [C_M00_AXI_AWUSER_WIDTH-1 : 0] m00_axi_awuser,
		output wire  m00_axi_awvalid,
		input wire  m00_axi_awready,
		output wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_wdata,
		output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_wstrb,
		output wire  m00_axi_wlast,
		output wire [C_M00_AXI_WUSER_WIDTH-1 : 0] m00_axi_wuser,
		output wire  m00_axi_wvalid,
		input wire  m00_axi_wready,
		input wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_bid,
		input wire [1 : 0] m00_axi_bresp,
		input wire [C_M00_AXI_BUSER_WIDTH-1 : 0] m00_axi_buser,
		input wire  m00_axi_bvalid,
		output wire  m00_axi_bready,
		output wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_arid,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_araddr,
		output wire [7 : 0] m00_axi_arlen,
		output wire [2 : 0] m00_axi_arsize,
		output wire [1 : 0] m00_axi_arburst,
		output wire  m00_axi_arlock,
		output wire [3 : 0] m00_axi_arcache,
		output wire [2 : 0] m00_axi_arprot,
		output wire [3 : 0] m00_axi_arqos,
		output wire [C_M00_AXI_ARUSER_WIDTH-1 : 0] m00_axi_aruser,
		output wire  m00_axi_arvalid,
		input wire  m00_axi_arready,
		input wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_rid,
		input wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_rdata,
		input wire [1 : 0] m00_axi_rresp,
		input wire  m00_axi_rlast,
		input wire [C_M00_AXI_RUSER_WIDTH-1 : 0] m00_axi_ruser,
		input wire  m00_axi_rvalid,
		output wire  m00_axi_rready
	);
// Instantiation of Axi Bus Interface M00_AXI
	myip_v1_0_M00_AXI # ( 
		//.C_M_TARGET_SLAVE_BASE_ADDR(C_M00_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_M00_AXI_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_M00_AXI_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_M00_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M00_AXI_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_M00_AXI_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_M00_AXI_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_M00_AXI_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_M00_AXI_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_M00_AXI_BUSER_WIDTH)
	) myip_v1_0_M00_AXI_inst (
	    .C_M_TARGET_SLAVE_BASE_ADDR(C_M_TARGET_SLAVE_BASE_ADDR_0),
		.INIT_AXI_TXN(m00_axi_init_axi_txn),
		.TXN_DONE(m00_axi_txn_done),
		.ERROR(m00_axi_error),
		.M_AXI_ACLK(m00_axi_aclk),
		.M_AXI_ARESETN(m00_axi_aresetn),
		.M_AXI_AWID(m00_axi_awid),
		.M_AXI_AWADDR(m00_axi_awaddr),
		.M_AXI_AWLEN(m00_axi_awlen),
		.M_AXI_AWSIZE(m00_axi_awsize),
		.M_AXI_AWBURST(m00_axi_awburst),
		.M_AXI_AWLOCK(m00_axi_awlock),
		.M_AXI_AWCACHE(m00_axi_awcache),
		.M_AXI_AWPROT(m00_axi_awprot),
		.M_AXI_AWQOS(m00_axi_awqos),
		.M_AXI_AWUSER(m00_axi_awuser),
		.M_AXI_AWVALID(m00_axi_awvalid),
		.M_AXI_AWREADY(m00_axi_awready),
		.M_AXI_WDATA(m00_axi_wdata),
		.M_AXI_WSTRB(m00_axi_wstrb),
		.M_AXI_WLAST(m00_axi_wlast),
		.M_AXI_WUSER(m00_axi_wuser),
		.M_AXI_WVALID(m00_axi_wvalid),
		.M_AXI_WREADY(m00_axi_wready),
		.M_AXI_BID(m00_axi_bid),
		.M_AXI_BRESP(m00_axi_bresp),
		.M_AXI_BUSER(m00_axi_buser),
		.M_AXI_BVALID(m00_axi_bvalid),
		.M_AXI_BREADY(m00_axi_bready),
		.M_AXI_ARID(m00_axi_arid),
		.M_AXI_ARADDR(m00_axi_araddr),
		.M_AXI_ARLEN(m00_axi_arlen),
		.M_AXI_ARSIZE(m00_axi_arsize),
		.M_AXI_ARBURST(m00_axi_arburst),
		.M_AXI_ARLOCK(m00_axi_arlock),
		.M_AXI_ARCACHE(m00_axi_arcache),
		.M_AXI_ARPROT(m00_axi_arprot),
		.M_AXI_ARQOS(m00_axi_arqos),
		.M_AXI_ARUSER(m00_axi_aruser),
		.M_AXI_ARVALID(m00_axi_arvalid),
		.M_AXI_ARREADY(m00_axi_arready),
		.M_AXI_RID(m00_axi_rid),
		.M_AXI_RDATA(m00_axi_rdata),
		.M_AXI_RRESP(m00_axi_rresp),
		.M_AXI_RLAST(m00_axi_rlast),
		.M_AXI_RUSER(m00_axi_ruser),
		.M_AXI_RVALID(m00_axi_rvalid),
		.M_AXI_RREADY(m00_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule



`timescale 1 ns / 1 ps

	module myip_v1_0_M00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Base address of targeted slave
	//	parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		// Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		parameter integer C_M_AXI_BURST_LEN	= 16,
		// Thread ID Width
		parameter integer C_M_AXI_ID_WIDTH	= 1,
		// Width of Address Bus
		parameter integer C_M_AXI_ADDR_WIDTH	= 32,
		// Width of Data Bus
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		// Width of User Write Address Bus
		parameter integer C_M_AXI_AWUSER_WIDTH	= 0,
		// Width of User Read Address Bus
		parameter integer C_M_AXI_ARUSER_WIDTH	= 0,
		// Width of User Write Data Bus
		parameter integer C_M_AXI_WUSER_WIDTH	= 0,
		// Width of User Read Data Bus
		parameter integer C_M_AXI_RUSER_WIDTH	= 0,
		// Width of User Response Bus
		parameter integer C_M_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        input wire [31 : 0] C_M_TARGET_SLAVE_BASE_ADDR,
		// Initiate AXI transactions
		input wire  INIT_AXI_TXN,
		// Asserts when transaction is complete
		output wire  TXN_DONE,
		// Asserts when ERROR is detected
		output reg  ERROR,
		// Global Clock Signal.
		input wire  M_AXI_ACLK,
		// Global Reset Singal. This Signal is Active Low
		input wire  M_AXI_ARESETN,
		// Master Interface Write Address ID
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
		// Master Interface Write Address
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each write transaction.
		output wire [3 : 0] M_AXI_AWQOS,
		// Optional User-defined signal in the write address channel.
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and control information.
		output wire  M_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_AWREADY,
		// Master Interface Write Data.
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		// Write last. This signal indicates the last transfer in a write burst.
		output wire  M_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available
		output wire  M_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		input wire  M_AXI_WREADY,
		// Master Interface Write Response.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
		// Write response. This signal indicates the status of the write transaction.
		input wire [1 : 0] M_AXI_BRESP,
		// Optional User-defined signal in the write response channel
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		input wire  M_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		output wire  M_AXI_BREADY,
		// Master Interface Read Address.
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each read transaction
		output wire [3 : 0] M_AXI_ARQOS,
		// Optional User-defined signal in the read address channel.
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and control information
		output wire  M_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
		// Master Read Data
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		// Read response. This signal indicates the status of the read transfer
		input wire [1 : 0] M_AXI_RRESP,
		// Read last. This signal indicates the last transfer in a read burst
		input wire  M_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		input wire  M_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		output wire  M_AXI_RREADY
	);


	// function called clogb2 that returns an integer which has the
	//value of the ceiling of the log base 2

	  // function called clogb2 that returns an integer which has the 
	  // value of the ceiling of the log base 2.                      
	  function integer clogb2 (input integer bit_depth);              
	  begin                                                           
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
	      bit_depth = bit_depth >> 1;                                 
	    end                                                           
	  endfunction                                                     

	// C_TRANSACTIONS_NUM is the width of the index counter for 
	// number of write or read transaction.
	 localparam integer C_TRANSACTIONS_NUM = clogb2(C_M_AXI_BURST_LEN-1);

	// Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
	// Non-2^n lengths will eventually cause bursts across 4K address boundaries.
	 localparam integer C_MASTER_LENGTH	= 12;
	// total number of burst transfers is master length divided by burst length and burst size
	 localparam integer C_NO_BURSTS_REQ = C_MASTER_LENGTH-clogb2((C_M_AXI_BURST_LEN*C_M_AXI_DATA_WIDTH/8)-1);
	// Example State machine to initialize counter, initialize write transactions, 
	// initialize read transactions and comparison of read data with the 
	// written data words.
	parameter [1:0] IDLE = 2'b00, // This state initiates AXI4Lite transaction 
			// after the state machine changes state to INIT_WRITE 
			// when there is 0 to 1 transition on INIT_AXI_TXN
		INIT_WRITE   = 2'b01, // This state initializes write transaction,
			// once writes are done, the state machine 
			// changes state to INIT_READ 
		INIT_READ = 2'b10, // This state initializes read transaction
			// once reads are done, the state machine 
			// changes state to INIT_COMPARE 
		INIT_COMPARE = 2'b11; // This state issues the status of comparison 
			// of the written data with the read data	

	 reg [1:0] mst_exec_state;

	// AXI4LITE signals
	//AXI4 internal temp signals
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awvalid;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	reg  	axi_wlast;
	reg  	axi_wvalid;
	reg  	axi_bready;
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arvalid;
	reg  	axi_rready;
	//write beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	write_index;
	//read beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	read_index;
	//size of C_M_AXI_BURST_LEN length burst in bytes
	wire [C_TRANSACTIONS_NUM+2 : 0] 	burst_size_bytes;
	//The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
	reg [C_NO_BURSTS_REQ : 0] 	write_burst_counter;
	reg [C_NO_BURSTS_REQ : 0] 	read_burst_counter;
	reg  	start_single_burst_write;
	reg  	start_single_burst_read;
	reg  	writes_done;
	reg  	reads_done;
	reg  	error_reg;
	reg  	compare_done;
	reg  	read_mismatch;
	reg  	burst_write_active;
	reg  	burst_read_active;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	expected_rdata;
	//Interface response error flags
	wire  	write_resp_error;
	wire  	read_resp_error;
	wire  	wnext;
	wire  	rnext;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;


	// I/O Connections assignments

	//I/O Connections. Write Address (AW)
	assign M_AXI_AWID	= 'b0;
	//The AXI address is a concatenation of the target base address + active offset range
	assign M_AXI_AWADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_awaddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_AWLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M_AXI_AWSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_AWBURST	= 2'b01;
	assign M_AXI_AWLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_AWCACHE	= 4'b0010;
	assign M_AXI_AWPROT	= 3'h0;
	assign M_AXI_AWQOS	= 4'h0;
	assign M_AXI_AWUSER	= 'b1;
	assign M_AXI_AWVALID	= axi_awvalid;
	//Write Data(W)
	assign M_AXI_WDATA	= axi_wdata;
	//All bursts are complete and aligned in this example
	assign M_AXI_WSTRB	= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
	assign M_AXI_WLAST	= axi_wlast;
	assign M_AXI_WUSER	= 'b0;
	assign M_AXI_WVALID	= axi_wvalid;
	//Write Response (B)
	assign M_AXI_BREADY	= axi_bready;
	//Read Address (AR)
	assign M_AXI_ARID	= 'b0;
	assign M_AXI_ARADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_araddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_ARLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M_AXI_ARSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_ARBURST	= 2'b01;
	assign M_AXI_ARLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_ARCACHE	= 4'b0010;
	assign M_AXI_ARPROT	= 3'h0;
	assign M_AXI_ARQOS	= 4'h0;
	assign M_AXI_ARUSER	= 'b1;
	assign M_AXI_ARVALID	= axi_arvalid;
	//Read and Read Response (R)
	assign M_AXI_RREADY	= axi_rready;
	//Example design I/O
	assign TXN_DONE	= compare_done;
	//Burst size in bytes
	assign burst_size_bytes	= C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
	assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff;


	//Generate a pulse to initiate AXI transaction.
	always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;                                                   
	        init_txn_ff2 <= 1'b0;                                                   
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= INIT_AXI_TXN;
	        init_txn_ff2 <= init_txn_ff;                                                                 
	      end                                                                      
	  end     


	//--------------------
	//Write Address Channel
	//--------------------

	// The purpose of the write address channel is to request the address and 
	// command information for the entire transaction.  It is a single beat
	// of information.

	// The AXI4 Write address channel in this example will continue to initiate
	// write commands as fast as it is allowed by the slave/interconnect.
	// The address will be incremented on each accepted address transaction,
	// by burst_size_byte to point to the next address. 

	  always @(posedge M_AXI_ACLK)                                   
	  begin                                                                
	                                                                       
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                           
	      begin                                                            
	        axi_awvalid <= 1'b0;                                           
	      end                                                              
	    // If previously not valid , start next transaction                
	    else if (~axi_awvalid && start_single_burst_write)                 
	      begin                                                            
	        axi_awvalid <= 1'b1;                                           
	      end                                                              
	    /* Once asserted, VALIDs cannot be deasserted, so axi_awvalid      
	    must wait until transaction is accepted */                         
	    else if (M_AXI_AWREADY && axi_awvalid)                             
	      begin                                                            
	        axi_awvalid <= 1'b0;                                           
	      end                                                              
	    else                                                               
	      axi_awvalid <= axi_awvalid;                                      
	    end                                                                
	                                                                       
	                                                                       
	// Next address after AWREADY indicates previous address acceptance    
	  always @(posedge M_AXI_ACLK)                                         
	  begin                                                                
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                            
	      begin                                                            
	        axi_awaddr <= 'b0;                                             
	      end                                                              
	    else if (M_AXI_AWREADY && axi_awvalid)                             
	      begin                                                            
	        axi_awaddr <= axi_awaddr + burst_size_bytes;                   
	      end                                                              
	    else                                                               
	      axi_awaddr <= axi_awaddr;                                        
	    end                                                                


	//--------------------
	//Write Data Channel
	//--------------------

	//The write data will continually try to push write data across the interface.

	//The amount of data accepted will depend on the AXI slave and the AXI
	//Interconnect settings, such as if there are FIFOs enabled in interconnect.

	//Note that there is no explicit timing relationship to the write address channel.
	//The write channel has its own throttling flag, separate from the AW channel.

	//Synchronization between the channels must be determined by the user.

	//The simpliest but lowest performance would be to only issue one address write
	//and write data burst at a time.

	//In this example they are kept in sync by using the same address increment
	//and burst sizes. Then the AW and W channels have their transactions measured
	//with threshold counters as part of the user logic, to make sure neither 
	//channel gets too far ahead of each other.

	//Forward movement occurs when the write channel is valid and ready

	  assign wnext = M_AXI_WREADY & axi_wvalid;                                   
	                                                                                    
	// WVALID logic, similar to the axi_awvalid always block above                      
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                        
	      begin                                                                         
	        axi_wvalid <= 1'b0;                                                         
	      end                                                                           
	    // If previously not valid, start next transaction                              
	    else if (~axi_wvalid && start_single_burst_write)                               
	      begin                                                                         
	        axi_wvalid <= 1'b1;                                                         
	      end                                                                           
	    /* If WREADY and too many writes, throttle WVALID                               
	    Once asserted, VALIDs cannot be deasserted, so WVALID                           
	    must wait until burst is complete with WLAST */                                 
	    else if (wnext && axi_wlast)                                                    
	      axi_wvalid <= 1'b0;                                                           
	    else                                                                            
	      axi_wvalid <= axi_wvalid;                                                     
	  end                                                                               
	                                                                                    
	                                                                                    
	//WLAST generation on the MSB of a counter underflow                                
	// WVALID logic, similar to the axi_awvalid always block above                      
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                        
	      begin                                                                         
	        axi_wlast <= 1'b0;                                                          
	      end                                                                           
	    // axi_wlast is asserted when the write index                                   
	    // count reaches the penultimate count to synchronize                           
	    // with the last write data when write_index is b1111                           
	    // else if (&(write_index[C_TRANSACTIONS_NUM-1:1])&& ~write_index[0] && wnext)  
	    else if (((write_index == C_M_AXI_BURST_LEN-2 && C_M_AXI_BURST_LEN >= 2) && wnext) || (C_M_AXI_BURST_LEN == 1 ))
	      begin                                                                         
	        axi_wlast <= 1'b1;                                                          
	      end                                                                           
	    // Deassrt axi_wlast when the last write data has been                          
	    // accepted by the slave with a valid response                                  
	    else if (wnext)                                                                 
	      axi_wlast <= 1'b0;                                                            
	    else if (axi_wlast && C_M_AXI_BURST_LEN == 1)                                   
	      axi_wlast <= 1'b0;                                                            
	    else                                                                            
	      axi_wlast <= axi_wlast;                                                       
	  end                                                                               
	                                                                                    
	                                                                                    
	/* Burst length counter. Uses extra counter register bit to indicate terminal       
	 count to reduce decode logic */                                                    
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || start_single_burst_write == 1'b1)    
	      begin                                                                         
	        write_index <= 0;                                                           
	      end                                                                           
	    else if (wnext && (write_index != C_M_AXI_BURST_LEN-1))                         
	      begin                                                                         
	        write_index <= write_index + 1;                                             
	      end                                                                           
	    else                                                                            
	      write_index <= write_index;                                                   
	  end                                                                               
	                                                                                    
	                                                                                    
	/* Write Data Generator                                                             
	 Data pattern is only a simple incrementing count from 0 for each burst  */         
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                         
	      axi_wdata <= 'b1;                                                             
	    //else if (wnext && axi_wlast)                                                  
	    //  axi_wdata <= 'b0;                                                           
	    else if (wnext)                                                                 
	      axi_wdata <= axi_wdata + 1;                                                   
	    else                                                                            
	      axi_wdata <= axi_wdata;                                                       
	    end                                                                             


	//----------------------------
	//Write Response (B) Channel
	//----------------------------

	//The write response channel provides feedback that the write has committed
	//to memory. BREADY will occur when all of the data and the write address
	//has arrived and been accepted by the slave.

	//The write issuance (number of outstanding write addresses) is started by 
	//the Address Write transfer, and is completed by a BREADY/BRESP.

	//While negating BREADY will eventually throttle the AWREADY signal, 
	//it is best not to throttle the whole data channel this way.

	//The BRESP bit [1] is used indicate any errors from the interconnect or
	//slave for the entire write burst. This example will capture the error 
	//into the ERROR output. 

	  always @(posedge M_AXI_ACLK)                                     
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                            
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // accept/acknowledge bresp with axi_bready by the master           
	    // when M_AXI_BVALID is asserted by slave                           
	    else if (M_AXI_BVALID && ~axi_bready)                               
	      begin                                                             
	        axi_bready <= 1'b1;                                             
	      end                                                               
	    // deassert after one clock cycle                                   
	    else if (axi_bready)                                                
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // retain the previous value                                        
	    else                                                                
	      axi_bready <= axi_bready;                                         
	  end                                                                   
	                                                                        
	                                                                        
	//Flag any write response errors                                        
	  assign write_resp_error = axi_bready & M_AXI_BVALID & M_AXI_BRESP[1]; 


	//----------------------------
	//Read Address Channel
	//----------------------------

	//The Read Address Channel (AW) provides a similar function to the
	//Write Address channel- to provide the tranfer qualifiers for the burst.

	//In this example, the read address increments in the same
	//manner as the write address channel.

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                         
	      begin                                                          
	        axi_arvalid <= 1'b0;                                         
	      end                                                            
	    // If previously not valid , start next transaction              
	    else if (~axi_arvalid && start_single_burst_read)                
	      begin                                                          
	        axi_arvalid <= 1'b1;                                         
	      end                                                            
	    else if (M_AXI_ARREADY && axi_arvalid)                           
	      begin                                                          
	        axi_arvalid <= 1'b0;                                         
	      end                                                            
	    else                                                             
	      axi_arvalid <= axi_arvalid;                                    
	  end                                                                
	                                                                     
	                                                                     
	// Next address after ARREADY indicates previous address acceptance  
	  always @(posedge M_AXI_ACLK)                                       
	  begin                                                              
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                          
	      begin                                                          
	        axi_araddr <= 'b0;                                           
	      end                                                            
	    else if (M_AXI_ARREADY && axi_arvalid)                           
	      begin                                                          
	        axi_araddr <= axi_araddr + burst_size_bytes;                 
	      end                                                            
	    else                                                             
	      axi_araddr <= axi_araddr;                                      
	  end                                                                


	//--------------------------------
	//Read Data (and Response) Channel
	//--------------------------------

	 // Forward movement occurs when the channel is valid and ready   
	  assign rnext = M_AXI_RVALID && axi_rready;                            
	                                                                        
	                                                                        
	// Burst length counter. Uses extra counter register bit to indicate    
	// terminal count to reduce decode logic                                
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || start_single_burst_read)                  
	      begin                                                             
	        read_index <= 0;                                                
	      end                                                               
	    else if (rnext && (read_index != C_M_AXI_BURST_LEN-1))              
	      begin                                                             
	        read_index <= read_index + 1;                                   
	      end                                                               
	    else                                                                
	      read_index <= read_index;                                         
	  end                                                                   
	                                                                        
	                                                                        
	/*                                                                      
	 The Read Data channel returns the results of the read request          
	                                                                        
	 In this example the data checker is always able to accept              
	 more data, so no need to throttle the RREADY signal                    
	 */                                                                     
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                  
	      begin                                                             
	        axi_rready <= 1'b0;                                             
	      end                                                               
	    // accept/acknowledge rdata/rresp with axi_rready by the master     
	    // when M_AXI_RVALID is asserted by slave                           
	    else if (M_AXI_RVALID)                       
	      begin                                      
	         if (M_AXI_RLAST && axi_rready)          
	          begin                                  
	            axi_rready <= 1'b0;                  
	          end                                    
	         else                                    
	           begin                                 
	             axi_rready <= 1'b1;                 
	           end                                   
	      end                                        
	    // retain the previous value                 
	  end                                            
	                                                                        
	//Check received read data against data generator                       
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                   
	      begin                                                             
	        read_mismatch <= 1'b0;                                          
	      end                                                               
	    //Only check data when RVALID is active                             
	    else if (rnext && (M_AXI_RDATA != expected_rdata))                  
	      begin                                                             
	        read_mismatch <= 1'b1;                                          
	      end                                                               
	    else                                                                
	      read_mismatch <= 1'b0;                                            
	  end                                                                   
	                                                                        
	//Flag any read response errors                                         
	  assign read_resp_error = axi_rready & M_AXI_RVALID & M_AXI_RRESP[1];  


	//----------------------------------------
	//Example design read check data generator
	//-----------------------------------------

	//Generate expected read data to check against actual read data

	  always @(posedge M_AXI_ACLK)                     
	  begin                                                  
		if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)// || M_AXI_RLAST)             
			expected_rdata <= 'b1;                            
		else if (M_AXI_RVALID && axi_rready)                  
			expected_rdata <= expected_rdata + 1;             
		else                                                  
			expected_rdata <= expected_rdata;                 
	  end                                                    


	//----------------------------------
	//Example design error register
	//----------------------------------

	//Register and hold any data mismatches, or read/write interface errors 

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                          
	      begin                                                          
	        error_reg <= 1'b0;                                           
	      end                                                            
	    else if (read_mismatch || write_resp_error || read_resp_error)   
	      begin                                                          
	        error_reg <= 1'b1;                                           
	      end                                                            
	    else                                                             
	      error_reg <= error_reg;                                        
	  end                                                                


	//--------------------------------
	//Example design throttling
	//--------------------------------

	// For maximum port throughput, this user example code will try to allow
	// each channel to run as independently and as quickly as possible.

	// However, there are times when the flow of data needs to be throtted by
	// the user application. This example application requires that data is
	// not read before it is written and that the write channels do not
	// advance beyond an arbitrary threshold (say to prevent an 
	// overrun of the current read address by the write address).

	// From AXI4 Specification, 13.13.1: "If a master requires ordering between 
	// read and write transactions, it must ensure that a response is received 
	// for the previous transaction before issuing the next transaction."

	// This example accomplishes this user application throttling through:
	// -Reads wait for writes to fully complete
	// -Address writes wait when not read + issued transaction counts pass 
	// a parameterized threshold
	// -Writes wait when a not read + active data burst count pass 
	// a parameterized threshold

	 // write_burst_counter counter keeps track with the number of burst transaction initiated            
	 // against the number of burst transactions the master needs to initiate                                   
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                                                 
	      begin                                                                                                 
	        write_burst_counter <= 'b0;                                                                         
	      end                                                                                                   
	    else if (M_AXI_AWREADY && axi_awvalid)                                                                  
	      begin                                                                                                 
	        if (write_burst_counter[C_NO_BURSTS_REQ] == 1'b0)                                                   
	          begin                                                                                             
	            write_burst_counter <= write_burst_counter + 1'b1;                                              
	            //write_burst_counter[C_NO_BURSTS_REQ] <= 1'b1;                                                 
	          end                                                                                               
	      end                                                                                                   
	    else                                                                                                    
	      write_burst_counter <= write_burst_counter;                                                           
	  end                                                                                                       
	                                                                                                            
	 // read_burst_counter counter keeps track with the number of burst transaction initiated                   
	 // against the number of burst transactions the master needs to initiate                                   
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      begin                                                                                                 
	        read_burst_counter <= 'b0;                                                                          
	      end                                                                                                   
	    else if (M_AXI_ARREADY && axi_arvalid)                                                                  
	      begin                                                                                                 
	        if (read_burst_counter[C_NO_BURSTS_REQ] == 1'b0)                                                    
	          begin                                                                                             
	            read_burst_counter <= read_burst_counter + 1'b1;                                                
	            //read_burst_counter[C_NO_BURSTS_REQ] <= 1'b1;                                                  
	          end                                                                                               
	      end                                                                                                   
	    else                                                                                                    
	      read_burst_counter <= read_burst_counter;                                                             
	  end                                                                                                       
	                                                                                                            
	                                                                                                            
	  //implement master command interface state machine                                                        
	                                                                                                            
	  always @ ( posedge M_AXI_ACLK)                                                                            
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 1'b0 )                                                                             
	      begin                                                                                                 
	        // reset condition                                                                                  
	        // All the signals are assigned default values under reset condition                                
	        mst_exec_state      <= IDLE;                                                                
	        start_single_burst_write <= 1'b0;                                                                   
	        start_single_burst_read  <= 1'b0;                                                                   
	        compare_done      <= 1'b0;                                                                          
	        ERROR <= 1'b0;   
	      end                                                                                                   
	    else                                                                                                    
	      begin                                                                                                 
	                                                                                                            
	        // state transition                                                                                 
	        case (mst_exec_state)                                                                               
	                                                                                                            
	          IDLE:                                                                                     
	            // This state is responsible to wait for user defined C_M_START_COUNT                           
	            // number of clock cycles.                                                                      
	            if ( init_txn_pulse == 1'b1)                                                      
	              begin                                                                                         
	                mst_exec_state  <= INIT_WRITE;                                                              
	                ERROR <= 1'b0;
	                compare_done <= 1'b0;
	              end                                                                                           
	            else                                                                                            
	              begin                                                                                         
	                mst_exec_state  <= IDLE;                                                            
	              end                                                                                           
	                                                                                                            
	          INIT_WRITE:                                                                                       
	            // This state is responsible to issue start_single_write pulse to                               
	            // initiate a write transaction. Write transactions will be                                     
	            // issued until burst_write_active signal is asserted.                                          
	            // write controller                                                                             
	            if (writes_done)                                                                                
	              begin                                                                                         
	                mst_exec_state <= INIT_READ;//                                                              
	              end                                                                                           
	            else                                                                                            
	              begin                                                                                         
	                mst_exec_state  <= INIT_WRITE;                                                              
	                                                                                                            
	                if (~axi_awvalid && ~start_single_burst_write && ~burst_write_active)                       
	                  begin                                                                                     
	                    start_single_burst_write <= 1'b1;                                                       
	                  end                                                                                       
	                else                                                                                        
	                  begin                                                                                     
	                    start_single_burst_write <= 1'b0; //Negate to generate a pulse                          
	                  end                                                                                       
	              end                                                                                           
	                                                                                                            
	          INIT_READ:                                                                                        
	            // This state is responsible to issue start_single_read pulse to                                
	            // initiate a read transaction. Read transactions will be                                       
	            // issued until burst_read_active signal is asserted.                                           
	            // read controller                                                                              
	            if (reads_done)                                                                                 
	              begin                                                                                         
	                mst_exec_state <= INIT_COMPARE;                                                             
	              end                                                                                           
	            else                                                                                            
	              begin                                                                                         
	                mst_exec_state  <= INIT_READ;                                                               
	                                                                                                            
	                if (~axi_arvalid && ~burst_read_active && ~start_single_burst_read)                         
	                  begin                                                                                     
	                    start_single_burst_read <= 1'b1;                                                        
	                  end                                                                                       
	               else                                                                                         
	                 begin                                                                                      
	                   start_single_burst_read <= 1'b0; //Negate to generate a pulse                            
	                 end                                                                                        
	              end                                                                                           
	                                                                                                            
	          INIT_COMPARE:                                                                                     
	            // This state is responsible to issue the state of comparison                                   
	            // of written data with the read data. If no error flags are set,                               
	            // compare_done signal will be asseted to indicate success.                                     
	            //if (~error_reg)                                                                               
	            begin                                                                                           
	              ERROR <= error_reg;
	              mst_exec_state <= IDLE;                                                               
	              compare_done <= 1'b1;                                                                         
	            end                                                                                             
	          default :                                                                                         
	            begin                                                                                           
	              mst_exec_state  <= IDLE;                                                              
	            end                                                                                             
	        endcase                                                                                             
	      end                                                                                                   
	  end //MASTER_EXECUTION_PROC                                                                               
	                                                                                                            
	                                                                                                            
	  // burst_write_active signal is asserted when there is a burst write transaction                          
	  // is initiated by the assertion of start_single_burst_write. burst_write_active                          
	  // signal remains asserted until the burst write is accepted by the slave                                 
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      burst_write_active <= 1'b0;                                                                           
	                                                                                                            
	    //The burst_write_active is asserted when a write burst transaction is initiated                        
	    else if (start_single_burst_write)                                                                      
	      burst_write_active <= 1'b1;                                                                           
	    else if (M_AXI_BVALID && axi_bready)                                                                    
	      burst_write_active <= 0;                                                                              
	  end                                                                                                       
	                                                                                                            
	 // Check for last write completion.                                                                        
	                                                                                                            
	 // This logic is to qualify the last write count with the final write                                      
	 // response. This demonstrates how to confirm that a write has been                                        
	 // committed.                                                                                              
	                                                                                                            
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      writes_done <= 1'b0;                                                                                  
	                                                                                                            
	    //The writes_done should be associated with a bready response                                           
	    //else if (M_AXI_BVALID && axi_bready && (write_burst_counter == {(C_NO_BURSTS_REQ-1){1}}) && axi_wlast)
	    else if (M_AXI_BVALID && (write_burst_counter[C_NO_BURSTS_REQ]) && axi_bready)                          
	      writes_done <= 1'b1;                                                                                  
	    else                                                                                                    
	      writes_done <= writes_done;                                                                           
	    end                                                                                                     
	                                                                                                            
	  // burst_read_active signal is asserted when there is a burst write transaction                           
	  // is initiated by the assertion of start_single_burst_write. start_single_burst_read                     
	  // signal remains asserted until the burst read is accepted by the master                                 
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      burst_read_active <= 1'b0;                                                                            
	                                                                                                            
	    //The burst_write_active is asserted when a write burst transaction is initiated                        
	    else if (start_single_burst_read)                                                                       
	      burst_read_active <= 1'b1;                                                                            
	    else if (M_AXI_RVALID && axi_rready && M_AXI_RLAST)                                                     
	      burst_read_active <= 0;                                                                               
	    end                                                                                                     
	                                                                                                            
	                                                                                                            
	 // Check for last read completion.                                                                         
	                                                                                                            
	 // This logic is to qualify the last read count with the final read                                        
	 // response. This demonstrates how to confirm that a read has been                                         
	 // committed.                                                                                              
	                                                                                                            
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      reads_done <= 1'b0;                                                                                   
	                                                                                                            
	    //The reads_done should be associated with a rready response                                            
	    //else if (M_AXI_BVALID && axi_bready && (write_burst_counter == {(C_NO_BURSTS_REQ-1){1}}) && axi_wlast)
	    else if (M_AXI_RVALID && axi_rready && (read_index == C_M_AXI_BURST_LEN-1) && (read_burst_counter[C_NO_BURSTS_REQ]))
	      reads_done <= 1'b1;                                                                                   
	    else                                                                                                    
	      reads_done <= reads_done;                                                                             
	    end                                                                                                     

	// Add user logic here

	// User logic ends

	endmodule


module top(
input reset_n,
input reset_rtl_0_1,
input clk,
input [31:0]C_M_TARGET_SLAVE_BASE_ADDR_0_1,
input m00_axi_init_axi_txn_0_1


);

//wire [31:0]C_M_TARGET_SLAVE_BASE_ADDR_0_1;
  wire [31:0]axi_interconnect_wra_0_m00_axi_ARADDR;
  wire [1:0]axi_interconnect_wra_0_m00_axi_ARBURST;
  wire [3:0]axi_interconnect_wra_0_m00_axi_ARCACHE;
  wire [7:0]axi_interconnect_wra_0_m00_axi_ARID;
  wire [7:0]axi_interconnect_wra_0_m00_axi_ARLEN;
  wire axi_interconnect_wra_0_m00_axi_ARLOCK;
  wire [2:0]axi_interconnect_wra_0_m00_axi_ARPROT;
  wire [3:0]axi_interconnect_wra_0_m00_axi_ARQOS;
  wire axi_interconnect_wra_0_m00_axi_ARREADY;
  wire [3:0]axi_interconnect_wra_0_m00_axi_ARREGION;
  wire [2:0]axi_interconnect_wra_0_m00_axi_ARSIZE;
  wire axi_interconnect_wra_0_m00_axi_ARUSER;
  wire axi_interconnect_wra_0_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_wra_0_m00_axi_AWADDR;
  wire [1:0]axi_interconnect_wra_0_m00_axi_AWBURST;
  wire [3:0]axi_interconnect_wra_0_m00_axi_AWCACHE;
  wire [7:0]axi_interconnect_wra_0_m00_axi_AWID;
  wire [7:0]axi_interconnect_wra_0_m00_axi_AWLEN;
  wire axi_interconnect_wra_0_m00_axi_AWLOCK;
  wire [2:0]axi_interconnect_wra_0_m00_axi_AWPROT;
  wire [3:0]axi_interconnect_wra_0_m00_axi_AWQOS;
  wire axi_interconnect_wra_0_m00_axi_AWREADY;
  wire [3:0]axi_interconnect_wra_0_m00_axi_AWREGION;
  wire [2:0]axi_interconnect_wra_0_m00_axi_AWSIZE;
  wire axi_interconnect_wra_0_m00_axi_AWUSER;
  wire axi_interconnect_wra_0_m00_axi_AWVALID;
  wire [7:0]axi_interconnect_wra_0_m00_axi_BID;
  wire axi_interconnect_wra_0_m00_axi_BREADY;
  wire [1:0]axi_interconnect_wra_0_m00_axi_BRESP;
  wire axi_interconnect_wra_0_m00_axi_BUSER;
  wire axi_interconnect_wra_0_m00_axi_BVALID;
  wire [31:0]axi_interconnect_wra_0_m00_axi_RDATA;
  wire [7:0]axi_interconnect_wra_0_m00_axi_RID;
  wire axi_interconnect_wra_0_m00_axi_RLAST;
  wire axi_interconnect_wra_0_m00_axi_RREADY;
  wire [1:0]axi_interconnect_wra_0_m00_axi_RRESP;
  wire axi_interconnect_wra_0_m00_axi_RUSER;
  wire axi_interconnect_wra_0_m00_axi_RVALID;
  wire [31:0]axi_interconnect_wra_0_m00_axi_WDATA;
  wire axi_interconnect_wra_0_m00_axi_WLAST;
  wire axi_interconnect_wra_0_m00_axi_WREADY;
  wire [3:0]axi_interconnect_wra_0_m00_axi_WSTRB;
  wire axi_interconnect_wra_0_m00_axi_WUSER;
  wire axi_interconnect_wra_0_m00_axi_WVALID;
  wire [31:0]axi_interconnect_wra_0_m01_axi_ARADDR;
  wire [1:0]axi_interconnect_wra_0_m01_axi_ARBURST;
  wire [3:0]axi_interconnect_wra_0_m01_axi_ARCACHE;
  wire [7:0]axi_interconnect_wra_0_m01_axi_ARID;
  wire [7:0]axi_interconnect_wra_0_m01_axi_ARLEN;
  wire axi_interconnect_wra_0_m01_axi_ARLOCK;
  wire [2:0]axi_interconnect_wra_0_m01_axi_ARPROT;
  wire [3:0]axi_interconnect_wra_0_m01_axi_ARQOS;
  wire axi_interconnect_wra_0_m01_axi_ARREADY;
  wire [3:0]axi_interconnect_wra_0_m01_axi_ARREGION;
  wire [2:0]axi_interconnect_wra_0_m01_axi_ARSIZE;
  wire axi_interconnect_wra_0_m01_axi_ARUSER;
  wire axi_interconnect_wra_0_m01_axi_ARVALID;
  wire [31:0]axi_interconnect_wra_0_m01_axi_AWADDR;
  wire [1:0]axi_interconnect_wra_0_m01_axi_AWBURST;
  wire [3:0]axi_interconnect_wra_0_m01_axi_AWCACHE;
  wire [7:0]axi_interconnect_wra_0_m01_axi_AWID;
  wire [7:0]axi_interconnect_wra_0_m01_axi_AWLEN;
  wire axi_interconnect_wra_0_m01_axi_AWLOCK;
  wire [2:0]axi_interconnect_wra_0_m01_axi_AWPROT;
  wire [3:0]axi_interconnect_wra_0_m01_axi_AWQOS;
  wire axi_interconnect_wra_0_m01_axi_AWREADY;
  wire [3:0]axi_interconnect_wra_0_m01_axi_AWREGION;
  wire [2:0]axi_interconnect_wra_0_m01_axi_AWSIZE;
  wire axi_interconnect_wra_0_m01_axi_AWUSER;
  wire axi_interconnect_wra_0_m01_axi_AWVALID;
  wire [7:0]axi_interconnect_wra_0_m01_axi_BID;
  wire axi_interconnect_wra_0_m01_axi_BREADY;
  wire [1:0]axi_interconnect_wra_0_m01_axi_BRESP;
  wire axi_interconnect_wra_0_m01_axi_BUSER;
  wire axi_interconnect_wra_0_m01_axi_BVALID;
  wire [31:0]axi_interconnect_wra_0_m01_axi_RDATA;
  wire [7:0]axi_interconnect_wra_0_m01_axi_RID;
  wire axi_interconnect_wra_0_m01_axi_RLAST;
  wire axi_interconnect_wra_0_m01_axi_RREADY;
  wire [1:0]axi_interconnect_wra_0_m01_axi_RRESP;
  wire axi_interconnect_wra_0_m01_axi_RUSER;
  wire axi_interconnect_wra_0_m01_axi_RVALID;
  wire [31:0]axi_interconnect_wra_0_m01_axi_WDATA;
  wire axi_interconnect_wra_0_m01_axi_WLAST;
  wire axi_interconnect_wra_0_m01_axi_WREADY;
  wire [3:0]axi_interconnect_wra_0_m01_axi_WSTRB;
  wire axi_interconnect_wra_0_m01_axi_WUSER;
  wire axi_interconnect_wra_0_m01_axi_WVALID;
  wire clk_100MHz_1;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  //wire m00_axi_init_axi_txn_0_1;
  wire [31:0]myip_0_M00_AXI_ARADDR;
  wire [1:0]myip_0_M00_AXI_ARBURST;
  wire [3:0]myip_0_M00_AXI_ARCACHE;
  wire [0:0]myip_0_M00_AXI_ARID;
  wire [7:0]myip_0_M00_AXI_ARLEN;
  wire myip_0_M00_AXI_ARLOCK;
  wire [2:0]myip_0_M00_AXI_ARPROT;
  wire [3:0]myip_0_M00_AXI_ARQOS;
  wire myip_0_M00_AXI_ARREADY;
  wire [2:0]myip_0_M00_AXI_ARSIZE;
  wire [0:0]myip_0_M00_AXI_ARUSER;
  wire myip_0_M00_AXI_ARVALID;
  wire [31:0]myip_0_M00_AXI_AWADDR;
  wire [1:0]myip_0_M00_AXI_AWBURST;
  wire [3:0]myip_0_M00_AXI_AWCACHE;
  wire [0:0]myip_0_M00_AXI_AWID;
  wire [7:0]myip_0_M00_AXI_AWLEN;
  wire myip_0_M00_AXI_AWLOCK;
  wire [2:0]myip_0_M00_AXI_AWPROT;
  wire [3:0]myip_0_M00_AXI_AWQOS;
  wire myip_0_M00_AXI_AWREADY;
  wire [2:0]myip_0_M00_AXI_AWSIZE;
  wire [0:0]myip_0_M00_AXI_AWUSER;
  wire myip_0_M00_AXI_AWVALID;
  wire [7:0]myip_0_M00_AXI_BID;
  wire myip_0_M00_AXI_BREADY;
  wire [1:0]myip_0_M00_AXI_BRESP;
  wire myip_0_M00_AXI_BUSER;
  wire myip_0_M00_AXI_BVALID;
  wire [31:0]myip_0_M00_AXI_RDATA;
  wire [7:0]myip_0_M00_AXI_RID;
  wire myip_0_M00_AXI_RLAST;
  wire myip_0_M00_AXI_RREADY;
  wire [1:0]myip_0_M00_AXI_RRESP;
  wire myip_0_M00_AXI_RUSER;
  wire myip_0_M00_AXI_RVALID;
  wire [31:0]myip_0_M00_AXI_WDATA;
  wire myip_0_M00_AXI_WLAST;
  wire myip_0_M00_AXI_WREADY;
  wire [3:0]myip_0_M00_AXI_WSTRB;
  wire [0:0]myip_0_M00_AXI_WUSER;
  wire myip_0_M00_AXI_WVALID;
 // wire reset_rtl_0_1;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;










design_1_myip_0_0 myip_0
       (.C_M_TARGET_SLAVE_BASE_ADDR_0(C_M_TARGET_SLAVE_BASE_ADDR_0_1),
        .m00_axi_aclk(clk),
        .m00_axi_araddr(myip_0_M00_AXI_ARADDR),
        .m00_axi_arburst(myip_0_M00_AXI_ARBURST),
        .m00_axi_arcache(myip_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(reset_n),
        .m00_axi_arid(myip_0_M00_AXI_ARID),
        .m00_axi_arlen(myip_0_M00_AXI_ARLEN),
        .m00_axi_arlock(myip_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(myip_0_M00_AXI_ARPROT),
        .m00_axi_arqos(myip_0_M00_AXI_ARQOS),
        .m00_axi_arready(myip_0_M00_AXI_ARREADY),
        .m00_axi_arsize(myip_0_M00_AXI_ARSIZE),
        .m00_axi_aruser(myip_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(myip_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(myip_0_M00_AXI_AWADDR),
        .m00_axi_awburst(myip_0_M00_AXI_AWBURST),
        .m00_axi_awcache(myip_0_M00_AXI_AWCACHE),
        .m00_axi_awid(myip_0_M00_AXI_AWID),
        .m00_axi_awlen(myip_0_M00_AXI_AWLEN),
        .m00_axi_awlock(myip_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(myip_0_M00_AXI_AWPROT),
        .m00_axi_awqos(myip_0_M00_AXI_AWQOS),
        .m00_axi_awready(myip_0_M00_AXI_AWREADY),
        .m00_axi_awsize(myip_0_M00_AXI_AWSIZE),
        .m00_axi_awuser(myip_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(myip_0_M00_AXI_AWVALID),
        .m00_axi_bid(myip_0_M00_AXI_BID[0]),
        .m00_axi_bready(myip_0_M00_AXI_BREADY),
        .m00_axi_bresp(myip_0_M00_AXI_BRESP),
        .m00_axi_buser(myip_0_M00_AXI_BUSER),
        .m00_axi_bvalid(myip_0_M00_AXI_BVALID),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn_0_1),
        .m00_axi_rdata(myip_0_M00_AXI_RDATA),
        .m00_axi_rid(myip_0_M00_AXI_RID[0]),
        .m00_axi_rlast(myip_0_M00_AXI_RLAST),
        .m00_axi_rready(myip_0_M00_AXI_RREADY),
        .m00_axi_rresp(myip_0_M00_AXI_RRESP),
        .m00_axi_ruser(myip_0_M00_AXI_RUSER),
        .m00_axi_rvalid(myip_0_M00_AXI_RVALID),
        .m00_axi_wdata(myip_0_M00_AXI_WDATA),
        .m00_axi_wlast(myip_0_M00_AXI_WLAST),
        .m00_axi_wready(myip_0_M00_AXI_WREADY),
        .m00_axi_wstrb(myip_0_M00_AXI_WSTRB),
        .m00_axi_wuser(myip_0_M00_AXI_WUSER),
        .m00_axi_wvalid(myip_0_M00_AXI_WVALID));

design_1_axi_interconnect_wra_0_0 axi_interconnect_wra_0
       (.clk(clk),
        .m00_axi_araddr(axi_interconnect_wra_0_m00_axi_ARADDR),
        .m00_axi_arburst(axi_interconnect_wra_0_m00_axi_ARBURST),
        .m00_axi_arcache(axi_interconnect_wra_0_m00_axi_ARCACHE),
        .m00_axi_arid(axi_interconnect_wra_0_m00_axi_ARID),
        .m00_axi_arlen(axi_interconnect_wra_0_m00_axi_ARLEN),
        .m00_axi_arlock(axi_interconnect_wra_0_m00_axi_ARLOCK),
        .m00_axi_arprot(axi_interconnect_wra_0_m00_axi_ARPROT),
        .m00_axi_arqos(axi_interconnect_wra_0_m00_axi_ARQOS),
        .m00_axi_arready(axi_interconnect_wra_0_m00_axi_ARREADY),
        .m00_axi_arregion(axi_interconnect_wra_0_m00_axi_ARREGION),
        .m00_axi_arsize(axi_interconnect_wra_0_m00_axi_ARSIZE),
        .m00_axi_aruser(axi_interconnect_wra_0_m00_axi_ARUSER),
        .m00_axi_arvalid(axi_interconnect_wra_0_m00_axi_ARVALID),
        .m00_axi_awaddr(axi_interconnect_wra_0_m00_axi_AWADDR),
        .m00_axi_awburst(axi_interconnect_wra_0_m00_axi_AWBURST),
        .m00_axi_awcache(axi_interconnect_wra_0_m00_axi_AWCACHE),
        .m00_axi_awid(axi_interconnect_wra_0_m00_axi_AWID),
        .m00_axi_awlen(axi_interconnect_wra_0_m00_axi_AWLEN),
        .m00_axi_awlock(axi_interconnect_wra_0_m00_axi_AWLOCK),
        .m00_axi_awprot(axi_interconnect_wra_0_m00_axi_AWPROT),
        .m00_axi_awqos(axi_interconnect_wra_0_m00_axi_AWQOS),
        .m00_axi_awready(axi_interconnect_wra_0_m00_axi_AWREADY),
        .m00_axi_awregion(axi_interconnect_wra_0_m00_axi_AWREGION),
        .m00_axi_awsize(axi_interconnect_wra_0_m00_axi_AWSIZE),
        .m00_axi_awuser(axi_interconnect_wra_0_m00_axi_AWUSER),
        .m00_axi_awvalid(axi_interconnect_wra_0_m00_axi_AWVALID),
        .m00_axi_bid(axi_interconnect_wra_0_m00_axi_BID),
        .m00_axi_bready(axi_interconnect_wra_0_m00_axi_BREADY),
        .m00_axi_bresp(axi_interconnect_wra_0_m00_axi_BRESP),
        .m00_axi_buser(axi_interconnect_wra_0_m00_axi_BUSER),
        .m00_axi_bvalid(axi_interconnect_wra_0_m00_axi_BVALID),
        .m00_axi_rdata(axi_interconnect_wra_0_m00_axi_RDATA),
        .m00_axi_rid(axi_interconnect_wra_0_m00_axi_RID),
        .m00_axi_rlast(axi_interconnect_wra_0_m00_axi_RLAST),
        .m00_axi_rready(axi_interconnect_wra_0_m00_axi_RREADY),
        .m00_axi_rresp(axi_interconnect_wra_0_m00_axi_RRESP),
        .m00_axi_ruser(axi_interconnect_wra_0_m00_axi_RUSER),
        .m00_axi_rvalid(axi_interconnect_wra_0_m00_axi_RVALID),
        .m00_axi_wdata(axi_interconnect_wra_0_m00_axi_WDATA),
        .m00_axi_wlast(axi_interconnect_wra_0_m00_axi_WLAST),
        .m00_axi_wready(axi_interconnect_wra_0_m00_axi_WREADY),
        .m00_axi_wstrb(axi_interconnect_wra_0_m00_axi_WSTRB),
        .m00_axi_wuser(axi_interconnect_wra_0_m00_axi_WUSER),
        .m00_axi_wvalid(axi_interconnect_wra_0_m00_axi_WVALID),
        .m01_axi_araddr(axi_interconnect_wra_0_m01_axi_ARADDR),
        .m01_axi_arburst(axi_interconnect_wra_0_m01_axi_ARBURST),
        .m01_axi_arcache(axi_interconnect_wra_0_m01_axi_ARCACHE),
        .m01_axi_arid(axi_interconnect_wra_0_m01_axi_ARID),
        .m01_axi_arlen(axi_interconnect_wra_0_m01_axi_ARLEN),
        .m01_axi_arlock(axi_interconnect_wra_0_m01_axi_ARLOCK),
        .m01_axi_arprot(axi_interconnect_wra_0_m01_axi_ARPROT),
        .m01_axi_arqos(axi_interconnect_wra_0_m01_axi_ARQOS),
        .m01_axi_arready(axi_interconnect_wra_0_m01_axi_ARREADY),
        .m01_axi_arregion(axi_interconnect_wra_0_m01_axi_ARREGION),
        .m01_axi_arsize(axi_interconnect_wra_0_m01_axi_ARSIZE),
        .m01_axi_aruser(axi_interconnect_wra_0_m01_axi_ARUSER),
        .m01_axi_arvalid(axi_interconnect_wra_0_m01_axi_ARVALID),
        .m01_axi_awaddr(axi_interconnect_wra_0_m01_axi_AWADDR),
        .m01_axi_awburst(axi_interconnect_wra_0_m01_axi_AWBURST),
        .m01_axi_awcache(axi_interconnect_wra_0_m01_axi_AWCACHE),
        .m01_axi_awid(axi_interconnect_wra_0_m01_axi_AWID),
        .m01_axi_awlen(axi_interconnect_wra_0_m01_axi_AWLEN),
        .m01_axi_awlock(axi_interconnect_wra_0_m01_axi_AWLOCK),
        .m01_axi_awprot(axi_interconnect_wra_0_m01_axi_AWPROT),
        .m01_axi_awqos(axi_interconnect_wra_0_m01_axi_AWQOS),
        .m01_axi_awready(axi_interconnect_wra_0_m01_axi_AWREADY),
        .m01_axi_awregion(axi_interconnect_wra_0_m01_axi_AWREGION),
        .m01_axi_awsize(axi_interconnect_wra_0_m01_axi_AWSIZE),
        .m01_axi_awuser(axi_interconnect_wra_0_m01_axi_AWUSER),
        .m01_axi_awvalid(axi_interconnect_wra_0_m01_axi_AWVALID),
        .m01_axi_bid(axi_interconnect_wra_0_m01_axi_BID),
        .m01_axi_bready(axi_interconnect_wra_0_m01_axi_BREADY),
        .m01_axi_bresp(axi_interconnect_wra_0_m01_axi_BRESP),
        .m01_axi_buser(axi_interconnect_wra_0_m01_axi_BUSER),
        .m01_axi_bvalid(axi_interconnect_wra_0_m01_axi_BVALID),
        .m01_axi_rdata(axi_interconnect_wra_0_m01_axi_RDATA),
        .m01_axi_rid(axi_interconnect_wra_0_m01_axi_RID),
        .m01_axi_rlast(axi_interconnect_wra_0_m01_axi_RLAST),
        .m01_axi_rready(axi_interconnect_wra_0_m01_axi_RREADY),
        .m01_axi_rresp(axi_interconnect_wra_0_m01_axi_RRESP),
        .m01_axi_ruser(axi_interconnect_wra_0_m01_axi_RUSER),
        .m01_axi_rvalid(axi_interconnect_wra_0_m01_axi_RVALID),
        .m01_axi_wdata(axi_interconnect_wra_0_m01_axi_WDATA),
        .m01_axi_wlast(axi_interconnect_wra_0_m01_axi_WLAST),
        .m01_axi_wready(axi_interconnect_wra_0_m01_axi_WREADY),
        .m01_axi_wstrb(axi_interconnect_wra_0_m01_axi_WSTRB),
        .m01_axi_wuser(axi_interconnect_wra_0_m01_axi_WUSER),
        .m01_axi_wvalid(axi_interconnect_wra_0_m01_axi_WVALID),
        .m02_axi_arready(1'b0),
        .m02_axi_awready(1'b0),
        .m02_axi_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m02_axi_bresp({1'b0,1'b0}),
        .m02_axi_buser(1'b0),
        .m02_axi_bvalid(1'b0),
        .m02_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m02_axi_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m02_axi_rlast(1'b0),
        .m02_axi_rresp({1'b0,1'b0}),
        .m02_axi_ruser(1'b0),
        .m02_axi_rvalid(1'b0),
        .m02_axi_wready(1'b0),
        .m03_axi_arready(1'b0),
        .m03_axi_awready(1'b0),
        .m03_axi_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m03_axi_bresp({1'b0,1'b0}),
        .m03_axi_buser(1'b0),
        .m03_axi_bvalid(1'b0),
        .m03_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m03_axi_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m03_axi_rlast(1'b0),
        .m03_axi_rresp({1'b0,1'b0}),
        .m03_axi_ruser(1'b0),
        .m03_axi_rvalid(1'b0),
        .m03_axi_wready(1'b0),
        .rst(reset_rtl_0_1),
        .s00_axi_araddr(myip_0_M00_AXI_ARADDR),
        .s00_axi_arburst(myip_0_M00_AXI_ARBURST),
        .s00_axi_arcache(myip_0_M00_AXI_ARCACHE),
        .s00_axi_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,myip_0_M00_AXI_ARID}),
        .s00_axi_arlen(myip_0_M00_AXI_ARLEN),
        .s00_axi_arlock(myip_0_M00_AXI_ARLOCK),
        .s00_axi_arprot(myip_0_M00_AXI_ARPROT),
        .s00_axi_arqos(myip_0_M00_AXI_ARQOS),
        .s00_axi_arready(myip_0_M00_AXI_ARREADY),
        .s00_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_arsize(myip_0_M00_AXI_ARSIZE),
        .s00_axi_aruser(myip_0_M00_AXI_ARUSER),
        .s00_axi_arvalid(myip_0_M00_AXI_ARVALID),
        .s00_axi_awaddr(myip_0_M00_AXI_AWADDR),
        .s00_axi_awburst(myip_0_M00_AXI_AWBURST),
        .s00_axi_awcache(myip_0_M00_AXI_AWCACHE),
        .s00_axi_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,myip_0_M00_AXI_AWID}),
        .s00_axi_awlen(myip_0_M00_AXI_AWLEN),
        .s00_axi_awlock(myip_0_M00_AXI_AWLOCK),
        .s00_axi_awprot(myip_0_M00_AXI_AWPROT),
        .s00_axi_awqos(myip_0_M00_AXI_AWQOS),
        .s00_axi_awready(myip_0_M00_AXI_AWREADY),
        .s00_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_awsize(myip_0_M00_AXI_AWSIZE),
        .s00_axi_awuser(myip_0_M00_AXI_AWUSER),
        .s00_axi_awvalid(myip_0_M00_AXI_AWVALID),
        .s00_axi_bid(myip_0_M00_AXI_BID),
        .s00_axi_bready(myip_0_M00_AXI_BREADY),
        .s00_axi_bresp(myip_0_M00_AXI_BRESP),
        .s00_axi_buser(myip_0_M00_AXI_BUSER),
        .s00_axi_bvalid(myip_0_M00_AXI_BVALID),
        .s00_axi_rdata(myip_0_M00_AXI_RDATA),
        .s00_axi_rid(myip_0_M00_AXI_RID),
        .s00_axi_rlast(myip_0_M00_AXI_RLAST),
        .s00_axi_rready(myip_0_M00_AXI_RREADY),
        .s00_axi_rresp(myip_0_M00_AXI_RRESP),
        .s00_axi_ruser(myip_0_M00_AXI_RUSER),
        .s00_axi_rvalid(myip_0_M00_AXI_RVALID),
        .s00_axi_wdata(myip_0_M00_AXI_WDATA),
        .s00_axi_wlast(myip_0_M00_AXI_WLAST),
        .s00_axi_wready(myip_0_M00_AXI_WREADY),
        .s00_axi_wstrb(myip_0_M00_AXI_WSTRB),
        .s00_axi_wuser(myip_0_M00_AXI_WUSER),
        .s00_axi_wvalid(myip_0_M00_AXI_WVALID),
        .s01_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_arburst({1'b0,1'b1}),
        .s01_axi_arcache({1'b0,1'b0,1'b1,1'b1}),
        .s01_axi_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_arlock(1'b0),
        .s01_axi_arprot({1'b0,1'b0,1'b0}),
        .s01_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_arsize({1'b0,1'b1,1'b0}),
        .s01_axi_aruser(1'b0),
        .s01_axi_arvalid(1'b0),
        .s01_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_awburst({1'b0,1'b1}),
        .s01_axi_awcache({1'b0,1'b0,1'b1,1'b1}),
        .s01_axi_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_awlock(1'b0),
        .s01_axi_awprot({1'b0,1'b0,1'b0}),
        .s01_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_awsize({1'b0,1'b1,1'b0}),
        .s01_axi_awuser(1'b0),
        .s01_axi_awvalid(1'b0),
        .s01_axi_bready(1'b0),
        .s01_axi_rready(1'b0),
        .s01_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axi_wlast(1'b0),
        .s01_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s01_axi_wuser(1'b0),
        .s01_axi_wvalid(1'b0),
        .s02_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_arburst({1'b0,1'b1}),
        .s02_axi_arcache({1'b0,1'b0,1'b1,1'b1}),
        .s02_axi_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_arlock(1'b0),
        .s02_axi_arprot({1'b0,1'b0,1'b0}),
        .s02_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_arsize({1'b0,1'b1,1'b0}),
        .s02_axi_aruser(1'b0),
        .s02_axi_arvalid(1'b0),
        .s02_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_awburst({1'b0,1'b1}),
        .s02_axi_awcache({1'b0,1'b0,1'b1,1'b1}),
        .s02_axi_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_awlock(1'b0),
        .s02_axi_awprot({1'b0,1'b0,1'b0}),
        .s02_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_awsize({1'b0,1'b1,1'b0}),
        .s02_axi_awuser(1'b0),
        .s02_axi_awvalid(1'b0),
        .s02_axi_bready(1'b0),
        .s02_axi_rready(1'b0),
        .s02_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axi_wlast(1'b0),
        .s02_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s02_axi_wuser(1'b0),
        .s02_axi_wvalid(1'b0),
        .s03_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_arburst({1'b0,1'b1}),
        .s03_axi_arcache({1'b0,1'b0,1'b1,1'b1}),
        .s03_axi_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_arlock(1'b0),
        .s03_axi_arprot({1'b0,1'b0,1'b0}),
        .s03_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_arsize({1'b0,1'b1,1'b0}),
        .s03_axi_aruser(1'b0),
        .s03_axi_arvalid(1'b0),
        .s03_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_awburst({1'b0,1'b1}),
        .s03_axi_awcache({1'b0,1'b0,1'b1,1'b1}),
        .s03_axi_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_awlock(1'b0),
        .s03_axi_awprot({1'b0,1'b0,1'b0}),
        .s03_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_awsize({1'b0,1'b1,1'b0}),
        .s03_axi_awuser(1'b0),
        .s03_axi_awvalid(1'b0),
        .s03_axi_bready(1'b0),
        .s03_axi_rready(1'b0),
        .s03_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axi_wlast(1'b0),
        .s03_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s03_axi_wuser(1'b0),
        .s03_axi_wvalid(1'b0));
  design_1_axi_ram_wrapper_0_1 axi_ram_wrapper_0
       (.clk(clk),
        .rst(reset_rtl_0_1),
        .s_axi_araddr(axi_interconnect_wra_0_m00_axi_ARADDR),
        .s_axi_arburst(axi_interconnect_wra_0_m00_axi_ARBURST),
        .s_axi_arcache(axi_interconnect_wra_0_m00_axi_ARCACHE),
        .s_axi_arid(axi_interconnect_wra_0_m00_axi_ARID),
        .s_axi_arlen(axi_interconnect_wra_0_m00_axi_ARLEN),
        .s_axi_arlock(axi_interconnect_wra_0_m00_axi_ARLOCK),
        .s_axi_arprot(axi_interconnect_wra_0_m00_axi_ARPROT),
        .s_axi_arqos(axi_interconnect_wra_0_m00_axi_ARQOS),
        .s_axi_arready(axi_interconnect_wra_0_m00_axi_ARREADY),
        .s_axi_arregion(axi_interconnect_wra_0_m00_axi_ARREGION),
        .s_axi_arsize(axi_interconnect_wra_0_m00_axi_ARSIZE),
        .s_axi_aruser(axi_interconnect_wra_0_m00_axi_ARUSER),
        .s_axi_arvalid(axi_interconnect_wra_0_m00_axi_ARVALID),
        .s_axi_awaddr(axi_interconnect_wra_0_m00_axi_AWADDR),
        .s_axi_awburst(axi_interconnect_wra_0_m00_axi_AWBURST),
        .s_axi_awcache(axi_interconnect_wra_0_m00_axi_AWCACHE),
        .s_axi_awid(axi_interconnect_wra_0_m00_axi_AWID),
        .s_axi_awlen(axi_interconnect_wra_0_m00_axi_AWLEN),
        .s_axi_awlock(axi_interconnect_wra_0_m00_axi_AWLOCK),
        .s_axi_awprot(axi_interconnect_wra_0_m00_axi_AWPROT),
        .s_axi_awqos(axi_interconnect_wra_0_m00_axi_AWQOS),
        .s_axi_awready(axi_interconnect_wra_0_m00_axi_AWREADY),
        .s_axi_awregion(axi_interconnect_wra_0_m00_axi_AWREGION),
        .s_axi_awsize(axi_interconnect_wra_0_m00_axi_AWSIZE),
        .s_axi_awuser(axi_interconnect_wra_0_m00_axi_AWUSER),
        .s_axi_awvalid(axi_interconnect_wra_0_m00_axi_AWVALID),
        .s_axi_bid(axi_interconnect_wra_0_m00_axi_BID),
        .s_axi_bready(axi_interconnect_wra_0_m00_axi_BREADY),
        .s_axi_bresp(axi_interconnect_wra_0_m00_axi_BRESP),
        .s_axi_buser(axi_interconnect_wra_0_m00_axi_BUSER),
        .s_axi_bvalid(axi_interconnect_wra_0_m00_axi_BVALID),
        .s_axi_rdata(axi_interconnect_wra_0_m00_axi_RDATA),
        .s_axi_rid(axi_interconnect_wra_0_m00_axi_RID),
        .s_axi_rlast(axi_interconnect_wra_0_m00_axi_RLAST),
        .s_axi_rready(axi_interconnect_wra_0_m00_axi_RREADY),
        .s_axi_rresp(axi_interconnect_wra_0_m00_axi_RRESP),
        .s_axi_ruser(axi_interconnect_wra_0_m00_axi_RUSER),
        .s_axi_rvalid(axi_interconnect_wra_0_m00_axi_RVALID),
        .s_axi_wdata(axi_interconnect_wra_0_m00_axi_WDATA),
        .s_axi_wlast(axi_interconnect_wra_0_m00_axi_WLAST),
        .s_axi_wready(axi_interconnect_wra_0_m00_axi_WREADY),
        .s_axi_wstrb(axi_interconnect_wra_0_m00_axi_WSTRB),
        .s_axi_wuser(axi_interconnect_wra_0_m00_axi_WUSER),
        .s_axi_wvalid(axi_interconnect_wra_0_m00_axi_WVALID));
  design_1_axi_ram_wrapper_1_0 axi_ram_wrapper_1
       (.clk(clk),
        .rst(reset_rtl_0_1),
        .s_axi_araddr(axi_interconnect_wra_0_m01_axi_ARADDR),
        .s_axi_arburst(axi_interconnect_wra_0_m01_axi_ARBURST),
        .s_axi_arcache(axi_interconnect_wra_0_m01_axi_ARCACHE),
        .s_axi_arid(axi_interconnect_wra_0_m01_axi_ARID),
        .s_axi_arlen(axi_interconnect_wra_0_m01_axi_ARLEN),
        .s_axi_arlock(axi_interconnect_wra_0_m01_axi_ARLOCK),
        .s_axi_arprot(axi_interconnect_wra_0_m01_axi_ARPROT),
        .s_axi_arqos(axi_interconnect_wra_0_m01_axi_ARQOS),
        .s_axi_arready(axi_interconnect_wra_0_m01_axi_ARREADY),
        .s_axi_arregion(axi_interconnect_wra_0_m01_axi_ARREGION),
        .s_axi_arsize(axi_interconnect_wra_0_m01_axi_ARSIZE),
        .s_axi_aruser(axi_interconnect_wra_0_m01_axi_ARUSER),
        .s_axi_arvalid(axi_interconnect_wra_0_m01_axi_ARVALID),
        .s_axi_awaddr(axi_interconnect_wra_0_m01_axi_AWADDR),
        .s_axi_awburst(axi_interconnect_wra_0_m01_axi_AWBURST),
        .s_axi_awcache(axi_interconnect_wra_0_m01_axi_AWCACHE),
        .s_axi_awid(axi_interconnect_wra_0_m01_axi_AWID),
        .s_axi_awlen(axi_interconnect_wra_0_m01_axi_AWLEN),
        .s_axi_awlock(axi_interconnect_wra_0_m01_axi_AWLOCK),
        .s_axi_awprot(axi_interconnect_wra_0_m01_axi_AWPROT),
        .s_axi_awqos(axi_interconnect_wra_0_m01_axi_AWQOS),
        .s_axi_awready(axi_interconnect_wra_0_m01_axi_AWREADY),
        .s_axi_awregion(axi_interconnect_wra_0_m01_axi_AWREGION),
        .s_axi_awsize(axi_interconnect_wra_0_m01_axi_AWSIZE),
        .s_axi_awuser(axi_interconnect_wra_0_m01_axi_AWUSER),
        .s_axi_awvalid(axi_interconnect_wra_0_m01_axi_AWVALID),
        .s_axi_bid(axi_interconnect_wra_0_m01_axi_BID),
        .s_axi_bready(axi_interconnect_wra_0_m01_axi_BREADY),
        .s_axi_bresp(axi_interconnect_wra_0_m01_axi_BRESP),
        .s_axi_buser(axi_interconnect_wra_0_m01_axi_BUSER),
        .s_axi_bvalid(axi_interconnect_wra_0_m01_axi_BVALID),
        .s_axi_rdata(axi_interconnect_wra_0_m01_axi_RDATA),
        .s_axi_rid(axi_interconnect_wra_0_m01_axi_RID),
        .s_axi_rlast(axi_interconnect_wra_0_m01_axi_RLAST),
        .s_axi_rready(axi_interconnect_wra_0_m01_axi_RREADY),
        .s_axi_rresp(axi_interconnect_wra_0_m01_axi_RRESP),
        .s_axi_ruser(axi_interconnect_wra_0_m01_axi_RUSER),
        .s_axi_rvalid(axi_interconnect_wra_0_m01_axi_RVALID),
        .s_axi_wdata(axi_interconnect_wra_0_m01_axi_WDATA),
        .s_axi_wlast(axi_interconnect_wra_0_m01_axi_WLAST),
        .s_axi_wready(axi_interconnect_wra_0_m01_axi_WREADY),
        .s_axi_wstrb(axi_interconnect_wra_0_m01_axi_WSTRB),
        .s_axi_wuser(axi_interconnect_wra_0_m01_axi_WUSER),
        .s_axi_wvalid(axi_interconnect_wra_0_m01_axi_WVALID));

endmodule 


/*

Copyright (c) 2014-2021 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * Arbiter module
 */
module arbiter #
(
    parameter PORTS = 4,
    // select round robin arbitration
    parameter ARB_TYPE_ROUND_ROBIN = 0,
    // blocking arbiter enable
    parameter ARB_BLOCK = 0,
    // block on acknowledge assert when nonzero, request deassert when 0
    parameter ARB_BLOCK_ACK = 1,
    // LSB priority selection
    parameter ARB_LSB_HIGH_PRIORITY = 0
)
(
    input  wire                     clk,
    input  wire                     rst,

    input  wire [PORTS-1:0]         request,
    input  wire [PORTS-1:0]         acknowledge,

    output wire [PORTS-1:0]         grant,
    output wire                     grant_valid,
    output wire [$clog2(PORTS)-1:0] grant_encoded
);

reg [PORTS-1:0] grant_reg = 0, grant_next;
reg grant_valid_reg = 0, grant_valid_next;
reg [$clog2(PORTS)-1:0] grant_encoded_reg = 0, grant_encoded_next;

assign grant_valid = grant_valid_reg;
assign grant = grant_reg;
assign grant_encoded = grant_encoded_reg;

wire request_valid;
wire [$clog2(PORTS)-1:0] request_index;
wire [PORTS-1:0] request_mask;

priority_encoder #(
    .WIDTH(PORTS),
    .LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
)
priority_encoder_inst (
    .input_unencoded(request),
    .output_valid(request_valid),
    .output_encoded(request_index),
    .output_unencoded(request_mask)
);

reg [PORTS-1:0] mask_reg = 0, mask_next;

wire masked_request_valid;
wire [$clog2(PORTS)-1:0] masked_request_index;
wire [PORTS-1:0] masked_request_mask;

priority_encoder #(
    .WIDTH(PORTS),
    .LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
)
priority_encoder_masked (
    .input_unencoded(request & mask_reg),
    .output_valid(masked_request_valid),
    .output_encoded(masked_request_index),
    .output_unencoded(masked_request_mask)
);

always @* begin
    grant_next = 0;
    grant_valid_next = 0;
    grant_encoded_next = 0;
    mask_next = mask_reg;

    if (ARB_BLOCK && !ARB_BLOCK_ACK && grant_reg & request) begin
        // granted request still asserted; hold it
        grant_valid_next = grant_valid_reg;
        grant_next = grant_reg;
        grant_encoded_next = grant_encoded_reg;
    end else if (ARB_BLOCK && ARB_BLOCK_ACK && grant_valid && !(grant_reg & acknowledge)) begin
        // granted request not yet acknowledged; hold it
        grant_valid_next = grant_valid_reg;
        grant_next = grant_reg;
        grant_encoded_next = grant_encoded_reg;
    end else if (request_valid) begin
        if (ARB_TYPE_ROUND_ROBIN) begin
            if (masked_request_valid) begin
                grant_valid_next = 1;
                grant_next = masked_request_mask;
                grant_encoded_next = masked_request_index;
                if (ARB_LSB_HIGH_PRIORITY) begin
                    mask_next = {PORTS{1'b1}} << (masked_request_index + 1);
                end else begin
                    mask_next = {PORTS{1'b1}} >> (PORTS - masked_request_index);
                end
            end else begin
                grant_valid_next = 1;
                grant_next = request_mask;
                grant_encoded_next = request_index;
                if (ARB_LSB_HIGH_PRIORITY) begin
                    mask_next = {PORTS{1'b1}} << (request_index + 1);
                end else begin
                    mask_next = {PORTS{1'b1}} >> (PORTS - request_index);
                end
            end
        end else begin
            grant_valid_next = 1;
            grant_next = request_mask;
            grant_encoded_next = request_index;
        end
    end
end

always @(posedge clk) begin
    if (rst) begin
        grant_reg <= 0;
        grant_valid_reg <= 0;
        grant_encoded_reg <= 0;
        mask_reg <= 0;
    end else begin
        grant_reg <= grant_next;
        grant_valid_reg <= grant_valid_next;
        grant_encoded_reg <= grant_encoded_next;
        mask_reg <= mask_next;
    end
end

endmodule

`resetall


/*

Copyright (c) 2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * AXI4 interconnect
 */
module axi_interconnect #
(
    // Number of AXI inputs (slave interfaces)
    parameter S_COUNT = 4,
    // Number of AXI outputs (master interfaces)
    parameter M_COUNT = 4,
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 32,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 8,
    // Propagate awuser signal
    parameter AWUSER_ENABLE = 0,
    // Width of awuser signal
    parameter AWUSER_WIDTH = 1,
    // Propagate wuser signal
    parameter WUSER_ENABLE = 0,
    // Width of wuser signal
    parameter WUSER_WIDTH = 1,
    // Propagate buser signal
    parameter BUSER_ENABLE = 0,
    // Width of buser signal
    parameter BUSER_WIDTH = 1,
    // Propagate aruser signal
    parameter ARUSER_ENABLE = 0,
    // Width of aruser signal
    parameter ARUSER_WIDTH = 1,
    // Propagate ruser signal
    parameter RUSER_ENABLE = 0,
    // Width of ruser signal
    parameter RUSER_WIDTH = 1,
    // Propagate ID field
    parameter FORWARD_ID = 0,
    // Number of regions per master interface
    parameter M_REGIONS = 1,
    // Master interface base addresses
    // M_COUNT concatenated fields of M_REGIONS concatenated fields of ADDR_WIDTH bits
    // set to zero for default addressing based on M_ADDR_WIDTH
    parameter M_BASE_ADDR = 0,
    // Master interface address widths
    // M_COUNT concatenated fields of M_REGIONS concatenated fields of 32 bits
    parameter M_ADDR_WIDTH = {M_COUNT{{M_REGIONS{32'd24}}}},
    // Read connections between interfaces
    // M_COUNT concatenated fields of S_COUNT bits
    parameter M_CONNECT_READ = {M_COUNT{{S_COUNT{1'b1}}}},
    // Write connections between interfaces
    // M_COUNT concatenated fields of S_COUNT bits
    parameter M_CONNECT_WRITE = {M_COUNT{{S_COUNT{1'b1}}}},
    // Secure master (fail operations based on awprot/arprot)
    // M_COUNT bits
    parameter M_SECURE = {M_COUNT{1'b0}}
)
(
    input  wire                            clk,
    input  wire                            rst,

    /*
     * AXI slave interfaces
     */
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axi_awid,
    input  wire [S_COUNT*ADDR_WIDTH-1:0]   s_axi_awaddr,
    input  wire [S_COUNT*8-1:0]            s_axi_awlen,
    input  wire [S_COUNT*3-1:0]            s_axi_awsize,
    input  wire [S_COUNT*2-1:0]            s_axi_awburst,
    input  wire [S_COUNT-1:0]              s_axi_awlock,
    input  wire [S_COUNT*4-1:0]            s_axi_awcache,
    input  wire [S_COUNT*3-1:0]            s_axi_awprot,
    input  wire [S_COUNT*4-1:0]            s_axi_awqos,
    input  wire [S_COUNT*AWUSER_WIDTH-1:0] s_axi_awuser,
    input  wire [S_COUNT-1:0]              s_axi_awvalid,
    output wire [S_COUNT-1:0]              s_axi_awready,
    input  wire [S_COUNT*DATA_WIDTH-1:0]   s_axi_wdata,
    input  wire [S_COUNT*STRB_WIDTH-1:0]   s_axi_wstrb,
    input  wire [S_COUNT-1:0]              s_axi_wlast,
    input  wire [S_COUNT*WUSER_WIDTH-1:0]  s_axi_wuser,
    input  wire [S_COUNT-1:0]              s_axi_wvalid,
    output wire [S_COUNT-1:0]              s_axi_wready,
    output wire [S_COUNT*ID_WIDTH-1:0]     s_axi_bid,
    output wire [S_COUNT*2-1:0]            s_axi_bresp,
    output wire [S_COUNT*BUSER_WIDTH-1:0]  s_axi_buser,
    output wire [S_COUNT-1:0]              s_axi_bvalid,
    input  wire [S_COUNT-1:0]              s_axi_bready,
    input  wire [S_COUNT*ID_WIDTH-1:0]     s_axi_arid,
    input  wire [S_COUNT*ADDR_WIDTH-1:0]   s_axi_araddr,
    input  wire [S_COUNT*8-1:0]            s_axi_arlen,
    input  wire [S_COUNT*3-1:0]            s_axi_arsize,
    input  wire [S_COUNT*2-1:0]            s_axi_arburst,
    input  wire [S_COUNT-1:0]              s_axi_arlock,
    input  wire [S_COUNT*4-1:0]            s_axi_arcache,
    input  wire [S_COUNT*3-1:0]            s_axi_arprot,
    input  wire [S_COUNT*4-1:0]            s_axi_arqos,
    input  wire [S_COUNT*ARUSER_WIDTH-1:0] s_axi_aruser,
    input  wire [S_COUNT-1:0]              s_axi_arvalid,
    output wire [S_COUNT-1:0]              s_axi_arready,
    output wire [S_COUNT*ID_WIDTH-1:0]     s_axi_rid,
    output wire [S_COUNT*DATA_WIDTH-1:0]   s_axi_rdata,
    output wire [S_COUNT*2-1:0]            s_axi_rresp,
    output wire [S_COUNT-1:0]              s_axi_rlast,
    output wire [S_COUNT*RUSER_WIDTH-1:0]  s_axi_ruser,
    output wire [S_COUNT-1:0]              s_axi_rvalid,
    input  wire [S_COUNT-1:0]              s_axi_rready,

    /*
     * AXI master interfaces
     */
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axi_awid,
    output wire [M_COUNT*ADDR_WIDTH-1:0]   m_axi_awaddr,
    output wire [M_COUNT*8-1:0]            m_axi_awlen,
    output wire [M_COUNT*3-1:0]            m_axi_awsize,
    output wire [M_COUNT*2-1:0]            m_axi_awburst,
    output wire [M_COUNT-1:0]              m_axi_awlock,
    output wire [M_COUNT*4-1:0]            m_axi_awcache,
    output wire [M_COUNT*3-1:0]            m_axi_awprot,
    output wire [M_COUNT*4-1:0]            m_axi_awqos,
    output wire [M_COUNT*4-1:0]            m_axi_awregion,
    output wire [M_COUNT*AWUSER_WIDTH-1:0] m_axi_awuser,
    output wire [M_COUNT-1:0]              m_axi_awvalid,
    input  wire [M_COUNT-1:0]              m_axi_awready,
    output wire [M_COUNT*DATA_WIDTH-1:0]   m_axi_wdata,
    output wire [M_COUNT*STRB_WIDTH-1:0]   m_axi_wstrb,
    output wire [M_COUNT-1:0]              m_axi_wlast,
    output wire [M_COUNT*WUSER_WIDTH-1:0]  m_axi_wuser,
    output wire [M_COUNT-1:0]              m_axi_wvalid,
    input  wire [M_COUNT-1:0]              m_axi_wready,
    input  wire [M_COUNT*ID_WIDTH-1:0]     m_axi_bid,
    input  wire [M_COUNT*2-1:0]            m_axi_bresp,
    input  wire [M_COUNT*BUSER_WIDTH-1:0]  m_axi_buser,
    input  wire [M_COUNT-1:0]              m_axi_bvalid,
    output wire [M_COUNT-1:0]              m_axi_bready,
    output wire [M_COUNT*ID_WIDTH-1:0]     m_axi_arid,
    output wire [M_COUNT*ADDR_WIDTH-1:0]   m_axi_araddr,
    output wire [M_COUNT*8-1:0]            m_axi_arlen,
    output wire [M_COUNT*3-1:0]            m_axi_arsize,
    output wire [M_COUNT*2-1:0]            m_axi_arburst,
    output wire [M_COUNT-1:0]              m_axi_arlock,
    output wire [M_COUNT*4-1:0]            m_axi_arcache,
    output wire [M_COUNT*3-1:0]            m_axi_arprot,
    output wire [M_COUNT*4-1:0]            m_axi_arqos,
    output wire [M_COUNT*4-1:0]            m_axi_arregion,
    output wire [M_COUNT*ARUSER_WIDTH-1:0] m_axi_aruser,
    output wire [M_COUNT-1:0]              m_axi_arvalid,
    input  wire [M_COUNT-1:0]              m_axi_arready,
    input  wire [M_COUNT*ID_WIDTH-1:0]     m_axi_rid,
    input  wire [M_COUNT*DATA_WIDTH-1:0]   m_axi_rdata,
    input  wire [M_COUNT*2-1:0]            m_axi_rresp,
    input  wire [M_COUNT-1:0]              m_axi_rlast,
    input  wire [M_COUNT*RUSER_WIDTH-1:0]  m_axi_ruser,
    input  wire [M_COUNT-1:0]              m_axi_rvalid,
    output wire [M_COUNT-1:0]              m_axi_rready
);

parameter CL_S_COUNT = $clog2(S_COUNT);
parameter CL_M_COUNT = $clog2(M_COUNT);

parameter AUSER_WIDTH = AWUSER_WIDTH > ARUSER_WIDTH ? AWUSER_WIDTH : ARUSER_WIDTH;

// default address computation
function [M_COUNT*M_REGIONS*ADDR_WIDTH-1:0] calcBaseAddrs(input [31:0] dummy);
    integer i;
    reg [ADDR_WIDTH-1:0] base;
    reg [ADDR_WIDTH-1:0] width;
    reg [ADDR_WIDTH-1:0] size;
    reg [ADDR_WIDTH-1:0] mask;
    begin
        calcBaseAddrs = {M_COUNT*M_REGIONS*ADDR_WIDTH{1'b0}};
        base = 0;
        for (i = 0; i < M_COUNT*M_REGIONS; i = i + 1) begin
            width = M_ADDR_WIDTH[i*32 +: 32];
            mask = {ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - width);
            size = mask + 1;
            if (width > 0) begin
                if ((base & mask) != 0) begin
                   base = base + size - (base & mask); // align
                end
                calcBaseAddrs[i * ADDR_WIDTH +: ADDR_WIDTH] = base;
                base = base + size; // increment
            end
        end
    end
endfunction

parameter M_BASE_ADDR_INT = M_BASE_ADDR ? M_BASE_ADDR : calcBaseAddrs(0);

integer i, j;

// check configuration
initial begin
    if (M_REGIONS < 1 || M_REGIONS > 16) begin
        $error("Error: M_REGIONS must be between 1 and 16 (instance %m)");
        $finish;
    end

    for (i = 0; i < M_COUNT*M_REGIONS; i = i + 1) begin
        if (M_ADDR_WIDTH[i*32 +: 32] && (M_ADDR_WIDTH[i*32 +: 32] < 12 || M_ADDR_WIDTH[i*32 +: 32] > ADDR_WIDTH)) begin
            $error("Error: address width out of range (instance %m)");
            $finish;
        end
    end

    $display("Addressing configuration for axi_interconnect instance %m");
    for (i = 0; i < M_COUNT*M_REGIONS; i = i + 1) begin
        if (M_ADDR_WIDTH[i*32 +: 32]) begin
            $display("%2d (%2d): %x / %02d -- %x-%x",
                i/M_REGIONS, i%M_REGIONS,
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH],
                M_ADDR_WIDTH[i*32 +: 32],
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[i*32 +: 32]),
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[i*32 +: 32]))
            );
        end
    end

    for (i = 0; i < M_COUNT*M_REGIONS; i = i + 1) begin
        if ((M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] & (2**M_ADDR_WIDTH[i*32 +: 32]-1)) != 0) begin
            $display("Region not aligned:");
            $display("%2d (%2d): %x / %2d -- %x-%x",
                i/M_REGIONS, i%M_REGIONS,
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH],
                M_ADDR_WIDTH[i*32 +: 32],
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[i*32 +: 32]),
                M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[i*32 +: 32]))
            );
            $error("Error: address range not aligned (instance %m)");
            $finish;
        end
    end

    for (i = 0; i < M_COUNT*M_REGIONS; i = i + 1) begin
        for (j = i+1; j < M_COUNT*M_REGIONS; j = j + 1) begin
            if (M_ADDR_WIDTH[i*32 +: 32] && M_ADDR_WIDTH[j*32 +: 32]) begin
                if (((M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[i*32 +: 32])) <= (M_BASE_ADDR_INT[j*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[j*32 +: 32]))))
                        && ((M_BASE_ADDR_INT[j*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[j*32 +: 32])) <= (M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[i*32 +: 32]))))) begin
                    $display("Overlapping regions:");
                    $display("%2d (%2d): %x / %2d -- %x-%x",
                        i/M_REGIONS, i%M_REGIONS,
                        M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH],
                        M_ADDR_WIDTH[i*32 +: 32],
                        M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[i*32 +: 32]),
                        M_BASE_ADDR_INT[i*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[i*32 +: 32]))
                    );
                    $display("%2d (%2d): %x / %2d -- %x-%x",
                        j/M_REGIONS, j%M_REGIONS,
                        M_BASE_ADDR_INT[j*ADDR_WIDTH +: ADDR_WIDTH],
                        M_ADDR_WIDTH[j*32 +: 32],
                        M_BASE_ADDR_INT[j*ADDR_WIDTH +: ADDR_WIDTH] & ({ADDR_WIDTH{1'b1}} << M_ADDR_WIDTH[j*32 +: 32]),
                        M_BASE_ADDR_INT[j*ADDR_WIDTH +: ADDR_WIDTH] | ({ADDR_WIDTH{1'b1}} >> (ADDR_WIDTH - M_ADDR_WIDTH[j*32 +: 32]))
                    );
                    $error("Error: address ranges overlap (instance %m)");
                    $finish;
                end
            end
        end
    end
end

localparam [2:0]
    STATE_IDLE = 3'd0,
    STATE_DECODE = 3'd1,
    STATE_WRITE = 3'd2,
    STATE_WRITE_RESP = 3'd3,
    STATE_WRITE_DROP = 3'd4,
    STATE_READ = 3'd5,
    STATE_READ_DROP = 3'd6,
    STATE_WAIT_IDLE = 3'd7;

reg [2:0] state_reg = STATE_IDLE, state_next;

reg match;

reg [CL_M_COUNT-1:0] m_select_reg = 2'd0, m_select_next;
reg [ID_WIDTH-1:0] axi_id_reg = {ID_WIDTH{1'b0}}, axi_id_next;
reg [ADDR_WIDTH-1:0] axi_addr_reg = {ADDR_WIDTH{1'b0}}, axi_addr_next;
reg axi_addr_valid_reg = 1'b0, axi_addr_valid_next;
reg [7:0] axi_len_reg = 8'd0, axi_len_next;
reg [2:0] axi_size_reg = 3'd0, axi_size_next;
reg [1:0] axi_burst_reg = 2'd0, axi_burst_next;
reg axi_lock_reg = 1'b0, axi_lock_next;
reg [3:0] axi_cache_reg = 4'd0, axi_cache_next;
reg [2:0] axi_prot_reg = 3'b000, axi_prot_next;
reg [3:0] axi_qos_reg = 4'd0, axi_qos_next;
reg [3:0] axi_region_reg = 4'd0, axi_region_next;
reg [AUSER_WIDTH-1:0] axi_auser_reg = {AUSER_WIDTH{1'b0}}, axi_auser_next;
reg [1:0] axi_bresp_reg = 2'b00, axi_bresp_next;
reg [BUSER_WIDTH-1:0] axi_buser_reg = {BUSER_WIDTH{1'b0}}, axi_buser_next;

reg [S_COUNT-1:0] s_axi_awready_reg = 0, s_axi_awready_next;
reg [S_COUNT-1:0] s_axi_wready_reg = 0, s_axi_wready_next;
reg [S_COUNT-1:0] s_axi_bvalid_reg = 0, s_axi_bvalid_next;
reg [S_COUNT-1:0] s_axi_arready_reg = 0, s_axi_arready_next;

reg [M_COUNT-1:0] m_axi_awvalid_reg = 0, m_axi_awvalid_next;
reg [M_COUNT-1:0] m_axi_bready_reg = 0, m_axi_bready_next;
reg [M_COUNT-1:0] m_axi_arvalid_reg = 0, m_axi_arvalid_next;
reg [M_COUNT-1:0] m_axi_rready_reg = 0, m_axi_rready_next;

// internal datapath
reg  [ID_WIDTH-1:0]    s_axi_rid_int;
reg  [DATA_WIDTH-1:0]  s_axi_rdata_int;
reg  [1:0]             s_axi_rresp_int;
reg                    s_axi_rlast_int;
reg  [RUSER_WIDTH-1:0] s_axi_ruser_int;
reg                    s_axi_rvalid_int;
reg                    s_axi_rready_int_reg = 1'b0;
wire                   s_axi_rready_int_early;

reg  [DATA_WIDTH-1:0]  m_axi_wdata_int;
reg  [STRB_WIDTH-1:0]  m_axi_wstrb_int;
reg                    m_axi_wlast_int;
reg  [WUSER_WIDTH-1:0] m_axi_wuser_int;
reg                    m_axi_wvalid_int;
reg                    m_axi_wready_int_reg = 1'b0;
wire                   m_axi_wready_int_early;

assign s_axi_awready = s_axi_awready_reg;
assign s_axi_wready = s_axi_wready_reg;
assign s_axi_bid = {S_COUNT{axi_id_reg}};
assign s_axi_bresp = {S_COUNT{axi_bresp_reg}};
assign s_axi_buser = {S_COUNT{BUSER_ENABLE ? axi_buser_reg : {BUSER_WIDTH{1'b0}}}};
assign s_axi_bvalid = s_axi_bvalid_reg;
assign s_axi_arready = s_axi_arready_reg;

assign m_axi_awid = {M_COUNT{FORWARD_ID ? axi_id_reg : {ID_WIDTH{1'b0}}}};
assign m_axi_awaddr = {M_COUNT{axi_addr_reg}};
assign m_axi_awlen = {M_COUNT{axi_len_reg}};
assign m_axi_awsize = {M_COUNT{axi_size_reg}};
assign m_axi_awburst = {M_COUNT{axi_burst_reg}};
assign m_axi_awlock = {M_COUNT{axi_lock_reg}};
assign m_axi_awcache = {M_COUNT{axi_cache_reg}};
assign m_axi_awprot = {M_COUNT{axi_prot_reg}};
assign m_axi_awqos = {M_COUNT{axi_qos_reg}};
assign m_axi_awregion = {M_COUNT{axi_region_reg}};
assign m_axi_awuser = {M_COUNT{AWUSER_ENABLE ? axi_auser_reg[AWUSER_WIDTH-1:0] : {AWUSER_WIDTH{1'b0}}}};
assign m_axi_awvalid = m_axi_awvalid_reg;
assign m_axi_bready = m_axi_bready_reg;
assign m_axi_arid = {M_COUNT{FORWARD_ID ? axi_id_reg : {ID_WIDTH{1'b0}}}};
assign m_axi_araddr = {M_COUNT{axi_addr_reg}};
assign m_axi_arlen = {M_COUNT{axi_len_reg}};
assign m_axi_arsize = {M_COUNT{axi_size_reg}};
assign m_axi_arburst = {M_COUNT{axi_burst_reg}};
assign m_axi_arlock = {M_COUNT{axi_lock_reg}};
assign m_axi_arcache = {M_COUNT{axi_cache_reg}};
assign m_axi_arprot = {M_COUNT{axi_prot_reg}};
assign m_axi_arqos = {M_COUNT{axi_qos_reg}};
assign m_axi_arregion = {M_COUNT{axi_region_reg}};
assign m_axi_aruser = {M_COUNT{ARUSER_ENABLE ? axi_auser_reg[ARUSER_WIDTH-1:0] : {ARUSER_WIDTH{1'b0}}}};
assign m_axi_arvalid = m_axi_arvalid_reg;
assign m_axi_rready = m_axi_rready_reg;

// slave side mux
wire [(CL_S_COUNT > 0 ? CL_S_COUNT-1 : 0):0] s_select;

wire [ID_WIDTH-1:0]     current_s_axi_awid      = s_axi_awid[s_select*ID_WIDTH +: ID_WIDTH];
wire [ADDR_WIDTH-1:0]   current_s_axi_awaddr    = s_axi_awaddr[s_select*ADDR_WIDTH +: ADDR_WIDTH];
wire [7:0]              current_s_axi_awlen     = s_axi_awlen[s_select*8 +: 8];
wire [2:0]              current_s_axi_awsize    = s_axi_awsize[s_select*3 +: 3];
wire [1:0]              current_s_axi_awburst   = s_axi_awburst[s_select*2 +: 2];
wire                    current_s_axi_awlock    = s_axi_awlock[s_select];
wire [3:0]              current_s_axi_awcache   = s_axi_awcache[s_select*4 +: 4];
wire [2:0]              current_s_axi_awprot    = s_axi_awprot[s_select*3 +: 3];
wire [3:0]              current_s_axi_awqos     = s_axi_awqos[s_select*4 +: 4];
wire [AWUSER_WIDTH-1:0] current_s_axi_awuser    = s_axi_awuser[s_select*AWUSER_WIDTH +: AWUSER_WIDTH];
wire                    current_s_axi_awvalid   = s_axi_awvalid[s_select];
wire                    current_s_axi_awready   = s_axi_awready[s_select];
wire [DATA_WIDTH-1:0]   current_s_axi_wdata     = s_axi_wdata[s_select*DATA_WIDTH +: DATA_WIDTH];
wire [STRB_WIDTH-1:0]   current_s_axi_wstrb     = s_axi_wstrb[s_select*STRB_WIDTH +: STRB_WIDTH];
wire                    current_s_axi_wlast     = s_axi_wlast[s_select];
wire [WUSER_WIDTH-1:0]  current_s_axi_wuser     = s_axi_wuser[s_select*WUSER_WIDTH +: WUSER_WIDTH];
wire                    current_s_axi_wvalid    = s_axi_wvalid[s_select];
wire                    current_s_axi_wready    = s_axi_wready[s_select];
wire [ID_WIDTH-1:0]     current_s_axi_bid       = s_axi_bid[s_select*ID_WIDTH +: ID_WIDTH];
wire [1:0]              current_s_axi_bresp     = s_axi_bresp[s_select*2 +: 2];
wire [BUSER_WIDTH-1:0]  current_s_axi_buser     = s_axi_buser[s_select*BUSER_WIDTH +: BUSER_WIDTH];
wire                    current_s_axi_bvalid    = s_axi_bvalid[s_select];
wire                    current_s_axi_bready    = s_axi_bready[s_select];
wire [ID_WIDTH-1:0]     current_s_axi_arid      = s_axi_arid[s_select*ID_WIDTH +: ID_WIDTH];
wire [ADDR_WIDTH-1:0]   current_s_axi_araddr    = s_axi_araddr[s_select*ADDR_WIDTH +: ADDR_WIDTH];
wire [7:0]              current_s_axi_arlen     = s_axi_arlen[s_select*8 +: 8];
wire [2:0]              current_s_axi_arsize    = s_axi_arsize[s_select*3 +: 3];
wire [1:0]              current_s_axi_arburst   = s_axi_arburst[s_select*2 +: 2];
wire                    current_s_axi_arlock    = s_axi_arlock[s_select];
wire [3:0]              current_s_axi_arcache   = s_axi_arcache[s_select*4 +: 4];
wire [2:0]              current_s_axi_arprot    = s_axi_arprot[s_select*3 +: 3];
wire [3:0]              current_s_axi_arqos     = s_axi_arqos[s_select*4 +: 4];
wire [ARUSER_WIDTH-1:0] current_s_axi_aruser    = s_axi_aruser[s_select*ARUSER_WIDTH +: ARUSER_WIDTH];
wire                    current_s_axi_arvalid   = s_axi_arvalid[s_select];
wire                    current_s_axi_arready   = s_axi_arready[s_select];
wire [ID_WIDTH-1:0]     current_s_axi_rid       = s_axi_rid[s_select*ID_WIDTH +: ID_WIDTH];
wire [DATA_WIDTH-1:0]   current_s_axi_rdata     = s_axi_rdata[s_select*DATA_WIDTH +: DATA_WIDTH];
wire [1:0]              current_s_axi_rresp     = s_axi_rresp[s_select*2 +: 2];
wire                    current_s_axi_rlast     = s_axi_rlast[s_select];
wire [RUSER_WIDTH-1:0]  current_s_axi_ruser     = s_axi_ruser[s_select*RUSER_WIDTH +: RUSER_WIDTH];
wire                    current_s_axi_rvalid    = s_axi_rvalid[s_select];
wire                    current_s_axi_rready    = s_axi_rready[s_select];

// master side mux
wire [ID_WIDTH-1:0]     current_m_axi_awid      = m_axi_awid[m_select_reg*ID_WIDTH +: ID_WIDTH];
wire [ADDR_WIDTH-1:0]   current_m_axi_awaddr    = m_axi_awaddr[m_select_reg*ADDR_WIDTH +: ADDR_WIDTH];
wire [7:0]              current_m_axi_awlen     = m_axi_awlen[m_select_reg*8 +: 8];
wire [2:0]              current_m_axi_awsize    = m_axi_awsize[m_select_reg*3 +: 3];
wire [1:0]              current_m_axi_awburst   = m_axi_awburst[m_select_reg*2 +: 2];
wire                    current_m_axi_awlock    = m_axi_awlock[m_select_reg];
wire [3:0]              current_m_axi_awcache   = m_axi_awcache[m_select_reg*4 +: 4];
wire [2:0]              current_m_axi_awprot    = m_axi_awprot[m_select_reg*3 +: 3];
wire [3:0]              current_m_axi_awqos     = m_axi_awqos[m_select_reg*4 +: 4];
wire [3:0]              current_m_axi_awregion  = m_axi_awregion[m_select_reg*4 +: 4];
wire [AWUSER_WIDTH-1:0] current_m_axi_awuser    = m_axi_awuser[m_select_reg*AWUSER_WIDTH +: AWUSER_WIDTH];
wire                    current_m_axi_awvalid   = m_axi_awvalid[m_select_reg];
wire                    current_m_axi_awready   = m_axi_awready[m_select_reg];
wire [DATA_WIDTH-1:0]   current_m_axi_wdata     = m_axi_wdata[m_select_reg*DATA_WIDTH +: DATA_WIDTH];
wire [STRB_WIDTH-1:0]   current_m_axi_wstrb     = m_axi_wstrb[m_select_reg*STRB_WIDTH +: STRB_WIDTH];
wire                    current_m_axi_wlast     = m_axi_wlast[m_select_reg];
wire [WUSER_WIDTH-1:0]  current_m_axi_wuser     = m_axi_wuser[m_select_reg*WUSER_WIDTH +: WUSER_WIDTH];
wire                    current_m_axi_wvalid    = m_axi_wvalid[m_select_reg];
wire                    current_m_axi_wready    = m_axi_wready[m_select_reg];
wire [ID_WIDTH-1:0]     current_m_axi_bid       = m_axi_bid[m_select_reg*ID_WIDTH +: ID_WIDTH];
wire [1:0]              current_m_axi_bresp     = m_axi_bresp[m_select_reg*2 +: 2];
wire [BUSER_WIDTH-1:0]  current_m_axi_buser     = m_axi_buser[m_select_reg*BUSER_WIDTH +: BUSER_WIDTH];
wire                    current_m_axi_bvalid    = m_axi_bvalid[m_select_reg];
wire                    current_m_axi_bready    = m_axi_bready[m_select_reg];
wire [ID_WIDTH-1:0]     current_m_axi_arid      = m_axi_arid[m_select_reg*ID_WIDTH +: ID_WIDTH];
wire [ADDR_WIDTH-1:0]   current_m_axi_araddr    = m_axi_araddr[m_select_reg*ADDR_WIDTH +: ADDR_WIDTH];
wire [7:0]              current_m_axi_arlen     = m_axi_arlen[m_select_reg*8 +: 8];
wire [2:0]              current_m_axi_arsize    = m_axi_arsize[m_select_reg*3 +: 3];
wire [1:0]              current_m_axi_arburst   = m_axi_arburst[m_select_reg*2 +: 2];
wire                    current_m_axi_arlock    = m_axi_arlock[m_select_reg];
wire [3:0]              current_m_axi_arcache   = m_axi_arcache[m_select_reg*4 +: 4];
wire [2:0]              current_m_axi_arprot    = m_axi_arprot[m_select_reg*3 +: 3];
wire [3:0]              current_m_axi_arqos     = m_axi_arqos[m_select_reg*4 +: 4];
wire [3:0]              current_m_axi_arregion  = m_axi_arregion[m_select_reg*4 +: 4];
wire [ARUSER_WIDTH-1:0] current_m_axi_aruser    = m_axi_aruser[m_select_reg*ARUSER_WIDTH +: ARUSER_WIDTH];
wire                    current_m_axi_arvalid   = m_axi_arvalid[m_select_reg];
wire                    current_m_axi_arready   = m_axi_arready[m_select_reg];
wire [ID_WIDTH-1:0]     current_m_axi_rid       = m_axi_rid[m_select_reg*ID_WIDTH +: ID_WIDTH];
wire [DATA_WIDTH-1:0]   current_m_axi_rdata     = m_axi_rdata[m_select_reg*DATA_WIDTH +: DATA_WIDTH];
wire [1:0]              current_m_axi_rresp     = m_axi_rresp[m_select_reg*2 +: 2];
wire                    current_m_axi_rlast     = m_axi_rlast[m_select_reg];
wire [RUSER_WIDTH-1:0]  current_m_axi_ruser     = m_axi_ruser[m_select_reg*RUSER_WIDTH +: RUSER_WIDTH];
wire                    current_m_axi_rvalid    = m_axi_rvalid[m_select_reg];
wire                    current_m_axi_rready    = m_axi_rready[m_select_reg];

// arbiter instance
wire [S_COUNT*2-1:0] request;
wire [S_COUNT*2-1:0] acknowledge;
wire [S_COUNT*2-1:0] grant;
wire grant_valid;
wire [CL_S_COUNT:0] grant_encoded;

wire read = grant_encoded[0];
assign s_select = grant_encoded >> 1;

arbiter #(
    .PORTS(S_COUNT*2),
    .ARB_TYPE_ROUND_ROBIN(1),
    .ARB_BLOCK(1),
    .ARB_BLOCK_ACK(1),
    .ARB_LSB_HIGH_PRIORITY(1)
)
arb_inst (
    .clk(clk),
    .rst(rst),
    .request(request),
    .acknowledge(acknowledge),
    .grant(grant),
    .grant_valid(grant_valid),
    .grant_encoded(grant_encoded)
);

genvar n;

// request generation
generate
for (n = 0; n < S_COUNT; n = n + 1) begin
    assign request[2*n]   = s_axi_awvalid[n];
    assign request[2*n+1] = s_axi_arvalid[n];
end
endgenerate

// acknowledge generation
generate
for (n = 0; n < S_COUNT; n = n + 1) begin
    assign acknowledge[2*n]   = grant[2*n]   && s_axi_bvalid[n] && s_axi_bready[n];
    assign acknowledge[2*n+1] = grant[2*n+1] && s_axi_rvalid[n] && s_axi_rready[n] && s_axi_rlast[n];
end
endgenerate

always @* begin
    state_next = STATE_IDLE;

    match = 1'b0;

    m_select_next = m_select_reg;
    axi_id_next = axi_id_reg;
    axi_addr_next = axi_addr_reg;
    axi_addr_valid_next = axi_addr_valid_reg;
    axi_len_next = axi_len_reg;
    axi_size_next = axi_size_reg;
    axi_burst_next = axi_burst_reg;
    axi_lock_next = axi_lock_reg;
    axi_cache_next = axi_cache_reg;
    axi_prot_next = axi_prot_reg;
    axi_qos_next = axi_qos_reg;
    axi_region_next = axi_region_reg;
    axi_auser_next = axi_auser_reg;
    axi_bresp_next = axi_bresp_reg;
    axi_buser_next = axi_buser_reg;

    s_axi_awready_next = 0;
    s_axi_wready_next = 0;
    s_axi_bvalid_next = s_axi_bvalid_reg & ~s_axi_bready;
    s_axi_arready_next = 0;

    m_axi_awvalid_next = m_axi_awvalid_reg & ~m_axi_awready;
    m_axi_bready_next = 0;
    m_axi_arvalid_next = m_axi_arvalid_reg & ~m_axi_arready;
    m_axi_rready_next = 0;

    s_axi_rid_int = axi_id_reg;
    s_axi_rdata_int = current_m_axi_rdata;
    s_axi_rresp_int = current_m_axi_rresp;
    s_axi_rlast_int = current_m_axi_rlast;
    s_axi_ruser_int = current_m_axi_ruser;
    s_axi_rvalid_int = 1'b0;

    m_axi_wdata_int = current_s_axi_wdata;
    m_axi_wstrb_int = current_s_axi_wstrb;
    m_axi_wlast_int = current_s_axi_wlast;
    m_axi_wuser_int = current_s_axi_wuser;
    m_axi_wvalid_int = 1'b0;

    case (state_reg)
        STATE_IDLE: begin
            // idle state; wait for arbitration

            if (grant_valid) begin

                axi_addr_valid_next = 1'b1;

                if (read) begin
                    // reading
                    axi_addr_next = current_s_axi_araddr;
                    axi_prot_next = current_s_axi_arprot;
                    axi_id_next = current_s_axi_arid;
                    axi_addr_next = current_s_axi_araddr;
                    axi_len_next = current_s_axi_arlen;
                    axi_size_next = current_s_axi_arsize;
                    axi_burst_next = current_s_axi_arburst;
                    axi_lock_next = current_s_axi_arlock;
                    axi_cache_next = current_s_axi_arcache;
                    axi_prot_next = current_s_axi_arprot;
                    axi_qos_next = current_s_axi_arqos;
                    axi_auser_next = current_s_axi_aruser;
                    s_axi_arready_next[s_select] = 1'b1;
                end else  begin
                    // writing
                    axi_addr_next = current_s_axi_awaddr;
                    axi_prot_next = current_s_axi_awprot;
                    axi_id_next = current_s_axi_awid;
                    axi_addr_next = current_s_axi_awaddr;
                    axi_len_next = current_s_axi_awlen;
                    axi_size_next = current_s_axi_awsize;
                    axi_burst_next = current_s_axi_awburst;
                    axi_lock_next = current_s_axi_awlock;
                    axi_cache_next = current_s_axi_awcache;
                    axi_prot_next = current_s_axi_awprot;
                    axi_qos_next = current_s_axi_awqos;
                    axi_auser_next = current_s_axi_awuser;
                    s_axi_awready_next[s_select] = 1'b1;
                end

                state_next = STATE_DECODE;
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_DECODE: begin
            // decode state; determine master interface

            match = 1'b0;
            for (i = 0; i < M_COUNT; i = i + 1) begin
                for (j = 0; j < M_REGIONS; j = j + 1) begin
                    if (M_ADDR_WIDTH[(i*M_REGIONS+j)*32 +: 32] && (!M_SECURE[i] || !axi_prot_reg[1]) && ((read ? M_CONNECT_READ : M_CONNECT_WRITE) & (1 << (s_select+i*S_COUNT))) && (axi_addr_reg >> M_ADDR_WIDTH[(i*M_REGIONS+j)*32 +: 32]) == (M_BASE_ADDR_INT[(i*M_REGIONS+j)*ADDR_WIDTH +: ADDR_WIDTH] >> M_ADDR_WIDTH[(i*M_REGIONS+j)*32 +: 32])) begin
                        m_select_next = i;
                        axi_region_next = j;
                        match = 1'b1;
                    end
                end
            end

            if (match) begin
                if (read) begin
                    // reading
                    m_axi_rready_next[m_select_reg] = s_axi_rready_int_early;
                    state_next = STATE_READ;
                end else begin
                    // writing
                    s_axi_wready_next[s_select] = m_axi_wready_int_early;
                    state_next = STATE_WRITE;
                end
            end else begin
                // no match; return decode error
                if (read) begin
                    // reading
                    state_next = STATE_READ_DROP;
                end else begin
                    // writing
                    axi_bresp_next = 2'b11;
                    s_axi_wready_next[s_select] = 1'b1;
                    state_next = STATE_WRITE_DROP;
                end
            end
        end
        STATE_WRITE: begin
            // write state; store and forward write data
            s_axi_wready_next[s_select] = m_axi_wready_int_early;

            if (axi_addr_valid_reg) begin
                m_axi_awvalid_next[m_select_reg] = 1'b1;
            end
            axi_addr_valid_next = 1'b0;

            if (current_s_axi_wready && current_s_axi_wvalid) begin
                m_axi_wdata_int = current_s_axi_wdata;
                m_axi_wstrb_int = current_s_axi_wstrb;
                m_axi_wlast_int = current_s_axi_wlast;
                m_axi_wuser_int = current_s_axi_wuser;
                m_axi_wvalid_int = 1'b1;

                if (current_s_axi_wlast) begin
                    s_axi_wready_next[s_select] = 1'b0;
                    m_axi_bready_next[m_select_reg] = 1'b1;
                    state_next = STATE_WRITE_RESP;
                end else begin
                    state_next = STATE_WRITE;
                end
            end else begin
                state_next = STATE_WRITE;
            end
        end
        STATE_WRITE_RESP: begin
            // write response state; store and forward write response
            m_axi_bready_next[m_select_reg] = 1'b1;

            if (current_m_axi_bready && current_m_axi_bvalid) begin
                m_axi_bready_next[m_select_reg] = 1'b0;
                axi_bresp_next = current_m_axi_bresp;
                s_axi_bvalid_next[s_select] = 1'b1;
                state_next = STATE_WAIT_IDLE;
            end else begin
                state_next = STATE_WRITE_RESP;
            end
        end
        STATE_WRITE_DROP: begin
            // write drop state; drop write data
            s_axi_wready_next[s_select] = 1'b1;

            axi_addr_valid_next = 1'b0;

            if (current_s_axi_wready && current_s_axi_wvalid && current_s_axi_wlast) begin
                s_axi_wready_next[s_select] = 1'b0;
                s_axi_bvalid_next[s_select] = 1'b1;
                state_next = STATE_WAIT_IDLE;
            end else begin
                state_next = STATE_WRITE_DROP;
            end
        end
        STATE_READ: begin
            // read state; store and forward read response
            m_axi_rready_next[m_select_reg] = s_axi_rready_int_early;

            if (axi_addr_valid_reg) begin
                m_axi_arvalid_next[m_select_reg] = 1'b1;
            end
            axi_addr_valid_next = 1'b0;

            if (current_m_axi_rready && current_m_axi_rvalid) begin
                s_axi_rid_int = axi_id_reg;
                s_axi_rdata_int = current_m_axi_rdata;
                s_axi_rresp_int = current_m_axi_rresp;
                s_axi_rlast_int = current_m_axi_rlast;
                s_axi_ruser_int = current_m_axi_ruser;
                s_axi_rvalid_int = 1'b1;

                if (current_m_axi_rlast) begin
                    m_axi_rready_next[m_select_reg] = 1'b0;
                    state_next = STATE_WAIT_IDLE;
                end else begin
                    state_next = STATE_READ;
                end
            end else begin
                state_next = STATE_READ;
            end
        end
        STATE_READ_DROP: begin
            // read drop state; generate decode error read response

            s_axi_rid_int = axi_id_reg;
            s_axi_rdata_int = {DATA_WIDTH{1'b0}};
            s_axi_rresp_int = 2'b11;
            s_axi_rlast_int = axi_len_reg == 0;
            s_axi_ruser_int = {RUSER_WIDTH{1'b0}};
            s_axi_rvalid_int = 1'b1;

            if (s_axi_rready_int_reg) begin
                axi_len_next = axi_len_reg - 1;
                if (axi_len_reg == 0) begin
                    state_next = STATE_WAIT_IDLE;
                end else begin
                    state_next = STATE_READ_DROP;
                end
            end else begin
                state_next = STATE_READ_DROP;
            end
        end
        STATE_WAIT_IDLE: begin
            // wait for idle state; wait untl grant valid is deasserted

            if (!grant_valid || acknowledge) begin
                state_next = STATE_IDLE;
            end else begin
                state_next = STATE_WAIT_IDLE;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;

        s_axi_awready_reg <= 0;
        s_axi_wready_reg <= 0;
        s_axi_bvalid_reg <= 0;
        s_axi_arready_reg <= 0;

        m_axi_awvalid_reg <= 0;
        m_axi_bready_reg <= 0;
        m_axi_arvalid_reg <= 0;
        m_axi_rready_reg <= 0;
    end else begin
        state_reg <= state_next;

        s_axi_awready_reg <= s_axi_awready_next;
        s_axi_wready_reg <= s_axi_wready_next;
        s_axi_bvalid_reg <= s_axi_bvalid_next;
        s_axi_arready_reg <= s_axi_arready_next;

        m_axi_awvalid_reg <= m_axi_awvalid_next;
        m_axi_bready_reg <= m_axi_bready_next;
        m_axi_arvalid_reg <= m_axi_arvalid_next;
        m_axi_rready_reg <= m_axi_rready_next;
    end

    m_select_reg <= m_select_next;
    axi_id_reg <= axi_id_next;
    axi_addr_reg <= axi_addr_next;
    axi_addr_valid_reg <= axi_addr_valid_next;
    axi_len_reg <= axi_len_next;
    axi_size_reg <= axi_size_next;
    axi_burst_reg <= axi_burst_next;
    axi_lock_reg <= axi_lock_next;
    axi_cache_reg <= axi_cache_next;
    axi_prot_reg <= axi_prot_next;
    axi_qos_reg <= axi_qos_next;
    axi_region_reg <= axi_region_next;
    axi_auser_reg <= axi_auser_next;
    axi_bresp_reg <= axi_bresp_next;
    axi_buser_reg <= axi_buser_next;
end

// output datapath logic (R channel)
reg [ID_WIDTH-1:0]    s_axi_rid_reg    = {ID_WIDTH{1'b0}};
reg [DATA_WIDTH-1:0]  s_axi_rdata_reg  = {DATA_WIDTH{1'b0}};
reg [1:0]             s_axi_rresp_reg  = 2'd0;
reg                   s_axi_rlast_reg  = 1'b0;
reg [RUSER_WIDTH-1:0] s_axi_ruser_reg  = 1'b0;
reg [S_COUNT-1:0]     s_axi_rvalid_reg = 1'b0, s_axi_rvalid_next;

reg [ID_WIDTH-1:0]    temp_s_axi_rid_reg    = {ID_WIDTH{1'b0}};
reg [DATA_WIDTH-1:0]  temp_s_axi_rdata_reg  = {DATA_WIDTH{1'b0}};
reg [1:0]             temp_s_axi_rresp_reg  = 2'd0;
reg                   temp_s_axi_rlast_reg  = 1'b0;
reg [RUSER_WIDTH-1:0] temp_s_axi_ruser_reg  = 1'b0;
reg                   temp_s_axi_rvalid_reg = 1'b0, temp_s_axi_rvalid_next;

// datapath control
reg store_axi_r_int_to_output;
reg store_axi_r_int_to_temp;
reg store_axi_r_temp_to_output;

assign s_axi_rid = {S_COUNT{s_axi_rid_reg}};
assign s_axi_rdata = {S_COUNT{s_axi_rdata_reg}};
assign s_axi_rresp = {S_COUNT{s_axi_rresp_reg}};
assign s_axi_rlast = {S_COUNT{s_axi_rlast_reg}};
assign s_axi_ruser = {S_COUNT{RUSER_ENABLE ? s_axi_ruser_reg : {RUSER_WIDTH{1'b0}}}};
assign s_axi_rvalid = s_axi_rvalid_reg;

// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign s_axi_rready_int_early = current_s_axi_rready | (~temp_s_axi_rvalid_reg & (~current_s_axi_rvalid | ~s_axi_rvalid_int));

always @* begin
    // transfer sink ready state to source
    s_axi_rvalid_next = s_axi_rvalid_reg;
    temp_s_axi_rvalid_next = temp_s_axi_rvalid_reg;

    store_axi_r_int_to_output = 1'b0;
    store_axi_r_int_to_temp = 1'b0;
    store_axi_r_temp_to_output = 1'b0;

    if (s_axi_rready_int_reg) begin
        // input is ready
        if (current_s_axi_rready | ~current_s_axi_rvalid) begin
            // output is ready or currently not valid, transfer data to output
            s_axi_rvalid_next[s_select] = s_axi_rvalid_int;
            store_axi_r_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_s_axi_rvalid_next = s_axi_rvalid_int;
            store_axi_r_int_to_temp = 1'b1;
        end
    end else if (current_s_axi_rready) begin
        // input is not ready, but output is ready
        s_axi_rvalid_next[s_select] = temp_s_axi_rvalid_reg;
        temp_s_axi_rvalid_next = 1'b0;
        store_axi_r_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        s_axi_rvalid_reg <= 1'b0;
        s_axi_rready_int_reg <= 1'b0;
        temp_s_axi_rvalid_reg <= 1'b0;
    end else begin
        s_axi_rvalid_reg <= s_axi_rvalid_next;
        s_axi_rready_int_reg <= s_axi_rready_int_early;
        temp_s_axi_rvalid_reg <= temp_s_axi_rvalid_next;
    end

    // datapath
    if (store_axi_r_int_to_output) begin
        s_axi_rid_reg <= s_axi_rid_int;
        s_axi_rdata_reg <= s_axi_rdata_int;
        s_axi_rresp_reg <= s_axi_rresp_int;
        s_axi_rlast_reg <= s_axi_rlast_int;
        s_axi_ruser_reg <= s_axi_ruser_int;
    end else if (store_axi_r_temp_to_output) begin
        s_axi_rid_reg <= temp_s_axi_rid_reg;
        s_axi_rdata_reg <= temp_s_axi_rdata_reg;
        s_axi_rresp_reg <= temp_s_axi_rresp_reg;
        s_axi_rlast_reg <= temp_s_axi_rlast_reg;
        s_axi_ruser_reg <= temp_s_axi_ruser_reg;
    end

    if (store_axi_r_int_to_temp) begin
        temp_s_axi_rid_reg <= s_axi_rid_int;
        temp_s_axi_rdata_reg <= s_axi_rdata_int;
        temp_s_axi_rresp_reg <= s_axi_rresp_int;
        temp_s_axi_rlast_reg <= s_axi_rlast_int;
        temp_s_axi_ruser_reg <= s_axi_ruser_int;
    end
end

// output datapath logic (W channel)
reg [DATA_WIDTH-1:0]  m_axi_wdata_reg  = {DATA_WIDTH{1'b0}};
reg [STRB_WIDTH-1:0]  m_axi_wstrb_reg  = {STRB_WIDTH{1'b0}};
reg                   m_axi_wlast_reg  = 1'b0;
reg [WUSER_WIDTH-1:0] m_axi_wuser_reg  = 1'b0;
reg [M_COUNT-1:0]     m_axi_wvalid_reg = 1'b0, m_axi_wvalid_next;

reg [DATA_WIDTH-1:0]  temp_m_axi_wdata_reg  = {DATA_WIDTH{1'b0}};
reg [STRB_WIDTH-1:0]  temp_m_axi_wstrb_reg  = {STRB_WIDTH{1'b0}};
reg                   temp_m_axi_wlast_reg  = 1'b0;
reg [WUSER_WIDTH-1:0] temp_m_axi_wuser_reg  = 1'b0;
reg                   temp_m_axi_wvalid_reg = 1'b0, temp_m_axi_wvalid_next;

// datapath control
reg store_axi_w_int_to_output;
reg store_axi_w_int_to_temp;
reg store_axi_w_temp_to_output;

assign m_axi_wdata = {M_COUNT{m_axi_wdata_reg}};
assign m_axi_wstrb = {M_COUNT{m_axi_wstrb_reg}};
assign m_axi_wlast = {M_COUNT{m_axi_wlast_reg}};
assign m_axi_wuser = {M_COUNT{WUSER_ENABLE ? m_axi_wuser_reg : {WUSER_WIDTH{1'b0}}}};
assign m_axi_wvalid = m_axi_wvalid_reg;

// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign m_axi_wready_int_early = current_m_axi_wready | (~temp_m_axi_wvalid_reg & (~current_m_axi_wvalid | ~m_axi_wvalid_int));

always @* begin
    // transfer sink ready state to source
    m_axi_wvalid_next = m_axi_wvalid_reg;
    temp_m_axi_wvalid_next = temp_m_axi_wvalid_reg;

    store_axi_w_int_to_output = 1'b0;
    store_axi_w_int_to_temp = 1'b0;
    store_axi_w_temp_to_output = 1'b0;

    if (m_axi_wready_int_reg) begin
        // input is ready
        if (current_m_axi_wready | ~current_m_axi_wvalid) begin
            // output is ready or currently not valid, transfer data to output
            m_axi_wvalid_next[m_select_reg] = m_axi_wvalid_int;
            store_axi_w_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_m_axi_wvalid_next = m_axi_wvalid_int;
            store_axi_w_int_to_temp = 1'b1;
        end
    end else if (current_m_axi_wready) begin
        // input is not ready, but output is ready
        m_axi_wvalid_next[m_select_reg] = temp_m_axi_wvalid_reg;
        temp_m_axi_wvalid_next = 1'b0;
        store_axi_w_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        m_axi_wvalid_reg <= 1'b0;
        m_axi_wready_int_reg <= 1'b0;
        temp_m_axi_wvalid_reg <= 1'b0;
    end else begin
        m_axi_wvalid_reg <= m_axi_wvalid_next;
        m_axi_wready_int_reg <= m_axi_wready_int_early;
        temp_m_axi_wvalid_reg <= temp_m_axi_wvalid_next;
    end

    // datapath
    if (store_axi_w_int_to_output) begin
        m_axi_wdata_reg <= m_axi_wdata_int;
        m_axi_wstrb_reg <= m_axi_wstrb_int;
        m_axi_wlast_reg <= m_axi_wlast_int;
        m_axi_wuser_reg <= m_axi_wuser_int;
    end else if (store_axi_w_temp_to_output) begin
        m_axi_wdata_reg <= temp_m_axi_wdata_reg;
        m_axi_wstrb_reg <= temp_m_axi_wstrb_reg;
        m_axi_wlast_reg <= temp_m_axi_wlast_reg;
        m_axi_wuser_reg <= temp_m_axi_wuser_reg;
    end

    if (store_axi_w_int_to_temp) begin
        temp_m_axi_wdata_reg <= m_axi_wdata_int;
        temp_m_axi_wstrb_reg <= m_axi_wstrb_int;
        temp_m_axi_wlast_reg <= m_axi_wlast_int;
        temp_m_axi_wuser_reg <= m_axi_wuser_int;
    end
end

endmodule

`resetall

// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : axi_interconnect_wrapper.v
// Device     : gemini
// LiteX sha1 : --------
// Date       : 2023-06-02 15:02:26
//------------------------------------------------------------------------------
// This file is Copyright (c) 2022 RapidSilicon
//--------------------------------------------------------------------------------

`timescale 1ns / 1ps

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module axi_interconnect_wrapper (
    input  wire          clk,
    input  wire          rst,
    input  wire          s00_axi_awvalid,
    output wire          s00_axi_awready,
    input  wire   [31:0] s00_axi_awaddr,
    input  wire    [1:0] s00_axi_awburst,
    input  wire    [7:0] s00_axi_awlen,
    input  wire    [2:0] s00_axi_awsize,
    input  wire          s00_axi_awlock,
    input  wire    [2:0] s00_axi_awprot,
    input  wire    [3:0] s00_axi_awcache,
    input  wire    [3:0] s00_axi_awqos,
    input  wire    [3:0] s00_axi_awregion,
    input  wire    [7:0] s00_axi_awid,
    input  wire          s00_axi_awuser,
    input  wire          s00_axi_wvalid,
    output wire          s00_axi_wready,
    input  wire          s00_axi_wlast,
    input  wire   [31:0] s00_axi_wdata,
    input  wire    [3:0] s00_axi_wstrb,
    input  wire          s00_axi_wuser,
    output wire          s00_axi_bvalid,
    input  wire          s00_axi_bready,
    output wire    [1:0] s00_axi_bresp,
    output wire    [7:0] s00_axi_bid,
    output wire          s00_axi_buser,
    input  wire          s00_axi_arvalid,
    output wire          s00_axi_arready,
    input  wire   [31:0] s00_axi_araddr,
    input  wire    [1:0] s00_axi_arburst,
    input  wire    [7:0] s00_axi_arlen,
    input  wire    [2:0] s00_axi_arsize,
    input  wire          s00_axi_arlock,
    input  wire    [2:0] s00_axi_arprot,
    input  wire    [3:0] s00_axi_arcache,
    input  wire    [3:0] s00_axi_arqos,
    input  wire    [3:0] s00_axi_arregion,
    input  wire    [7:0] s00_axi_arid,
    input  wire          s00_axi_aruser,
    output wire          s00_axi_rvalid,
    input  wire          s00_axi_rready,
    output wire          s00_axi_rlast,
    output wire    [1:0] s00_axi_rresp,
    output wire   [31:0] s00_axi_rdata,
    output wire    [7:0] s00_axi_rid,
    output wire          s00_axi_ruser,
    input  wire          s01_axi_awvalid,
    output wire          s01_axi_awready,
    input  wire   [31:0] s01_axi_awaddr,
    input  wire    [1:0] s01_axi_awburst,
    input  wire    [7:0] s01_axi_awlen,
    input  wire    [2:0] s01_axi_awsize,
    input  wire          s01_axi_awlock,
    input  wire    [2:0] s01_axi_awprot,
    input  wire    [3:0] s01_axi_awcache,
    input  wire    [3:0] s01_axi_awqos,
    input  wire    [3:0] s01_axi_awregion,
    input  wire    [7:0] s01_axi_awid,
    input  wire          s01_axi_awuser,
    input  wire          s01_axi_wvalid,
    output wire          s01_axi_wready,
    input  wire          s01_axi_wlast,
    input  wire   [31:0] s01_axi_wdata,
    input  wire    [3:0] s01_axi_wstrb,
    input  wire          s01_axi_wuser,
    output wire          s01_axi_bvalid,
    input  wire          s01_axi_bready,
    output wire    [1:0] s01_axi_bresp,
    output wire    [7:0] s01_axi_bid,
    output wire          s01_axi_buser,
    input  wire          s01_axi_arvalid,
    output wire          s01_axi_arready,
    input  wire   [31:0] s01_axi_araddr,
    input  wire    [1:0] s01_axi_arburst,
    input  wire    [7:0] s01_axi_arlen,
    input  wire    [2:0] s01_axi_arsize,
    input  wire          s01_axi_arlock,
    input  wire    [2:0] s01_axi_arprot,
    input  wire    [3:0] s01_axi_arcache,
    input  wire    [3:0] s01_axi_arqos,
    input  wire    [3:0] s01_axi_arregion,
    input  wire    [7:0] s01_axi_arid,
    input  wire          s01_axi_aruser,
    output wire          s01_axi_rvalid,
    input  wire          s01_axi_rready,
    output wire          s01_axi_rlast,
    output wire    [1:0] s01_axi_rresp,
    output wire   [31:0] s01_axi_rdata,
    output wire    [7:0] s01_axi_rid,
    output wire          s01_axi_ruser,
    input  wire          s02_axi_awvalid,
    output wire          s02_axi_awready,
    input  wire   [31:0] s02_axi_awaddr,
    input  wire    [1:0] s02_axi_awburst,
    input  wire    [7:0] s02_axi_awlen,
    input  wire    [2:0] s02_axi_awsize,
    input  wire          s02_axi_awlock,
    input  wire    [2:0] s02_axi_awprot,
    input  wire    [3:0] s02_axi_awcache,
    input  wire    [3:0] s02_axi_awqos,
    input  wire    [3:0] s02_axi_awregion,
    input  wire    [7:0] s02_axi_awid,
    input  wire          s02_axi_awuser,
    input  wire          s02_axi_wvalid,
    output wire          s02_axi_wready,
    input  wire          s02_axi_wlast,
    input  wire   [31:0] s02_axi_wdata,
    input  wire    [3:0] s02_axi_wstrb,
    input  wire          s02_axi_wuser,
    output wire          s02_axi_bvalid,
    input  wire          s02_axi_bready,
    output wire    [1:0] s02_axi_bresp,
    output wire    [7:0] s02_axi_bid,
    output wire          s02_axi_buser,
    input  wire          s02_axi_arvalid,
    output wire          s02_axi_arready,
    input  wire   [31:0] s02_axi_araddr,
    input  wire    [1:0] s02_axi_arburst,
    input  wire    [7:0] s02_axi_arlen,
    input  wire    [2:0] s02_axi_arsize,
    input  wire          s02_axi_arlock,
    input  wire    [2:0] s02_axi_arprot,
    input  wire    [3:0] s02_axi_arcache,
    input  wire    [3:0] s02_axi_arqos,
    input  wire    [3:0] s02_axi_arregion,
    input  wire    [7:0] s02_axi_arid,
    input  wire          s02_axi_aruser,
    output wire          s02_axi_rvalid,
    input  wire          s02_axi_rready,
    output wire          s02_axi_rlast,
    output wire    [1:0] s02_axi_rresp,
    output wire   [31:0] s02_axi_rdata,
    output wire    [7:0] s02_axi_rid,
    output wire          s02_axi_ruser,
    input  wire          s03_axi_awvalid,
    output wire          s03_axi_awready,
    input  wire   [31:0] s03_axi_awaddr,
    input  wire    [1:0] s03_axi_awburst,
    input  wire    [7:0] s03_axi_awlen,
    input  wire    [2:0] s03_axi_awsize,
    input  wire          s03_axi_awlock,
    input  wire    [2:0] s03_axi_awprot,
    input  wire    [3:0] s03_axi_awcache,
    input  wire    [3:0] s03_axi_awqos,
    input  wire    [3:0] s03_axi_awregion,
    input  wire    [7:0] s03_axi_awid,
    input  wire          s03_axi_awuser,
    input  wire          s03_axi_wvalid,
    output wire          s03_axi_wready,
    input  wire          s03_axi_wlast,
    input  wire   [31:0] s03_axi_wdata,
    input  wire    [3:0] s03_axi_wstrb,
    input  wire          s03_axi_wuser,
    output wire          s03_axi_bvalid,
    input  wire          s03_axi_bready,
    output wire    [1:0] s03_axi_bresp,
    output wire    [7:0] s03_axi_bid,
    output wire          s03_axi_buser,
    input  wire          s03_axi_arvalid,
    output wire          s03_axi_arready,
    input  wire   [31:0] s03_axi_araddr,
    input  wire    [1:0] s03_axi_arburst,
    input  wire    [7:0] s03_axi_arlen,
    input  wire    [2:0] s03_axi_arsize,
    input  wire          s03_axi_arlock,
    input  wire    [2:0] s03_axi_arprot,
    input  wire    [3:0] s03_axi_arcache,
    input  wire    [3:0] s03_axi_arqos,
    input  wire    [3:0] s03_axi_arregion,
    input  wire    [7:0] s03_axi_arid,
    input  wire          s03_axi_aruser,
    output wire          s03_axi_rvalid,
    input  wire          s03_axi_rready,
    output wire          s03_axi_rlast,
    output wire    [1:0] s03_axi_rresp,
    output wire   [31:0] s03_axi_rdata,
    output wire    [7:0] s03_axi_rid,
    output wire          s03_axi_ruser,
    output wire          m00_axi_awvalid,
    input  wire          m00_axi_awready,
    output wire   [31:0] m00_axi_awaddr,
    output wire    [1:0] m00_axi_awburst,
    output wire    [7:0] m00_axi_awlen,
    output wire    [2:0] m00_axi_awsize,
    output wire          m00_axi_awlock,
    output wire    [2:0] m00_axi_awprot,
    output wire    [3:0] m00_axi_awcache,
    output wire    [3:0] m00_axi_awqos,
    output wire    [3:0] m00_axi_awregion,
    output wire    [7:0] m00_axi_awid,
    output wire          m00_axi_awuser,
    output wire          m00_axi_wvalid,
    input  wire          m00_axi_wready,
    output wire          m00_axi_wlast,
    output wire   [31:0] m00_axi_wdata,
    output wire    [3:0] m00_axi_wstrb,
    output wire          m00_axi_wuser,
    input  wire          m00_axi_bvalid,
    output wire          m00_axi_bready,
    input  wire    [1:0] m00_axi_bresp,
    input  wire    [7:0] m00_axi_bid,
    input  wire          m00_axi_buser,
    output wire          m00_axi_arvalid,
    input  wire          m00_axi_arready,
    output wire   [31:0] m00_axi_araddr,
    output wire    [1:0] m00_axi_arburst,
    output wire    [7:0] m00_axi_arlen,
    output wire    [2:0] m00_axi_arsize,
    output wire          m00_axi_arlock,
    output wire    [2:0] m00_axi_arprot,
    output wire    [3:0] m00_axi_arcache,
    output wire    [3:0] m00_axi_arqos,
    output wire    [3:0] m00_axi_arregion,
    output wire    [7:0] m00_axi_arid,
    output wire          m00_axi_aruser,
    input  wire          m00_axi_rvalid,
    output wire          m00_axi_rready,
    input  wire          m00_axi_rlast,
    input  wire    [1:0] m00_axi_rresp,
    input  wire   [31:0] m00_axi_rdata,
    input  wire    [7:0] m00_axi_rid,
    input  wire          m00_axi_ruser,
    output wire          m01_axi_awvalid,
    input  wire          m01_axi_awready,
    output wire   [31:0] m01_axi_awaddr,
    output wire    [1:0] m01_axi_awburst,
    output wire    [7:0] m01_axi_awlen,
    output wire    [2:0] m01_axi_awsize,
    output wire          m01_axi_awlock,
    output wire    [2:0] m01_axi_awprot,
    output wire    [3:0] m01_axi_awcache,
    output wire    [3:0] m01_axi_awqos,
    output wire    [3:0] m01_axi_awregion,
    output wire    [7:0] m01_axi_awid,
    output wire          m01_axi_awuser,
    output wire          m01_axi_wvalid,
    input  wire          m01_axi_wready,
    output wire          m01_axi_wlast,
    output wire   [31:0] m01_axi_wdata,
    output wire    [3:0] m01_axi_wstrb,
    output wire          m01_axi_wuser,
    input  wire          m01_axi_bvalid,
    output wire          m01_axi_bready,
    input  wire    [1:0] m01_axi_bresp,
    input  wire    [7:0] m01_axi_bid,
    input  wire          m01_axi_buser,
    output wire          m01_axi_arvalid,
    input  wire          m01_axi_arready,
    output wire   [31:0] m01_axi_araddr,
    output wire    [1:0] m01_axi_arburst,
    output wire    [7:0] m01_axi_arlen,
    output wire    [2:0] m01_axi_arsize,
    output wire          m01_axi_arlock,
    output wire    [2:0] m01_axi_arprot,
    output wire    [3:0] m01_axi_arcache,
    output wire    [3:0] m01_axi_arqos,
    output wire    [3:0] m01_axi_arregion,
    output wire    [7:0] m01_axi_arid,
    output wire          m01_axi_aruser,
    input  wire          m01_axi_rvalid,
    output wire          m01_axi_rready,
    input  wire          m01_axi_rlast,
    input  wire    [1:0] m01_axi_rresp,
    input  wire   [31:0] m01_axi_rdata,
    input  wire    [7:0] m01_axi_rid,
    input  wire          m01_axi_ruser,
    output wire          m02_axi_awvalid,
    input  wire          m02_axi_awready,
    output wire   [31:0] m02_axi_awaddr,
    output wire    [1:0] m02_axi_awburst,
    output wire    [7:0] m02_axi_awlen,
    output wire    [2:0] m02_axi_awsize,
    output wire          m02_axi_awlock,
    output wire    [2:0] m02_axi_awprot,
    output wire    [3:0] m02_axi_awcache,
    output wire    [3:0] m02_axi_awqos,
    output wire    [3:0] m02_axi_awregion,
    output wire    [7:0] m02_axi_awid,
    output wire          m02_axi_awuser,
    output wire          m02_axi_wvalid,
    input  wire          m02_axi_wready,
    output wire          m02_axi_wlast,
    output wire   [31:0] m02_axi_wdata,
    output wire    [3:0] m02_axi_wstrb,
    output wire          m02_axi_wuser,
    input  wire          m02_axi_bvalid,
    output wire          m02_axi_bready,
    input  wire    [1:0] m02_axi_bresp,
    input  wire    [7:0] m02_axi_bid,
    input  wire          m02_axi_buser,
    output wire          m02_axi_arvalid,
    input  wire          m02_axi_arready,
    output wire   [31:0] m02_axi_araddr,
    output wire    [1:0] m02_axi_arburst,
    output wire    [7:0] m02_axi_arlen,
    output wire    [2:0] m02_axi_arsize,
    output wire          m02_axi_arlock,
    output wire    [2:0] m02_axi_arprot,
    output wire    [3:0] m02_axi_arcache,
    output wire    [3:0] m02_axi_arqos,
    output wire    [3:0] m02_axi_arregion,
    output wire    [7:0] m02_axi_arid,
    output wire          m02_axi_aruser,
    input  wire          m02_axi_rvalid,
    output wire          m02_axi_rready,
    input  wire          m02_axi_rlast,
    input  wire    [1:0] m02_axi_rresp,
    input  wire   [31:0] m02_axi_rdata,
    input  wire    [7:0] m02_axi_rid,
    input  wire          m02_axi_ruser,
    output wire          m03_axi_awvalid,
    input  wire          m03_axi_awready,
    output wire   [31:0] m03_axi_awaddr,
    output wire    [1:0] m03_axi_awburst,
    output wire    [7:0] m03_axi_awlen,
    output wire    [2:0] m03_axi_awsize,
    output wire          m03_axi_awlock,
    output wire    [2:0] m03_axi_awprot,
    output wire    [3:0] m03_axi_awcache,
    output wire    [3:0] m03_axi_awqos,
    output wire    [3:0] m03_axi_awregion,
    output wire    [7:0] m03_axi_awid,
    output wire          m03_axi_awuser,
    output wire          m03_axi_wvalid,
    input  wire          m03_axi_wready,
    output wire          m03_axi_wlast,
    output wire   [31:0] m03_axi_wdata,
    output wire    [3:0] m03_axi_wstrb,
    output wire          m03_axi_wuser,
    input  wire          m03_axi_bvalid,
    output wire          m03_axi_bready,
    input  wire    [1:0] m03_axi_bresp,
    input  wire    [7:0] m03_axi_bid,
    input  wire          m03_axi_buser,
    output wire          m03_axi_arvalid,
    input  wire          m03_axi_arready,
    output wire   [31:0] m03_axi_araddr,
    output wire    [1:0] m03_axi_arburst,
    output wire    [7:0] m03_axi_arlen,
    output wire    [2:0] m03_axi_arsize,
    output wire          m03_axi_arlock,
    output wire    [2:0] m03_axi_arprot,
    output wire    [3:0] m03_axi_arcache,
    output wire    [3:0] m03_axi_arqos,
    output wire    [3:0] m03_axi_arregion,
    output wire    [7:0] m03_axi_arid,
    output wire          m03_axi_aruser,
    input  wire          m03_axi_rvalid,
    output wire          m03_axi_rready,
    input  wire          m03_axi_rlast,
    input  wire    [1:0] m03_axi_rresp,
    input  wire   [31:0] m03_axi_rdata,
    input  wire    [7:0] m03_axi_rid,
    input  wire          m03_axi_ruser
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

wire          sys_clk;
wire          sys_rst;
wire          axiinterface0_aw_valid0;
wire          axiinterface0_aw_ready0;
wire   [31:0] axiinterface0_aw_payload_addr0;
wire    [1:0] axiinterface0_aw_payload_burst0;
wire    [7:0] axiinterface0_aw_payload_len0;
wire    [2:0] axiinterface0_aw_payload_size0;
wire          axiinterface0_aw_payload_lock0;
wire    [2:0] axiinterface0_aw_payload_prot0;
wire    [3:0] axiinterface0_aw_payload_cache0;
wire    [3:0] axiinterface0_aw_payload_qos0;
wire    [3:0] axiinterface0_aw_payload_region0;
wire    [7:0] axiinterface0_aw_param_id0;
wire          axiinterface0_aw_param_user0;
wire          axiinterface0_w_valid0;
wire          axiinterface0_w_ready0;
wire          axiinterface0_w_last0;
wire   [31:0] axiinterface0_w_payload_data0;
wire    [3:0] axiinterface0_w_payload_strb0;
wire          axiinterface0_w_param_user0;
wire          axiinterface0_b_valid0;
wire          axiinterface0_b_ready0;
wire    [1:0] axiinterface0_b_payload_resp0;
wire    [7:0] axiinterface0_b_param_id0;
wire          axiinterface0_b_param_user0;
wire          axiinterface0_ar_valid0;
wire          axiinterface0_ar_ready0;
wire   [31:0] axiinterface0_ar_payload_addr0;
wire    [1:0] axiinterface0_ar_payload_burst0;
wire    [7:0] axiinterface0_ar_payload_len0;
wire    [2:0] axiinterface0_ar_payload_size0;
wire          axiinterface0_ar_payload_lock0;
wire    [2:0] axiinterface0_ar_payload_prot0;
wire    [3:0] axiinterface0_ar_payload_cache0;
wire    [3:0] axiinterface0_ar_payload_qos0;
wire    [3:0] axiinterface0_ar_payload_region0;
wire    [7:0] axiinterface0_ar_param_id0;
wire          axiinterface0_ar_param_user0;
wire          axiinterface0_r_valid0;
wire          axiinterface0_r_ready0;
wire          axiinterface0_r_last0;
wire    [1:0] axiinterface0_r_payload_resp0;
wire   [31:0] axiinterface0_r_payload_data0;
wire    [7:0] axiinterface0_r_param_id0;
wire          axiinterface0_r_param_user0;
wire          axiinterface1_aw_valid0;
wire          axiinterface1_aw_ready0;
wire   [31:0] axiinterface1_aw_payload_addr0;
wire    [1:0] axiinterface1_aw_payload_burst0;
wire    [7:0] axiinterface1_aw_payload_len0;
wire    [2:0] axiinterface1_aw_payload_size0;
wire          axiinterface1_aw_payload_lock0;
wire    [2:0] axiinterface1_aw_payload_prot0;
wire    [3:0] axiinterface1_aw_payload_cache0;
wire    [3:0] axiinterface1_aw_payload_qos0;
wire    [3:0] axiinterface1_aw_payload_region0;
wire    [7:0] axiinterface1_aw_param_id0;
wire          axiinterface1_aw_param_user0;
wire          axiinterface1_w_valid0;
wire          axiinterface1_w_ready0;
wire          axiinterface1_w_last0;
wire   [31:0] axiinterface1_w_payload_data0;
wire    [3:0] axiinterface1_w_payload_strb0;
wire          axiinterface1_w_param_user0;
wire          axiinterface1_b_valid0;
wire          axiinterface1_b_ready0;
wire    [1:0] axiinterface1_b_payload_resp0;
wire    [7:0] axiinterface1_b_param_id0;
wire          axiinterface1_b_param_user0;
wire          axiinterface1_ar_valid0;
wire          axiinterface1_ar_ready0;
wire   [31:0] axiinterface1_ar_payload_addr0;
wire    [1:0] axiinterface1_ar_payload_burst0;
wire    [7:0] axiinterface1_ar_payload_len0;
wire    [2:0] axiinterface1_ar_payload_size0;
wire          axiinterface1_ar_payload_lock0;
wire    [2:0] axiinterface1_ar_payload_prot0;
wire    [3:0] axiinterface1_ar_payload_cache0;
wire    [3:0] axiinterface1_ar_payload_qos0;
wire    [3:0] axiinterface1_ar_payload_region0;
wire    [7:0] axiinterface1_ar_param_id0;
wire          axiinterface1_ar_param_user0;
wire          axiinterface1_r_valid0;
wire          axiinterface1_r_ready0;
wire          axiinterface1_r_last0;
wire    [1:0] axiinterface1_r_payload_resp0;
wire   [31:0] axiinterface1_r_payload_data0;
wire    [7:0] axiinterface1_r_param_id0;
wire          axiinterface1_r_param_user0;
wire          axiinterface2_aw_valid0;
wire          axiinterface2_aw_ready0;
wire   [31:0] axiinterface2_aw_payload_addr0;
wire    [1:0] axiinterface2_aw_payload_burst0;
wire    [7:0] axiinterface2_aw_payload_len0;
wire    [2:0] axiinterface2_aw_payload_size0;
wire          axiinterface2_aw_payload_lock0;
wire    [2:0] axiinterface2_aw_payload_prot0;
wire    [3:0] axiinterface2_aw_payload_cache0;
wire    [3:0] axiinterface2_aw_payload_qos0;
wire    [3:0] axiinterface2_aw_payload_region0;
wire    [7:0] axiinterface2_aw_param_id0;
wire          axiinterface2_aw_param_user0;
wire          axiinterface2_w_valid0;
wire          axiinterface2_w_ready0;
wire          axiinterface2_w_last0;
wire   [31:0] axiinterface2_w_payload_data0;
wire    [3:0] axiinterface2_w_payload_strb0;
wire          axiinterface2_w_param_user0;
wire          axiinterface2_b_valid0;
wire          axiinterface2_b_ready0;
wire    [1:0] axiinterface2_b_payload_resp0;
wire    [7:0] axiinterface2_b_param_id0;
wire          axiinterface2_b_param_user0;
wire          axiinterface2_ar_valid0;
wire          axiinterface2_ar_ready0;
wire   [31:0] axiinterface2_ar_payload_addr0;
wire    [1:0] axiinterface2_ar_payload_burst0;
wire    [7:0] axiinterface2_ar_payload_len0;
wire    [2:0] axiinterface2_ar_payload_size0;
wire          axiinterface2_ar_payload_lock0;
wire    [2:0] axiinterface2_ar_payload_prot0;
wire    [3:0] axiinterface2_ar_payload_cache0;
wire    [3:0] axiinterface2_ar_payload_qos0;
wire    [3:0] axiinterface2_ar_payload_region0;
wire    [7:0] axiinterface2_ar_param_id0;
wire          axiinterface2_ar_param_user0;
wire          axiinterface2_r_valid0;
wire          axiinterface2_r_ready0;
wire          axiinterface2_r_last0;
wire    [1:0] axiinterface2_r_payload_resp0;
wire   [31:0] axiinterface2_r_payload_data0;
wire    [7:0] axiinterface2_r_param_id0;
wire          axiinterface2_r_param_user0;
wire          axiinterface3_aw_valid0;
wire          axiinterface3_aw_ready0;
wire   [31:0] axiinterface3_aw_payload_addr0;
wire    [1:0] axiinterface3_aw_payload_burst0;
wire    [7:0] axiinterface3_aw_payload_len0;
wire    [2:0] axiinterface3_aw_payload_size0;
wire          axiinterface3_aw_payload_lock0;
wire    [2:0] axiinterface3_aw_payload_prot0;
wire    [3:0] axiinterface3_aw_payload_cache0;
wire    [3:0] axiinterface3_aw_payload_qos0;
wire    [3:0] axiinterface3_aw_payload_region0;
wire    [7:0] axiinterface3_aw_param_id0;
wire          axiinterface3_aw_param_user0;
wire          axiinterface3_w_valid0;
wire          axiinterface3_w_ready0;
wire          axiinterface3_w_last0;
wire   [31:0] axiinterface3_w_payload_data0;
wire    [3:0] axiinterface3_w_payload_strb0;
wire          axiinterface3_w_param_user0;
wire          axiinterface3_b_valid0;
wire          axiinterface3_b_ready0;
wire    [1:0] axiinterface3_b_payload_resp0;
wire    [7:0] axiinterface3_b_param_id0;
wire          axiinterface3_b_param_user0;
wire          axiinterface3_ar_valid0;
wire          axiinterface3_ar_ready0;
wire   [31:0] axiinterface3_ar_payload_addr0;
wire    [1:0] axiinterface3_ar_payload_burst0;
wire    [7:0] axiinterface3_ar_payload_len0;
wire    [2:0] axiinterface3_ar_payload_size0;
wire          axiinterface3_ar_payload_lock0;
wire    [2:0] axiinterface3_ar_payload_prot0;
wire    [3:0] axiinterface3_ar_payload_cache0;
wire    [3:0] axiinterface3_ar_payload_qos0;
wire    [3:0] axiinterface3_ar_payload_region0;
wire    [7:0] axiinterface3_ar_param_id0;
wire          axiinterface3_ar_param_user0;
wire          axiinterface3_r_valid0;
wire          axiinterface3_r_ready0;
wire          axiinterface3_r_last0;
wire    [1:0] axiinterface3_r_payload_resp0;
wire   [31:0] axiinterface3_r_payload_data0;
wire    [7:0] axiinterface3_r_param_id0;
wire          axiinterface3_r_param_user0;
wire          axiinterface0_aw_valid1;
wire          axiinterface0_aw_ready1;
wire   [31:0] axiinterface0_aw_payload_addr1;
wire    [1:0] axiinterface0_aw_payload_burst1;
wire    [7:0] axiinterface0_aw_payload_len1;
wire    [2:0] axiinterface0_aw_payload_size1;
wire          axiinterface0_aw_payload_lock1;
wire    [2:0] axiinterface0_aw_payload_prot1;
wire    [3:0] axiinterface0_aw_payload_cache1;
wire    [3:0] axiinterface0_aw_payload_qos1;
wire    [3:0] axiinterface0_aw_payload_region1;
wire    [7:0] axiinterface0_aw_param_id1;
wire          axiinterface0_aw_param_user1;
wire          axiinterface0_w_valid1;
wire          axiinterface0_w_ready1;
wire          axiinterface0_w_last1;
wire   [31:0] axiinterface0_w_payload_data1;
wire    [3:0] axiinterface0_w_payload_strb1;
wire          axiinterface0_w_param_user1;
wire          axiinterface0_b_valid1;
wire          axiinterface0_b_ready1;
wire    [1:0] axiinterface0_b_payload_resp1;
wire    [7:0] axiinterface0_b_param_id1;
wire          axiinterface0_b_param_user1;
wire          axiinterface0_ar_valid1;
wire          axiinterface0_ar_ready1;
wire   [31:0] axiinterface0_ar_payload_addr1;
wire    [1:0] axiinterface0_ar_payload_burst1;
wire    [7:0] axiinterface0_ar_payload_len1;
wire    [2:0] axiinterface0_ar_payload_size1;
wire          axiinterface0_ar_payload_lock1;
wire    [2:0] axiinterface0_ar_payload_prot1;
wire    [3:0] axiinterface0_ar_payload_cache1;
wire    [3:0] axiinterface0_ar_payload_qos1;
wire    [3:0] axiinterface0_ar_payload_region1;
wire    [7:0] axiinterface0_ar_param_id1;
wire          axiinterface0_ar_param_user1;
wire          axiinterface0_r_valid1;
wire          axiinterface0_r_ready1;
wire          axiinterface0_r_last1;
wire    [1:0] axiinterface0_r_payload_resp1;
wire   [31:0] axiinterface0_r_payload_data1;
wire    [7:0] axiinterface0_r_param_id1;
wire          axiinterface0_r_param_user1;
wire          axiinterface1_aw_valid1;
wire          axiinterface1_aw_ready1;
wire   [31:0] axiinterface1_aw_payload_addr1;
wire    [1:0] axiinterface1_aw_payload_burst1;
wire    [7:0] axiinterface1_aw_payload_len1;
wire    [2:0] axiinterface1_aw_payload_size1;
wire          axiinterface1_aw_payload_lock1;
wire    [2:0] axiinterface1_aw_payload_prot1;
wire    [3:0] axiinterface1_aw_payload_cache1;
wire    [3:0] axiinterface1_aw_payload_qos1;
wire    [3:0] axiinterface1_aw_payload_region1;
wire    [7:0] axiinterface1_aw_param_id1;
wire          axiinterface1_aw_param_user1;
wire          axiinterface1_w_valid1;
wire          axiinterface1_w_ready1;
wire          axiinterface1_w_last1;
wire   [31:0] axiinterface1_w_payload_data1;
wire    [3:0] axiinterface1_w_payload_strb1;
wire          axiinterface1_w_param_user1;
wire          axiinterface1_b_valid1;
wire          axiinterface1_b_ready1;
wire    [1:0] axiinterface1_b_payload_resp1;
wire    [7:0] axiinterface1_b_param_id1;
wire          axiinterface1_b_param_user1;
wire          axiinterface1_ar_valid1;
wire          axiinterface1_ar_ready1;
wire   [31:0] axiinterface1_ar_payload_addr1;
wire    [1:0] axiinterface1_ar_payload_burst1;
wire    [7:0] axiinterface1_ar_payload_len1;
wire    [2:0] axiinterface1_ar_payload_size1;
wire          axiinterface1_ar_payload_lock1;
wire    [2:0] axiinterface1_ar_payload_prot1;
wire    [3:0] axiinterface1_ar_payload_cache1;
wire    [3:0] axiinterface1_ar_payload_qos1;
wire    [3:0] axiinterface1_ar_payload_region1;
wire    [7:0] axiinterface1_ar_param_id1;
wire          axiinterface1_ar_param_user1;
wire          axiinterface1_r_valid1;
wire          axiinterface1_r_ready1;
wire          axiinterface1_r_last1;
wire    [1:0] axiinterface1_r_payload_resp1;
wire   [31:0] axiinterface1_r_payload_data1;
wire    [7:0] axiinterface1_r_param_id1;
wire          axiinterface1_r_param_user1;
wire          axiinterface2_aw_valid1;
wire          axiinterface2_aw_ready1;
wire   [31:0] axiinterface2_aw_payload_addr1;
wire    [1:0] axiinterface2_aw_payload_burst1;
wire    [7:0] axiinterface2_aw_payload_len1;
wire    [2:0] axiinterface2_aw_payload_size1;
wire          axiinterface2_aw_payload_lock1;
wire    [2:0] axiinterface2_aw_payload_prot1;
wire    [3:0] axiinterface2_aw_payload_cache1;
wire    [3:0] axiinterface2_aw_payload_qos1;
wire    [3:0] axiinterface2_aw_payload_region1;
wire    [7:0] axiinterface2_aw_param_id1;
wire          axiinterface2_aw_param_user1;
wire          axiinterface2_w_valid1;
wire          axiinterface2_w_ready1;
wire          axiinterface2_w_last1;
wire   [31:0] axiinterface2_w_payload_data1;
wire    [3:0] axiinterface2_w_payload_strb1;
wire          axiinterface2_w_param_user1;
wire          axiinterface2_b_valid1;
wire          axiinterface2_b_ready1;
wire    [1:0] axiinterface2_b_payload_resp1;
wire    [7:0] axiinterface2_b_param_id1;
wire          axiinterface2_b_param_user1;
wire          axiinterface2_ar_valid1;
wire          axiinterface2_ar_ready1;
wire   [31:0] axiinterface2_ar_payload_addr1;
wire    [1:0] axiinterface2_ar_payload_burst1;
wire    [7:0] axiinterface2_ar_payload_len1;
wire    [2:0] axiinterface2_ar_payload_size1;
wire          axiinterface2_ar_payload_lock1;
wire    [2:0] axiinterface2_ar_payload_prot1;
wire    [3:0] axiinterface2_ar_payload_cache1;
wire    [3:0] axiinterface2_ar_payload_qos1;
wire    [3:0] axiinterface2_ar_payload_region1;
wire    [7:0] axiinterface2_ar_param_id1;
wire          axiinterface2_ar_param_user1;
wire          axiinterface2_r_valid1;
wire          axiinterface2_r_ready1;
wire          axiinterface2_r_last1;
wire    [1:0] axiinterface2_r_payload_resp1;
wire   [31:0] axiinterface2_r_payload_data1;
wire    [7:0] axiinterface2_r_param_id1;
wire          axiinterface2_r_param_user1;
wire          axiinterface3_aw_valid1;
wire          axiinterface3_aw_ready1;
wire   [31:0] axiinterface3_aw_payload_addr1;
wire    [1:0] axiinterface3_aw_payload_burst1;
wire    [7:0] axiinterface3_aw_payload_len1;
wire    [2:0] axiinterface3_aw_payload_size1;
wire          axiinterface3_aw_payload_lock1;
wire    [2:0] axiinterface3_aw_payload_prot1;
wire    [3:0] axiinterface3_aw_payload_cache1;
wire    [3:0] axiinterface3_aw_payload_qos1;
wire    [3:0] axiinterface3_aw_payload_region1;
wire    [7:0] axiinterface3_aw_param_id1;
wire          axiinterface3_aw_param_user1;
wire          axiinterface3_w_valid1;
wire          axiinterface3_w_ready1;
wire          axiinterface3_w_last1;
wire   [31:0] axiinterface3_w_payload_data1;
wire    [3:0] axiinterface3_w_payload_strb1;
wire          axiinterface3_w_param_user1;
wire          axiinterface3_b_valid1;
wire          axiinterface3_b_ready1;
wire    [1:0] axiinterface3_b_payload_resp1;
wire    [7:0] axiinterface3_b_param_id1;
wire          axiinterface3_b_param_user1;
wire          axiinterface3_ar_valid1;
wire          axiinterface3_ar_ready1;
wire   [31:0] axiinterface3_ar_payload_addr1;
wire    [1:0] axiinterface3_ar_payload_burst1;
wire    [7:0] axiinterface3_ar_payload_len1;
wire    [2:0] axiinterface3_ar_payload_size1;
wire          axiinterface3_ar_payload_lock1;
wire    [2:0] axiinterface3_ar_payload_prot1;
wire    [3:0] axiinterface3_ar_payload_cache1;
wire    [3:0] axiinterface3_ar_payload_qos1;
wire    [3:0] axiinterface3_ar_payload_region1;
wire    [7:0] axiinterface3_ar_param_id1;
wire          axiinterface3_ar_param_user1;
wire          axiinterface3_r_valid1;
wire          axiinterface3_r_ready1;
wire          axiinterface3_r_last1;
wire    [1:0] axiinterface3_r_payload_resp1;
wire   [31:0] axiinterface3_r_payload_data1;
wire    [7:0] axiinterface3_r_param_id1;
wire          axiinterface3_r_param_user1;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign sys_clk = clk;
assign sys_rst = rst;
assign axiinterface0_aw_valid0 = s00_axi_awvalid;
assign axiinterface0_aw_payload_addr0 = s00_axi_awaddr;
assign axiinterface0_aw_payload_burst0 = s00_axi_awburst;
assign axiinterface0_aw_payload_len0 = s00_axi_awlen;
assign axiinterface0_aw_payload_size0 = s00_axi_awsize;
assign axiinterface0_aw_payload_lock0 = s00_axi_awlock;
assign axiinterface0_aw_payload_prot0 = s00_axi_awprot;
assign axiinterface0_aw_payload_cache0 = s00_axi_awcache;
assign axiinterface0_aw_payload_qos0 = s00_axi_awqos;
assign axiinterface0_aw_payload_region0 = s00_axi_awregion;
assign axiinterface0_aw_param_id0 = s00_axi_awid;
assign axiinterface0_aw_param_user0 = s00_axi_awuser;
assign s00_axi_awready = axiinterface0_aw_ready0;
assign axiinterface0_w_valid0 = s00_axi_wvalid;
assign axiinterface0_w_payload_data0 = s00_axi_wdata;
assign axiinterface0_w_payload_strb0 = s00_axi_wstrb;
assign axiinterface0_w_param_user0 = s00_axi_wuser;
assign axiinterface0_w_last0 = s00_axi_wlast;
assign s00_axi_wready = axiinterface0_w_ready0;
assign s00_axi_bvalid = axiinterface0_b_valid0;
assign s00_axi_bresp = axiinterface0_b_payload_resp0;
assign s00_axi_bid = axiinterface0_b_param_id0;
assign s00_axi_buser = axiinterface0_b_param_user0;
assign axiinterface0_b_ready0 = s00_axi_bready;
assign axiinterface0_ar_valid0 = s00_axi_arvalid;
assign axiinterface0_ar_payload_addr0 = s00_axi_araddr;
assign axiinterface0_ar_payload_burst0 = s00_axi_arburst;
assign axiinterface0_ar_payload_len0 = s00_axi_arlen;
assign axiinterface0_ar_payload_size0 = s00_axi_arsize;
assign axiinterface0_ar_payload_lock0 = s00_axi_arlock;
assign axiinterface0_ar_payload_prot0 = s00_axi_arprot;
assign axiinterface0_ar_payload_cache0 = s00_axi_arcache;
assign axiinterface0_ar_payload_qos0 = s00_axi_arqos;
assign axiinterface0_ar_payload_region0 = s00_axi_arregion;
assign axiinterface0_ar_param_id0 = s00_axi_arid;
assign axiinterface0_ar_param_user0 = s00_axi_aruser;
assign s00_axi_arready = axiinterface0_ar_ready0;
assign s00_axi_rvalid = axiinterface0_r_valid0;
assign s00_axi_rresp = axiinterface0_r_payload_resp0;
assign s00_axi_rdata = axiinterface0_r_payload_data0;
assign s00_axi_rid = axiinterface0_r_param_id0;
assign s00_axi_ruser = axiinterface0_r_param_user0;
assign s00_axi_rlast = axiinterface0_r_last0;
assign axiinterface0_r_ready0 = s00_axi_rready;
assign axiinterface1_aw_valid0 = s01_axi_awvalid;
assign axiinterface1_aw_payload_addr0 = s01_axi_awaddr;
assign axiinterface1_aw_payload_burst0 = s01_axi_awburst;
assign axiinterface1_aw_payload_len0 = s01_axi_awlen;
assign axiinterface1_aw_payload_size0 = s01_axi_awsize;
assign axiinterface1_aw_payload_lock0 = s01_axi_awlock;
assign axiinterface1_aw_payload_prot0 = s01_axi_awprot;
assign axiinterface1_aw_payload_cache0 = s01_axi_awcache;
assign axiinterface1_aw_payload_qos0 = s01_axi_awqos;
assign axiinterface1_aw_payload_region0 = s01_axi_awregion;
assign axiinterface1_aw_param_id0 = s01_axi_awid;
assign axiinterface1_aw_param_user0 = s01_axi_awuser;
assign s01_axi_awready = axiinterface1_aw_ready0;
assign axiinterface1_w_valid0 = s01_axi_wvalid;
assign axiinterface1_w_payload_data0 = s01_axi_wdata;
assign axiinterface1_w_payload_strb0 = s01_axi_wstrb;
assign axiinterface1_w_param_user0 = s01_axi_wuser;
assign axiinterface1_w_last0 = s01_axi_wlast;
assign s01_axi_wready = axiinterface1_w_ready0;
assign s01_axi_bvalid = axiinterface1_b_valid0;
assign s01_axi_bresp = axiinterface1_b_payload_resp0;
assign s01_axi_bid = axiinterface1_b_param_id0;
assign s01_axi_buser = axiinterface1_b_param_user0;
assign axiinterface1_b_ready0 = s01_axi_bready;
assign axiinterface1_ar_valid0 = s01_axi_arvalid;
assign axiinterface1_ar_payload_addr0 = s01_axi_araddr;
assign axiinterface1_ar_payload_burst0 = s01_axi_arburst;
assign axiinterface1_ar_payload_len0 = s01_axi_arlen;
assign axiinterface1_ar_payload_size0 = s01_axi_arsize;
assign axiinterface1_ar_payload_lock0 = s01_axi_arlock;
assign axiinterface1_ar_payload_prot0 = s01_axi_arprot;
assign axiinterface1_ar_payload_cache0 = s01_axi_arcache;
assign axiinterface1_ar_payload_qos0 = s01_axi_arqos;
assign axiinterface1_ar_payload_region0 = s01_axi_arregion;
assign axiinterface1_ar_param_id0 = s01_axi_arid;
assign axiinterface1_ar_param_user0 = s01_axi_aruser;
assign s01_axi_arready = axiinterface1_ar_ready0;
assign s01_axi_rvalid = axiinterface1_r_valid0;
assign s01_axi_rresp = axiinterface1_r_payload_resp0;
assign s01_axi_rdata = axiinterface1_r_payload_data0;
assign s01_axi_rid = axiinterface1_r_param_id0;
assign s01_axi_ruser = axiinterface1_r_param_user0;
assign s01_axi_rlast = axiinterface1_r_last0;
assign axiinterface1_r_ready0 = s01_axi_rready;
assign axiinterface2_aw_valid0 = s02_axi_awvalid;
assign axiinterface2_aw_payload_addr0 = s02_axi_awaddr;
assign axiinterface2_aw_payload_burst0 = s02_axi_awburst;
assign axiinterface2_aw_payload_len0 = s02_axi_awlen;
assign axiinterface2_aw_payload_size0 = s02_axi_awsize;
assign axiinterface2_aw_payload_lock0 = s02_axi_awlock;
assign axiinterface2_aw_payload_prot0 = s02_axi_awprot;
assign axiinterface2_aw_payload_cache0 = s02_axi_awcache;
assign axiinterface2_aw_payload_qos0 = s02_axi_awqos;
assign axiinterface2_aw_payload_region0 = s02_axi_awregion;
assign axiinterface2_aw_param_id0 = s02_axi_awid;
assign axiinterface2_aw_param_user0 = s02_axi_awuser;
assign s02_axi_awready = axiinterface2_aw_ready0;
assign axiinterface2_w_valid0 = s02_axi_wvalid;
assign axiinterface2_w_payload_data0 = s02_axi_wdata;
assign axiinterface2_w_payload_strb0 = s02_axi_wstrb;
assign axiinterface2_w_param_user0 = s02_axi_wuser;
assign axiinterface2_w_last0 = s02_axi_wlast;
assign s02_axi_wready = axiinterface2_w_ready0;
assign s02_axi_bvalid = axiinterface2_b_valid0;
assign s02_axi_bresp = axiinterface2_b_payload_resp0;
assign s02_axi_bid = axiinterface2_b_param_id0;
assign s02_axi_buser = axiinterface2_b_param_user0;
assign axiinterface2_b_ready0 = s02_axi_bready;
assign axiinterface2_ar_valid0 = s02_axi_arvalid;
assign axiinterface2_ar_payload_addr0 = s02_axi_araddr;
assign axiinterface2_ar_payload_burst0 = s02_axi_arburst;
assign axiinterface2_ar_payload_len0 = s02_axi_arlen;
assign axiinterface2_ar_payload_size0 = s02_axi_arsize;
assign axiinterface2_ar_payload_lock0 = s02_axi_arlock;
assign axiinterface2_ar_payload_prot0 = s02_axi_arprot;
assign axiinterface2_ar_payload_cache0 = s02_axi_arcache;
assign axiinterface2_ar_payload_qos0 = s02_axi_arqos;
assign axiinterface2_ar_payload_region0 = s02_axi_arregion;
assign axiinterface2_ar_param_id0 = s02_axi_arid;
assign axiinterface2_ar_param_user0 = s02_axi_aruser;
assign s02_axi_arready = axiinterface2_ar_ready0;
assign s02_axi_rvalid = axiinterface2_r_valid0;
assign s02_axi_rresp = axiinterface2_r_payload_resp0;
assign s02_axi_rdata = axiinterface2_r_payload_data0;
assign s02_axi_rid = axiinterface2_r_param_id0;
assign s02_axi_ruser = axiinterface2_r_param_user0;
assign s02_axi_rlast = axiinterface2_r_last0;
assign axiinterface2_r_ready0 = s02_axi_rready;
assign axiinterface3_aw_valid0 = s03_axi_awvalid;
assign axiinterface3_aw_payload_addr0 = s03_axi_awaddr;
assign axiinterface3_aw_payload_burst0 = s03_axi_awburst;
assign axiinterface3_aw_payload_len0 = s03_axi_awlen;
assign axiinterface3_aw_payload_size0 = s03_axi_awsize;
assign axiinterface3_aw_payload_lock0 = s03_axi_awlock;
assign axiinterface3_aw_payload_prot0 = s03_axi_awprot;
assign axiinterface3_aw_payload_cache0 = s03_axi_awcache;
assign axiinterface3_aw_payload_qos0 = s03_axi_awqos;
assign axiinterface3_aw_payload_region0 = s03_axi_awregion;
assign axiinterface3_aw_param_id0 = s03_axi_awid;
assign axiinterface3_aw_param_user0 = s03_axi_awuser;
assign s03_axi_awready = axiinterface3_aw_ready0;
assign axiinterface3_w_valid0 = s03_axi_wvalid;
assign axiinterface3_w_payload_data0 = s03_axi_wdata;
assign axiinterface3_w_payload_strb0 = s03_axi_wstrb;
assign axiinterface3_w_param_user0 = s03_axi_wuser;
assign axiinterface3_w_last0 = s03_axi_wlast;
assign s03_axi_wready = axiinterface3_w_ready0;
assign s03_axi_bvalid = axiinterface3_b_valid0;
assign s03_axi_bresp = axiinterface3_b_payload_resp0;
assign s03_axi_bid = axiinterface3_b_param_id0;
assign s03_axi_buser = axiinterface3_b_param_user0;
assign axiinterface3_b_ready0 = s03_axi_bready;
assign axiinterface3_ar_valid0 = s03_axi_arvalid;
assign axiinterface3_ar_payload_addr0 = s03_axi_araddr;
assign axiinterface3_ar_payload_burst0 = s03_axi_arburst;
assign axiinterface3_ar_payload_len0 = s03_axi_arlen;
assign axiinterface3_ar_payload_size0 = s03_axi_arsize;
assign axiinterface3_ar_payload_lock0 = s03_axi_arlock;
assign axiinterface3_ar_payload_prot0 = s03_axi_arprot;
assign axiinterface3_ar_payload_cache0 = s03_axi_arcache;
assign axiinterface3_ar_payload_qos0 = s03_axi_arqos;
assign axiinterface3_ar_payload_region0 = s03_axi_arregion;
assign axiinterface3_ar_param_id0 = s03_axi_arid;
assign axiinterface3_ar_param_user0 = s03_axi_aruser;
assign s03_axi_arready = axiinterface3_ar_ready0;
assign s03_axi_rvalid = axiinterface3_r_valid0;
assign s03_axi_rresp = axiinterface3_r_payload_resp0;
assign s03_axi_rdata = axiinterface3_r_payload_data0;
assign s03_axi_rid = axiinterface3_r_param_id0;
assign s03_axi_ruser = axiinterface3_r_param_user0;
assign s03_axi_rlast = axiinterface3_r_last0;
assign axiinterface3_r_ready0 = s03_axi_rready;
assign m00_axi_awvalid = axiinterface0_aw_valid1;
assign m00_axi_awaddr = axiinterface0_aw_payload_addr1;
assign m00_axi_awburst = axiinterface0_aw_payload_burst1;
assign m00_axi_awlen = axiinterface0_aw_payload_len1;
assign m00_axi_awsize = axiinterface0_aw_payload_size1;
assign m00_axi_awlock = axiinterface0_aw_payload_lock1;
assign m00_axi_awprot = axiinterface0_aw_payload_prot1;
assign m00_axi_awcache = axiinterface0_aw_payload_cache1;
assign m00_axi_awqos = axiinterface0_aw_payload_qos1;
assign m00_axi_awregion = axiinterface0_aw_payload_region1;
assign m00_axi_awid = axiinterface0_aw_param_id1;
assign m00_axi_awuser = axiinterface0_aw_param_user1;
assign axiinterface0_aw_ready1 = m00_axi_awready;
assign m00_axi_wvalid = axiinterface0_w_valid1;
assign m00_axi_wdata = axiinterface0_w_payload_data1;
assign m00_axi_wstrb = axiinterface0_w_payload_strb1;
assign m00_axi_wuser = axiinterface0_w_param_user1;
assign m00_axi_wlast = axiinterface0_w_last1;
assign axiinterface0_w_ready1 = m00_axi_wready;
assign axiinterface0_b_valid1 = m00_axi_bvalid;
assign axiinterface0_b_payload_resp1 = m00_axi_bresp;
assign axiinterface0_b_param_id1 = m00_axi_bid;
assign axiinterface0_b_param_user1 = m00_axi_buser;
assign m00_axi_bready = axiinterface0_b_ready1;
assign m00_axi_arvalid = axiinterface0_ar_valid1;
assign m00_axi_araddr = axiinterface0_ar_payload_addr1;
assign m00_axi_arburst = axiinterface0_ar_payload_burst1;
assign m00_axi_arlen = axiinterface0_ar_payload_len1;
assign m00_axi_arsize = axiinterface0_ar_payload_size1;
assign m00_axi_arlock = axiinterface0_ar_payload_lock1;
assign m00_axi_arprot = axiinterface0_ar_payload_prot1;
assign m00_axi_arcache = axiinterface0_ar_payload_cache1;
assign m00_axi_arqos = axiinterface0_ar_payload_qos1;
assign m00_axi_arregion = axiinterface0_ar_payload_region1;
assign m00_axi_arid = axiinterface0_ar_param_id1;
assign m00_axi_aruser = axiinterface0_ar_param_user1;
assign axiinterface0_ar_ready1 = m00_axi_arready;
assign axiinterface0_r_valid1 = m00_axi_rvalid;
assign axiinterface0_r_payload_resp1 = m00_axi_rresp;
assign axiinterface0_r_payload_data1 = m00_axi_rdata;
assign axiinterface0_r_param_id1 = m00_axi_rid;
assign axiinterface0_r_param_user1 = m00_axi_ruser;
assign axiinterface0_r_last1 = m00_axi_rlast;
assign m00_axi_rready = axiinterface0_r_ready1;
assign m01_axi_awvalid = axiinterface1_aw_valid1;
assign m01_axi_awaddr = axiinterface1_aw_payload_addr1;
assign m01_axi_awburst = axiinterface1_aw_payload_burst1;
assign m01_axi_awlen = axiinterface1_aw_payload_len1;
assign m01_axi_awsize = axiinterface1_aw_payload_size1;
assign m01_axi_awlock = axiinterface1_aw_payload_lock1;
assign m01_axi_awprot = axiinterface1_aw_payload_prot1;
assign m01_axi_awcache = axiinterface1_aw_payload_cache1;
assign m01_axi_awqos = axiinterface1_aw_payload_qos1;
assign m01_axi_awregion = axiinterface1_aw_payload_region1;
assign m01_axi_awid = axiinterface1_aw_param_id1;
assign m01_axi_awuser = axiinterface1_aw_param_user1;
assign axiinterface1_aw_ready1 = m01_axi_awready;
assign m01_axi_wvalid = axiinterface1_w_valid1;
assign m01_axi_wdata = axiinterface1_w_payload_data1;
assign m01_axi_wstrb = axiinterface1_w_payload_strb1;
assign m01_axi_wuser = axiinterface1_w_param_user1;
assign m01_axi_wlast = axiinterface1_w_last1;
assign axiinterface1_w_ready1 = m01_axi_wready;
assign axiinterface1_b_valid1 = m01_axi_bvalid;
assign axiinterface1_b_payload_resp1 = m01_axi_bresp;
assign axiinterface1_b_param_id1 = m01_axi_bid;
assign axiinterface1_b_param_user1 = m01_axi_buser;
assign m01_axi_bready = axiinterface1_b_ready1;
assign m01_axi_arvalid = axiinterface1_ar_valid1;
assign m01_axi_araddr = axiinterface1_ar_payload_addr1;
assign m01_axi_arburst = axiinterface1_ar_payload_burst1;
assign m01_axi_arlen = axiinterface1_ar_payload_len1;
assign m01_axi_arsize = axiinterface1_ar_payload_size1;
assign m01_axi_arlock = axiinterface1_ar_payload_lock1;
assign m01_axi_arprot = axiinterface1_ar_payload_prot1;
assign m01_axi_arcache = axiinterface1_ar_payload_cache1;
assign m01_axi_arqos = axiinterface1_ar_payload_qos1;
assign m01_axi_arregion = axiinterface1_ar_payload_region1;
assign m01_axi_arid = axiinterface1_ar_param_id1;
assign m01_axi_aruser = axiinterface1_ar_param_user1;
assign axiinterface1_ar_ready1 = m01_axi_arready;
assign axiinterface1_r_valid1 = m01_axi_rvalid;
assign axiinterface1_r_payload_resp1 = m01_axi_rresp;
assign axiinterface1_r_payload_data1 = m01_axi_rdata;
assign axiinterface1_r_param_id1 = m01_axi_rid;
assign axiinterface1_r_param_user1 = m01_axi_ruser;
assign axiinterface1_r_last1 = m01_axi_rlast;
assign m01_axi_rready = axiinterface1_r_ready1;
assign m02_axi_awvalid = axiinterface2_aw_valid1;
assign m02_axi_awaddr = axiinterface2_aw_payload_addr1;
assign m02_axi_awburst = axiinterface2_aw_payload_burst1;
assign m02_axi_awlen = axiinterface2_aw_payload_len1;
assign m02_axi_awsize = axiinterface2_aw_payload_size1;
assign m02_axi_awlock = axiinterface2_aw_payload_lock1;
assign m02_axi_awprot = axiinterface2_aw_payload_prot1;
assign m02_axi_awcache = axiinterface2_aw_payload_cache1;
assign m02_axi_awqos = axiinterface2_aw_payload_qos1;
assign m02_axi_awregion = axiinterface2_aw_payload_region1;
assign m02_axi_awid = axiinterface2_aw_param_id1;
assign m02_axi_awuser = axiinterface2_aw_param_user1;
assign axiinterface2_aw_ready1 = m02_axi_awready;
assign m02_axi_wvalid = axiinterface2_w_valid1;
assign m02_axi_wdata = axiinterface2_w_payload_data1;
assign m02_axi_wstrb = axiinterface2_w_payload_strb1;
assign m02_axi_wuser = axiinterface2_w_param_user1;
assign m02_axi_wlast = axiinterface2_w_last1;
assign axiinterface2_w_ready1 = m02_axi_wready;
assign axiinterface2_b_valid1 = m02_axi_bvalid;
assign axiinterface2_b_payload_resp1 = m02_axi_bresp;
assign axiinterface2_b_param_id1 = m02_axi_bid;
assign axiinterface2_b_param_user1 = m02_axi_buser;
assign m02_axi_bready = axiinterface2_b_ready1;
assign m02_axi_arvalid = axiinterface2_ar_valid1;
assign m02_axi_araddr = axiinterface2_ar_payload_addr1;
assign m02_axi_arburst = axiinterface2_ar_payload_burst1;
assign m02_axi_arlen = axiinterface2_ar_payload_len1;
assign m02_axi_arsize = axiinterface2_ar_payload_size1;
assign m02_axi_arlock = axiinterface2_ar_payload_lock1;
assign m02_axi_arprot = axiinterface2_ar_payload_prot1;
assign m02_axi_arcache = axiinterface2_ar_payload_cache1;
assign m02_axi_arqos = axiinterface2_ar_payload_qos1;
assign m02_axi_arregion = axiinterface2_ar_payload_region1;
assign m02_axi_arid = axiinterface2_ar_param_id1;
assign m02_axi_aruser = axiinterface2_ar_param_user1;
assign axiinterface2_ar_ready1 = m02_axi_arready;
assign axiinterface2_r_valid1 = m02_axi_rvalid;
assign axiinterface2_r_payload_resp1 = m02_axi_rresp;
assign axiinterface2_r_payload_data1 = m02_axi_rdata;
assign axiinterface2_r_param_id1 = m02_axi_rid;
assign axiinterface2_r_param_user1 = m02_axi_ruser;
assign axiinterface2_r_last1 = m02_axi_rlast;
assign m02_axi_rready = axiinterface2_r_ready1;
assign m03_axi_awvalid = axiinterface3_aw_valid1;
assign m03_axi_awaddr = axiinterface3_aw_payload_addr1;
assign m03_axi_awburst = axiinterface3_aw_payload_burst1;
assign m03_axi_awlen = axiinterface3_aw_payload_len1;
assign m03_axi_awsize = axiinterface3_aw_payload_size1;
assign m03_axi_awlock = axiinterface3_aw_payload_lock1;
assign m03_axi_awprot = axiinterface3_aw_payload_prot1;
assign m03_axi_awcache = axiinterface3_aw_payload_cache1;
assign m03_axi_awqos = axiinterface3_aw_payload_qos1;
assign m03_axi_awregion = axiinterface3_aw_payload_region1;
assign m03_axi_awid = axiinterface3_aw_param_id1;
assign m03_axi_awuser = axiinterface3_aw_param_user1;
assign axiinterface3_aw_ready1 = m03_axi_awready;
assign m03_axi_wvalid = axiinterface3_w_valid1;
assign m03_axi_wdata = axiinterface3_w_payload_data1;
assign m03_axi_wstrb = axiinterface3_w_payload_strb1;
assign m03_axi_wuser = axiinterface3_w_param_user1;
assign m03_axi_wlast = axiinterface3_w_last1;
assign axiinterface3_w_ready1 = m03_axi_wready;
assign axiinterface3_b_valid1 = m03_axi_bvalid;
assign axiinterface3_b_payload_resp1 = m03_axi_bresp;
assign axiinterface3_b_param_id1 = m03_axi_bid;
assign axiinterface3_b_param_user1 = m03_axi_buser;
assign m03_axi_bready = axiinterface3_b_ready1;
assign m03_axi_arvalid = axiinterface3_ar_valid1;
assign m03_axi_araddr = axiinterface3_ar_payload_addr1;
assign m03_axi_arburst = axiinterface3_ar_payload_burst1;
assign m03_axi_arlen = axiinterface3_ar_payload_len1;
assign m03_axi_arsize = axiinterface3_ar_payload_size1;
assign m03_axi_arlock = axiinterface3_ar_payload_lock1;
assign m03_axi_arprot = axiinterface3_ar_payload_prot1;
assign m03_axi_arcache = axiinterface3_ar_payload_cache1;
assign m03_axi_arqos = axiinterface3_ar_payload_qos1;
assign m03_axi_arregion = axiinterface3_ar_payload_region1;
assign m03_axi_arid = axiinterface3_ar_param_id1;
assign m03_axi_aruser = axiinterface3_ar_param_user1;
assign axiinterface3_ar_ready1 = m03_axi_arready;
assign axiinterface3_r_valid1 = m03_axi_rvalid;
assign axiinterface3_r_payload_resp1 = m03_axi_rresp;
assign axiinterface3_r_payload_data1 = m03_axi_rdata;
assign axiinterface3_r_param_id1 = m03_axi_rid;
assign axiinterface3_r_param_user1 = m03_axi_ruser;
assign axiinterface3_r_last1 = m03_axi_rlast;
assign m03_axi_rready = axiinterface3_r_ready1;


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

axi_interconnect #(
	.ADDR_WIDTH(32),
	.ARUSER_ENABLE(1'd1),
	.ARUSER_WIDTH(1),
	.AWUSER_ENABLE(1'd1),
	.AWUSER_WIDTH(1),
	.BUSER_ENABLE(1'd1),
	.BUSER_WIDTH(1),
	.DATA_WIDTH(32),
	.ID_WIDTH(8),
	.M_COUNT(4),
	.RUSER_ENABLE(1'd1),
	.RUSER_WIDTH(1),
	.S_COUNT(4),
	.WUSER_ENABLE(1'd1),
	.WUSER_WIDTH(1)
) axi_interconnect (
	.clk(sys_clk),
	.m_axi_arready({axiinterface3_ar_ready1, axiinterface2_ar_ready1, axiinterface1_ar_ready1, axiinterface0_ar_ready1}),
	.m_axi_awready({axiinterface3_aw_ready1, axiinterface2_aw_ready1, axiinterface1_aw_ready1, axiinterface0_aw_ready1}),
	.m_axi_bid({axiinterface3_b_param_id1, axiinterface2_b_param_id1, axiinterface1_b_param_id1, axiinterface0_b_param_id1}),
	.m_axi_bresp({axiinterface3_b_payload_resp1, axiinterface2_b_payload_resp1, axiinterface1_b_payload_resp1, axiinterface0_b_payload_resp1}),
	.m_axi_buser({axiinterface3_b_param_user1, axiinterface2_b_param_user1, axiinterface1_b_param_user1, axiinterface0_b_param_user1}),
	.m_axi_bvalid({axiinterface3_b_valid1, axiinterface2_b_valid1, axiinterface1_b_valid1, axiinterface0_b_valid1}),
	.m_axi_rdata({axiinterface3_r_payload_data1, axiinterface2_r_payload_data1, axiinterface1_r_payload_data1, axiinterface0_r_payload_data1}),
	.m_axi_rid({axiinterface3_r_param_id1, axiinterface2_r_param_id1, axiinterface1_r_param_id1, axiinterface0_r_param_id1}),
	.m_axi_rlast({axiinterface3_r_last1, axiinterface2_r_last1, axiinterface1_r_last1, axiinterface0_r_last1}),
	.m_axi_rresp({axiinterface3_r_payload_resp1, axiinterface2_r_payload_resp1, axiinterface1_r_payload_resp1, axiinterface0_r_payload_resp1}),
	.m_axi_ruser({axiinterface3_r_param_user1, axiinterface2_r_param_user1, axiinterface1_r_param_user1, axiinterface0_r_param_user1}),
	.m_axi_rvalid({axiinterface3_r_valid1, axiinterface2_r_valid1, axiinterface1_r_valid1, axiinterface0_r_valid1}),
	.m_axi_wready({axiinterface3_w_ready1, axiinterface2_w_ready1, axiinterface1_w_ready1, axiinterface0_w_ready1}),
	.rst(sys_rst),
	.s_axi_araddr({axiinterface3_ar_payload_addr0, axiinterface2_ar_payload_addr0, axiinterface1_ar_payload_addr0, axiinterface0_ar_payload_addr0}),
	.s_axi_arburst({axiinterface3_ar_payload_burst0, axiinterface2_ar_payload_burst0, axiinterface1_ar_payload_burst0, axiinterface0_ar_payload_burst0}),
	.s_axi_arcache({axiinterface3_ar_payload_cache0, axiinterface2_ar_payload_cache0, axiinterface1_ar_payload_cache0, axiinterface0_ar_payload_cache0}),
	.s_axi_arid({axiinterface3_ar_param_id0, axiinterface2_ar_param_id0, axiinterface1_ar_param_id0, axiinterface0_ar_param_id0}),
	.s_axi_arlen({axiinterface3_ar_payload_len0, axiinterface2_ar_payload_len0, axiinterface1_ar_payload_len0, axiinterface0_ar_payload_len0}),
	.s_axi_arlock({axiinterface3_ar_payload_lock0, axiinterface2_ar_payload_lock0, axiinterface1_ar_payload_lock0, axiinterface0_ar_payload_lock0}),
	.s_axi_arprot({axiinterface3_ar_payload_prot0, axiinterface2_ar_payload_prot0, axiinterface1_ar_payload_prot0, axiinterface0_ar_payload_prot0}),
	.s_axi_arqos({axiinterface3_ar_payload_qos0, axiinterface2_ar_payload_qos0, axiinterface1_ar_payload_qos0, axiinterface0_ar_payload_qos0}),
	.s_axi_arsize({axiinterface3_ar_payload_size0, axiinterface2_ar_payload_size0, axiinterface1_ar_payload_size0, axiinterface0_ar_payload_size0}),
	.s_axi_aruser({axiinterface3_ar_param_user0, axiinterface2_ar_param_user0, axiinterface1_ar_param_user0, axiinterface0_ar_param_user0}),
	.s_axi_arvalid({axiinterface3_ar_valid0, axiinterface2_ar_valid0, axiinterface1_ar_valid0, axiinterface0_ar_valid0}),
	.s_axi_awaddr({axiinterface3_aw_payload_addr0, axiinterface2_aw_payload_addr0, axiinterface1_aw_payload_addr0, axiinterface0_aw_payload_addr0}),
	.s_axi_awburst({axiinterface3_aw_payload_burst0, axiinterface2_aw_payload_burst0, axiinterface1_aw_payload_burst0, axiinterface0_aw_payload_burst0}),
	.s_axi_awcache({axiinterface3_aw_payload_cache0, axiinterface2_aw_payload_cache0, axiinterface1_aw_payload_cache0, axiinterface0_aw_payload_cache0}),
	.s_axi_awid({axiinterface3_aw_param_id0, axiinterface2_aw_param_id0, axiinterface1_aw_param_id0, axiinterface0_aw_param_id0}),
	.s_axi_awlen({axiinterface3_aw_payload_len0, axiinterface2_aw_payload_len0, axiinterface1_aw_payload_len0, axiinterface0_aw_payload_len0}),
	.s_axi_awlock({axiinterface3_aw_payload_lock0, axiinterface2_aw_payload_lock0, axiinterface1_aw_payload_lock0, axiinterface0_aw_payload_lock0}),
	.s_axi_awprot({axiinterface3_aw_payload_prot0, axiinterface2_aw_payload_prot0, axiinterface1_aw_payload_prot0, axiinterface0_aw_payload_prot0}),
	.s_axi_awqos({axiinterface3_aw_payload_qos0, axiinterface2_aw_payload_qos0, axiinterface1_aw_payload_qos0, axiinterface0_aw_payload_qos0}),
	.s_axi_awsize({axiinterface3_aw_payload_size0, axiinterface2_aw_payload_size0, axiinterface1_aw_payload_size0, axiinterface0_aw_payload_size0}),
	.s_axi_awuser({axiinterface3_aw_param_user0, axiinterface2_aw_param_user0, axiinterface1_aw_param_user0, axiinterface0_aw_param_user0}),
	.s_axi_awvalid({axiinterface3_aw_valid0, axiinterface2_aw_valid0, axiinterface1_aw_valid0, axiinterface0_aw_valid0}),
	.s_axi_bready({axiinterface3_b_ready0, axiinterface2_b_ready0, axiinterface1_b_ready0, axiinterface0_b_ready0}),
	.s_axi_rready({axiinterface3_r_ready0, axiinterface2_r_ready0, axiinterface1_r_ready0, axiinterface0_r_ready0}),
	.s_axi_wdata({axiinterface3_w_payload_data0, axiinterface2_w_payload_data0, axiinterface1_w_payload_data0, axiinterface0_w_payload_data0}),
	.s_axi_wlast({axiinterface3_w_last0, axiinterface2_w_last0, axiinterface1_w_last0, axiinterface0_w_last0}),
	.s_axi_wstrb({axiinterface3_w_payload_strb0, axiinterface2_w_payload_strb0, axiinterface1_w_payload_strb0, axiinterface0_w_payload_strb0}),
	.s_axi_wuser({axiinterface3_w_param_user0, axiinterface2_w_param_user0, axiinterface1_w_param_user0, axiinterface0_w_param_user0}),
	.s_axi_wvalid({axiinterface3_w_valid0, axiinterface2_w_valid0, axiinterface1_w_valid0, axiinterface0_w_valid0}),
	.m_axi_araddr({axiinterface3_ar_payload_addr1, axiinterface2_ar_payload_addr1, axiinterface1_ar_payload_addr1, axiinterface0_ar_payload_addr1}),
	.m_axi_arburst({axiinterface3_ar_payload_burst1, axiinterface2_ar_payload_burst1, axiinterface1_ar_payload_burst1, axiinterface0_ar_payload_burst1}),
	.m_axi_arcache({axiinterface3_ar_payload_cache1, axiinterface2_ar_payload_cache1, axiinterface1_ar_payload_cache1, axiinterface0_ar_payload_cache1}),
	.m_axi_arid({axiinterface3_ar_param_id1, axiinterface2_ar_param_id1, axiinterface1_ar_param_id1, axiinterface0_ar_param_id1}),
	.m_axi_arlen({axiinterface3_ar_payload_len1, axiinterface2_ar_payload_len1, axiinterface1_ar_payload_len1, axiinterface0_ar_payload_len1}),
	.m_axi_arlock({axiinterface3_ar_payload_lock1, axiinterface2_ar_payload_lock1, axiinterface1_ar_payload_lock1, axiinterface0_ar_payload_lock1}),
	.m_axi_arprot({axiinterface3_ar_payload_prot1, axiinterface2_ar_payload_prot1, axiinterface1_ar_payload_prot1, axiinterface0_ar_payload_prot1}),
	.m_axi_arqos({axiinterface3_ar_payload_qos1, axiinterface2_ar_payload_qos1, axiinterface1_ar_payload_qos1, axiinterface0_ar_payload_qos1}),
	.m_axi_arregion({axiinterface3_ar_payload_region1, axiinterface2_ar_payload_region1, axiinterface1_ar_payload_region1, axiinterface0_ar_payload_region1}),
	.m_axi_arsize({axiinterface3_ar_payload_size1, axiinterface2_ar_payload_size1, axiinterface1_ar_payload_size1, axiinterface0_ar_payload_size1}),
	.m_axi_aruser({axiinterface3_ar_param_user1, axiinterface2_ar_param_user1, axiinterface1_ar_param_user1, axiinterface0_ar_param_user1}),
	.m_axi_arvalid({axiinterface3_ar_valid1, axiinterface2_ar_valid1, axiinterface1_ar_valid1, axiinterface0_ar_valid1}),
	.m_axi_awaddr({axiinterface3_aw_payload_addr1, axiinterface2_aw_payload_addr1, axiinterface1_aw_payload_addr1, axiinterface0_aw_payload_addr1}),
	.m_axi_awburst({axiinterface3_aw_payload_burst1, axiinterface2_aw_payload_burst1, axiinterface1_aw_payload_burst1, axiinterface0_aw_payload_burst1}),
	.m_axi_awcache({axiinterface3_aw_payload_cache1, axiinterface2_aw_payload_cache1, axiinterface1_aw_payload_cache1, axiinterface0_aw_payload_cache1}),
	.m_axi_awid({axiinterface3_aw_param_id1, axiinterface2_aw_param_id1, axiinterface1_aw_param_id1, axiinterface0_aw_param_id1}),
	.m_axi_awlen({axiinterface3_aw_payload_len1, axiinterface2_aw_payload_len1, axiinterface1_aw_payload_len1, axiinterface0_aw_payload_len1}),
	.m_axi_awlock({axiinterface3_aw_payload_lock1, axiinterface2_aw_payload_lock1, axiinterface1_aw_payload_lock1, axiinterface0_aw_payload_lock1}),
	.m_axi_awprot({axiinterface3_aw_payload_prot1, axiinterface2_aw_payload_prot1, axiinterface1_aw_payload_prot1, axiinterface0_aw_payload_prot1}),
	.m_axi_awqos({axiinterface3_aw_payload_qos1, axiinterface2_aw_payload_qos1, axiinterface1_aw_payload_qos1, axiinterface0_aw_payload_qos1}),
	.m_axi_awregion({axiinterface3_aw_payload_region1, axiinterface2_aw_payload_region1, axiinterface1_aw_payload_region1, axiinterface0_aw_payload_region1}),
	.m_axi_awsize({axiinterface3_aw_payload_size1, axiinterface2_aw_payload_size1, axiinterface1_aw_payload_size1, axiinterface0_aw_payload_size1}),
	.m_axi_awuser({axiinterface3_aw_param_user1, axiinterface2_aw_param_user1, axiinterface1_aw_param_user1, axiinterface0_aw_param_user1}),
	.m_axi_awvalid({axiinterface3_aw_valid1, axiinterface2_aw_valid1, axiinterface1_aw_valid1, axiinterface0_aw_valid1}),
	.m_axi_bready({axiinterface3_b_ready1, axiinterface2_b_ready1, axiinterface1_b_ready1, axiinterface0_b_ready1}),
	.m_axi_rready({axiinterface3_r_ready1, axiinterface2_r_ready1, axiinterface1_r_ready1, axiinterface0_r_ready1}),
	.m_axi_wdata({axiinterface3_w_payload_data1, axiinterface2_w_payload_data1, axiinterface1_w_payload_data1, axiinterface0_w_payload_data1}),
	.m_axi_wlast({axiinterface3_w_last1, axiinterface2_w_last1, axiinterface1_w_last1, axiinterface0_w_last1}),
	.m_axi_wstrb({axiinterface3_w_payload_strb1, axiinterface2_w_payload_strb1, axiinterface1_w_payload_strb1, axiinterface0_w_payload_strb1}),
	.m_axi_wuser({axiinterface3_w_param_user1, axiinterface2_w_param_user1, axiinterface1_w_param_user1, axiinterface0_w_param_user1}),
	.m_axi_wvalid({axiinterface3_w_valid1, axiinterface2_w_valid1, axiinterface1_w_valid1, axiinterface0_w_valid1}),
	.s_axi_arready({axiinterface3_ar_ready0, axiinterface2_ar_ready0, axiinterface1_ar_ready0, axiinterface0_ar_ready0}),
	.s_axi_awready({axiinterface3_aw_ready0, axiinterface2_aw_ready0, axiinterface1_aw_ready0, axiinterface0_aw_ready0}),
	.s_axi_bid({axiinterface3_b_param_id0, axiinterface2_b_param_id0, axiinterface1_b_param_id0, axiinterface0_b_param_id0}),
	.s_axi_bresp({axiinterface3_b_payload_resp0, axiinterface2_b_payload_resp0, axiinterface1_b_payload_resp0, axiinterface0_b_payload_resp0}),
	.s_axi_buser({axiinterface3_b_param_user0, axiinterface2_b_param_user0, axiinterface1_b_param_user0, axiinterface0_b_param_user0}),
	.s_axi_bvalid({axiinterface3_b_valid0, axiinterface2_b_valid0, axiinterface1_b_valid0, axiinterface0_b_valid0}),
	.s_axi_rdata({axiinterface3_r_payload_data0, axiinterface2_r_payload_data0, axiinterface1_r_payload_data0, axiinterface0_r_payload_data0}),
	.s_axi_rid({axiinterface3_r_param_id0, axiinterface2_r_param_id0, axiinterface1_r_param_id0, axiinterface0_r_param_id0}),
	.s_axi_rlast({axiinterface3_r_last0, axiinterface2_r_last0, axiinterface1_r_last0, axiinterface0_r_last0}),
	.s_axi_rresp({axiinterface3_r_payload_resp0, axiinterface2_r_payload_resp0, axiinterface1_r_payload_resp0, axiinterface0_r_payload_resp0}),
	.s_axi_ruser({axiinterface3_r_param_user0, axiinterface2_r_param_user0, axiinterface1_r_param_user0, axiinterface0_r_param_user0}),
	.s_axi_rvalid({axiinterface3_r_valid0, axiinterface2_r_valid0, axiinterface1_r_valid0, axiinterface0_r_valid0}),
	.s_axi_wready({axiinterface3_w_ready0, axiinterface2_w_ready0, axiinterface1_w_ready0, axiinterface0_w_ready0})
);

endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2023-06-02 15:02:26.
//------------------------------------------------------------------------------


/*

Copyright (c) 2014-2021 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * Priority encoder module
 */
module priority_encoder #
(
    parameter WIDTH = 4,
    // LSB priority selection
    parameter LSB_HIGH_PRIORITY = 0
)
(
    input  wire [WIDTH-1:0]         input_unencoded,
    output wire                     output_valid,
    output wire [$clog2(WIDTH)-1:0] output_encoded,
    output wire [WIDTH-1:0]         output_unencoded
);

parameter LEVELS = WIDTH > 2 ? $clog2(WIDTH) : 1;
parameter W = 2**LEVELS;

// pad input to even power of two
wire [W-1:0] input_padded = {{W-WIDTH{1'b0}}, input_unencoded};

wire [W/2-1:0] stage_valid[LEVELS-1:0];
wire [W/2-1:0] stage_enc[LEVELS-1:0];

generate
    genvar l, n;

    // process input bits; generate valid bit and encoded bit for each pair
    for (n = 0; n < W/2; n = n + 1) begin : loop_in
        assign stage_valid[0][n] = |input_padded[n*2+1:n*2];
        if (LSB_HIGH_PRIORITY) begin
            // bit 0 is highest priority
            assign stage_enc[0][n] = !input_padded[n*2+0];
        end else begin
            // bit 0 is lowest priority
            assign stage_enc[0][n] = input_padded[n*2+1];
        end
    end

    // compress down to single valid bit and encoded bus
    for (l = 1; l < LEVELS; l = l + 1) begin : loop_levels
        for (n = 0; n < W/(2*2**l); n = n + 1) begin : loop_compress
            assign stage_valid[l][n] = |stage_valid[l-1][n*2+1:n*2];
            if (LSB_HIGH_PRIORITY) begin
                // bit 0 is highest priority
                assign stage_enc[l][(n+1)*(l+1)-1:n*(l+1)] = stage_valid[l-1][n*2+0] ? {1'b0, stage_enc[l-1][(n*2+1)*l-1:(n*2+0)*l]} : {1'b1, stage_enc[l-1][(n*2+2)*l-1:(n*2+1)*l]};
            end else begin
                // bit 0 is lowest priority
                assign stage_enc[l][(n+1)*(l+1)-1:n*(l+1)] = stage_valid[l-1][n*2+1] ? {1'b1, stage_enc[l-1][(n*2+2)*l-1:(n*2+1)*l]} : {1'b0, stage_enc[l-1][(n*2+1)*l-1:(n*2+0)*l]};
            end
        end
    end
endgenerate

assign output_valid = stage_valid[LEVELS-1];
assign output_encoded = stage_enc[LEVELS-1];
assign output_unencoded = 1 << output_encoded;

endmodule

`resetall
