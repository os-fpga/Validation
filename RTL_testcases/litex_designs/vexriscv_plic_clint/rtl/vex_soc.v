/*
Top-level module for the Vexriscv SoC with AXI RAM and AXI Interconnect
*/
module vex_soc (
    input wire      reset,
    input wire      clock
);
    wire   	      	vexriscv_dBusAxi_ar_ready;
    wire   	      	vexriscv_dBusAxi_aw_ready;
    wire   	[7:0] 	vexriscv_dBusAxi_b_payload_id;
    wire   	[1:0] 	vexriscv_dBusAxi_b_payload_resp;
    wire   	      	vexriscv_dBusAxi_b_valid;
    reg    	[31:0]	vexriscv_dBusAxi_rf_payload_data;
    wire   	[7:0] 	vexriscv_dBusAxi_r_payload_id;
    wire   	      	vexriscv_dBusAxi_r_payload_last;
    wire   	[1:0] 	vexriscv_dBusAxi_r_payload_resp;
    wire   	      	vexriscv_dBusAxi_r_valid;
    wire   	      	vexriscv_dBusAxi_w_ready;
    wire   	      	vexriscv_debugReset = 1'd0;
    wire   	      	vexriscv_iBusAxi_ar_ready;
    wire   	[31:0]	vexriscv_iBusAxi_r_payload_data;
    wire   	[7:0] 	vexriscv_iBusAxi_r_payload_id;
    wire   	      	vexriscv_iBusAxi_r_payload_last;
    wire   	[1:0] 	vexriscv_iBusAxi_r_payload_resp;
    wire   	      	vexriscv_iBusAxi_r_valid;
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
	wire			vexriscv_dBusAxi_aw_payload_user;
	wire			vexriscv_dBusAxi_w_payload_user;
	wire			vexriscv_dBusAxi_b_payload_user;
	wire			vexriscv_dBusAxi_ar_payload_user;
	wire			vexriscv_dBusAxi_r_payload_user;
    wire   	      	vexriscv5;
    wire   	      	vexriscv6;
    wire   	      	vexriscv7;
    wire   	      	vexriscv8;
    wire    [7:0]   axi4_m00_axi_awid;
    wire    [31:0]  axi4_m00_axi_awaddr;
    wire    [7:0]   axi4_m00_axi_awlen;
    wire    [2:0]   axi4_m00_axi_awsize;
    wire    [1:0]   axi4_m00_axi_awburst;
    wire            axi4_m00_axi_awlock;
    wire    [3:0]   axi4_m00_axi_awcache;
    wire    [2:0]   axi4_m00_axi_awprot;
    wire            axi4_m00_axi_awvalid;
    wire            axi4_m00_axi_awready;
    wire    [31:0]  axi4_m00_axi_wdata;
    wire    [3:0]   axi4_m00_axi_wstrb;
    wire            axi4_m00_axi_wlast;
    wire            axi4_m00_axi_wvalid;
    wire            axi4_m00_axi_wready;
    wire    [7:0]   axi4_m00_axi_bid;
    wire    [1:0]   axi4_m00_axi_bresp;
    wire            axi4_m00_axi_bvalid;
    wire            axi4_m00_axi_bready;
    wire    [7:0]   axi4_m00_axi_arid;
    wire    [31:0]  axi4_m00_axi_araddr;
    wire    [7:0]   axi4_m00_axi_arlen;
    wire    [2:0]   axi4_m00_axi_arsize;
    wire    [1:0]   axi4_m00_axi_arburst;
    wire            axi4_m00_axi_arlock;
    wire    [3:0]   axi4_m00_axi_arcache;
    wire    [2:0]   axi4_m00_axi_arprot;
    wire            axi4_m00_axi_arvalid;
    wire            axi4_m00_axi_arready;
    wire    [7:0]   axi4_m00_axi_rid;
    wire    [31:0]  axi4_m00_axi_rdata;
    wire    [1:0]   axi4_m00_axi_rresp;
    wire            axi4_m00_axi_rlast;
    wire            axi4_m00_axi_rvalid;
    wire            axi4_m00_axi_rready;
    wire			axi4_m00_axi_buser;
    wire 			axi4_m00_axi_ruser;



    wire    [15:0]  axi4_m01_axi_awaddr;
    wire    [2:0]   axi4_m01_axi_awprot;
    wire            axi4_m01_axi_awvalid;
    wire            axi4_m01_axi_awready;
    wire    [7:0]   axi4_m01_axi_wdata;
    wire    [3:0]   axi4_m01_axi_wstrb;
    wire            axi4_m01_axi_wvalid;
    wire            axi4_m01_axi_wready;
    wire    [1:0]   axi4_m01_axi_bresp;
    wire            axi4_m01_axi_bvalid;
    wire            axi4_m01_axi_bready;
    wire    [15:0]  axi4_m01_axi_araddr;
    wire    [2:0]   axi4_m01_axi_arprot;
    wire            axi4_m01_axi_arvalid;
    wire            axi4_m01_axi_arready;
    wire    [7:0]   axi4_m01_axi_rdata;
    wire    [1:0]   axi4_m01_axi_rresp;
    wire            axi4_m01_axi_rvalid;
    wire            axi4_m01_axi_rready;

    wire    [15:0]  axi4_m02_axi_awaddr;
    wire    [2:0]   axi4_m02_axi_awprot;
    wire            axi4_m02_axi_awvalid;
    wire            axi4_m02_axi_awready;
    wire    [31:0]  axi4_m02_axi_wdata;
    wire    [3:0]   axi4_m02_axi_wstrb;
    wire            axi4_m02_axi_wvalid;
    wire            axi4_m02_axi_wready;
    wire    [1:0]   axi4_m02_axi_bresp;
    wire            axi4_m02_axi_bvalid;
    wire            axi4_m02_axi_bready;
    wire    [15:0]  axi4_m02_axi_araddr;
    wire    [2:0]   axi4_m02_axi_arprot;
    wire            axi4_m02_axi_arvalid;
    wire            axi4_m02_axi_arready;
    wire    [31:0]  axi4_m02_axi_rdata;
    wire    [1:0]   axi4_m02_axi_rresp;
    wire            axi4_m02_axi_rvalid;
    wire            axi4_m02_axi_rready;

    wire    [21:0]  axi4_m03_axi_awaddr;
    wire    [2:0]   axi4_m03_axi_awprot;
    wire            axi4_m03_axi_awvalid;
    wire            axi4_m03_axi_awready;
    wire    [31:0]  axi4_m03_axi_wdata;
    wire    [3:0]   axi4_m03_axi_wstrb;
    wire            axi4_m03_axi_wvalid;
    wire            axi4_m03_axi_wready;
    wire    [1:0]   axi4_m03_axi_bresp;
    wire            axi4_m03_axi_bvalid;
    wire            axi4_m03_axi_bready;
    wire    [21:0]  axi4_m03_axi_araddr;
    wire    [2:0]   axi4_m03_axi_arprot;
    wire            axi4_m03_axi_arvalid;
    wire            axi4_m03_axi_arready;
    wire    [31:0]  axi4_m03_axi_rdata;
    wire    [1:0]   axi4_m03_axi_rresp;
    wire            axi4_m03_axi_rvalid;
    wire            axi4_m03_axi_rready;


	
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
	// Converting 8 bit data to 32 bit for compatibility
    wire     [31:0]  temp_wire;
    assign temp_wire = {axi4_m01_axi_rdata, axi4_m01_axi_rdata, axi4_m01_axi_rdata, axi4_m01_axi_rdata};


