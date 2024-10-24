//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Generic Single-Port Synchronous RAM with byte write signals ////
////                                                              ////
////  This file is part of memory library available from          ////
////  http://www.opencores.org/cvsweb.shtml/generic_memories/     ////
////                                                              ////
////  Description                                                 ////
////  This block is a wrapper with common single-port             ////
////  synchronous memory interface for different                  ////
////  types of ASIC and FPGA RAMs. Beside universal memory        ////
////  interface it also provides behavioral model of generic      ////
////  single-port synchronous RAM.                                ////
////  It should be used in all OPENCORES designs that want to be  ////
////  portable accross different target technologies and          ////
////  independent of target memory.                               ////
////                                                              ////
////  Supported ASIC RAMs are:                                    ////
////  - Artisan Single-Port Sync RAM                              ////
////  - Avant! Two-Port Sync RAM (*)                              ////
////  - Virage Single-Port Sync RAM                               ////
////  - Virtual Silicon Single-Port Sync RAM                      ////
////                                                              ////
////  Supported FPGA RAMs are:                                    ////
////  - Xilinx Virtex RAMB16                                      ////
////  - Xilinx Virtex RAMB4                                       ////
////                                                              ////
////  To Do:                                                      ////
////   - xilinx rams need external tri-state logic                ////
////   - fix avant! two-port ram                                  ////
////   - add additional RAMs                                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: or1200_spram_2048x32_bw.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// Minor update: 
// Coding style changed.
//
// Revision 1.5  2005/10/19 11:37:56  jcastillo
// Added support for RAMB16 Xilinx4/Spartan3 primitives
//
// Revision 1.4  2004/06/08 18:15:32  lampret
// Changed behavior of the simulation generic models
//
// Revision 1.3  2003/10/17 07:59:44  markom
// mbist signals updated according to newest convention
//
// Revision 1.2  2003/09/12 09:03:54  dries
// correct all the syntax errors
//
// Revision 1.1  2003/08/26 09:37:02  simons
// Added support for rams with byte write access.
//
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module or1200_spram_2048x32_bw(
`ifdef OR1200_BIST
        // RAM BIST
        mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
        // Generic synchronous single-port RAM interface
        clk, rst, ce, we, oe, addr, di, doq
);

`ifdef OR1200_BIST
//
// RAM BIST
//
input                   mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;       // bist chain shift control
output                  mbist_so_o;
`endif

//
// Generic synchronous single-port RAM interface
//
input                   clk;    // Clock
input                   rst;    // Reset
input                   ce;     // Chip enable input
input   [3:0]           we;     // Write enable input
input                   oe;     // Output enable input
input   [10:0]          addr;   // address bus inputs
input   [31:0]          di;     // input data bus
output  [31:0]          doq;     // output data bus

//
// Internal wires and registers
//

`ifdef OR1200_ARTISAN_SSP
`else
`ifdef OR1200_VIRTUALSILICON_SSP
`else
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif
`endif
`endif


`ifdef OR1200_ARTISAN_SSP

//
// Instantiation of ASIC memory:
//
// Artisan Synchronous Single-Port RAM (ra1sh)
//
`ifdef UNUSED
art_hssp_2048x32_bw artisan_ssp(
`else
`ifdef OR1200_BIST
art_hssp_2048x32_bw_bist artisan_ssp(
`else
art_hssp_2048x32_bw artisan_ssp(
`endif
`endif
`ifdef OR1200_BIST
        // RAM BIST
        .mbist_si_i(mbist_si_i),
        .mbist_so_o(mbist_so_o),
        .mbist_ctrl_i(mbist_ctrl_i),
`endif
        .CLK(clk),
        .CEN(~ce),
        .WEN(~we),
        .A(addr),
        .D(di),
        .OEN(~oe),
        .Q(doq)
);

`else

`ifdef OR1200_AVANT_ATP

//
// Instantiation of ASIC memory:
//
// Avant! Asynchronous Two-Port RAM
//
avant_atp avant_atp(
        .web(~we),
        .reb(),
        .oeb(~oe),
        .rcsb(),
        .wcsb(),
        .ra(addr),
        .wa(addr),
        .di(di),
        .doq(doq)
);

`else

`ifdef OR1200_VIRAGE_SSP

//
// Instantiation of ASIC memory:
//
// Virage Synchronous 1-port R/W RAM
//
virage_ssp virage_ssp(
        .clk(clk),
        .adr(addr),
        .d(di),
        .we(we),
        .oe(oe),
        .me(ce),
        .q(doq)
);

`else

`ifdef OR1200_VIRTUALSILICON_SSP

//
// Instantiation of ASIC memory:
//
// Virtual Silicon Single-Port Synchronous SRAM
//
`ifdef OR1200_BIST
wire mbist_si_i_ram_0;
wire mbist_si_i_ram_1;
wire mbist_si_i_ram_2;
wire mbist_si_i_ram_3;
wire mbist_so_o_ram_0;
wire mbist_so_o_ram_1;
wire mbist_so_o_ram_2;
wire mbist_so_o_ram_3;
assign mbist_si_i_ram_0 = mbist_si_i;
assign mbist_si_i_ram_1 = mbist_so_o_ram_0;
assign mbist_si_i_ram_2 = mbist_so_o_ram_1;
assign mbist_si_i_ram_3 = mbist_so_o_ram_2;
assign mbist_so_o = mbist_so_o_ram_3;
`endif

`ifdef UNUSED
vs_hdsp_2048x8 vs_ssp_0(
`else
`ifdef OR1200_BIST
vs_hdsp_2048x8_bist vs_ssp_0(
`else
vs_hdsp_2048x8 vs_ssp_0(
`endif
`endif
`ifdef OR1200_BIST
        // RAM BIST
        .mbist_si_i(mbist_si_i_ram_0),
        .mbist_so_o(mbist_so_o_ram_0),
        .mbist_ctrl_i(mbist_ctrl_i),
`endif
        .CK(clk),
        .ADR(addr),
        .DI(di[7:0]),
        .WEN(~we[0]),
        .CEN(~ce),
        .OEN(~oe),
        .DOUT(doq[7:0])
);

`ifdef UNUSED
vs_hdsp_2048x8 vs_ssp_1(
`else
`ifdef OR1200_BIST
vs_hdsp_2048x8_bist vs_ssp_1(
`else
vs_hdsp_2048x8 vs_ssp_1(
`endif
`endif
`ifdef OR1200_BIST
        // RAM BIST
        .mbist_si_i(mbist_si_i_ram_1),
        .mbist_so_o(mbist_so_o_ram_1),
        .mbist_ctrl_i(mbist_ctrl_i),
`endif
        .CK(clk),
        .ADR(addr),
        .DI(di[15:8]),
        .WEN(~we[1]),
        .CEN(~ce),
        .OEN(~oe),
        .DOUT(doq[15:8])
);

`ifdef UNUSED
vs_hdsp_2048x8 vs_ssp_2(
`else
`ifdef OR1200_BIST
vs_hdsp_2048x8_bist vs_ssp_2(
`else
vs_hdsp_2048x8 vs_ssp_2(
`endif
`endif
`ifdef OR1200_BIST
        // RAM BIST
        .mbist_si_i(mbist_si_i_ram_2),
        .mbist_so_o(mbist_so_o_ram_2),
        .mbist_ctrl_i(mbist_ctrl_i),
`endif
        .CK(clk),
        .ADR(addr),
        .DI(di[23:16]),
        .WEN(~we[2]),
        .CEN(~ce),
        .OEN(~oe),
        .DOUT(doq[23:16])
);

`ifdef UNUSED
vs_hdsp_2048x8 vs_ssp_3(
`else
`ifdef OR1200_BIST
vs_hdsp_2048x8_bist vs_ssp_3(
`else
vs_hdsp_2048x8 vs_ssp_3(
`endif
`endif
`ifdef OR1200_BIST
        // RAM BIST
        .mbist_si_i(mbist_si_i_ram_3),
        .mbist_so_o(mbist_so_o_ram_3),
        .mbist_ctrl_i(mbist_ctrl_i),
`endif
        .CK(clk),
        .ADR(addr),
        .DI(di[31:24]),
        .WEN(~we[3]),
        .CEN(~ce),
        .OEN(~oe),
        .DOUT(doq[31:24])
);

`else

`ifdef OR1200_XILINX_RAMB4

//
// Instantiation of FPGA memory:
//
// Virtex/Spartan2
//

//
// Block 0
//
RAMB4_S2 ramb4_s2_0(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[1:0]),
	.EN(ce),
	.WE(we[0]),
	.DO(doq[1:0])
);

