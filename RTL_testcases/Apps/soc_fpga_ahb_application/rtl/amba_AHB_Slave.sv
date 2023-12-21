//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  AMBA AHB bus slave model (simple memory model)                          //
//                                                                          //
//  Copyright (C) 2008  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This RTL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
`define AMBA_AHB_VER_3   // version 3 is supported

// AHB bus parameters
`define AW 32            // address bus width
`define DW 32            // data bus width
`ifdef AMBA_AHB_VER_3
`define RW 1             // response signal width
`elsif AMBA_AHB_VER_2
`define RW 2             // response signal width
`endif
`define DE "BIG"         // endianness ("BIG" or "LITTLE")

// HWRITE      Transfer direction
`define H_READ       1'b0
`define H_WRITE      1'b1

// HTRAN[1:0]  Transfer Type
`define H_IDLE       2'b00   // Indicates that no data transfer is required
`define H_BUSY       2'b01   // The BUSY transfer type enables masters to insert idle cycles in the middle of a burst
`define H_NONSEQ     2'b10   // Indicates a single transfer or the first transfer of a burst
`define H_SEQ        2'b11   // The remaining transfers in a burst are SEQUENTIAL

// HSIZE[2:0]  Transfer Size
`define H_SIZE_8     3'b000
`define H_SIZE_16    3'b001
`define H_SIZE_32    3'b010
`define H_SIZE_64    3'b011
`define H_SIZE_128   3'b100
`define H_SIZE_256   3'b101
`define H_SIZE_512   3'b110
`define H_SIZE_1024  3'b111

// HBURST[2:0] Burst Type
`define H_SINGLE     3'b000  // Single burst
`define H_INCR       3'b001  // Incrementing burst of undefined length
`define H_WRAP4      3'b010  // 4-beat wrapping burst
`define H_INCR4      3'b011  // 4-beat incrementing burst
`define H_WRAP8      3'b100  // 8-beat wrapping burst
`define H_INCR8      3'b101  // 8-beat incrementing burst
`define H_WRAP16     3'b110  // 16-beat wrapping burst
`define H_INCR16     3'b111  // 16-beat incrementing burst

// HRESP       Transfer Response
`ifdef AMBA_AHB_VER_3
`define H_OKAY    1'b0       //
`define H_ERROR   1'b1       //
`elsif AMBA_AHB_VER_2
`define H_OKAY    2'b00
`define H_ERROR   2'b01
`endif
`define H_RETRY   2'b10      //
`define H_SPLIT   2'b11      //


