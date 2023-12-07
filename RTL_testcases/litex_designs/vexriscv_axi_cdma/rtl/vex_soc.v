/*
Top-level module for the Vexriscv SoC with AXI RAM and AXI Interconnect
*/
`default_nettype none

module vex_soc (
    input wire      reset,
    input wire      clk
);
    wire   	      	vexriscv_dBusAxi_ar_ready;
    wire   	      	vexriscv_dBusAxi_aw_ready;
    wire    [7:0] 	vexriscv_dBusAxi_b_payload_id;
    wire    [1:0] 	vexriscv_dBusAxi_b_payload_resp;
    wire          	vexriscv_dBusAxi_b_valid;
    reg    	[31:0]	vexriscv_dBusAxi_rf_payload_data;
    wire   	[7:0] 	vexriscv_dBusAxi_r_payload_id;
    wire          	vexriscv_dBusAxi_r_payload_last;
    wire    [1:0] 	vexriscv_dBusAxi_r_payload_resp;
    wire   	      	vexriscv_dBusAxi_r_valid;
    wire    	    vexriscv_dBusAxi_w_ready;
    wire   	      	vexriscv_debugReset = 1'd0;
    wire   	      	vexriscv_externalInterrupt  = 1'd0;
    wire          	vexriscv_iBusAxi_ar_ready;
    wire    [31:0]	vexriscv_iBusAxi_r_payload_data;
    wire    [7:0] 	vexriscv_iBusAxi_r_payload_id;
    wire          	vexriscv_iBusAxi_r_payload_last;
    wire    [1:0] 	vexriscv_iBusAxi_r_payload_resp;
    wire          	vexriscv_iBusAxi_r_valid;
    reg    	      	vexriscv_jtag_tck = 1'd0;
    reg    	      	vexriscv_jtag_tdi = 1'd0;
    reg    	      	vexriscv_jtag_tms = 1'd0;
    wire   	      	vexriscv_reset;
    wire 	[2:0] 	vexriscv_dBusAxi_ar_payload_size;
    wire 	[3:0] 	vexriscv_dBusAxi_ar_payload_qos;
    wire 	[7:0] 	vexriscv_dBusAxi_ar_payload_id;
    wire   	      	vexriscv_iBusAxi_ar_valid;
    reg    	      	vexriscv_iBusAxi_ar_first;
    reg    	      	vexriscv_iBusAxi_ar_last;
    wire 	[31:0]	vexriscv_iBusAxi_ar_payload_addr;
    wire 	[1:0] 	vexriscv_iBusAxi_ar_payload_burst;
    wire 	[7:0] 	vexriscv_iBusAxi_ar_payload_len;
    wire 	[2:0] 	vexriscv_iBusAxi_ar_payload_size;
    wire 	[1:0] 	vexriscv_iBusAxi_ar_payload_lock;
    wire 	[2:0] 	vexriscv_iBusAxi_ar_payload_prot;
    wire	[3:0] 	vexriscv_iBusAxi_ar_payload_cache;
    wire 	[3:0] 	vexriscv_iBusAxi_ar_payload_qos;
    wire   	      	vexriscv_dBusAxi_ar_valid;
    reg    	      	vexriscv_dBusAxi_ar_first;
    reg    	      	vexriscv_dBusAxi_ar_last;
    wire 	[31:0]	vexriscv_dBusAxi_ar_payload_addr;
    wire 	[1:0] 	vexriscv_dBusAxi_ar_payload_burst;
    wire 	[7:0] 	vexriscv_dBusAxi_ar_payload_len;
    wire   	      	vexriscv_dBusAxi_ar_payload_lock;
    wire 	[2:0] 	vexriscv_dBusAxi_ar_payload_prot;
    wire	[31:0]	vexriscv_dBusAxi_r_payload_data;
    wire	[3:0] 	vexriscv_dBusAxi_ar_payload_cache;
    wire	[31:0]	vexriscv_dBusAxi_aw_payload_addr;
    wire	[1:0] 	vexriscv_dBusAxi_aw_payload_burst;
    wire	[7:0] 	vexriscv_dBusAxi_aw_payload_len;
    wire	[3:0] 	vexriscv_dBusAxi_aw_payload_size;
    wire   	      	vexriscv_dBusAxi_aw_payload_lock;
    wire	[2:0] 	vexriscv_dBusAxi_aw_payload_prot;
    wire	[3:0] 	vexriscv_dBusAxi_aw_payload_cache;
    wire	[3:0] 	vexriscv_dBusAxi_aw_payload_qos;
    wire   	      	vexriscv_dBusAxi_aw_payload_id;
    wire   	      	vexriscv_dBusAxi_aw_valid;
    reg    	      	vexriscv_dBusAxi_aw_first;
    reg    	      	vexriscv_dBusAxi_aw_last;
    wire   	      	vexriscv_dBusAxi_b_ready;
    wire   	      	vexriscv_dBusAxi_r_ready;
    wire   	      	vexriscv_iBusAxi_r_ready;
    wire	[31:0]	vexriscv_dBusAxi_w_payload_data;
    wire	[31:0]	axilitesram1_dat_w;
    wire	[3:0] 	vexriscv_dBusAxi_w_payload_strb;
    wire   	      	vexriscv_dBusAxi_w_last;
    wire   	      	vexriscv_dBusAxi_w_valid;
    wire   	      	vexriscv_iBusAxi_ar_payload_id;
    wire   	      	vexriscv_jtag_tdo;
    wire	[3:0] 	vexriscv_dBusAxi_ar_payload_region;
    wire   	      	vexriscv_dBusAxi_w_payload_last;
    wire   			vexriscv_dBusAxi_aw_payload_user;
    wire			vexriscv_dBusAxi_w_payload_user;
    wire			vexriscv_dBusAxi_b_payload_user;
    wire			vexriscv_dBusAxi_ar_payload_user;
    wire			vexriscv_dBusAxi_r_payload_user;
    wire   	      	vexriscv5;
    wire   	      	vexriscv6;
    wire   	      	vexriscv7;
    wire   	      	vexriscv8;
    wire    [7:0]  	axi4_m00_axi_awid;
    wire    [31:0] 	axi4_m00_axi_awaddr;
    wire    [7:0]   axi4_m00_axi_awlen;
    wire    [2:0]   axi4_m00_axi_awsize;
    wire    [1:0]   axi4_m00_axi_awburst;
    wire           	axi4_m00_axi_awlock;
    wire    [3:0]   axi4_m00_axi_awcache;
    wire    [2:0]   axi4_m00_axi_awprot;
    wire           	axi4_m00_axi_awvalid;
    wire           	axi4_m00_axi_awready;
    wire    [31:0]  axi4_m00_axi_wdata;
    wire    [3:0]   axi4_m00_axi_wstrb;
    wire           	axi4_m00_axi_wlast;
    wire           	axi4_m00_axi_wvalid;
    wire           	axi4_m00_axi_wready;
    wire   	[7:0]   axi4_m00_axi_bid;
    wire   	[1:0]   axi4_m00_axi_bresp;
    wire           	axi4_m00_axi_bvalid;
    wire           	axi4_m00_axi_bready;
    wire    [7:0]   axi4_m00_axi_arid;
    wire    [31:0]  axi4_m00_axi_araddr;
    wire    [7:0]   axi4_m00_axi_arlen;
    wire    [2:0]   axi4_m00_axi_arsize;
    wire    [1:0]   axi4_m00_axi_arburst;
    wire           	axi4_m00_axi_arlock;
    wire    [3:0]   axi4_m00_axi_arcache;
    wire    [2:0]   axi4_m00_axi_arprot;
    wire           	axi4_m00_axi_arvalid;
    wire           	axi4_m00_axi_arready;
    wire   	[7:0]   axi4_m00_axi_rid;
    wire   	[31:0]  axi4_m00_axi_rdata;
    wire   	[1:0]   axi4_m00_axi_rresp;
    wire           	axi4_m00_axi_rlast;
    wire           	axi4_m00_axi_rvalid;
    wire            axi4_m00_axi_rready;
    wire			axi4_m00_axi_buser;
    wire 			axi4_m00_axi_ruser;
    wire            	o_int;

    //-----------AXI4 interconnect----------

    wire     [7:0]  axi4_m01_axi_awid;
    wire     [31:0] axi4_m01_axi_awaddr;
    wire     [7:0]  axi4_m01_axi_awlen;
    wire     [2:0]  axi4_m01_axi_awsize;
    wire     [1:0]  axi4_m01_axi_awburst;
    wire       	    axi4_m01_axi_awlock;
    wire     [3:0]  axi4_m01_axi_awcache;
    wire     [2:0]  axi4_m01_axi_awprot;
    wire            axi4_m01_axi_awvalid;
    wire            axi4_m01_axi_awready;
    wire     [31:0] axi4_m01_axi_wdata;
    wire     [3:0]  axi4_m01_axi_wstrb;
    wire            axi4_m01_axi_wlast;
    wire           	axi4_m01_axi_wvalid;
    wire           	axi4_m01_axi_wready;
    wire    [7:0]   axi4_m01_axi_bid;
    wire    [1:0]   axi4_m01_axi_bresp;
    wire           	axi4_m01_axi_bvalid;
    wire            axi4_m01_axi_bready;
    wire     [7:0]  axi4_m01_axi_arid;
    wire     [31:0] axi4_m01_axi_araddr;
    wire     [7:0]  axi4_m01_axi_arlen;
    wire     [2:0]  axi4_m01_axi_arsize;
    wire     [1:0]  axi4_m01_axi_arburst;
    wire            axi4_m01_axi_arlock;
    wire     [3:0]  axi4_m01_axi_arcache;
    wire     [2:0]  axi4_m01_axi_arprot;
    wire            axi4_m01_axi_arvalid;
    wire            axi4_m01_axi_arready;
    wire    [7:0]   axi4_m01_axi_rid;
    wire    [31:0]  axi4_m01_axi_rdata;
    wire    [1:0]   axi4_m01_axi_rresp;
    wire           	axi4_m01_axi_rlast;
    wire           	axi4_m01_axi_rvalid;
    wire            axi4_m01_axi_rready;
    wire			axi4_m01_axi_buser;
    wire 			axi4_m01_axi_ruser;



    wire     [7:0]  axi4_m02_axi_awid;
    wire     [31:0] axi4_m02_axi_awaddr;
    wire     [7:0]  axi4_m02_axi_awlen;
    wire     [2:0]  axi4_m02_axi_awsize;
    wire     [1:0]  axi4_m02_axi_awburst;
    wire       	    axi4_m02_axi_awlock;
    wire     [3:0]  axi4_m02_axi_awcache;
    wire     [2:0]  axi4_m02_axi_awprot;
    wire            axi4_m02_axi_awvalid;
    wire            axi4_m02_axi_awready;
    wire     [31:0] axi4_m02_axi_wdata;
    wire     [3:0]  axi4_m02_axi_wstrb;
    wire            axi4_m02_axi_wlast;
    wire            axi4_m02_axi_wvalid;
    wire           	axi4_m02_axi_wready;
    wire    [7:0]   axi4_m02_axi_bid;
    wire    [1:0]   axi4_m02_axi_bresp;
    wire           	axi4_m02_axi_bvalid;
    wire            axi4_m02_axi_bready;
    wire     [7:0]  axi4_m02_axi_arid;
    wire     [31:0] axi4_m02_axi_araddr;
    wire     [7:0]  axi4_m02_axi_arlen;
    wire     [2:0]  axi4_m02_axi_arsize;
    wire     [1:0]  axi4_m02_axi_arburst;
    wire            axi4_m02_axi_arlock;
    wire     [3:0]  axi4_m02_axi_arcache;
    wire     [2:0]  axi4_m02_axi_arprot;
    wire            axi4_m02_axi_arvalid;
    wire           	axi4_m02_axi_arready;
    wire    [7:0]   axi4_m02_axi_rid;
    wire    [31:0]  axi4_m02_axi_rdata;
    wire    [1:0]   axi4_m02_axi_rresp;
    wire           	axi4_m02_axi_rlast;
    wire           	axi4_m02_axi_rvalid;
    wire            axi4_m02_axi_rready;
    wire			axi4_m02_axi_buser;
    wire 			axi4_m02_axi_ruser;

//----------------offset_remove_comb-----
    wire    [31:0] 	axi_addr;
    wire    [31:0] 	addr_without_offset;
//-----------AXI2AXILite Interconnections


    wire    [31:0]  axi2axil_awaddr;
    wire    [2:0]   axi2axil_awprot;
    wire            axi2axil_awvalid;
    wire            axi2axil_awready;
    wire    [31:0]  axi2axil_wdata;
    wire    [3:0]   axi2axil_wstrb;
    wire            axi2axil_wvalid;
    wire            axi2axil_wready;
    wire    [1:0]   axi2axil_bresp;
    wire            axi2axil_bvalid;
    wire            axi2axil_bready;
    wire    [31:0]  axi2axil_araddr;
    wire    [2:0]   axi2axil_arprot;
    wire            axi2axil_arvalid;
    wire            axi2axil_arready;
    wire            axi2axil_rvalid;
    wire            axi2axil_rready;
    wire    [31:0]  axi2axil_rdata;
    wire    [1:0]   axi2axil_rresp; 



//------	-Ram--	---------------    
    reg 	[7:0] 	ram_s_axi_awid; 
    reg 	[31:0]	ram_s_axi_awaddr; 
    reg 	[7:0] 	ram_s_axi_awlen; 
    reg 	[2:0] 	ram_s_axi_awsize; 
    reg 	[1:0] 	ram_s_axi_awburst; 
    reg 	      	ram_s_axi_awlock; 
    reg 	[3:0] 	ram_s_axi_awcache; 
    reg 	[2:0] 	ram_s_axi_awprot; 
    reg 	      	ram_s_axi_awvalid; 
    wire	      	ram_s_axi_awready; 
    reg 	[31:0]	ram_s_axi_wdata; 
    reg 	[3:0] 	ram_s_axi_wstrb; 
    reg 	      	ram_s_axi_wlast; 
    reg 	      	ram_s_axi_wvalid; 
    wire	      	ram_s_axi_wready; 
    wire	[7:0] 	ram_s_axi_bid; 
    wire	[1:0] 	ram_s_axi_bresp; 
    wire	      	ram_s_axi_bvalid; 
    reg 	      	ram_s_axi_bready; 
    reg 	[7:0] 	ram_s_axi_arid; 
    reg 	[31:0]	ram_s_axi_araddr; 
    reg 	[7:0] 	ram_s_axi_arlen; 
    reg 	[2:0] 	ram_s_axi_arsize; 
    reg 	[1:0] 	ram_s_axi_arburst; 
    reg 	      	ram_s_axi_arlock; 
    reg 	[3:0] 	ram_s_axi_arcache; 
    reg 	[2:0] 	ram_s_axi_arprot; 
    reg 	      	ram_s_axi_arvalid; 
    wire	      	ram_s_axi_arready; 
    wire	[7:0] 	ram_s_axi_rid; 
    wire	[31:0]	ram_s_axi_rdata; 
    wire	[1:0] 	ram_s_axi_rresp; 
    wire	      	ram_s_axi_rlast; 
    wire	      	ram_s_axi_rvalid; 

//------------AXILite Interconnect---------//
    wire            axil_m00_awvalid;
    wire            axil_m00_awready;
    wire   [31:0]   axil_m00_awaddr;
    wire   [2:0]    axil_m00_awprot;
    wire            axil_m00_wvalid;
    wire            axil_m00_wready;
    wire   [31:0]   axil_m00_wdata;
    wire   [3:0]    axil_m00_wstrb;
    wire            axil_m00_bvalid;
    wire            axil_m00_bready;
    wire   [1:0]    axil_m00_bresp;
    wire            axil_m00_arvalid;
    wire            axil_m00_arready;
    wire   [31:0]   axil_m00_araddr;
    wire   [2:0]    axil_m00_arprot;
    wire            axil_m00_rvalid;
    wire            axil_m00_rready;
    wire   [1:0]    axil_m00_rresp;
    wire   [31:0]   axil_m00_rdata;
    wire            axil_m01_awvalid;
    wire            axil_m01_awready;
    wire   [31:0]   axil_m01_awaddr;
    wire   [2:0]    axil_m01_awprot;
    wire            axil_m01_wvalid;
    wire            axil_m01_wready;
    wire   [31:0]   axil_m01_wdata;
    wire   [3:0]    axil_m01_wstrb;
    wire            axil_m01_bvalid;
    wire            axil_m01_bready;
    wire   [1:0]    axil_m01_bresp;
    wire            axil_m01_arvalid;
    wire            axil_m01_arready;
    wire   [31:0]   axil_m01_araddr;
    wire   [2:0]    axil_m01_arprot;
    wire            axil_m01_rvalid;
    wire            axil_m01_rready;
    wire   [1:0]    axil_m01_rresp;
    wire   [31:0]   axil_m01_rdata;


//------------Uart ports---------------------------
    wire            int_o;
    reg             srx_pad_i = 1'd0;
    wire            stx_pad_o;
    wire            rts_pad_o;
    reg             cts_pad_i = 1'd0;
    wire            dtr_pad_o;
    reg             dsr_pad_i = 1'd0;
    reg             ri_pad_i = 1'd0;
    reg             dcd_pad_i = 1'd0;

//----------------Instansiation------------//
	// Turning 8 bit data to 32 bit for compatibility
    wire     [31:0]  temp_wire;
    assign temp_wire = {axil_m01_rdata, axil_m01_rdata, axil_m01_rdata, axil_m01_rdata};


//-----------Instruction AXI RAM----------

axi_ram ram_inst(
    .clk						(clk),
    .rst						(reset),
    .s_axi_awid					(ram_s_axi_awid),
    .s_axi_awaddr				(ram_s_axi_awaddr),
    .s_axi_awlen				(ram_s_axi_awlen),
    .s_axi_awsize				(ram_s_axi_awsize),
    .s_axi_awburst				(ram_s_axi_awburst),
    .s_axi_awlock				(ram_s_axi_awlock),
    .s_axi_awcache				(ram_s_axi_awcache),
    .s_axi_awprot				(ram_s_axi_awprot),
    .s_axi_awvalid				(ram_s_axi_awvalid),
    .s_axi_awready				(ram_s_axi_awready),
    .s_axi_wdata				(ram_s_axi_wdata),
    .s_axi_wstrb				(ram_s_axi_wstrb),
    .s_axi_wlast				(ram_s_axi_wlast),
    .s_axi_wvalid				(ram_s_axi_wvalid),
    .s_axi_wready				(ram_s_axi_wready),
    .s_axi_bid					(ram_s_axi_bid),
    .s_axi_bresp				(ram_s_axi_bresp),
    .s_axi_bvalid				(ram_s_axi_bvalid),
    .s_axi_bready				(ram_s_axi_bready),
    .s_axi_arid					(vexriscv_iBusAxi_ar_payload_id),
    .s_axi_araddr				(vexriscv_iBusAxi_ar_payload_addr),
    .s_axi_arlen				(vexriscv_iBusAxi_ar_payload_len),
    .s_axi_arsize				(vexriscv_iBusAxi_ar_payload_size),
    .s_axi_arburst				(vexriscv_iBusAxi_ar_payload_burst),
    .s_axi_arlock				(vexriscv_iBusAxi_ar_payload_lock),
    .s_axi_arcache				(vexriscv_iBusAxi_ar_payload_cache),
    .s_axi_arprot				(vexriscv_iBusAxi_ar_payload_prot),
    .s_axi_arvalid				(vexriscv_iBusAxi_ar_valid),
    .s_axi_arready				(vexriscv_iBusAxi_ar_ready),
    .s_axi_rid					(vexriscv_iBusAxi_r_payload_id),
    .s_axi_rdata				(vexriscv_iBusAxi_r_payload_data),
    .s_axi_rresp				(vexriscv_iBusAxi_r_payload_resp),
    .s_axi_rlast				(vexriscv_iBusAxi_r_payload_last),
    .s_axi_rvalid				(vexriscv_iBusAxi_r_valid),
    .s_axi_rready				(vexriscv_iBusAxi_r_ready)
	);




//---------------VexRiscv----------------

VexRiscvAxi4 cpu(
	.clk						(clk),
	.dBusAxi_ar_ready			(vexriscv_dBusAxi_ar_ready),
	.dBusAxi_aw_ready			(vexriscv_dBusAxi_aw_ready),
	.dBusAxi_b_payload_id		(vexriscv_dBusAxi_b_payload_id),
	.dBusAxi_b_payload_resp		(vexriscv_dBusAxi_b_payload_resp),
	.dBusAxi_b_valid			(vexriscv_dBusAxi_b_valid),
	.dBusAxi_r_payload_data		(vexriscv_dBusAxi_r_payload_data),
	.dBusAxi_r_payload_id		(vexriscv_dBusAxi_r_payload_id),
	.dBusAxi_r_payload_last		(vexriscv_dBusAxi_r_payload_last),
	.dBusAxi_r_payload_resp		(vexriscv_dBusAxi_r_payload_resp),
	.dBusAxi_r_valid			(vexriscv_dBusAxi_r_valid),
	.dBusAxi_w_ready			(vexriscv_dBusAxi_w_ready),
	.debugReset					(vexriscv_debugReset),
	.externalInterrupt			(vexriscv_externalInterrupt),
	.iBusAxi_ar_ready			(vexriscv_iBusAxi_ar_ready),
	.iBusAxi_r_payload_data		(vexriscv_iBusAxi_r_payload_data),
	.iBusAxi_r_payload_id		(vexriscv_iBusAxi_r_payload_id),
	.iBusAxi_r_payload_last		(vexriscv_iBusAxi_r_payload_last),
	.iBusAxi_r_payload_resp		(vexriscv_iBusAxi_r_payload_resp),
	.iBusAxi_r_valid			(vexriscv_iBusAxi_r_valid),
	.jtag_tck					(vexriscv_jtag_tck),
	.jtag_tdi					(vexriscv_jtag_tdi),
	.jtag_tms					(vexriscv_jtag_tms),
	.reset						(reset),
	.softwareInterrupt			(1'd0),
	.timerInterrupt				(1'd0),
	.dBusAxi_ar_payload_addr	(vexriscv_dBusAxi_ar_payload_addr),
	.dBusAxi_ar_payload_burst	(vexriscv_dBusAxi_ar_payload_burst),
	.dBusAxi_ar_payload_cache	(vexriscv_dBusAxi_ar_payload_cache),
	.dBusAxi_ar_payload_id		(vexriscv_dBusAxi_ar_payload_id),
	.dBusAxi_ar_payload_len		(vexriscv_dBusAxi_ar_payload_len),
	.dBusAxi_ar_payload_lock	(vexriscv_dBusAxi_ar_payload_lock),
	.dBusAxi_ar_payload_prot	(vexriscv_dBusAxi_ar_payload_prot),
	.dBusAxi_ar_payload_qos		(vexriscv_dBusAxi_ar_payload_qos),
	.dBusAxi_ar_payload_region	(vexriscv_dBusAxi_ar_payload_region),
	.dBusAxi_ar_payload_size	(vexriscv_dBusAxi_ar_payload_size),
	.dBusAxi_ar_valid			(vexriscv_dBusAxi_ar_valid),
	.dBusAxi_aw_payload_addr	(vexriscv_dBusAxi_aw_payload_addr),
	.dBusAxi_aw_payload_burst	(vexriscv_dBusAxi_aw_payload_burst),
	.dBusAxi_aw_payload_cache	(vexriscv_dBusAxi_aw_payload_cache),
	.dBusAxi_aw_payload_id		(vexriscv_dBusAxi_aw_payload_id),
	.dBusAxi_aw_payload_len		(vexriscv_dBusAxi_aw_payload_len),
	.dBusAxi_aw_payload_lock	(vexriscv_dBusAxi_aw_payload_lock),
	.dBusAxi_aw_payload_prot	(vexriscv_dBusAxi_aw_payload_prot),
	.dBusAxi_aw_payload_qos		(vexriscv_dBusAxi_aw_payload_qos),
	.dBusAxi_aw_payload_region	(vexriscv6),
	.dBusAxi_aw_payload_size	(vexriscv_dBusAxi_aw_payload_size),
	.dBusAxi_aw_valid			(vexriscv_dBusAxi_aw_valid),
	.dBusAxi_b_ready			(vexriscv_dBusAxi_b_ready),
	.dBusAxi_r_ready			(vexriscv_dBusAxi_r_ready),
	.dBusAxi_w_payload_data		(vexriscv_dBusAxi_w_payload_data),
	.dBusAxi_w_payload_last		(vexriscv_dBusAxi_w_payload_last),
	.dBusAxi_w_payload_strb		(vexriscv_dBusAxi_w_payload_strb),
	.dBusAxi_w_valid			(vexriscv_dBusAxi_w_valid),
	.iBusAxi_ar_payload_addr	(vexriscv_iBusAxi_ar_payload_addr),
	.iBusAxi_ar_payload_burst	(vexriscv_iBusAxi_ar_payload_burst),
	.iBusAxi_ar_payload_cache	(vexriscv_iBusAxi_ar_payload_cache),
	.iBusAxi_ar_payload_id		(vexriscv_iBusAxi_ar_payload_id),
	.iBusAxi_ar_payload_len		(vexriscv_iBusAxi_ar_payload_len),
	.iBusAxi_ar_payload_lock	(vexriscv_iBusAxi_ar_payload_lock),
	.iBusAxi_ar_payload_prot	(vexriscv_iBusAxi_ar_payload_prot),
	.iBusAxi_ar_payload_qos		(vexriscv_iBusAxi_ar_payload_qos),
	.iBusAxi_ar_payload_region	(vexriscv7),
	.iBusAxi_ar_payload_size	(vexriscv_iBusAxi_ar_payload_size),
	.iBusAxi_ar_valid			(vexriscv_iBusAxi_ar_valid),
	.iBusAxi_r_ready			(vexriscv_iBusAxi_r_ready),
	.jtag_tdo					(vexriscv5),
	.debug_resetOut				(vexriscv8)
	);


//-----------AXI2AXILite Bridge---------------------

//--------------------------------------------------

axi2axilite axi2axil(
    //----------AXI4 Slave Interface
    .S_AXI_ACLK                 (clk),
    .S_AXI_ARESETN              (!reset),
    .S_AXI_AWVALID              (vexriscv_dBusAxi_aw_valid),
    .S_AXI_AWREADY              (vexriscv_dBusAxi_aw_ready),
    .S_AXI_AWID                 (vexriscv_dBusAxi_aw_payload_id),
    .S_AXI_AWADDR               (vexriscv_dBusAxi_aw_payload_addr),
    .S_AXI_AWLEN                (vexriscv_dBusAxi_aw_payload_len),
    .S_AXI_AWSIZE               (vexriscv_dBusAxi_aw_payload_size),
    .S_AXI_AWBURST              (vexriscv_dBusAxi_aw_payload_burst),
    .S_AXI_AWLOCK               (vexriscv_dBusAxi_aw_payload_lock),
    .S_AXI_AWCACHE              (vexriscv_dBusAxi_aw_payload_cache),
    .S_AXI_AWPROT               (vexriscv_dBusAxi_aw_payload_prot),
    .S_AXI_AWQOS                (vexriscv_dBusAxi_aw_payload_qos),
    .S_AXI_WVALID               (vexriscv_dBusAxi_w_valid),
    .S_AXI_WREADY               (vexriscv_dBusAxi_w_ready),
    .S_AXI_WDATA                (vexriscv_dBusAxi_w_payload_data),
    .S_AXI_WSTRB                (vexriscv_dBusAxi_w_payload_strb),
    .S_AXI_WLAST                (vexriscv_dBusAxi_w_payload_last),
    .S_AXI_BVALID               (vexriscv_dBusAxi_b_valid),
    .S_AXI_BREADY               (vexriscv_dBusAxi_b_ready),
    .S_AXI_BID                  (vexriscv_dBusAxi_b_payload_id),
    .S_AXI_BRESP                (vexriscv_dBusAxi_b_payload_resp),
    .S_AXI_ARVALID              (vexriscv_dBusAxi_ar_valid),
    .S_AXI_ARREADY              (vexriscv_dBusAxi_ar_ready),
    .S_AXI_ARID                 (vexriscv_dBusAxi_ar_payload_id),
    .S_AXI_ARADDR               (vexriscv_dBusAxi_ar_payload_addr),
    .S_AXI_ARLEN                (vexriscv_dBusAxi_ar_payload_len),
    .S_AXI_ARSIZE               (vexriscv_dBusAxi_ar_payload_size),
    .S_AXI_ARBURST              (vexriscv_dBusAxi_ar_payload_burst),
    .S_AXI_ARLOCK               (vexriscv_dBusAxi_ar_payload_lock),
    .S_AXI_ARCACHE              (vexriscv_dBusAxi_ar_payload_cache),
    .S_AXI_ARPROT               (vexriscv_dBusAxi_ar_payload_prot),
    .S_AXI_ARQOS                (vexriscv_dBusAxi_ar_payload_qos),
    .S_AXI_RVALID               (vexriscv_dBusAxi_r_valid),
    .S_AXI_RREADY               (vexriscv_dBusAxi_r_ready),
    .S_AXI_RID                  (vexriscv_dBusAxi_r_payload_id),
    .S_AXI_RDATA                (vexriscv_dBusAxi_r_payload_data),
    .S_AXI_RRESP                (vexriscv_dBusAxi_r_payload_resp),
    .S_AXI_RLAST                (vexriscv_dBusAxi_r_payload_last),
    //----------AXI4 Lite Master Interface
    .M_AXI_AWADDR               (axi2axil_awaddr),
    .M_AXI_AWPROT               (axi2axil_awprot),
    .M_AXI_AWVALID              (axi2axil_awvalid),
    .M_AXI_AWREADY              (axi2axil_awready),
    .M_AXI_WDATA                (axi2axil_wdata),
    .M_AXI_WSTRB                (axi2axil_wstrb),
    .M_AXI_WVALID               (axi2axil_wvalid),
    .M_AXI_WREADY               (axi2axil_wready),
    .M_AXI_BRESP                (axi2axil_bresp),
    .M_AXI_BVALID               (axi2axil_bvalid),
    .M_AXI_BREADY               (axi2axil_bready),
    .M_AXI_ARADDR               (axi2axil_araddr),
    .M_AXI_ARPROT               (axi2axil_arprot),
    .M_AXI_ARVALID              (axi2axil_arvalid),
    .M_AXI_ARREADY              (axi2axil_arready),
    .M_AXI_RVALID               (axi2axil_rvalid),
    .M_AXI_RREADY               (axi2axil_rready),
    .M_AXI_RDATA                (axi2axil_rdata),
    .M_AXI_RRESP                (axi2axil_rresp)
	);

axil_interconnect_1x2 axil_interconnect_1x2 (
    .clk                        (clk),
    .rst                        (reset),
    .s00_axil_awvalid           (axi2axil_awvalid),
    .s00_axil_awready           (axi2axil_awready),
    .s00_axil_awaddr            (axi2axil_awaddr),
    .s00_axil_awprot            (axi2axil_awprot),
    .s00_axil_wvalid            (axi2axil_wvalid),
    .s00_axil_wready            (axi2axil_wready),
    .s00_axil_wdata             (axi2axil_wdata),
    .s00_axil_wstrb             (axi2axil_wstrb),
    .s00_axil_bvalid            (axi2axil_bvalid),
    .s00_axil_bready            (axi2axil_bready),
    .s00_axil_bresp             (axi2axil_bresp),
    .s00_axil_arvalid           (axi2axil_arvalid),
    .s00_axil_arready           (axi2axil_arready),
    .s00_axil_araddr            (axi2axil_araddr),
    .s00_axil_arprot            (axi2axil_arprot),
    .s00_axil_rvalid            (axi2axil_rvalid),
    .s00_axil_rready            (axi2axil_rready),
    .s00_axil_rresp             (axi2axil_rresp),
    .s00_axil_rdata             (axi2axil_rdata),
    .m00_axil_awvalid           (axil_m00_awvalid),
    .m00_axil_awready           (axil_m00_awready),
    .m00_axil_awaddr            (axil_m00_awaddr),
    .m00_axil_awprot            (axil_m00_awprot),
    .m00_axil_wvalid            (axil_m00_wvalid),
    .m00_axil_wready            (axil_m00_wready),
    .m00_axil_wdata             (axil_m00_wdata),
    .m00_axil_wstrb             (axil_m00_wstrb),
    .m00_axil_bvalid            (axil_m00_bvalid),
    .m00_axil_bready            (axil_m00_bready),
    .m00_axil_bresp             (axil_m00_bresp),
    .m00_axil_arvalid           (axil_m00_arvalid),
    .m00_axil_arready           (axil_m00_arready),
    .m00_axil_araddr            (axil_m00_araddr),
    .m00_axil_arprot            (axil_m00_arprot),
    .m00_axil_rvalid            (axil_m00_rvalid),
    .m00_axil_rready            (axil_m00_rready),
    .m00_axil_rresp             (axil_m00_rresp),
    .m00_axil_rdata             (axil_m00_rdata),
    .m01_axil_awvalid           (axil_m01_awvalid),
    .m01_axil_awready           (axil_m01_awready),
    .m01_axil_awaddr            (axil_m01_awaddr),
    .m01_axil_awprot            (axil_m01_awprot),
    .m01_axil_wvalid            (axil_m01_wvalid),
    .m01_axil_wready            (axil_m01_wready),
    .m01_axil_wdata             (axil_m01_wdata),
    .m01_axil_wstrb             (axil_m01_wstrb),
    .m01_axil_bvalid            (axil_m01_bvalid),
    .m01_axil_bready            (axil_m01_bready),
    .m01_axil_bresp             (axil_m01_bresp),
    .m01_axil_arvalid           (axil_m01_arvalid),
    .m01_axil_arready           (axil_m01_arready),
    .m01_axil_araddr            (axil_m01_araddr),
    .m01_axil_arprot            (axil_m01_arprot),
    .m01_axil_rvalid            (axil_m01_rvalid),
    .m01_axil_rready            (axil_m01_rready),
    .m01_axil_rresp             (axil_m01_rresp),
    .m01_axil_rdata             (axil_m01_rdata)

);
//-----------offset_remove_comb----------
offset_remove_comb remove_offset(
    .in_addr					(axil_m00_awaddr),
    .out_addr					(addr_without_offset)
);

//-----------AXI CDMA---------------


axi_cdma  axi_cdma (
    .S_AXI_ACLK 				(clk ),
    .S_AXI_ARESETN 				(!reset ),
    .S_AXIL_AWVALID 			(axil_m00_awvalid ),
    .S_AXIL_AWREADY 			(axil_m00_awready ),
    .S_AXIL_AWADDR 				(addr_without_offset ),
    .S_AXIL_AWPROT 				(axil_m00_awprot ),
    .S_AXIL_WVALID 				(axil_m00_wvalid ),
    .S_AXIL_WREADY 				(axil_m00_wready ),
    .S_AXIL_WDATA 				(axil_m00_wdata ),
    .S_AXIL_WSTRB 				(axil_m00_wstrb ),
    .S_AXIL_BVALID 				(axil_m00_bvalid ),
    .S_AXIL_BREADY 				(axil_m00_bready ),
    .S_AXIL_BRESP 				(axil_m00_bresp ),
    .S_AXIL_ARVALID 			(axil_m00_arvalid ),
    .S_AXIL_ARREADY 			(axil_m00_arready ),
    .S_AXIL_ARADDR 				(axil_m00_araddr ),
    .S_AXIL_ARPROT 				(axil_m00_arprot ),
    .S_AXIL_RVALID 				(axil_m00_rvalid ),
    .S_AXIL_RREADY 				(axil_m00_rready ),
    .S_AXIL_RDATA 				(axil_m00_rdata ),
    .S_AXIL_RRESP 				(axil_m00_rresp ),


    .M_AXI_AWVALID 				(axi4_m00_axi_awvalid),
    .M_AXI_AWREADY 				(axi4_m00_axi_awready ),
    .M_AXI_AWID 				(axi4_m00_axi_awid ),
    .M_AXI_AWADDR 				(axi4_m00_axi_awaddr),
    .M_AXI_AWLEN 				(axi4_m00_axi_awlen),
    .M_AXI_AWSIZE 				(axi4_m00_axi_awsize ),
    .M_AXI_AWBURST 				(axi4_m00_axi_awburst),
    .M_AXI_AWLOCK 				(axi4_m00_axi_awlock ),
    .M_AXI_AWCACHE 				(axi4_m00_axi_awcache ),
    .M_AXI_AWPROT 				(axi4_m00_axi_awprot),
    .M_AXI_AWQOS 				( ),
    .M_AXI_WVALID 				(axi4_m00_axi_wvalid),
    .M_AXI_WREADY 				(axi4_m00_axi_wready),
    .M_AXI_WDATA 				(axi4_m00_axi_wdata),
    .M_AXI_WSTRB 				(axi4_m00_axi_wstrb),
    .M_AXI_WLAST 				(axi4_m00_axi_wlast),
    .M_AXI_BVALID 				(axi4_m00_axi_bvalid),
    .M_AXI_BREADY 				(axi4_m00_axi_bready),
    .M_AXI_BID 					(axi4_m00_axi_bid),
    .M_AXI_BRESP 				(axi4_m00_axi_bresp),
    .M_AXI_ARVALID 				(axi4_m00_axi_arvalid ),
    .M_AXI_ARREADY 				(axi4_m00_axi_arready ),
    .M_AXI_ARID 				(axi4_m00_axi_arid ),
    .M_AXI_ARADDR 				(axi4_m00_axi_araddr ),
    .M_AXI_ARLEN				(axi4_m00_axi_arlen),
    .M_AXI_ARSIZE 				(axi4_m00_axi_arsize ),
    .M_AXI_ARBURST 				(axi4_m00_axi_arburst),
    .M_AXI_ARLOCK 				(axi4_m00_axi_arlock),
    .M_AXI_ARCACHE 				(axi4_m00_axi_arcache),
    .M_AXI_ARPROT 				(axi4_m00_axi_arprot),
    .M_AXI_ARQOS 				( ),
    .M_AXI_RVALID 				(axi4_m00_axi_rvalid),
    .M_AXI_RREADY 				(axi4_m00_axi_rready ),
    .M_AXI_RID 					(axi4_m00_axi_rid ),
    .M_AXI_RDATA 				(axi4_m00_axi_rdata),
    .M_AXI_RLAST 				(axi4_m00_axi_rlast ),
    .M_AXI_RRESP 				(axi4_m00_axi_rresp ),
    .o_int  					(o_int)
  );


 
//-----------AXILite UART-----------------

axi4lite_uart_top uart(
    .s_axi_aclk                 (clk),
    .s_axi_aresetn              (!reset),
    .s_axi_awvalid              (axil_m01_awvalid),
    .s_axi_awaddr               (axil_m01_awaddr),
    .s_axi_awprot               (axil_m01_awprot),
    .s_axi_awready              (axil_m01_awready),
    .s_axi_wvalid               (axil_m01_wvalid),
    .s_axi_wdata                (axil_m01_wdata),
    .s_axi_wstrb                (axil_m01_wstrb),
    .s_axi_wready               (axil_m01_wready),
    .s_axi_bvalid               (axil_m01_bvalid),
    .s_axi_bresp                (axil_m01_bresp),
    .s_axi_bready               (axil_m01_bready),
    .s_axi_arvalid              (axil_m01_arvalid),
    .s_axi_araddr               (axil_m01_araddr),
    .s_axi_arprot               (axil_m01_arprot),
    .s_axi_arready              (axil_m01_arready),
    .s_axi_rvalid               (axil_m01_rvalid),
    .s_axi_rdata                (axil_m01_rdata),
    .s_axi_rresp                (axil_m01_rresp),
    .s_axi_rready               (axil_m01_rready),
    .int_o                      (int_o),
    .srx_pad_i                  (stx_pad_o),
    .stx_pad_o                  (stx_pad_o),
    .rts_pad_o                  (rts_pad_o),
    .cts_pad_i                  (cts_pad_i),
    .dtr_pad_o                  (dtr_pad_o),
    .dsr_pad_i                  (dsr_pad_i),
    .ri_pad_i                   (ri_pad_i ),
    .dcd_pad_i                  (dcd_pad_i));


  axi_interconnect_wrapper axi_interconnect_1x2 (
    .clk 						(clk ),
    .rst 						(reset ),
    .s00_axi_awvalid 			(axi4_m00_axi_awvalid ),
    .s00_axi_awready 			(axi4_m00_axi_awready ),
    .s00_axi_awaddr 			(axi4_m00_axi_awaddr ),
    .s00_axi_awburst 			(axi4_m00_axi_awburst ),
    .s00_axi_awlen 				(axi4_m00_axi_awlen ),
    .s00_axi_awsize 			(axi4_m00_axi_awsize ),
    .s00_axi_awlock 			(axi4_m00_axi_awlock ),
    .s00_axi_awprot 			(axi4_m00_axi_awprot ),
    .s00_axi_awcache 			(axi4_m00_axi_awcache ),
    .s00_axi_awqos 				( ),
    .s00_axi_awregion 			( ),
    .s00_axi_awid 				(axi4_m00_axi_awid ),
    .s00_axi_awuser 			( ),
    .s00_axi_wvalid 			(axi4_m00_axi_wvalid ),
    .s00_axi_wready 			(axi4_m00_axi_wready ),
    .s00_axi_wlast 				(axi4_m00_axi_wlast ),
    .s00_axi_wdata 				(axi4_m00_axi_wdata ),
    .s00_axi_wstrb 				(axi4_m00_axi_wstrb ),
    .s00_axi_wuser 				( ),
    .s00_axi_bvalid 			(axi4_m00_axi_bvalid ),
    .s00_axi_bready 			(axi4_m00_axi_bready ),
    .s00_axi_bresp 				(axi4_m00_axi_bresp ),
    .s00_axi_bid 				(axi4_m00_axi_bid ),
    .s00_axi_buser 				( ),
    .s00_axi_arvalid 			(axi4_m00_axi_arvalid ),
    .s00_axi_arready 			(axi4_m00_axi_arready ),
    .s00_axi_araddr				(axi4_m00_axi_araddr ),
    .s00_axi_arburst 			(axi4_m00_axi_arburst ),
    .s00_axi_arlen 				(axi4_m00_axi_arlen ),
    .s00_axi_arsize 			(axi4_m00_axi_arsize ),
    .s00_axi_arlock 			(axi4_m00_axi_arlock ),
    .s00_axi_arprot 			(axi4_m00_axi_arprot ),
    .s00_axi_arcache 			(axi4_m00_axi_arcache ),
    .s00_axi_arqos 				( ),
    .s00_axi_arregion 			( ),
    .s00_axi_arid 				(axi4_m00_axi_arid ),
    .s00_axi_aruser 			( ),
    .s00_axi_rvalid 			(axi4_m00_axi_rvalid ),
    .s00_axi_rready 			(axi4_m00_axi_rready ),
    .s00_axi_rlast 				(axi4_m00_axi_rlast ),
    .s00_axi_rresp 				(axi4_m00_axi_rresp ),
    .s00_axi_rdata 				(axi4_m00_axi_rdata ),
    .s00_axi_rid 				(axi4_m00_axi_rid ),
    .s00_axi_ruser 				( ),

    .m00_axi_awvalid 			(axi4_m01_axi_awvalid ),
    .m00_axi_awready 			(axi4_m01_axi_awready ),
    .m00_axi_awaddr 			(axi4_m01_axi_awaddr ),
    .m00_axi_awburst 			(axi4_m01_axi_awburst ),
    .m00_axi_awlen 				(axi4_m01_axi_awlen ),
    .m00_axi_awsize 			(axi4_m01_axi_awsize ),
    .m00_axi_awlock 			(axi4_m01_axi_awlock ),
    .m00_axi_awprot 			(axi4_m01_axi_awprot ),
    .m00_axi_awcache 			(axi4_m01_axi_awcache ),
    .m00_axi_awqos 				( ),
    .m00_axi_awregion 			( ),
    .m00_axi_awid 				(axi4_m01_axi_awid ),
    .m00_axi_awuser 			( ),
    .m00_axi_wvalid 			(axi4_m01_axi_wvalid ),
    .m00_axi_wready 			(axi4_m01_axi_wready ),
    .m00_axi_wlast 				(axi4_m01_axi_wlast ),
    .m00_axi_wdata 				(axi4_m01_axi_wdata ),
    .m00_axi_wstrb 				(axi4_m01_axi_wstrb ),
    .m00_axi_wuser 				( ),
    .m00_axi_bvalid 			(axi4_m01_axi_bvalid ),
    .m00_axi_bready 			(axi4_m01_axi_bready ),
    .m00_axi_bresp 				(axi4_m01_axi_bresp ),
    .m00_axi_bid 				(axi4_m01_axi_bid ),
    .m00_axi_buser 				( ),
    .m00_axi_arvalid 			(axi4_m01_axi_arvalid ),
    .m00_axi_arready 			(axi4_m01_axi_arready ),
    .m00_axi_araddr 			(axi4_m01_axi_araddr ),
    .m00_axi_arburst 			(axi4_m01_axi_arburst ),
    .m00_axi_arlen 				(axi4_m01_axi_arlen ),
    .m00_axi_arsize 			(axi4_m01_axi_arsize ),
    .m00_axi_arlock 			(axi4_m01_axi_arlock ),
    .m00_axi_arprot 			(axi4_m01_axi_arprot ),
    .m00_axi_arcache 			(axi4_m01_axi_arcache ),
    .m00_axi_arqos 				( ),
    .m00_axi_arregion 			( ),
    .m00_axi_arid 				(axi4_m01_axi_arid ),
    .m00_axi_aruser 			( ),
    .m00_axi_rvalid 			(axi4_m01_axi_rvalid ),
    .m00_axi_rready 			(axi4_m01_axi_rready ),
    .m00_axi_rlast 				(axi4_m01_axi_rlast ),
    .m00_axi_rresp 				(axi4_m01_axi_rresp ),
    .m00_axi_rdata 				(axi4_m01_axi_rdata ),
    .m00_axi_rid 				(axi4_m01_axi_rid ),
    .m00_axi_ruser 				( ),
    .m01_axi_awvalid 			(axi4_m02_axi_awvalid ),
    .m01_axi_awready 			(axi4_m02_axi_awready ),
    .m01_axi_awaddr 			(axi4_m02_axi_awaddr ),
    .m01_axi_awburst 			(axi4_m02_axi_awburst ),
    .m01_axi_awlen 				(axi4_m02_axi_awlen ),
    .m01_axi_awsize 			(axi4_m02_axi_awsize ),
    .m01_axi_awlock 			(axi4_m02_axi_awlock ),
    .m01_axi_awprot 			(axi4_m02_axi_awprot ),
    .m01_axi_awcache 			(axi4_m02_axi_awcache ),
    .m01_axi_awqos 				( ),
    .m01_axi_awregion 			( ),
    .m01_axi_awid				(axi4_m02_axi_awid ),
    .m01_axi_awuser 			( ),
    .m01_axi_wvalid 			(axi4_m02_axi_wvalid ),
    .m01_axi_wready 			(axi4_m02_axi_wready ),
    .m01_axi_wlast 				(axi4_m02_axi_wlast ),
    .m01_axi_wdata 				(axi4_m02_axi_wdata ),
    .m01_axi_wstrb 				(axi4_m02_axi_wstrb ),
    .m01_axi_wuser 				( ),
    .m01_axi_bvalid 			(axi4_m02_axi_bvalid ),
    .m01_axi_bready 			(axi4_m02_axi_bready ),
    .m01_axi_bresp 				(axi4_m02_axi_bresp ),
    .m01_axi_bid 				(axi4_m02_axi_bid ),
    .m01_axi_buser 				( ),
    .m01_axi_arvalid 			(axi4_m02_axi_arvalid ),
    .m01_axi_arready 			(axi4_m02_axi_arready ),
    .m01_axi_araddr 			(axi4_m02_axi_araddr ),
    .m01_axi_arburst 			(axi4_m02_axi_arburst ),
    .m01_axi_arlen 				(axi4_m02_axi_arlen ),
    .m01_axi_arsize 			(axi4_m02_axi_arsize ),
    .m01_axi_arlock 			(axi4_m02_axi_arlock ),
    .m01_axi_arprot 			(axi4_m02_axi_arprot ),
    .m01_axi_arcache 			(axi4_m02_axi_arcache ),
    .m01_axi_arqos 				( ),
    .m01_axi_arregion 			( ),
    .m01_axi_arid 				(axi4_m02_axi_arid ),
    .m01_axi_aruser 			( ),
    .m01_axi_rvalid 			(axi4_m02_axi_rvalid ),
    .m01_axi_rready 			(axi4_m02_axi_rready ),
    .m01_axi_rlast 				(axi4_m02_axi_rlast ),
    .m01_axi_rresp 				(axi4_m02_axi_rresp ),
    .m01_axi_rdata 				(axi4_m02_axi_rdata ),
    .m01_axi_rid 				(axi4_m02_axi_rid ),
    .m01_axi_ruser  			( )
  );


//-----------Peripheral AXI RAM1---------------

axi_ram_per ram_periph1(
    .clk					(clk),
    .rst					(reset),
    .s_axi_awid				(axi4_m01_axi_awid),
    .s_axi_awaddr			(axi4_m01_axi_awaddr),
    .s_axi_awlen			(axi4_m01_axi_awlen),
    .s_axi_awsize			(axi4_m01_axi_awsize),
    .s_axi_awburst			(axi4_m01_axi_awburst),
    .s_axi_awlock			(axi4_m01_axi_awlock),
    .s_axi_awcache			(axi4_m01_axi_awcache),
    .s_axi_awprot			(axi4_m01_axi_awprot),
    .s_axi_awvalid			(axi4_m01_axi_awvalid),
    .s_axi_awready			(axi4_m01_axi_awready),
    .s_axi_wdata			(axi4_m01_axi_wdata),
    .s_axi_wstrb			(axi4_m01_axi_wstrb),
    .s_axi_wlast			(axi4_m01_axi_wlast),
    .s_axi_wvalid			(axi4_m01_axi_wvalid),
    .s_axi_wready			(axi4_m01_axi_wready),
    .s_axi_bid				(axi4_m01_axi_bid),
    .s_axi_bresp			(axi4_m01_axi_bresp),
    .s_axi_bvalid			(axi4_m01_axi_bvalid),
    .s_axi_bready			(axi4_m01_axi_bready),
    .s_axi_arid				(axi4_m01_axi_arid),
    .s_axi_araddr			(axi4_m01_axi_araddr),
    .s_axi_arlen			(axi4_m01_axi_arlen),
    .s_axi_arsize			(axi4_m01_axi_arsize),
    .s_axi_arburst			(axi4_m01_axi_arburst),
    .s_axi_arlock			(axi4_m01_axi_arlock),
    .s_axi_arcache			(axi4_m01_axi_arcache),
    .s_axi_arprot			(axi4_m01_axi_arprot),
    .s_axi_arvalid			(axi4_m01_axi_arvalid),
    .s_axi_arready			(axi4_m01_axi_arready),
    .s_axi_rid				(axi4_m01_axi_rid),
    .s_axi_rdata			(axi4_m01_axi_rdata),
    .s_axi_rresp			(axi4_m01_axi_rresp),
    .s_axi_rlast			(axi4_m01_axi_rlast),
    .s_axi_rvalid			(axi4_m01_axi_rvalid),
    .s_axi_rready			(axi4_m01_axi_rready)
	);

    //-----------Peripheral AXI RAM2---------------

axi_ram_per ram_periph2(
    .clk					(clk),
    .rst					(reset),
    .s_axi_awid				(axi4_m02_axi_awid),
    .s_axi_awaddr			(axi4_m02_axi_awaddr),
    .s_axi_awlen			(axi4_m02_axi_awlen),
    .s_axi_awsize			(axi4_m02_axi_awsize),
    .s_axi_awburst			(axi4_m02_axi_awburst),
    .s_axi_awlock			(axi4_m02_axi_awlock),
    .s_axi_awcache			(axi4_m02_axi_awcache),
    .s_axi_awprot			(axi4_m02_axi_awprot),
    .s_axi_awvalid			(axi4_m02_axi_awvalid),
    .s_axi_awready			(axi4_m02_axi_awready),
    .s_axi_wdata			(axi4_m02_axi_wdata),
    .s_axi_wstrb			(axi4_m02_axi_wstrb),
    .s_axi_wlast			(axi4_m02_axi_wlast),
    .s_axi_wvalid			(axi4_m02_axi_wvalid),
    .s_axi_wready			(axi4_m02_axi_wready),
    .s_axi_bid				(axi4_m02_axi_bid),
    .s_axi_bresp			(axi4_m02_axi_bresp),
    .s_axi_bvalid			(axi4_m02_axi_bvalid),
    .s_axi_bready			(axi4_m02_axi_bready),
    .s_axi_arid				(axi4_m02_axi_arid),
    .s_axi_araddr			(axi4_m02_axi_araddr),
    .s_axi_arlen			(axi4_m02_axi_arlen),
    .s_axi_arsize			(axi4_m02_axi_arsize),
    .s_axi_arburst			(axi4_m02_axi_arburst),
    .s_axi_arlock			(axi4_m02_axi_arlock),
    .s_axi_arcache			(axi4_m02_axi_arcache),
    .s_axi_arprot			(axi4_m02_axi_arprot),
    .s_axi_arvalid			(axi4_m02_axi_arvalid),
    .s_axi_arready			(axi4_m02_axi_arready),
    .s_axi_rid				(axi4_m02_axi_rid),
    .s_axi_rdata			(axi4_m02_axi_rdata),
    .s_axi_rresp			(axi4_m02_axi_rresp),
    .s_axi_rlast			(axi4_m02_axi_rlast),
    .s_axi_rvalid			(axi4_m02_axi_rvalid),
    .s_axi_rready			(axi4_m02_axi_rready)
	);

endmodule