//
// Block 1
//
RAMB4_S2 ramb4_s2_1(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[3:2]),
	.EN(ce),
	.WE(we[0]),
	.DO(doq[3:2])
);

//
// Block 2
//
RAMB4_S2 ramb4_s2_2(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[5:4]),
	.EN(ce),
	.WE(we[0]),
	.DO(doq[5:4])
);

//
// Block 3
//
RAMB4_S2 ramb4_s2_3(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[7:6]),
	.EN(ce),
	.WE(we[0]),
	.DO(doq[7:6])
);
//
// Block 4
//
RAMB4_S2 ramb4_s2_4(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[9:8]),
	.EN(ce),
	.WE(we[1]),
	.DO(doq[9:8])
);

//
// Block 5
//
RAMB4_S2 ramb4_s2_5(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[11:10]),
	.EN(ce),
	.WE(we[1]),
	.DO(doq[11:10])
);

//
// Block 6
//
RAMB4_S2 ramb4_s2_6(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[13:12]),
	.EN(ce),
	.WE(we[1]),
	.DO(doq[13:12])
);

//
// Block 7
//
RAMB4_S2 ramb4_s2_7(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[15:14]),
	.EN(ce),
	.WE(we[1]),
	.DO(doq[15:14])
);
//
// Block 8
//
RAMB4_S2 ramb4_s2_8(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[17:16]),
	.EN(ce),
	.WE(we[2]),
	.DO(doq[17:16])
);

