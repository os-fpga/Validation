// Code your design here
//----------------------------------------------------------------
//
//  Project     : LM IP Development 
//  Module      : AHB master and Slave testbench 
//  Description :
//  Version     :     
//  Date        : 
//  
//----------------------------------------------------------------
/*


To do: test h_ready
    
*/

//`include "defines.v"
//`include "../rtl/ahb_master_synthesizable.sv"
	
//`include "assertions.sv"
//`include "ahb_master.sv"
//`include "amba_ahb_defines.v"
//`include "dec_mux.sv"
//`include "slave_memory.sv"




`define DATA_WIDTH 32
`define ADDR_WIDTH 32

/////////////////////////////////////////////////////////
///////////////// APB signal parameters /////////////////
/////////////////////////////////////////////////////////

`define ADDR_WDTH 32
`define DAT_WDTH 32
`define GRANULARITY 8
`define SLV 8
`define STRB_SIZE (`DAT_WDTH/`GRANULARITY)
`define SEL_WDTH $clog2(`SLV)

`define DATA_WIDTH 32
`define ADDR_WIDTH 32

/////////////////////////////////////////////////////////
///////////////// APB signal parameters /////////////////
/////////////////////////////////////////////////////////

`define ADDR_WDTH 32
`define DAT_WDTH 32
`define GRANULARITY 8
`define SLV 8
`define STRB_SIZE (`DAT_WDTH/`GRANULARITY)
`define SEL_WDTH $clog2(`SLV)

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


