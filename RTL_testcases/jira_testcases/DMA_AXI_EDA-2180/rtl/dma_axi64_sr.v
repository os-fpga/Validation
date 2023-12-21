`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2023 01:24:06 PM
// Design Name: 
// Module Name: dma_axi64_sr
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

`include "dma_axi64_defines.v"

module dma_axi64_sr (
   input                                clk,
   input                 reset,
   input                 scan_en,

   output                 idle,
   output [1-1:0]                INT,
   
   input   periph_tx_req,
   output  periph_tx_clr,
   input   periph_rx_req,
   output  periph_rx_clr,

   input                                pclken,
   input                                psel,
   input                                penable,
   input  paddr,
   input                                pwrite,
   input  pwdata,
   output  prdata,
   output                               pslverr,
   output                               pready,
   
    output  AWID0,
    output  AWADDR0,
    output  AWLEN0,
    output  AWSIZE0,
    output                              AWVALID0,
    input                               AWREADY0,
    output  WID0,
    output  WDATA0,
    output  WSTRB0,
    output                              WLAST0,
    output                              WVALID0,
    input                               WREADY0,
    input  BID0,
    input  BRESP0,
    input                               BVALID0,
    output                              BREADY0,
    output  ARID0,
    output  ARADDR0,
    output  ARLEN0,
    output  ARSIZE0,
    output                              ARVALID0,
    input                               ARREADY0,
    input  RID0,
    input  RDATA0,
    input  RRESP0,
    input                               RLAST0,
    input                               RVALID0,
    output                              RREADY0

    );



  reg [31:1]             periph_tx_req_reg;
  reg [31:1]             periph_rx_req_reg;
  reg [12:0]                         paddr_reg;
  reg [31:0]                         pwdata_reg;
  reg [1:0]                         BRESP0_reg;
  reg [64-1:0]              RDATA0_reg;
  reg [1:0]                         RRESP0_reg;


  wire [31:1]             periph_tx_clr_wire;
  wire [31:1]             periph_rx_clr_wire;
  wire [31:0]                        prdata_wire;   
  wire [32-1:0]             AWADDR0_wire;
  wire [`LEN_BITS-1:0]              AWLEN0_wire;
  wire [`SIZE_BITS-1:0]      AWSIZE0_wire;
  wire [64-1:0]             WDATA0_wire;
  wire [64/8-1:0]           WSTRB0_wire;
  wire [32-1:0]             ARADDR0_wire;
  wire [`LEN_BITS-1:0]              ARLEN0_wire;
  wire [`SIZE_BITS-1:0]      ARSIZE0_wire;

  reg [31:1]             periph_tx_clr_reg;
  reg [31:1]             periph_rx_clr_reg;
  reg [31:0]                        prdata_reg;   
  reg [32-1:0]             AWADDR0_reg;
  reg [`LEN_BITS-1:0]              AWLEN0_reg;
  reg [`SIZE_BITS-1:0]      AWSIZE0_reg;
  reg [64-1:0]             WDATA0_reg;
  reg [64/8-1:0]           WSTRB0_reg;
  reg [32-1:0]             ARADDR0_reg;
  reg [`LEN_BITS-1:0]              ARLEN0_reg;
  reg [`SIZE_BITS-1:0]      ARSIZE0_reg;

  always @(posedge clk) begin
    periph_tx_req_reg <= {periph_tx_req_reg[30:1], periph_tx_req};
    periph_rx_req_reg <= {periph_rx_req_reg[30:1], periph_rx_req};
    paddr_reg <= {paddr_reg[11:0], paddr};
    pwdata_reg <= {pwdata_reg[30:0], pwdata};
    BRESP0_reg <= {BRESP0_reg[0], BRESP0};
    RDATA0_reg <= {RDATA0_reg[62:0], RDATA0};
    RRESP0_reg <= {RRESP0_reg[0], RRESP0};
  end
  
  always @(posedge clk)
    if (penable) begin
      periph_tx_clr_reg <= periph_tx_clr_wire;
      periph_rx_clr_reg <= periph_rx_clr_wire;
      prdata_reg <= prdata_wire;   
      AWADDR0_reg <= AWADDR0_wire;
      AWLEN0_reg <= AWLEN0_wire;
      AWSIZE0_reg <= AWSIZE0_wire;
      WDATA0_reg <= WDATA0_wire;
      WSTRB0_reg <= WSTRB0_wire;
      ARADDR0_reg <= ARADDR0_wire;
      ARLEN0_reg <= ARLEN0_wire;
      ARSIZE0_reg <= ARSIZE0_wire;
    end else begin
      periph_tx_clr_reg <= {periph_tx_clr_reg[30:1], 1'b0};
      periph_rx_clr_reg <= {periph_rx_clr_reg[30:1], 1'b0};
      prdata_reg <= {prdata_reg[30:0], 1'b0};   
      AWADDR0_reg <= {AWADDR0_reg[32-2:0], 1'b0};
      AWLEN0_reg <= {AWLEN0_reg[`LEN_BITS-2:0], 1'b0};
      AWSIZE0_reg <= {AWSIZE0_reg[`SIZE_BITS-2:0], 1'b0};
      WDATA0_reg <= {WDATA0_reg[64-2:0], 1'b0};
      WSTRB0_reg <= {WSTRB0_reg[64/8-2:0], 1'b0};
      ARADDR0_reg <= {ARADDR0_reg[32-2:0], 1'b0};
      ARLEN0_reg <= {ARLEN0_reg[`LEN_BITS-2:0], 1'b0};
      ARSIZE0_reg <= {ARSIZE0_reg[`SIZE_BITS-2:0], 1'b0};
    end


  assign periph_tx_clr = periph_tx_clr_reg[31];
  assign periph_rx_clr = periph_rx_clr_reg[31];
  assign prdata = prdata_reg[31];   
  assign AWADDR0 = AWADDR0_reg[31];
  assign AWLEN0 = AWLEN0_reg[`LEN_BITS-1];
  assign AWSIZE0 = AWSIZE0_reg[`SIZE_BITS-1];
  assign WDATA0 = WDATA0_reg[63];
  assign WSTRB0 = WSTRB0_reg[64/8-1];
  assign ARADDR0 = ARADDR0_reg[31];
  assign ARLEN0 = ARLEN0_reg[`LEN_BITS-1];
  assign ARSIZE0 = ARSIZE0_reg[`SIZE_BITS-1];



  dma_axi64 U1 (
    .clk(clk),
    .reset(reset),
    .scan_en(scan_en),
    .idle(idle),
    .INT(INT),
    .periph_tx_req(periph_tx_req_reg),
    .periph_tx_clr(periph_tx_clr_wire),
    .periph_rx_req(periph_rx_req_reg),
    .periph_rx_clr(periph_rx_clr_wire),
    .pclken(pclken),
    .psel(psel),
    .penable(penable),
    .paddr(paddr_reg),
    .pwrite(pwrite),
    .pwdata(pwdata_reg),
    .prdata(prdata_wire),
    .pslverr(pslverr),
    .pready(pready),
    .AWID0(AWID0),
    .AWADDR0(AWADDR0_wire),
    .AWLEN0(AWLEN0_wire),
    .AWSIZE0(AWSIZE0_wire),
    .AWVALID0(AWVALID0),
    .AWREADY0(AWREADY0),
    .WID0(WID0),
    .WDATA0(WDATA0_wire),
    .WSTRB0(WSTRB0_wire),
    .WLAST0(WLAST0),
    .WVALID0(WVALID0),
    .WREADY0(WREADY0),
    .BID0(BID0),
    .BRESP0(BRESP0_reg),
    .BVALID0(BVALID0),
    .BREADY0(BREADY0),
    .ARID0(ARID0),
    .ARADDR0(ARADDR0_wire),
    .ARLEN0(ARLEN0_wire),
    .ARSIZE0(ARSIZE0_wire),
    .ARVALID0(ARVALID0),
    .ARREADY0(ARREADY0),
    .RID0(RID0),
    .RDATA0(RDATA0_reg),
    .RRESP0(RRESP0_reg),
    .RLAST0(RLAST0),
    .RVALID0(RVALID0),
    .RREADY0(RREADY0)
  );


endmodule
