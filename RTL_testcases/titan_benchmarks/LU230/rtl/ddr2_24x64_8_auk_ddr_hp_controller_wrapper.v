//Legal Notice: (C)2006 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.


///////////////////////////////////////////////////////////////////////////////
// Title         : Controller Wrapper
//
// File          : $RCSfile: auk_ddr_hp_controller_wrapper.v,v $
//
// Last modified : $Date: 2008/03/13 00:21:53 $
//
// Revision      : $Revision: 1.3.2.1 $
//
// Abstract      : A wrapper for the controller as it is encrypted
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps
//
module ddr2_24x64_8_auk_ddr_hp_controller_wrapper (
//      stratix_dll_control  ,
        local_ready          ,
        local_rdata_valid    ,
//      local_rdvalid_in_n   ,
        local_rdata          ,
        local_wdata_req      ,
        local_init_done      ,
        local_refresh_ack    ,
        local_powerdn_ack    ,
        local_self_rfsh_ack  ,
        ddr_cs_n             ,
        ddr_cke_l            ,
        ddr_cke_h            ,
        ddr_odt              ,
        ddr_a                ,
        ddr_ba               ,
        ddr_ras_n            ,
        ddr_cas_n            ,
        ddr_we_n             ,
        control_doing_wr     ,
        control_dqs_burst    ,
        control_wdata_valid  ,
        control_wdata        ,
        control_be           ,
        control_doing_rd     ,
                             
        clk                  ,
        reset_n              ,
        local_read_req       ,
        local_write_req      ,
        local_autopch_req    ,
        local_size           ,
        local_burstbegin     ,
        local_cs_addr        ,
        local_row_addr       ,
        local_bank_addr      ,
        local_col_addr       ,
        local_wdata          ,
        local_be             ,
        local_refresh_req    ,
        local_powerdn_req    ,
        local_self_rfsh_req  ,
        control_rdata        ,
        control_rdata_valid
    );

//Inserted Generics
  localparam gLOCAL_DATA_BITS      = 128;
  localparam gLOCAL_BURST_LEN      = 2;
  localparam gLOCAL_BURST_LEN_BITS = 2;
  localparam gLOCAL_AVALON_IF      = "false";
  localparam DWIDTH_RATIO          = 2;
  localparam gMEM_TYPE             = "ddr2_sdram";
  localparam gMEM_CHIPSELS         = 1;
  localparam gMEM_CHIP_BITS        = 1;
  localparam gMEM_ROW_BITS         = 13;
  localparam gMEM_BANK_BITS        = 2;
  localparam gMEM_COL_BITS         = 10;
  localparam gMEM_DQ_PER_DQS       = 8;
  localparam gMEM_PCH_BIT          = 10;
  localparam gMEM_ODT_RANKS        = 1;
  localparam gFAMILY               = "Stratix III";
  localparam gREG_DIMM             = "false";
  localparam gUSER_REFRESH         = "false";
  localparam ECC_CSR_ADDR_WIDTH    = 8;
  localparam gPIPELINE_COMMANDS    = "true";
  localparam gEXTRA_PIPELINE_REGS  = "false";
  localparam gADDR_CMD_NEGEDGE     = "false";
  localparam gRESYNCH_CYCLE        = 1;
  localparam gINTER_RESYNCH        = "false";
  localparam gPIPELINE_READDATA    = "false";
  localparam gSTRATIX_DLL_CONTROL  = "false";
  localparam LOCAL_IF_AWIDTH       = 24;

output wire                                                local_ready        ;
output wire                                                local_rdata_valid  ;
//output wire                                              local_rdvalid_in_n ;
output wire [gLOCAL_DATA_BITS - 1 : 0]                     local_rdata        ;
output wire                                                local_wdata_req    ;
output wire                                                local_init_done    ;
output wire                                                local_refresh_ack  ;
output wire                                                local_powerdn_ack  ;
output wire                                                local_self_rfsh_ack;
output wire [gMEM_CHIPSELS - 1 : 0]                        ddr_cs_n           ;
output wire [gMEM_CHIPSELS - 1 : 0]                        ddr_cke_l          ;
output wire [gMEM_CHIPSELS - 1 : 0]                        ddr_cke_h          ;
output wire [gMEM_CHIPSELS - 1 : 0]                        ddr_odt            ;
output wire [gMEM_ROW_BITS - 1 : 0]                        ddr_a              ;
output wire [gMEM_BANK_BITS - 1 : 0]                       ddr_ba             ;
output wire                                                ddr_ras_n          ;
output wire                                                ddr_cas_n          ;
output wire                                                ddr_we_n           ;
output wire                                                control_doing_wr   ;
output wire                                                control_dqs_burst  ;
output wire                                                control_wdata_valid;
output wire [gLOCAL_DATA_BITS - 1 : 0]                     control_wdata      ;
output wire [gLOCAL_DATA_BITS/8 - 1 : 0]                   control_be         ;
output wire                                                control_doing_rd   ;
                                                                    