//---------------VexRiscv----------------

VexRiscvAxi4LinuxPlicClint cpu(
	.clk						(clock),
	.dBusAxi_arready			(vexriscv_dBusAxi_ar_ready),
	.dBusAxi_awready			(vexriscv_dBusAxi_aw_ready),
	.dBusAxi_bid		        (vexriscv_dBusAxi_b_payload_id),
	.dBusAxi_bresp		        (vexriscv_dBusAxi_b_payload_resp),
	.dBusAxi_bvalid			    (vexriscv_dBusAxi_b_valid),
	.dBusAxi_rdata		        (vexriscv_dBusAxi_r_payload_data),
	.dBusAxi_rid		        (vexriscv_dBusAxi_r_payload_id),
	.dBusAxi_rlast		        (vexriscv_dBusAxi_r_payload_last),
	.dBusAxi_rresp		        (vexriscv_dBusAxi_r_payload_resp),
	.dBusAxi_rvalid			    (vexriscv_dBusAxi_r_valid),
	.dBusAxi_wready			    (vexriscv_dBusAxi_w_ready),
	.debugReset					(vexriscv_debugReset),
	.iBusAxi_arready			(vexriscv_iBusAxi_ar_ready),
	.iBusAxi_rdata		        (vexriscv_iBusAxi_r_payload_data),
	.iBusAxi_rid		        (vexriscv_iBusAxi_r_payload_id),
	.iBusAxi_rlast		        (vexriscv_iBusAxi_r_payload_last),
	.iBusAxi_rresp		        (vexriscv_iBusAxi_r_payload_resp),
	.iBusAxi_rvalid			    (vexriscv_iBusAxi_r_valid),
	.jtag_tck					(vexriscv_jtag_tck),
	.jtag_tdi					(vexriscv_jtag_tdi),
	.jtag_tms					(vexriscv_jtag_tms),
	.reset						(reset),
	.dBusAxi_araddr	            (vexriscv_dBusAxi_ar_payload_addr),
	.dBusAxi_arburst	        (vexriscv_dBusAxi_ar_payload_burst),
	.dBusAxi_arcache	        (vexriscv_dBusAxi_ar_payload_cache),
	.dBusAxi_arid		        (vexriscv_dBusAxi_ar_payload_id),
	.dBusAxi_arlen		        (vexriscv_dBusAxi_ar_payload_len),
	.dBusAxi_arlock	            (vexriscv_dBusAxi_ar_payload_lock),
	.dBusAxi_arprot	            (vexriscv_dBusAxi_ar_payload_prot),
	.dBusAxi_arqos		        (vexriscv_dBusAxi_ar_payload_qos),
	.dBusAxi_arregion	        (vexriscv_dBusAxi_ar_payload_region),
	.dBusAxi_arsize	            (vexriscv_dBusAxi_ar_payload_size),
	.dBusAxi_arvalid			(vexriscv_dBusAxi_ar_valid),
	.dBusAxi_awaddr	            (vexriscv_dBusAxi_aw_payload_addr),
	.dBusAxi_awburst	        (vexriscv_dBusAxi_aw_payload_burst),
	.dBusAxi_awcache	        (vexriscv_dBusAxi_aw_payload_cache),
	.dBusAxi_awid		        (vexriscv_dBusAxi_aw_payload_id),
	.dBusAxi_awlen		        (vexriscv_dBusAxi_aw_payload_len),
	.dBusAxi_awlock	            (vexriscv_dBusAxi_aw_payload_lock),
	.dBusAxi_awprot	            (vexriscv_dBusAxi_aw_payload_prot),
	.dBusAxi_awqos		        (vexriscv_dBusAxi_aw_payload_qos),
	.dBusAxi_awregion	        (vexriscv6),
	.dBusAxi_awsize	            (vexriscv_dBusAxi_aw_payload_size),
	.dBusAxi_awvalid			(vexriscv_dBusAxi_aw_valid),
	.dBusAxi_bready			    (vexriscv_dBusAxi_b_ready),
	.dBusAxi_rready			    (vexriscv_dBusAxi_r_ready),
	.dBusAxi_wdata		        (vexriscv_dBusAxi_w_payload_data),
	.dBusAxi_wlast		        (vexriscv_dBusAxi_w_payload_last),
	.dBusAxi_wstrb		        (vexriscv_dBusAxi_w_payload_strb),
	.dBusAxi_wvalid			    (vexriscv_dBusAxi_w_valid),
	.iBusAxi_araddr	            (vexriscv_iBusAxi_ar_payload_addr),
	.iBusAxi_arburst	        (vexriscv_iBusAxi_ar_payload_burst),
	.iBusAxi_arcache	        (vexriscv_iBusAxi_ar_payload_cache),
	.iBusAxi_arid		        (vexriscv_iBusAxi_ar_payload_id),
	.iBusAxi_arlen		        (vexriscv_iBusAxi_ar_payload_len),
	.iBusAxi_arlock	            (vexriscv_iBusAxi_ar_payload_lock),
	.iBusAxi_arprot	            (vexriscv_iBusAxi_ar_payload_prot),
	.iBusAxi_arqos		        (vexriscv_iBusAxi_ar_payload_qos),
	.iBusAxi_arregion	        (vexriscv7),
	.iBusAxi_arsize	            (vexriscv_iBusAxi_ar_payload_size),
	.iBusAxi_arvalid			(vexriscv_iBusAxi_ar_valid),
	.iBusAxi_rready			    (vexriscv_iBusAxi_r_ready),
	.jtag_tdo					(vexriscv5),
	.debug_resetOut				(vexriscv8),
    .clint_awvalid              (axi4_m02_axi_awvalid),
    .clint_awready              (axi4_m02_axi_awready),
    .clint_awaddr               (axi4_m02_axi_awaddr),
    .clint_awprot               (axi4_m02_axi_awprot),
    .clint_wvalid               (axi4_m02_axi_wvalid),
    .clint_wready               (axi4_m02_axi_wready),
    .clint_wdata                (axi4_m02_axi_wdata),
    .clint_wstrb                (axi4_m02_axi_wstrb),
    .clint_bvalid               (axi4_m02_axi_bvalid),
    .clint_bready               (axi4_m02_axi_bready),
    .clint_bresp                (axi4_m02_axi_bresp),
    .clint_arvalid              (axi4_m02_axi_arvalid),
    .clint_arready              (axi4_m02_axi_arready),
    .clint_araddr               (axi4_m02_axi_araddr),
    .clint_arprot               (axi4_m02_axi_arprot),
    .clint_rvalid               (axi4_m02_axi_rvalid),
    .clint_rready               (axi4_m02_axi_rready),
    .clint_rdata                (axi4_m02_axi_rdata),
    .clint_rresp                (axi4_m02_axi_rresp),
    .plic_awvalid               (axi4_m03_axi_awvalid),
    .plic_awready               (axi4_m03_axi_awready),
    .plic_awaddr                (axi4_m03_axi_awaddr),
    .plic_awprot                (axi4_m03_axi_awprot),
    .plic_wvalid                (axi4_m03_axi_wvalid),
    .plic_wready                (axi4_m03_axi_wready),
    .plic_wdata                 (axi4_m03_axi_wdata),
    .plic_wstrb                 (axi4_m03_axi_wstrb),
    .plic_bvalid                (axi4_m03_axi_bvalid),
    .plic_bready                (axi4_m03_axi_bready),
    .plic_bresp                 (axi4_m03_axi_bresp),
    .plic_arvalid               (axi4_m03_axi_arvalid),
    .plic_arready               (axi4_m03_axi_arready),
    .plic_araddr                (axi4_m03_axi_araddr),
    .plic_arprot                (axi4_m03_axi_arprot),
    .plic_rvalid                (axi4_m03_axi_rvalid),
    .plic_rready                (axi4_m03_axi_rready),
    .plic_rdata                 (axi4_m03_axi_rdata),
    .plic_rresp                 (axi4_m03_axi_rresp),
    .plicInterrupts             ({int_o, cts_pad_i}));

