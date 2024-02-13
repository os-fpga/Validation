module ahb_slave_example_simulation ();
    parameter DEPTH = 10;
    parameter WIDTH = 32;
    
    input  wire          s_ahb_aclk;
    input  wire          jtag_tms;
    input  wire          jtag_tdi;
    output wire          jtag_tdo;
    input  wire          s_ahb_aresetn;

    wire [WIDTH-1:0] hrdata_w;
    wire hready_w;
    wire ahb_haddr;
    wire ahb_hburst;
    wire ahb_hmastlock;
    wire ahb_hreadyout;
    wire ahb_hprot;
    wire ahb_hrdata;
    wire ahb_hresp;
    wire ahb_hsel;
    wire ahb_hsize;
    wire ahb_htrans;
    wire ahb_hnonsec;
    wire ahb_hwdata;
    wire ahb_hwrite;
    wire m_axi_awvalid;
    wire m_axi_awready;
    wire m_axi_awaddr;
    wire m_axi_awburst;
    wire m_axi_awlen;
    wire m_axi_awsize;
    wire m_axi_awlock;
    wire m_axi_awprot;
    wire m_axi_awcache;
    wire m_axi_awqos;
    wire m_axi_awregion;
    wire m_axi_awid;
    wire m_axi_awuser;
    wire m_axi_wvalid;
    wire m_axi_wready;
    wire m_axi_wlast;
    wire m_axi_wdata;
    wire m_axi_wstrb;
    wire m_axi_wuser;
    wire m_axi_bvalid;
    wire m_axi_bready;
    wire m_axi_bresp;
    wire m_axi_bid;
    wire m_axi_buser;
    wire m_axi_arvalid;
    wire m_axi_arready;
    wire m_axi_araddr;
    wire m_axi_arburst;
    wire m_axi_arlen;
    wire m_axi_arsize;
    wire m_axi_arlock;
    wire m_axi_arprot;
    wire m_axi_arcache;
    wire m_axi_arqos;
    wire m_axi_arregion;
    wire m_axi_arid;
    wire m_axi_aruser;
    wire m_axi_rvalid;
    wire m_axi_rready;
    wire m_axi_rlast;
    wire m_axi_rresp;
    wire m_axi_rdata;
    wire m_axi_rid;
    wire m_axi_ruser;

    SOC_FPGA_INTF_AHB_S inst (
        .HRESETN_I(s_ahb_aresetn),
        .HADDR(ahb_haddr),
        .HBURST(ahb_hburst),
        .HMASTLOCK(ahb_hmastlock),
        .HREADY(ahb_hreadyout),
        .HPROT(ahb_hprot),
        .HRDATA(ahb_hrdata),
        .HRESP(ahb_hresp),
        .HSEL(ahb_hsel),
        .HSIZE(ahb_hsize),
        .HTRANS(ahb_htrans),
        .HWBE(ahb_hnonsec),
        .HWDATA(ahb_hwdata),
        .HWRITE(ahb_hwrite),
        .HCLK(s_ahb_aclk)
    );

    jtag_to_axi_wrapper jtag_to_axi_wrapper_inst (
        .ACLK(s_ahb_aclk),
        .ARESET(s_ahb_aresetn),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awready(m_axi_awready),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awregion(m_axi_awregion),
        .m_axi_awid(m_axi_awid),
        .m_axi_awuser(m_axi_awuser),
        .m_axi_wvalid(m_axi_wvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(m_axi_wuser),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bid(m_axi_bid),
        .m_axi_buser(m_axi_buser),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_arready(m_axi_arready),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arlock(m_axi_arlock),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arregion(m_axi_arregion),
        .m_axi_arid(m_axi_arid),
        .m_axi_aruser(m_axi_aruser),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(m_axi_rid),
        .m_axi_ruser(m_axi_ruser),
        .JTAG_TCK(s_ahb_aclk),
        .JTAG_TMS(jtag_tms),
        .JTAG_TDI(jtag_tdi),
        .JTAG_TDO(jtag_tdo),
        .JTAG_TRST(s_ahb_aresetn)
    );

    ahb2axi4_wrapper ahb2axi4_inst (
        .s_ahb_aclk(s_ahb_aclk),
        .s_ahb_aresetn(s_ahb_aresetn),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awready(m_axi_awready),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awregion(m_axi_awregion),
        .m_axi_awid(m_axi_awid),
        .m_axi_awuser(m_axi_awuser),
        .m_axi_wvalid(m_axi_wvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(m_axi_wuser),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bid(m_axi_bid),
        .m_axi_buser(m_axi_buser),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_arready(m_axi_arready),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arlock(m_axi_arlock),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arregion(m_axi_arregion),
        .m_axi_arid(m_axi_arid),
        .m_axi_aruser(m_axi_aruser),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(m_axi_rid),
        .m_axi_ruser(m_axi_ruser),
        .ahb_haddr(ahb_haddr),
        .ahb_hburst(ahb_hburst),
        .ahb_hmastlock(ahb_hmastlock),
        .ahb_hprot(ahb_hprot),
        .ahb_hsize(ahb_hsize),
        .ahb_htrans(ahb_htrans),
        .ahb_hwrite(ahb_hwrite),
        .ahb_hwdata(ahb_hwdata),
        .ahb_hsel(ahb_hsel),
        .ahb_hreadyin(),
        .ahb_hnonsec(ahb_hnonsec),
        .ahb_hrdata(ahb_hrdata),
        .ahb_hreadyout(ahb_hreadyout),
        .ahb_hresp(ahb_hresp)
    );

    // ram ram_inst (
    //     .clk(clk),
    //     .we(we),
    //     .addr(addr),
    //     .di(hrdata_w),
    //     .dout(read_data)
    // );

endmodule  

module ram();
    parameter WIDTH=32;
    parameter DEPTH=10;

    input clk;
    input we;
    input [WIDTH-1:0] addr;
    input [WIDTH-1:0] di;
    output [WIDTH-1:0] dout;

    reg [WIDTH-1:0] RAM [2**DEPTH-1:0];
    reg [WIDTH-1:0] dout;

    always @(posedge clk)
        begin
            if (we)
            begin
                RAM[addr] <= di;
                dout <= di;
            end
            else
                dout <= RAM[addr];
        end
endmodule