module dec_mux 
(
input               h_clk,
input wire  [`ADDR_WIDTH-1:0]  haddr,
input wire  [`DATA_WIDTH-1:0]  hrdata_1,
input wire  [`DATA_WIDTH-1:0]  hrdata_2,
input wire  [`DATA_WIDTH-1:0]  hrdata_3,
input wire          hreadyout_1,
input wire          hreadyout_2,
input wire          hreadyout_3,
input wire          hresp_1,
input wire          hresp_2,
input wire          hresp_3,
output wire [`DATA_WIDTH-1:0]  hrdata,
output wire         hresp,
output wire         hready,
output logic        h_sel_1,
output logic        h_sel_2,
output logic        h_sel_3
);

wire hsel_1;
wire hsel_2;
wire hsel_3;

reg mux_sel1;
reg mux_sel2;
reg mux_sel3;

parameter ST_S1 = 1;
parameter ED_S1 = 4026531840;
parameter ST_S2 = 257;
parameter ED_S2 = 400;
parameter ST_S3 = 401;
parameter ED_S3 = 600;

//decoder
//assign hsel_1 = haddr==='hAxxxxxxx ? 1'b0:((haddr >= ST_S1) && (haddr <= ED_S1))?1'b1:1'b0; 
assign hsel_1 = haddr[31:28]==4'hA  ?  1'b1:1'b0;
assign hsel_2 = haddr==='bx ? 1'b0:(haddr >= ST_S2) && (haddr <= ED_S2)?1'b1:1'b0;
assign hsel_3 = haddr==='bx ? 1'b0:(haddr >= ST_S3) && (haddr <= ED_S3)?1'b1:1'b0;

always  @(posedge h_clk) begin
  h_sel_1 = hsel_1;
  h_sel_2 = hsel_2;
  h_sel_3 = hsel_3;
end
/*
always @(posedge h_clk)
  begin
    mux_sel1 <= hsel_1;
    mux_sel2 <= hsel_2;
    mux_sel3 <= hsel_3;
  end
*/
//mux
assign hrdata =  ((h_sel_1 && hreadyout_1) ? hrdata_1 : ((h_sel_2 && hreadyout_2) ? hrdata_2 : 
		         ((h_sel_3 && hreadyout_3) ? hrdata_3 : 32'bz)));
assign hresp  =  h_sel_1 ? hresp_1 : (h_sel_2 ? hresp_2 : (h_sel_3 ? hresp_3 : 1'bz));

assign hready =  h_sel_1 ? hreadyout_1 : (h_sel_2 ? hreadyout_2 : (h_sel_3 ? hreadyout_3 : 1'b0));

endmodule


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


module ahb_master(                           // module declaration

     ///// Global inputs /////
  input logic			h_clk,		                    // clock
  input logic			h_reset,	                    // Active low reset

    ///// AHB Master inputs from slave /////
  input logic			h_ready,	                 		// When HIGH, it indicates to the master that 
																								//  previous transfer is complete			
  input logic			h_resp,		                 		// When HIGH, the h_resp signal indicates  that 
																								// the transfer status is ERROR
  input logic  [`DATA_WIDTH-1:0]	h_rdata,	 		// Data during read operation
		
    ///// AHB Master outputs /////		
  output logic [`ADDR_WIDTH-1:0]	h_addr,		 		// The 32-bit system address bus 
  output logic [2:0] 	            h_burst,	    // signal is hardcoded to '000 as no burst 
																								// operation is being implemented	
  output logic [2:0] 	h_size,		             		// Indicates the size of the transfer, '010 
																								// for word transfer
  output logic [1:0] 	h_trans,	             		// Indicates the transfer type of the current  
																								// transfer IDLE('00) and NON-SEQ('10) in this case
  output logic [`DATA_WIDTH-1:0]	h_wdata,	 		// Data to write			
  output logic		h_write ,	                 		// Indicates R/W req.

    ///// AHB Master Driving inputs /////
  input   logic        oprtn_req,            		// backend module request 
  input   logic        opr_type,                // for Write operation
  input   logic [`ADDR_WIDTH-1:0] addr,      	  // destination Address  
  input   logic [`DATA_WIDTH-1:0] wdata,     		// write data   
  output  logic [`DATA_WIDTH-1:0] read_data, 		// read data    
  input   logic [2:0]  size,                 		// size of transfer
  input   logic [2:0]  burst,                		// burst mode 
  input   logic     	 mastr_lock,            	// Master lock signal
  input 	logic		tr_cease,

  output logic tr_done    
);
///// internal signals /////    
  logic [`ADDR_WIDTH-1:0] in_addr0;             // to capture address 
  logic [`ADDR_WIDTH-1:0] in_addr;              // to configure address 
  logic [`ADDR_WIDTH-1:0] incrtd_addr;          // to configure address 
  logic [`ADDR_WIDTH-1:0] incrtd_addr_wrp; 
  logic [`DATA_WIDTH-1:0] in_wdata;             // to capturer wdata
  logic [`DATA_WIDTH-1:0] wdata_ff;             // to flop in_wdata 
  logic [`DATA_WIDTH-1:0] wdata_ff0;
  
  logic h_write_ff0;
  logic h_ready_ff0;
  logic h_write_ff;                             // flopped h_write signal
  logic h_ready_ff;                             // flopped h_ready signal
      											// transfer done
 // logic tr_cease;         											// transfer cease               

// control signals from fsm to datapath
  logic in_idle;                                // in IDLE state
  logic in_brstconfig;                          // in BURST configuration state
  logic in_busy;                                // in BUSY state    
  logic start_tr;                               // starting the operation
  logic start_tr2;
  logic next_tr;                                // signal to check whether or not start next transfer 
  logic beat_count_strt;
  logic addr_incr_strt;
  logic addr_incr_strt_wrp;
  logic in_oprtn_req;
  logic nxt_brst_wdata_pick;
  // BURST count variables 
  logic [4:0] beat_count;         							// address increment (* also determines the limit for undefine iNCR request)
  logic [4:0] addr_incr;          							// Increment value in Burst mode 

// WRAPPING BURST count variables						
  logic [31:0] lwb_wrap_addr;    						    // lower boundry wrap around  
  logic [31:0] upper_wrap_addr;    							// upper boundry wrap around
  logic [31:0] addr_holder;
  //logic [31:0] wrap16_addr_bits;   							 
  logic [3:0] size_value;         							// size value to increment in addr
  logic [4:0] burst_value;
///// states enum type  /////
  localparam [1:0] IDLES		=0;                 // IDLE state
  localparam [1:0] BRSTMCONF	=1;               // BURST Configuration state
  localparam [1:0] BUSYS		=2;                 // enum type name 
  localparam [1:0] IDLESB		=3;                 // enum type name 
  
  logic [1:0] state;
  
// HTRANS
  localparam [1:0] IDLE   = 0;		              // IDLE Transfer type							
  localparam [1:0] BUSY   = 1;                  // BUSY transfer type
  localparam [1:0] NONSEQ = 2;                  // NON-SEQ transfer type (single transfer )
  localparam [1:0] SEQ    = 3;                  // SEQUENTIAL transfer type
  
// HBURST 
  localparam [2:0] SINGLE = 0;                  // Single burst type
  localparam [2:0] INCR   = 1;                  // Undefine size burst
  localparam [2:0] WRAP4  = 2;                  // 4 beat Wrape around burst
  localparam [2:0] INCR4  = 3;                  // 4 beat increment burst
  localparam [2:0] WRAP8  = 4;                  // 8 beat Wrape around burst
  localparam [2:0] INCR8  = 5;                  // 8 beat increment burst
  localparam [2:0] WRAP16 = 6;                  // beat Wrape around burst
  localparam [2:0] INCR16 = 7;                  // 16 beat increment burst

// HSIZE
  localparam [2:0] BYTE   = 0;                  // byte size data 
  localparam [2:0] HWORD  = 1;                  // half word size data
  localparam [2:0] WORD   = 2;                  // word size data
  

///// state transition logic /////
  always @(posedge h_clk ) begin
      if(!h_reset)                                                // Active Low Reset
        state <= IDLES;                         
      else                                                        // State transitions      
        begin           
          case(state)
            IDLES:                                // IDLE state
              begin
                if (in_oprtn_req && h_ready && !tr_cease)
                  state <= BRSTMCONF;
                else if(tr_cease)
                  state <= BUSYS;  
                else if((h_ready) !== 'b1)
                  state <= IDLESB;
                else  
                  state <= IDLES;                      
              end
            IDLESB:                                // IDLE state
              begin
                if(tr_cease)
                  state <= BUSYS;  
                else if (in_oprtn_req && h_ready)
                  state <= BRSTMCONF;                 
                else 
                  state <= IDLESB;                         
              end  
            BRSTMCONF:                            // BRSTMCONF state
              begin
                if ((tr_done && !oprtn_req )|| h_resp)
                  state <= IDLES;
                else if (tr_cease) 
                  state <= BUSYS;
                else
                  state <= BRSTMCONF;                   
              end
            BUSYS:                                // BUSY state
              begin
                if ((start_tr2 || h_resp) && !tr_cease)
                  state <= IDLES;
                else if (!tr_done && !tr_cease)
                  state <= BRSTMCONF; 
                else 
                  state <= BUSYS;                  
              end
            default : state <= IDLES; 
          endcase   
    end
  end
  ///// output function logic /////
  always_comb begin  
      case(state)
        IDLES:
         begin
          start_tr = 'b1;
          start_tr2= 'b1;
          in_idle = 'b1;
          in_brstconfig = 'b0;
          in_busy = 'b0;  
         end
        IDLESB:
          begin
            start_tr2= 'b1;
            start_tr = 'b0;
            in_idle = 'b1;
            in_brstconfig = 'b0;
            in_busy = 'b0; 
          end  
        BRSTMCONF:
         begin
           start_tr2= 'b0;
          start_tr = 'b0;
          in_idle = 'b0;
          in_brstconfig = 'b1;
          in_busy = 'b0;
         end
        BUSYS:
         begin
           start_tr2= 'b0;
          start_tr = 'b0;				
          in_idle = 'b0;
          in_brstconfig = 'b0;
          in_busy = 'b1;
         end
      endcase  
    end
	
  
 
  ///// pre decoding/////
   always @(*)
    begin
      if(in_oprtn_req)
        begin
           case(h_size)			                      // size value to do address allignment 
            BYTE:
              begin
                size_value <= 'd1;
              end
            HWORD:
              begin
                size_value <= 'd2;
              end
            WORD: 
              begin
                size_value <= 'd4;
              end
            default:size_value <= 'd4;
           endcase   
           if(h_burst != SINGLE)
            begin
              case(h_burst)
                WRAP4:  begin
                        burst_value <= 'd4;
                end
                WRAP8:begin
                  burst_value <='d8;
          
                end
                WRAP16:begin
                        burst_value <='d16;
                end
                default:begin
						      burst_value     <=  'b0;
                end
              endcase 
              lwb_wrap_addr   <= (in_addr0 / (size_value * burst_value))*(size_value * burst_value);
              upper_wrap_addr <= lwb_wrap_addr + (size_value * burst_value) - size_value;
            end 
           else
              begin
                lwb_wrap_addr       <=  'b0;
                upper_wrap_addr     <=  'b0;
					      burst_value         <=  'b0;
              end
        end
      else
        begin
          lwb_wrap_addr       <=  'b0;
          upper_wrap_addr     <=  'b0;
          size_value          <=  'b0;
			    burst_value         <=  'b0;
        end
        
    end
  ///// Data handling block /////
  always @(*)
    begin
      if (!h_write_ff  && h_ready_ff && !in_busy && in_oprtn_req) 
				begin
					read_data <= h_rdata;
					h_wdata <= h_wdata;        //  h_wdata <= 'bzz;
				end   
			else if (h_write_ff && h_ready_ff && !in_busy && in_oprtn_req)
				begin
					read_data <= read_data;       //  read_data <= 'bzz;
					h_wdata 	 <=  wdata_ff;
				end 
      else  
        begin
					read_data <= read_data;            //  read_data <= 'bzz; 
					h_wdata 	 <=  h_wdata;
				end 
    end
  ///// h_addr flop/////
  always @(posedge h_clk) 
    begin
      if(!h_reset)
      addr_holder = 'd0;
      else
      addr_holder = h_addr;
    end
  ///// Data Path /////
  always@(*)
    	begin
      if(!oprtn_req)
        in_addr = 'b0;
      else  
      in_addr = in_addr0; 
		  ///////////////////////////////////////////////////////////////////////////////////	
			if(in_idle)                               // IDLE state Configs
        begin
          if(in_oprtn_req)
            begin              
              h_trans <= NONSEQ;
              if(h_burst != SINGLE)
                begin
                  beat_count_strt <= 'b1;
                  addr_incr_strt  <='b1;
                  nxt_brst_wdata_pick = 'b1;
		              next_tr <= 1;
                end
              else
                begin
                  beat_count_strt <= 'b0;
                  addr_incr_strt  <='b0;
                  nxt_brst_wdata_pick = 'b0;
                  if(h_ready)
		                next_tr <= 0;
                  else 
                   next_tr <= 1;
                end
            end
          else
            begin
              h_trans <= IDLE;
              next_tr <= 0;
              beat_count_strt <= 'b0;
              addr_incr_strt  <='b0;
              nxt_brst_wdata_pick = 'b0;              
            end          
          tr_done <= 'b0;                    // before going to BRSTMCONF state
          addr_incr_strt_wrp<='b0;
          if(oprtn_req)
            begin
              h_addr  <= in_addr0;
              h_trans <= NONSEQ;
            end
          else 
            begin
              h_addr  <= 'd0;
              h_trans <= IDLE;
            end
        end
      ///////////////////////////////////////////////////////////////////////////////////
			else if(in_brstconfig)                    // BURST mode configuration  
				begin	
          if (h_ready || h_burst == SINGLE)
            begin
              case(h_burst)
                SINGLE: begin
                  beat_count_strt<= 'b0;
                  addr_incr_strt_wrp<='b0;
                  addr_incr_strt  <='b0;
                  nxt_brst_wdata_pick = 'b0;
                  if(h_ready)
                    begin
                      tr_done <= 'b1;
                      next_tr <= 0;
                    end
                  else
                    begin
                      tr_done <= 'b0;
                      next_tr <= 1;    
                    end 
                  
                end
                INCR:   begin                   // Undefine increment burst
                    if(!in_oprtn_req || (beat_count+'d1) == 'd31)
                      begin
                        tr_done <= 'b1;
                        addr_incr_strt  <='b0;
                        beat_count_strt <= 'b0;
                        nxt_brst_wdata_pick = 'b0;
                        next_tr <= 0;

                      end  
                    else  
                      begin
                        nxt_brst_wdata_pick = 'b1;
                        addr_incr_strt  <='b1;
                        tr_done <= 'b0;
                        beat_count_strt <= 'b1;
                        next_tr <= 'b1;

                      end
                        addr_incr_strt_wrp<='b0;                      
                   //        h_trans <= SEQ;		                    // h_trans becomes SEQ
                  end
                WRAP4:  begin                   // 4 beat wrapping burst
                  if(beat_count > 'd4 )  
                    begin
                      tr_done    <= 1;               // to jump to IDLE state
                      addr_incr_strt_wrp<='b0;
                      next_tr <= 'b0;
                      beat_count_strt <= 'b0;
                      nxt_brst_wdata_pick = 'b0;
                    end
                  else begin
                    nxt_brst_wdata_pick = 'b1;
                    tr_done <= 0; 
                    addr_incr_strt_wrp<='b1;
                    next_tr <= 'b1;
                    beat_count_strt <= 'b1;
                  end 
                    //     h_trans <= SEQ;		                    // h_trans becomes SEQ 
                    addr_incr_strt <= 'b0;
                  end
                INCR4:  begin                   // 4 beat increment burst
                    if((beat_count+'d1) > 'd5 )
                      begin
                        tr_done <= 'b1;
                        if(oprtn_req)
                          begin
                            addr_incr_strt<='b1;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b1;
                            nxt_brst_wdata_pick = 'b1;
                          end
                        else 
                          begin
                            addr_incr_strt<='b0;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b0;
                            nxt_brst_wdata_pick = 'b0;                          
                          end
                      end
                    else if ((beat_count+'d1) > 'd4 )
                      begin
                       
                        nxt_brst_wdata_pick = 'b1;
                        tr_done <= 'b0;
                        addr_incr_strt<='b1;
                        next_tr <= 'b0;
                        beat_count_strt <= 'b1;
                      end
                    else
                      begin
                        nxt_brst_wdata_pick = 'b1;
                        tr_done <= 'b0;
                        addr_incr_strt<='b1;
                        next_tr <= 'b1;
                        beat_count_strt <= 'b1;
                      end
                    //       h_trans <= SEQ;		                    // h_trans becomes SEQ 
                      addr_incr_strt_wrp  <= 'b0;
                  end
                WRAP8:  begin                   // 8 beat wrapping burst
                  if(beat_count > 'd8 )
                    begin
                        tr_done             <= 1;               // to jump to IDLE state
                        addr_incr_strt_wrp  <='b0;
                        next_tr <= 'b0;
                        beat_count_strt <= 'b0;
                        nxt_brst_wdata_pick = 'b0;
                    end
                  else
                    begin
                      nxt_brst_wdata_pick = 'b1;
                      tr_done <= 0;
                      addr_incr_strt_wrp <='b1;
                      next_tr <= 'b1;     
                      beat_count_strt <= 'b1;
                    end 
                    addr_incr_strt  <= 'b0;
                  //      h_trans <= SEQ;		                    // h_trans becomes SEQ 
                end
                INCR8:  begin                   // 8 beat increment burst
                  if((beat_count+'d1) > 'd9 )
                    begin
                      tr_done <= 1;               // to jump to IDLE state
                       if(oprtn_req)
                          begin
                            addr_incr_strt<='b1;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b1;
                            nxt_brst_wdata_pick = 'b1;
                          end
                        else 
                          begin
                            addr_incr_strt<='b0;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b0;
                            nxt_brst_wdata_pick = 'b0;                          
                          end
                      end
                  else if ((beat_count+'d1) > 'd8 )
                    begin
                     
                      nxt_brst_wdata_pick = 'b1;
                      tr_done <= 'b0;
                      addr_incr_strt<='b1;
                      next_tr <= 'b0;
                      beat_count_strt <= 'b1;
                    end
                  else
                    begin
                      nxt_brst_wdata_pick = 'b1;
                      addr_incr_strt<='b1;
                      tr_done <= 0;
                      next_tr <=  'b1;
                      beat_count_strt <= 'b1;
                    end
                    addr_incr_strt_wrp  <= 'b0;
                    //       h_trans <= SEQ;		                    // h_trans becomes SEQ 
                end
                WRAP16: begin                   // 16 beat wrapping burst
                  if(beat_count > 'd16 )
                    begin
                      tr_done <= 1;               // to jump to IDLE state
                      addr_incr_strt_wrp<='b0;
                      next_tr <=  'b0;  
                      beat_count_strt <= 'b0;
                      nxt_brst_wdata_pick = 'b0;  
                    end         
                  else
                    begin
                        nxt_brst_wdata_pick = 'b1;
                        tr_done <= 0; 
                        addr_incr_strt_wrp<='b1;
                        next_tr <=  'b1;
                        beat_count_strt <= 'b1;
                    end 
                    addr_incr_strt  <= 'b0;
                     //       h_trans <= SEQ;		                    // h_trans becomes SEQ
                end
                INCR16: begin                   // 16 beat increment burst
                  if((beat_count+'d1) > 'd17 )
                    begin
                      tr_done <= 'b1;               // to jump to IDLE state
                      if(oprtn_req)
                          begin
                            addr_incr_strt<='b1;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b1;
                            nxt_brst_wdata_pick = 'b1;
                          end
                        else 
                          begin
                            addr_incr_strt<='b0;
                            next_tr <= 'b1;
                            beat_count_strt <= 'b0;
                            nxt_brst_wdata_pick = 'b0;                          
                          end
                      end
                  else if ((beat_count+'d1) > 'd16 )
                    begin
                     
                      nxt_brst_wdata_pick = 'b1;
                      tr_done <= 'b0;
                      addr_incr_strt<='b1;
                      next_tr <= 'b0;
                      beat_count_strt <= 'b1;
                    end  
                  else
                    begin
                      nxt_brst_wdata_pick = 'b1;
                      tr_done <= 'b0;
                      addr_incr_strt<='b1;
                      beat_count_strt     <= 'b1;
                      next_tr <=  'b1;
                    end
                      addr_incr_strt_wrp  <= 'b0;
                      
                     // h_trans <= SEQ;		                    // h_trans becomes SEQ 
                end
              endcase
              if(oprtn_req && tr_done)
                begin
                  h_trans <= NONSEQ;
                end
              else if (oprtn_req && !tr_done) 
                begin
                  h_trans <= SEQ;
                end
              else 
                h_trans <= IDLE;

              if (tr_done && !oprtn_req)
                h_addr <= 'b0; 
              else if (tr_done) 
                h_addr  <= in_addr;
              else if(addr_incr_strt)
                h_addr  <= incrtd_addr;
              else if (addr_incr_strt_wrp) 
                h_addr <= incrtd_addr_wrp; 
                                  
              else
                h_addr  <= in_addr;                                         
            end          
            else
              begin					 
                h_trans             <= SEQ;	// h_trans becomes SEQ
                h_addr              <= addr_holder;
                beat_count_strt     <= 'b0;
                addr_incr_strt      <= 'b0;	
                addr_incr_strt_wrp  <='b0; 
                tr_done <=  'b0;      
                next_tr <=  'b0;   
                nxt_brst_wdata_pick = 'b0;  
              end
        end
		  ///////////////////////////////////////////////////////////////////////////////////
			else if(in_busy)                          // BUSY state configuration
				begin
            tr_done <= '0;
            if(tr_done)
              next_tr <= 'b0;
            else  
              next_tr <= 'b1;
            h_addr  <= addr_holder;
            h_trans <= BUSY;
         //   beat_count_strt<= 'b0;
         //   addr_incr_strt<='b0;	
          //  addr_incr_strt_wrp <='b0;	
            if(tr_cease !==1'b1)
              begin
            nxt_brst_wdata_pick = 'b1; 
             end
            else
              begin
                nxt_brst_wdata_pick = 'b0;
              end
      /*      if(tr_cease !==1'b1)
              begin
                addr_incr_strt<='b1;	
                addr_incr_strt_wrp <='b1;
            beat_count_strt<= 'b1;
              end
            else
              begin
       */         addr_incr_strt<='b0;	
                addr_incr_strt_wrp <='b0;
                beat_count_strt<= 'b0;
         //     end  
 
				end
      ///////////////////////////////////////////////////////////////////////////////////              
      else                                      // Undefine state
        begin
              tr_done <=0;
              next_tr <= 'b0;
              h_addr  <= in_addr0;
              h_trans <= 0;
			        beat_count_strt<= 'b0;
              addr_incr_strt<='b0;	
              addr_incr_strt_wrp<='b0;
              nxt_brst_wdata_pick = 'b0;

			  end
		end
  
  ///// driving ports to start the operation /////  
  always@(posedge h_clk ) 
    begin
      if(!next_tr && h_reset && (start_tr || start_tr2 || h_ready) && tr_cease !=='b1  && oprtn_req)
        begin
          h_write	      <= opr_type; 
          h_size 	      <= size; 
          h_burst	      <= burst;                                         
          in_addr0      <= addr;
          in_wdata      <= wdata;
          in_oprtn_req  <= oprtn_req;
        end
      else if (nxt_brst_wdata_pick && h_ready && tr_cease !=='b1  && oprtn_req) begin
          in_wdata      <= wdata;
          h_write	      <= h_write; 
          h_size 	      <= h_size; 
          h_burst	      <= h_burst;                                         
          in_addr0      <= in_addr0;
          in_oprtn_req  <= oprtn_req;
          
        end
      else if (!oprtn_req) begin
          in_wdata      <= 'b0;
          h_write	      <= 'b0; 
          h_size 	      <= 'b0; 
          h_burst	      <= 'b0;                                         
          in_addr0      <= 'b0;
          in_oprtn_req  <= 'b0;
      end  
      else
        begin
          h_write	      <= h_write; 
          h_size 	      <= h_size; 
          h_burst	      <= h_burst;                                          
          in_addr0      <= in_addr0;
          in_wdata      <= in_wdata;
          in_oprtn_req  <= in_oprtn_req;          			        
        end
 
    end
 
 
  ///// counter  /////  
  always @(posedge h_clk )
    begin
      if(!h_reset)
        begin
          beat_count <= 5'd1;
          incrtd_addr <= in_addr;
          incrtd_addr_wrp <=in_addr;
        end
      else 
        if(tr_done && !oprtn_req)
          begin
            beat_count <= 5'd1;
            incrtd_addr <= 'b0;
            incrtd_addr_wrp <='b0;
          end
        else if(tr_done)
          begin
            beat_count <= 5'd2;
            incrtd_addr <= in_addr + (5'd1*size_value);
      // ************************ to be tested      
            if (incrtd_addr_wrp + size_value > upper_wrap_addr)
                incrtd_addr_wrp <= lwb_wrap_addr;
              else
                if(addr_incr_strt_wrp)
                  incrtd_addr_wrp <= incrtd_addr_wrp + size_value;
                else 
                  incrtd_addr_wrp <= incrtd_addr_wrp;
          end
        else
          begin
            if(beat_count_strt && h_ready)
              beat_count <= beat_count + 5'd1;
            else 
              beat_count <= beat_count;
            if(addr_incr_strt)
              begin
                incrtd_addr <= in_addr + (beat_count*size_value);
              end
            else 
              incrtd_addr <= incrtd_addr;
        
            if(start_tr2)
              if ((in_addr + size_value) > upper_wrap_addr)
                incrtd_addr_wrp<= lwb_wrap_addr;
              else
                incrtd_addr_wrp <= in_addr + size_value;
            else
              if (in_busy)
                incrtd_addr_wrp <= incrtd_addr_wrp;
              else if (incrtd_addr_wrp + size_value > upper_wrap_addr)
                incrtd_addr_wrp <= lwb_wrap_addr;
              else
                if(addr_incr_strt_wrp)
                  incrtd_addr_wrp <= incrtd_addr_wrp + size_value;
                else 
                  incrtd_addr_wrp <= incrtd_addr_wrp;
          end
   
   end  
  ///// Flopping wdata, operation and h_ready signals /////  
   always @(posedge h_clk  )
    begin

          if (!h_reset)
          begin
            h_ready_ff <= 'd0;
            h_write_ff <= 'd0;            
            wdata_ff   <= 'd0;
          end
          else begin
            h_ready_ff <= h_ready;
            h_write_ff <= h_write;
            if(start_tr || h_ready)
              wdata_ff   <= in_wdata;
            else
            begin
              wdata_ff  <= wdata_ff;
            end            
          end	
    end

  endmodule


module tb_ahb_master_SC();

//	`define		DATA_WIDTH		32
//	`define		ADDR_WIDTH		32

  ///// Global inputs /////
	logic			              h_clk =0;                             //clock
	logic			              h_reset;                              // Active low reset
  ///// AHB Master inputs /////
	logic			              h_ready;                              // When HIGH, it indicates to the master that previous 
                                                  				    // transfer is complete			
	logic			              h_resp;	                            // When HIGH, the h_resp signal indicates  that the tra
                                                  			 	    // -nsfer status is ERROR
  logic [`DATA_WIDTH-1:0] h_rdata;              				    // Data during read operation

  ///// AHB Master outputs /////
  logic [`ADDR_WIDTH-1:0]	h_addr;	                // The 32-bit system address bus 
  logic [2:0] 	          	h_burst;                // signal is hardcoded to '000 as no burst operation is
                                                  // being implemented
  logic [2:0]            	h_size;	                          // Indicates the size of the transfer, '010 for word tr
                                                  // ansfer
  logic [1:0]           	h_trans;                          // Indicates the transfer type of the current transfer 
                                                  // - IDLE('00) and NON-SEQ('10) in this case
  logic [`DATA_WIDTH-1:0]	h_wdata;                // Data to write			
  logic	                        h_write;	                              // Indicates R/W req.
  logic                         apb_slverr=1'b0;
  
  // AHB Slave outputs //
  logic                   hreadyout_1;
  logic                   hreadyout_2;
  logic                   hreadyout_3;
                
  logic       [31:0]            h_rdata_1;
  logic       [31:0]            h_rdata_2;
  logic       [31:0]            h_rdata_3;
                
  logic                   h_resp_1;
  logic                   h_resp_2;
  logic                   h_resp_3;
  logic			  tr_cease;
  logic [31:0]haddr1;

  //// back end memory signals ////
  logic [31:0]w_data, r_data, m_addr;
  logic rd_en, wr_en;
  logic [3:0]mem_mask;

    ///// driving signals /////    
  logic                   oprtn_req;                         // Backend module request   
  logic                   opr_type;                          // For Write operation   
  logic [`ADDR_WIDTH-1:0] addr;                   // Destination Address  
  logic [`DATA_WIDTH-1:0] wdata;                  // Write data   
  logic [`DATA_WIDTH-1:0] read_data;              // Read data    
  logic [1:0]             trans;                              // transfer modes
  logic [2:0]             size;   
  logic [1:0] 		  size_value;                             // size of transfer
  logic [2:0]             burst;
  logic [31:0]	          burst_value;

  logic tr_done;  
//selection signals
logic h_sel_1, h_sel_2, h_sel_3;

ahb_master u_ahb_master(
  .h_clk        (h_clk        ),
  .h_reset      (h_reset      ),
  .h_ready      (hreadyout_1      ),   // hreadyout_1
  .h_resp       (h_resp       ),
  .h_rdata      (h_rdata      ),
  .h_addr       (h_addr       ),
  .h_burst      (h_burst      ),
  .h_size       (h_size       ),
  .h_trans      (h_trans      ),
  .h_wdata      (h_wdata      ),
  .h_write      (h_write      ),
  .oprtn_req    (oprtn_req    ),
  .opr_type     (opr_type     ),
  .addr         (addr         ),
  .wdata        (wdata        ),
  .size         (size         ),
  .read_data    (read_data    ),
  .burst        (burst        ),
  .tr_cease     (tr_cease     ),
  .tr_done      (tr_done)
);

amba_ahb_slave u_AhbSlave1(
  .hclk       (h_clk       ),
  .hresetn   (h_reset     ),
  .haddr      (h_addr      ),
  .hwrite     (h_write     ),
  .hsize      (h_size      ),
  .hburst     (h_burst     ),
  .htrans     (h_trans     ),
  .hready     (hreadyout_1   ),  //
  .hsel     (h_sel_1     ),
//  .apb_slverr  (apb_slverr  ),
  .hwdata     (h_wdata     ),
  .hrdata     (h_rdata_1     ),
  .hresp      (h_resp_1      )
 // .hready (hreadyout_1 ),
 // .addr        (m_addr),
  //.w_data      (w_data),
  //.r_data      (r_data),
//  .wr_en       (wr_en)
 // .mem_mask    (mem_mask)
);

/*
SlaveMem mem (
  .h_clk       (h_clk),
  .h_reset_n   (h_reset),
  .addr        (m_addr),
  .w_data      (w_data),
  .r_data      (r_data),
  .wr_en       (wr_en),
  .mem_mask    (mem_mask)
);

*/

/*AhbSlave u_AhbSlave2(
  .h_clk       (h_clk       ),
  .h_reset_n   (h_reset   ),
  .h_addr      (h_addr      ),
  .h_write     (h_write     ),
  .h_size      (h_size      ),
  .h_burst     (h_burst     ),
  .h_trans     (h_trans     ),
  .h_ready     (h_ready     ),
  .h_sel_0     (h_sel_2     ),
  .apb_slverr  (apb_slverr  ),
  .h_wdata     (h_wdata     ),
  .h_rdata    (  h_rdata_2    ),
  .h_resp      (h_resp_2       ),
  .h_ready_out (hreadyout_2  )
);

AhbSlave u_AhbSlave3(
  .h_clk       (h_clk       ),
  .h_reset_n   (h_reset   ),
  .h_addr      (h_addr      ),
  .h_write     (h_write     ),
  .h_size      (h_size      ),
  .h_burst     (h_burst     ),
  .h_trans     (h_trans     ),
  .h_ready     (h_ready     ),
  .h_sel_0     (h_sel_3     ),
  .apb_slverr  (apb_slverr  ),
  .h_wdata     (h_wdata     ),
  .h_rdata     (h_rdata_3 ),
  .h_resp       (h_resp_3    ),
  .h_ready_out ( hreadyout_3)
); */

                    
dec_mux u_dec_mux(
  .h_clk       (h_clk       ),
  .haddr       (h_addr      ),
  .hrdata_1    (h_rdata_1    ),
  .hrdata_2    (h_rdata_2    ),
  .hrdata_3    (h_rdata_3    ),
  .hreadyout_1 (hreadyout_1 ),
  .hreadyout_2 (hreadyout_2 ),
  .hreadyout_3 (hreadyout_3 ),
  .hresp_1     (h_resp_1     ),
  .hresp_2     (h_resp_2     ),
  .hresp_3     (h_resp_3     ),
  .hrdata      (h_rdata     ),
  .hresp       (h_resp      ),
  .hready      (h_ready     ),
  .h_sel_1     (h_sel_1),
  .h_sel_2     (h_sel_2),
  .h_sel_3     (h_sel_3)
);


  parameter CLOCK_PERIOD = 10;

  always #(CLOCK_PERIOD/2) h_clk = ~h_clk;
  
  // HTRANS
  localparam [1:0] IDLE   = 0;		              // IDLE Transfer type							
  localparam [1:0] BUSY   = 1;                  // BUSY transfer type
  localparam [1:0] NONSEQ = 2;                  // NON-SEQ transfer type (single transfer )
  localparam [1:0] SEQ    = 3;                  // SEQUENTIAL transfer type
  
  // HBURST 
  localparam [2:0] SINGLE = 0;                  // Single burst type
  localparam [2:0] INCR   = 1;                  // Undefine size burst
  localparam [2:0] WRAP4  = 2;                  // 4 beat Wrape around burst
  localparam [2:0] INCR4  = 3;                  // 4 beat increment burst
  localparam [2:0] WRAP8  = 4;                  // 8 beat Wrape around burst
  localparam [2:0] INCR8  = 5;                  // 8 beat increment burst
  localparam [2:0] WRAP16 = 6;                  // beat Wrape around burst
  localparam [2:0] INCR16 = 7;                  // 16 beat increment burst

  // HSIZE
  localparam [2:0] BYTE   = 0;                  // byte size data 
  localparam [2:0] HWORD  = 1;                  // half word size data
  localparam [2:0] WORD   = 2;                  // word size data

  // memory array
  logic [31:0] lwb_wrap_addr;
  logic [31:0] upper_wrap_addr;
  logic [31:0] in_addr ;

    byte mem_write[int];  // Dummy memory to store h_wdata coming out of master
    
    byte mem_read [int];  // Dummy memory to store data read from slave

  always @(posedge h_clk) // data to be written from master to slave
    begin
      wdata =  $urandom_range(100000,1) ;
    end
    

task engage_ahb (input logic reset, req, input logic [31:0] addr1, input logic [2:0] size_in, input logic [3:0] burst_in);
    h_reset    = #3 reset;
    oprtn_req  = req;
    size       = size_in;
    burst      = burst_in;
    addr       = addr1;
    if (oprtn_req && h_reset)
      begin
          
        case(size)			                      // size value to do address allignment 
              BYTE:
                begin
                  size_value = 'd1;
                end
              HWORD:
                begin
                  size_value = 'd2;
                end
              WORD: 
                begin
                  size_value = 'd4;
                end
              default:size_value = 'd4;
            endcase
          case(burst)			                      
              SINGLE:
                begin
                  burst_value = 'd1;
                end
              INCR4:
                begin
                  burst_value = 'd4;
                end
              INCR8: 
                begin
                  burst_value = 'd8;
                end
              INCR16: 
                begin
                  burst_value = 'd16;
                end
              WRAP4: 
                begin
                  burst_value = 'd4;
                  lwb_wrap_addr   = (in_addr / (size_value * 'd4))*(size_value * 'd4);
                  upper_wrap_addr = lwb_wrap_addr + ((size_value * 'd4) - size_value);
               //   $display("*********************************************************");  
               //   $display("lower: %d upper: %d", lwb_wrap_addr ,upper_wrap_addr);
               //   $display("*********************************************************");  
                end
              WRAP8: 
                begin
                  burst_value = 'd8;
                  lwb_wrap_addr   = ($floor(in_addr / (size_value * 'd8)))*(size_value * 'd8);
                  upper_wrap_addr = lwb_wrap_addr + (size_value * 'd8) - size_value;  
                 // $display("*********************************************************");  
                 // $display("lower: %d upper: %d", $floor(in_addr / (size_value * 'd8)),upper_wrap_addr);
                 // $display("*********************************************************");  
                end
              WRAP16: 
                begin
                  burst_value = 'd16;
                  lwb_wrap_addr   = ($floor(in_addr / (size_value * 'd16)))*(size_value * 'd16);
                  upper_wrap_addr = lwb_wrap_addr + ((size_value * 'd16)- size_value);                      
                end
              INCR: 
                begin
                  burst_value = 'd30;
  
                end
		        default: burst_value = 'd1;
	        	endcase
      end
  endtask 

task single_write ();
 #3 opr_type = 1;
  @(posedge h_ready==1)
   @(posedge h_clk);
		 #3  oprtn_req = 0;	
		haddr1 <= h_addr;
	  @(posedge h_clk);  
  		
		mem_write [haddr1] = h_wdata;
 // @(posedge h_clk);

endtask

task single_read(); 
 #3 opr_type = 0;
  @ (posedge h_ready);
  @(posedge h_clk);
		#3	oprtn_req = 0;
		haddr1 <= h_addr;
	  @(posedge h_clk);
  			
	        mem_read[haddr1] = h_rdata;
endtask

always  @(posedge h_clk)begin
if(h_sel_1 && !h_write) begin
$display ($time, " hrdata___ %d", h_rdata_1);
  @(posedge h_clk);
end
end
task multiple_transfer();
  opr_type = 1;
	  @(posedge h_ready);
	  @(posedge h_clk);
		haddr1 <= h_addr;
	  @(posedge h_clk);
		haddr1 <= h_addr;
		mem_write [haddr1] = h_wdata;
	  @(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	  @(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
		oprtn_req = 0;
	  @(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
endtask


task multiple_rd_wr();
  opr_type = 1;
	  @(posedge h_ready);
	  @(posedge h_clk);
  opr_type = 0;
		haddr1 <= h_addr;
	  @(posedge h_clk);
  opr_type = 1;
		haddr1 <= h_addr;
		mem_write [haddr1] = h_wdata;
	  @(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	  @(posedge h_clk); 
  opr_type = 0;
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	  @(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	@(posedge h_clk); 
  opr_type = 1;
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	@(posedge h_clk); 
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
	@(posedge h_clk); 
		oprtn_req = 0;
		haddr1 <= h_addr;
 		mem_write [haddr1] = h_wdata;
		
endtask

task burst_write ([1:0]size);
  opr_type = 1; 
	  @(posedge h_ready);
	  @(posedge h_clk); 
		haddr1   <= h_addr;
	for (int i=0; i<burst_value; i=i+1) begin
	  @(posedge h_clk);
		haddr1<=h_addr;
		if (size==BYTE)
		mem_write[haddr1]=h_wdata[7:0];   //write data from master to slave
		else if (size==HWORD) begin
		mem_write[haddr1]=h_wdata[7:0];
		mem_write[haddr1+1]=h_wdata[15:8];
		end else if (size == WORD) begin
		mem_write[haddr1]=h_wdata[7:0];
		mem_write[haddr1+1]=h_wdata[15:8];
		mem_write[haddr1+2]=h_wdata[23:16];
		mem_write[haddr1+3]=h_wdata[31:24];
		end 
		if (i == burst_value-2)
		oprtn_req=0;
end
		 @(posedge h_clk);
endtask

task burst_read ([1:0]size);
  opr_type = 0;  
	@(posedge h_ready);
	  @(posedge h_clk); 
		haddr1   <= h_addr;
	for (int i = 0; i < burst_value; i = i+1) begin
	  @(posedge h_clk);	
		haddr1<=h_addr;
		if (size==BYTE)
		mem_read[haddr1]=h_rdata[7:0];   //write data from master to slave
		else if (size==HWORD) begin
		mem_read[haddr1]=h_rdata[7:0];
		mem_read[haddr1+1]=h_rdata[15:8];
		end else if (size == WORD) begin
		mem_read[haddr1]=h_rdata[7:0];
		mem_read[haddr1+1]=h_rdata[15:8];
		mem_read[haddr1+2]=h_rdata[23:16];
		mem_read[haddr1+3]=h_rdata[31:24];
		end 
		if (i == burst_value-2)
		oprtn_req=0;
end
		@(posedge h_clk);
endtask

task cease_write (input [2:0]duration);
  opr_type = 1;
	@(posedge h_ready);
	@(posedge h_clk);
		haddr1 <= h_addr;
	for (int i=0; i<(burst_value+duration); i = i+1) begin 
		@(posedge h_clk);	
		haddr1 <= h_addr;
		if (size==BYTE)
		mem_write[haddr1]=h_wdata[7:0];   //write data from master to slave
		else if (size==HWORD) begin
		mem_write[haddr1]=h_wdata[7:0];
		mem_write[haddr1+1]=h_wdata[15:8];
		end else if (size == WORD) begin
		mem_write[haddr1]=h_wdata[7:0];
		mem_write[haddr1+1]=h_wdata[15:8];
		mem_write[haddr1+2]=h_wdata[23:16];
		mem_write[haddr1+3]=h_wdata[31:24];
		end 
		if (i == (burst_value+duration-2))
		  oprtn_req=0;
		
	end
endtask

task cease_trigger(input [2:0]beat_no, input [2:0]duration);
	tr_cease = 0;
  @(posedge h_ready);
   for (int i = 1; i<=burst_value; i=i+1) begin
     if (i==beat_no) begin
	$display($time);
     for (int j = 0; j<duration; j++) begin
	  tr_cease = 1;
	  @(posedge h_clk);
      end
   end else begin
	  tr_cease = 0;
	  @ (posedge h_clk);
	end
    end
endtask

task cease_read (input [2:0]duration);
  opr_type = 0;
	@(posedge h_ready);
	@(posedge h_clk);
		haddr1 <= h_addr;
	for (int i=0; i<burst_value+duration; i = i+1) begin
		@(posedge h_clk);
		haddr1 <= h_addr;
		if (size==BYTE)
		mem_read[haddr1]=h_rdata[7:0];   //write data from master to slave
		else if (size==HWORD) begin
		mem_read[haddr1]=h_rdata[7:0];
		mem_read[haddr1+1]=h_rdata[15:8];
		end else if (size == WORD) begin
		mem_read[haddr1]=h_rdata[7:0];
		mem_read[haddr1+1]=h_rdata[15:8];
		mem_read[haddr1+2]=h_rdata[23:16];
		mem_read[haddr1+3]=h_rdata[31:24];
		end 
		if (i == (burst_value+duration-2))
		  oprtn_req=0;
	end
endtask


	
     
task scoreboard (string test);
  if (mem_write == mem_read)
      $display ("%s Passed ", test);
  else begin
    $display ("%s Failed", test);    
  end
endtask  

initial begin 
/////////////// RESET Master and Slave ////////////////////
         	engage_ahb (0, 0, 0, 0, 0);
		@(posedge h_clk);	

//////////////  SINGLE TRANSFER (SIZE = WORD) /////////////
 	 repeat(10)
 	   begin
 		engage_ahb (1, 1, 32'hA0000004, WORD, SINGLE); //SINGLE WRITE/READ
		single_write ();
 		@(posedge h_clk);
		engage_ahb (1, 1, 32'hA0000004, WORD, SINGLE);
		single_read  ();
	
       end


    #50;
  end

initial begin
            $dumpfile("tb.vcd");
            $dumpvars;
            #7000  $finish;
            $display("SoC Simulation Completed");
        end
endmodule