//-----------AXI2AXILite Bridge---------------------

//--------------------------------------------------

axi2axilite axi2axil(
    //----------AXI4 Slave Interface
    .S_AXI_ACLK                 (clock),
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
    .M_AXI_RRESP                (axi2axil_rresp));

//-----------AXI4 full interconnect-----------------

axil_1x4_inter axil_1x4(
    .clk						(clock),
    .rst						(reset),
	//-----------Slave-------------------
    .s00_axil_awaddr			(axi2axil_awaddr),
    .s00_axil_awprot			(axi2axil_awprot),
    .s00_axil_awvalid			(axi2axil_awvalid),
    .s00_axil_awready			(axi2axil_awready),
    .s00_axil_wdata				(axi2axil_wdata),
    .s00_axil_wstrb				(axi2axil_wstrb),
    .s00_axil_wvalid			(axi2axil_wvalid),
    .s00_axil_wready			(axi2axil_wready),
    .s00_axil_bresp				(axi2axil_bresp),
    .s00_axil_bvalid			(axi2axil_bvalid),
    .s00_axil_bready			(axi2axil_bready),
    .s00_axil_araddr			(axi2axil_araddr),
    .s00_axil_arprot			(axi2axil_arprot),
    .s00_axil_arvalid			(axi2axil_arvalid),
    .s00_axil_arready			(axi2axil_arready),
    .s00_axil_rdata				(axi2axil_rdata),
    .s00_axil_rresp				(axi2axil_rresp),
    .s00_axil_rvalid			(axi2axil_rvalid),
    .s00_axil_rready			(axi2axil_rready),
    //--------------------MASTER----------------
    .m00_axil_awaddr			(axi4_m00_axi_awaddr),
    .m00_axil_awprot			(axi4_m00_axi_awprot),
    .m00_axil_awvalid			(axi4_m00_axi_awvalid),
    .m00_axil_awready			(axi4_m00_axi_awready),
    .m00_axil_wdata				(axi4_m00_axi_wdata),
    .m00_axil_wstrb				(axi4_m00_axi_wstrb),
    .m00_axil_wvalid			(axi4_m00_axi_wvalid),
    .m00_axil_wready			(axi4_m00_axi_wready),
    .m00_axil_bresp				(axi4_m00_axi_bresp),
    .m00_axil_bvalid			(axi4_m00_axi_bvalid),
    .m00_axil_bready			(axi4_m00_axi_bready),
    .m00_axil_araddr			(axi4_m00_axi_araddr),
    .m00_axil_arprot			(axi4_m00_axi_arprot),
    .m00_axil_arvalid			(axi4_m00_axi_arvalid),
    .m00_axil_arready			(axi4_m00_axi_arready),
    .m00_axil_rdata				(axi4_m00_axi_rdata),
    .m00_axil_rresp				(axi4_m00_axi_rresp),
    .m00_axil_rvalid			(axi4_m00_axi_rvalid),
    .m00_axil_rready			(axi4_m00_axi_rready),
    //-------------------Second Master---------------------
    .m01_axil_awaddr	        (axi4_m01_axi_awaddr),
    .m01_axil_awprot	        (axi4_m01_axi_awprot),
    .m01_axil_awvalid           (axi4_m01_axi_awvalid),
    .m01_axil_awready           (axi4_m01_axi_awready),
    .m01_axil_wdata		        (axi4_m01_axi_wdata),
    .m01_axil_wstrb		        (axi4_m01_axi_wstrb),
    .m01_axil_wvalid	        (axi4_m01_axi_wvalid),
    .m01_axil_wready	        (axi4_m01_axi_wready),
    .m01_axil_bresp		        (axi4_m01_axi_bresp),
    .m01_axil_bvalid	        (axi4_m01_axi_bvalid),
    .m01_axil_bready	        (axi4_m01_axi_bready),
    .m01_axil_araddr	        (axi4_m01_axi_araddr),
    .m01_axil_arprot	        (axi4_m01_axi_arprot),
    .m01_axil_arvalid           (axi4_m01_axi_arvalid),
    .m01_axil_arready           (axi4_m01_axi_arready),
    .m01_axil_rdata		        (temp_wire),
    .m01_axil_rresp		        (axi4_m01_axi_rresp),
    .m01_axil_rvalid	        (axi4_m01_axi_rvalid),
    .m01_axil_rready	        (axi4_m01_axi_rready),
    //-----------------Third Master-------------------
    .m02_axil_awaddr            (axi4_m02_axi_awaddr),
    .m02_axil_awprot            (axi4_m02_axi_awprot),
    .m02_axil_awvalid           (axi4_m02_axi_awvalid),
    .m02_axil_awready           (axi4_m02_axi_awready),
    .m02_axil_wdata             (axi4_m02_axi_wdata),
    .m02_axil_wstrb             (axi4_m02_axi_wstrb),
    .m02_axil_wvalid            (axi4_m02_axi_wvalid),
    .m02_axil_wready            (axi4_m02_axi_wready),
    .m02_axil_bresp             (axi4_m02_axi_bresp),
    .m02_axil_bvalid            (axi4_m02_axi_bvalid),
    .m02_axil_bready            (axi4_m02_axi_bready),
    .m02_axil_araddr            (axi4_m02_axi_araddr),
    .m02_axil_arprot            (axi4_m02_axi_arprot),
    .m02_axil_arvalid           (axi4_m02_axi_arvalid),
    .m02_axil_arready           (axi4_m02_axi_arready),
    .m02_axil_rdata             (axi4_m02_axi_rdata),
    .m02_axil_rresp             (axi4_m02_axi_rresp),
    .m02_axil_rvalid            (axi4_m02_axi_rvalid),
    .m02_axil_rready            (axi4_m02_axi_rready),
    //---------------------Fourth Master--------------
    .m03_axil_awaddr            (axi4_m03_axi_awaddr),
    .m03_axil_awprot            (axi4_m03_axi_awprot),
    .m03_axil_awvalid           (axi4_m03_axi_awvalid),
    .m03_axil_awready           (axi4_m03_axi_awready),
    .m03_axil_wdata             (axi4_m03_axi_wdata),
    .m03_axil_wstrb             (axi4_m03_axi_wstrb),
    .m03_axil_wvalid            (axi4_m03_axi_wvalid),
    .m03_axil_wready            (axi4_m03_axi_wready),
    .m03_axil_bresp             (axi4_m03_axi_bresp),
    .m03_axil_bvalid            (axi4_m03_axi_bvalid),
    .m03_axil_bready            (axi4_m03_axi_bready),
    .m03_axil_araddr            (axi4_m03_axi_araddr),
    .m03_axil_arprot            (axi4_m03_axi_arprot),
    .m03_axil_arvalid           (axi4_m03_axi_arvalid),
    .m03_axil_arready           (axi4_m03_axi_arready),
    .m03_axil_rdata             (axi4_m03_axi_rdata),
    .m03_axil_rresp             (axi4_m03_axi_rresp),
    .m03_axil_rvalid            (axi4_m03_axi_rvalid),
    .m03_axil_rready            (axi4_m03_axi_rready));