module amba_ahb_slave #(
  // bus paramaters
  parameter AW = `AW,    // address bus width
  parameter DW = `DW,    // data bus width
  parameter DE = `DE,    // endianess
  parameter RW = `RW,    // response width
  // memory parameters
  parameter MS = 1024,  // memory size (in Bytes)
  parameter AM = {10{1'b1}},  // address mask
  // write and read latencies for sequential and nonsequential accesses
  parameter LW_NS = 0,  // write latency for nonsequential transfers
  parameter LW_S  = 0,  // write latency for sequential transfers
  parameter LR_NS = 0,  // read latency for nonsequential transfers
  parameter LR_S  = 0   // read latency for sequential transfers
)(
  // AMBA AHB system signals
  input  wire          hclk,     // Bus clock
  input  wire          hresetn,  // Reset (active low)
  // AMBA AHB decoder signal
  input  wire          hsel,     // Slave select
  // AMBA AHB master signals
  input  wire [AW-1:0] haddr,    // Address bus
  input  wire    [1:0] htrans,   // Transfer type
  input  wire          hwrite,   // Transfer direction
  input  wire    [2:0] hsize,    // Transfer size
  input  wire    [2:0] hburst,   // Burst type
  input  wire    [3:0] hprot,    // Protection control
  input  wire [DW-1:0] hwdata,   // Write data bus
  // AMBA AHB slave signals
  output wire [DW-1:0] hrdata,   // Read data bus
  output reg           hready,   // Transfer done
  output reg  [RW-1:0] hresp,    // Transfer response
  // slave control signal
  
  output hmastlock,
  output [3:0] hwbe,
  input  wire           error     // request an error response wire
);

//////////////////////////////////////////////////////////////////////////////
// local parameters and signals                                             //
//////////////////////////////////////////////////////////////////////////////

localparam SW = DW/8;  // byte select width (data bus width in Bytes)

// slave control signal
wire           error_req;   //wor

assign error_req = 1'b0;
assign error_req = error;          // default error value

// cycle and burst length couners
// TODO should be integers
wire [32-1:0] delay;    // expected delay for observed cycle
wire [32-1:0] cnt_t;    // time counter reload input
reg  [32-1:0] cnt_t_r;  // time counter register

// registered AHB input signals
reg           hsel_r;
reg  [AW-1:0] haddr_r;
reg     [1:0] htrans_r;
reg           hwrite_r;
reg     [2:0] hsize_r;
reg     [2:0] hburst_r;
reg     [2:0] hprot_r;

// slave memory
reg     [31:0] mem;

genvar i;

wire    [7:0] bytes;
wire [DW-1:0] wdata;    // write data buse used for endian byte swap
wire [DW-1:0] rdata;    // read data buse used for endian byte swap
wire          trn;      // read or write transfer
wire          trn_reg;  // transfer request
wire          trn_ack;  // transfer acknowledge
wire [31:0] adder;
//////////////////////////////////////////////////////////////////////////////
// pipelining input signals                                                 //
//////////////////////////////////////////////////////////////////////////////

always @(negedge hresetn, posedge hclk)
if (~hresetn) begin
  htrans_r <= `H_IDLE;
end else if (hready) begin
  hsel_r   <= hsel;
  haddr_r  <= haddr;
  htrans_r <= htrans;
  hwrite_r <= hwrite;
  hsize_r  <= hsize;
  hburst_r <= hburst;
  hprot_r  <= hprot;
end

//////////////////////////////////////////////////////////////////////////////
// slave response timing                                                    //
//////////////////////////////////////////////////////////////////////////////

// cycle and burst length couners
// generating the response signals with the proper timing
always @(negedge hresetn, posedge hclk)
if (~hresetn) begin
  cnt_t_r <= 0;
  hready  <= 1'b1;
  hresp   <= `H_OKAY;
end else begin
  // apply a new value to the counter register
  cnt_t_r <= cnt_t;
  // error response: wait periods + two ERROR periods
  if (error) begin
    if (hready) begin
      if ((htrans == `H_IDLE) | (htrans == `H_BUSY)) begin
        hresp   <= `H_OKAY;
        hready  <= 1'b1;
      end
      if ((htrans == `H_NONSEQ) | (htrans == `H_SEQ)) begin
        hresp   <= (cnt_t == 0) ? `H_ERROR : `H_OKAY;
        hready  <= 1'b0;
      end
    end else begin
      if ((htrans_r == `H_NONSEQ) | (htrans_r == `H_SEQ)) begin
        if (hresp == `H_OKAY) begin
          hresp   <= (cnt_t == 0) ? `H_ERROR : `H_OKAY;
        end else begin
          hready  <= 1'b1;
        end
      end
    end
  // okay response: wait periods + one OKAY period
  end else begin
    hresp   <= `H_OKAY;
    hready  <= (cnt_t == 0);
  end
end

assign delay = htrans[0] ? (hwrite ? LW_S  : LR_S )
                         : (hwrite ? LW_NS : LR_NS);

assign cnt_t = hready ? (htrans[1] & hsel ? delay
                                          : 0)
                      : cnt_t_r - 1;

//////////////////////////////////////////////////////////////////////////////
// memory and data bus implementation                                       //
//////////////////////////////////////////////////////////////////////////////

assign trn_req = ((htrans_r == `H_NONSEQ) | (htrans_r == `H_SEQ)) & hsel_r;
assign trn_ack = hready;
assign trn     = trn_req & trn_ack;

assign bytes = 1 << hsize_r;
assign  wdata  = hwdata ;
assign hrdata = (haddr[3:0]==4'h8) ? rdata:(haddr[3:0]==4'h4)?mem:0 ;
//assign hrdata =rdata;
// endian byte swap
/*
generate
  for (i=0; i<SW; i=i+1) begin
    if (DE == "BIG") begin
      assign  wdata [DW-1-8*i-:8] = hwdata [8*i+:8];
      assign hrdata [DW-1-8*i-:8] =  rdata [8*i+:8];
    end else if (DE == "LITTLE") begin
      assign  wdata [     8*i+:8] = hwdata [8*i+:8];
      assign hrdata [     8*i-:8] =  rdata [8*i+:8];
    end
  end
endgenerate
*/
// write to memory
//generate
 // for (i=0; i<SW; i=i+1) begin
    always @(posedge hclk) begin
      if ((trn & (hresp == `H_OKAY) & hwrite_r)) begin
  //      if (((haddr_r&AM)%SW <= i) & (i < ((haddr_r&AM)%SW + bytes))) 
         mem  <= wdata;
      end
    end
 // end
//endgenerate

// read from memory
//generate
//  for (i=0; i<SW; i=i+1) begin
  //  assign rdata  = (trn & (hresp == `H_OKAY) & ~hwrite_r) ?({15'b000000000000000, adder})  : 32'h00 ;
  assign rdata  = (trn & (hresp == `H_OKAY) & ~hwrite_r) ? adder  : 32'h00 ;
  //    assign rdata  = (trn & (hresp == `H_OKAY) & ~hwrite_r) ? mem  : 32'h00 ;
//  end
//endgenerate
assign adder= mem[31:16]+mem[15:0];

endmodule