//
// Block 9
//
RAMB4_S2 ramb4_s2_9(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[19:18]),
	.EN(ce),
	.WE(we[2]),
	.DO(doq[19:18])
);

//
// Block 10
//
RAMB4_S2 ramb4_s2_10(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[21:20]),
	.EN(ce),
	.WE(we[2]),
	.DO(doq[21:20])
);

//
// Block 11
//
RAMB4_S2 ramb4_s2_11(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[23:22]),
	.EN(ce),
	.WE(we[2]),
	.DO(doq[23:22])
);
//
// Block 12
//
RAMB4_S2 ramb4_s2_12(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[25:24]),
	.EN(ce),
	.WE(we[3]),
	.DO(doq[25:24])
);

//
// Block 13
//
RAMB4_S2 ramb4_s2_13(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[27:26]),
	.EN(ce),
	.WE(we[3]),
	.DO(doq[27:26])
);

//
// Block 14
//
RAMB4_S2 ramb4_s2_14(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[29:28]),
	.EN(ce),
	.WE(we[3]),
	.DO(doq[29:28])
);

//
// Block 15
//
RAMB4_S2 ramb4_s2_15(
	.CLK(clk),
	.RST(1'b0),
	.ADDR(addr),
	.DI(di[31:30]),
	.EN(ce),
	.WE(we[3]),
	.DO(doq[31:30])
);

`else

`ifdef OR1200_XILINX_RAMB16

//
// Instantiation of FPGA memory:
//
// Virtex4/Spartan3E
//
// Added By Nir Mor
//

//
// Block 0
//
RAMB16_S9 ramb16_s9_0(
	.CLK(clk),
	.SSR(1'b0),
	.ADDR(addr),
	.DI(di[7:0]),
	.DIP(1'b0),
	.EN(ce),
	.WE(we[0]),
	.DO(doq[7:0]),
	.DOP()
);

//
// Block 1
//
RAMB16_S9 ramb16_s9_1(
	.CLK(clk),
	.SSR(1'b0),
	.ADDR(addr),
	.DI(di[15:8]),
	.DIP(1'b0),
	.EN(ce),
	.WE(we[1]),
	.DO(doq[15:8]),
	.DOP()
);

//
// Block 2
//
RAMB16_S9 ramb16_s9_2(
	.CLK(clk),
	.SSR(1'b0),
	.ADDR(addr),
	.DI(di[23:16]),
	.DIP(1'b0),
	.EN(ce),
	.WE(we[2]),
	.DO(doq[23:16]),
	.DOP()
);

//
// Block 3
//
RAMB16_S9 ramb16_s9_3(
	.CLK(clk),
	.SSR(1'b0),
	.ADDR(addr),
	.DI(di[31:24]),
	.DIP(1'b0),
	.EN(ce),
	.WE(we[3]),
	.DO(doq[31:24]),
	.DOP()
);

`else

//
// Generic single-port synchronous RAM model
//

//
// Generic RAM's registers and wires
//
reg     [7:0]        mem_0 [2047:0];              // RAM content
reg     [7:0]        mem_1 [2047:0];              // RAM content
reg     [7:0]        mem_2 [2047:0];              // RAM content
reg     [7:0]        mem_3 [2047:0];              // RAM content
integer i;

initial begin
   // Loop through all the memory locations and initialize them to 0
   for (i = 0; i < 2048; i = i + 1) begin
      mem_0[i] = 8'b0;
      mem_1[i] = 8'b0;
      mem_2[i] = 8'b0;
      mem_3[i] = 8'b0;
   end
end
reg     [10:0]       addr_reg=0;                    // RAM address register
                                                                                                                                                                                                     
//
// Data output drivers
//
assign doq = (oe) ? {mem_3[addr_reg], mem_2[addr_reg], mem_1[addr_reg], mem_0[addr_reg]} : {32{1'b0}};
                                                                                                                                                                                                     
//
// RAM address register
//
always @(posedge clk or `OR1200_RST_EVENT rst)
        if (rst == `OR1200_RST_VALUE)
                addr_reg <=  11'h000;
        else if (ce)
                addr_reg <=  addr;
                                                                                                                                                                                                     
//
// RAM write byte 0
//
always @(posedge clk)
        if (ce && we[0])
                mem_0[addr] <=  di[7:0];
                                                                                                                                                                                                     
//
// RAM write byte 1
//
always @(posedge clk)
        if (ce && we[1])
                mem_1[addr] <=  di[15:8];
                                                                                                                                                                                                     
//
// RAM write byte 2
//
always @(posedge clk)
        if (ce && we[2])
                mem_2[addr] <=  di[23:16];
                                                                                                                                                                                                     
//
// RAM write byte 3
//
always @(posedge clk)
        if (ce && we[3])
                mem_3[addr] <=  di[31:24];

`endif  // !OR1200_XILINX_RAMB16
`endif  // !OR1200_XILINX_RAMB4
`endif  // !OR1200_VIRTUALSILICON_SSP
`endif  // !OR1200_VIRAGE_SSP
`endif  // !OR1200_AVANT_ATP
`endif  // !OR1200_ARTISAN_SSP

endmodule