//-----------Instruction AXI RAM----------

axi_ram ram_inst(
    .clk						(clock),
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
    .s_axi_rready				(vexriscv_iBusAxi_r_ready));

//-----------Peripheral AXI RAM---------------

axi_ram_per ram_periph(
    .clk						(clock),
    .rst						(reset),
    .s_axi_awid					(axi4_m00_axi_awid),
    .s_axi_awaddr				(axi4_m00_axi_awaddr),
    .s_axi_awlen				(axi4_m00_axi_awlen),
    .s_axi_awsize				(axi4_m00_axi_awsize),
    .s_axi_awburst				(axi4_m00_axi_awburst),
    .s_axi_awlock				(axi4_m00_axi_awlock),
    .s_axi_awcache				(axi4_m00_axi_awcache),
    .s_axi_awprot				(axi4_m00_axi_awprot),
    .s_axi_awvalid				(axi4_m00_axi_awvalid),
    .s_axi_awready				(axi4_m00_axi_awready),
    .s_axi_wdata				(axi4_m00_axi_wdata),
    .s_axi_wstrb				(axi4_m00_axi_wstrb),
    .s_axi_wlast				(axi4_m00_axi_wlast),
    .s_axi_wvalid				(axi4_m00_axi_wvalid),
    .s_axi_wready				(axi4_m00_axi_wready),
    .s_axi_bid					(axi4_m00_axi_bid),
    .s_axi_bresp				(axi4_m00_axi_bresp),
    .s_axi_bvalid				(axi4_m00_axi_bvalid),
    .s_axi_bready				(axi4_m00_axi_bready),
    .s_axi_arid					(axi4_m00_axi_arid),
    .s_axi_araddr				(axi4_m00_axi_araddr),
    .s_axi_arlen				(axi4_m00_axi_arlen),
    .s_axi_arsize				(axi4_m00_axi_arsize),
    .s_axi_arburst				(axi4_m00_axi_arburst),
    .s_axi_arlock				(axi4_m00_axi_arlock),
    .s_axi_arcache				(axi4_m00_axi_arcache),
    .s_axi_arprot				(axi4_m00_axi_arprot),
    .s_axi_arvalid				(axi4_m00_axi_arvalid),
    .s_axi_arready				(axi4_m00_axi_arready),
    .s_axi_rid					(axi4_m00_axi_rid),
    .s_axi_rdata				(axi4_m00_axi_rdata),
    .s_axi_rresp				(axi4_m00_axi_rresp),
    .s_axi_rlast				(axi4_m00_axi_rlast),
    .s_axi_rvalid				(axi4_m00_axi_rvalid),
    .s_axi_rready				(axi4_m00_axi_rready));