input wire                                                  clk               ;
input wire                                                  reset_n           ;
input wire                                                  local_read_req    ;
input wire                                                  local_write_req   ;
input wire                                                  local_autopch_req ;
input wire                                                  local_powerdn_req ;
input wire                                                  local_self_rfsh_req;
input wire  [gLOCAL_BURST_LEN_BITS - 1 : 0]                 local_size        ;
input wire                                                  local_burstbegin  ;
input wire  [gMEM_CHIP_BITS - 1 : 0]                        local_cs_addr     ;
input wire  [gMEM_ROW_BITS - 1 : 0]                         local_row_addr    ;
input wire  [gMEM_BANK_BITS - 1 : 0]                        local_bank_addr   ;
input wire  [gMEM_COL_BITS - 2 : 0]                         local_col_addr    ;
input wire  [gLOCAL_DATA_BITS - 1 : 0]                      local_wdata       ;
input wire  [gLOCAL_DATA_BITS/8 - 1 : 0]                    local_be          ;
input wire                                                  local_refresh_req ;
input wire  [gLOCAL_DATA_BITS - 1 : 0]                      control_rdata     ;
input wire                                                  control_rdata_valid;

// memory params for controller
wire  [2 : 0]  mem_tcl            ;
wire  [2 : 0]  mem_bl             ;
wire           mem_btype          ;
wire           mem_dll_en         ;
wire           mem_drv_str        ;
wire  [1 : 0]  mem_odt            ;
wire  [2 : 0]  mem_trcd           ;
wire  [3 : 0]  mem_tras           ;
wire  [1 : 0]  mem_twtr           ;
wire  [2 : 0]  mem_twr            ;
wire  [2 : 0]  mem_trp            ;
wire  [6 : 0]  mem_trfc           ;
wire  [1 : 0]  mem_tmrd           ;
wire [15 : 0]  mem_trefi          ;
wire [15 : 0]  mem_tinit_time     ;
//wire logic_zero  = 1'b0;


//this is to comply with the ecc wrapper port map. in the non-ecc case route these signals straight through
assign local_rdata = control_rdata;
assign local_rdata_valid = control_rdata_valid;


