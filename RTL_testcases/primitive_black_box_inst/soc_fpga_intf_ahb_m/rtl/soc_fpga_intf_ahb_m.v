module soc_fpga_intf_ahb_m (

    input                 S0_HRESETN_I,
    input [         31:0] S0_HADDR,
    input [          2:0] S0_HBURST,
    input [          3:0] S0_HPROT,
    input [          2:0] S0_HSIZE,
    input [          2:0] S0_HTRANS,
    input [         31:0] S0_HWDATA,
    input                 S0_HWWRITE,
    output [        31:0] S0_HRDATA,
    output                S0_HREADY,
    output                S0_HRESP,
    input                 S0_HCLK
);

SOC_FPGA_INTF_AHB_M inst (
    .HRESETN_I(S0_HRESETN_I),
    .HADDR(S0_HADDR),
    .HBURST(S0_HBURST),
    .HPROT(S0_HPROT),
    .HSIZE(S0_HSIZE),
    .HTRANS(S0_HTRANS),
    .HWDATA(S0_HWDATA),
    .HWWRITE(S0_HWWRITE),
    .HRDATA(S0_HRDATA),
    .HREADY(S0_HREADY),
    .HRESP(S0_HRESP),
    .HCLK(S0_HCLK)
);

endmodule