axi4lite_uart_top uart(
    .s_axi_aclk                 (clock),
    .s_axi_aresetn              (!reset),
    .s_axi_awvalid              (axi4_m01_axi_awvalid),
    .s_axi_awaddr               (axi4_m01_axi_awaddr),
    .s_axi_awprot               (axi4_m01_axi_awprot),
    .s_axi_awready              (axi4_m01_axi_awready),
    .s_axi_wvalid               (axi4_m01_axi_wvalid),
    .s_axi_wdata                (axi4_m01_axi_wdata),
    .s_axi_wstrb                (axi4_m01_axi_wstrb),
    .s_axi_wready               (axi4_m01_axi_wready),
    .s_axi_bvalid               (axi4_m01_axi_bvalid),
    .s_axi_bresp                (axi4_m01_axi_bresp),
    .s_axi_bready               (axi4_m01_axi_bready),
    .s_axi_arvalid              (axi4_m01_axi_arvalid),
    .s_axi_araddr               (axi4_m01_axi_araddr),
    .s_axi_arprot               (axi4_m01_axi_arprot),
    .s_axi_arready              (axi4_m01_axi_arready),
    .s_axi_rvalid               (axi4_m01_axi_rvalid),
    .s_axi_rdata                (axi4_m01_axi_rdata),
    .s_axi_rresp                (axi4_m01_axi_rresp),
    .s_axi_rready               (axi4_m01_axi_rready),
    .int_o                      (int_o),
    .srx_pad_i                  (srx_pad_i),
    .stx_pad_o                  (stx_pad_o),
    .rts_pad_o                  (rts_pad_o),
    .cts_pad_i                  (cts_pad_i),
    .dtr_pad_o                  (dtr_pad_o),
    .dsr_pad_i                  (dsr_pad_i),
    .ri_pad_i                   (ri_pad_i ),
    .dcd_pad_i                  (dcd_pad_i));


endmodule