//////////////////////////////////////////////////////////////////////////////-
// Instantiate the controller according to the memory type
//////////////////////////////////////////////////////////////////////////////-    

	auk_ddr_hp_controller # (
	        .gMEM_TYPE                   (gMEM_TYPE),
	        .gLOCAL_AVALON_IF            (gLOCAL_AVALON_IF),
	        .gREG_DIMM                   (gREG_DIMM),
	        .gEXTRA_PIPELINE_REGS        (gEXTRA_PIPELINE_REGS),
	        .gFAMILY                     (gFAMILY),
	        .gUSER_REFRESH               (gUSER_REFRESH),
	        .gADDR_CMD_NEGEDGE           (gADDR_CMD_NEGEDGE),
	        .gINTER_RESYNCH              (gINTER_RESYNCH),
	        .gSTRATIX_DLL_CONTROL        (gSTRATIX_DLL_CONTROL),
	        .gMEM_ODT_RANKS              (gMEM_ODT_RANKS),
	        .gLOCAL_BURST_LEN            (gLOCAL_BURST_LEN),
	        .gLOCAL_BURST_LEN_BITS       (gLOCAL_BURST_LEN_BITS),
	        .gLOCAL_DATA_BITS            (gLOCAL_DATA_BITS),
	        .gMEM_BANK_BITS              (gMEM_BANK_BITS),
	        .gMEM_CHIPSELS               (gMEM_CHIPSELS),
	        .gMEM_CHIP_BITS              (gMEM_CHIP_BITS),
	        .gMEM_COL_BITS               (gMEM_COL_BITS),                                               
	        .gMEM_DQ_PER_DQS             (gMEM_DQ_PER_DQS),
	        .gMEM_PCH_BIT                (gMEM_PCH_BIT),
	        .gMEM_ROW_BITS               (gMEM_ROW_BITS),
	        .gRESYNCH_CYCLE              (gRESYNCH_CYCLE),
	        .gPIPELINE_READDATA          (gPIPELINE_READDATA),
	        .gDWIDTH_RATIO               (DWIDTH_RATIO)
	    ) auk_ddr_hp_controller_inst (
	      .clk                   (clk),
	      .control_be            (control_be),
	      .control_doing_rd      (control_doing_rd),
	      .control_doing_wr      (control_doing_wr),
	      .control_dqs_burst     (control_dqs_burst),
	      .control_rdata         (control_rdata), // not needed, just routes straight through to local_rdata
	      .control_wdata         (control_wdata),
	      .control_wdata_valid   (control_wdata_valid),
	      .ddr_a                 (ddr_a),
	      .ddr_ba                (ddr_ba),
	      .ddr_cas_n             (ddr_cas_n),
	      .ddr_cke_l             (ddr_cke_l),
	      .ddr_cke_h             (ddr_cke_h),
	      .ddr_cs_n              (ddr_cs_n),
	      .ddr_odt               (ddr_odt),
	      .ddr_ras_n             (ddr_ras_n),
	      .ddr_we_n              (ddr_we_n),
	      .local_write_req       (local_write_req),
	      .local_read_req        (local_read_req),
	      .local_autopch_req     (local_autopch_req),
	      .local_ready           (local_ready),
	      .local_cs_addr         (local_cs_addr),
	      .local_row_addr        (local_row_addr),
	      .local_bank_addr       (local_bank_addr),
	      .local_col_addr        (local_col_addr), 
	      .local_size            (local_size),
	//    .local_rdata           (open), // comes straight from the phy
	//    .local_rdata_valid     (open), // generated by the phy
	      .local_wdata           (local_wdata),
	      .local_be              (local_be),
	      .local_wdata_req       (local_wdata_req),
	      .local_init_done       (local_init_done),
	      .local_rdvalid_in_n    (),
	      .local_refresh_ack     (local_refresh_ack),
	      .local_refresh_req     (local_refresh_req),
	      .local_powerdn_ack     (local_powerdn_ack),
	      .local_powerdn_req     (local_powerdn_req),
	      .local_self_rfsh_ack   (local_self_rfsh_ack),
	      .local_self_rfsh_req   (local_self_rfsh_req),
	      .local_burstbegin      (local_burstbegin),
	      .mem_bl                (mem_bl),
	      .mem_btype             (mem_btype),
	      .mem_dll_en            (mem_dll_en),
	      .mem_dqsn_en           (mem_dqsn_en),
	      .mem_drv_str           (mem_drv_str),
	      .mem_odt               (mem_odt),
	      .mem_tcl               (mem_tcl),
	      .mem_tinit_time        (mem_tinit_time),
	      .mem_tmrd              (mem_tmrd),
	      .mem_tras              (mem_tras),
	      .mem_trcd              (mem_trcd),
	      .mem_trefi             (mem_trefi),
	      .mem_trfc              (mem_trfc),
	      .mem_trp               (mem_trp),
	      .mem_twr               (mem_twr),
	      .mem_twtr              (mem_twtr),
	      .reset_n               (reset_n)
	      );

      
//////////////////////////////////////////////////////////////////////////////-
// Controller timing parameters
//////////////////////////////////////////////////////////////////////////////-
  
  //
assign mem_tcl                       = 3'b100;
assign mem_bl                        = 3'b010;
assign mem_btype                     = 1'b0;
assign mem_dll_en                    = 1'b0;
assign mem_dqsn_en                   = 1'b0;
assign mem_drv_str                   = 1'b0;
assign mem_odt                       = 2'b00;
assign mem_twtr                      = 2'b10;
assign mem_tinit_time                = 16'b1101000001010110;
assign mem_trcd                      = 3'b101;
assign mem_tras                      = 4'b1101;
assign mem_twr                       = 3'b101;
assign mem_trp                       = 3'b101;
assign mem_trfc                      = 7'b0010101;
assign mem_tmrd                      = 2'b10;
assign mem_trefi                     = 16'b0000011101001011;

endmodule
