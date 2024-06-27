module soc_fpga_intf_ahb_s (
    output  		  S0_HRESETN_I  ,
    output   [        31:0] S0_HADDR     ,
    output   [         2:0] S0_HBURST    ,
    output                  S0_HMASTLOCK ,
    input                   S0_HREADY    ,
    output   [         3:0] S0_HPROT     ,
    input    [        31:0] S0_HRDATA    ,
    input                   S0_HRESP     ,
    output                  S0_HSEL      ,
    output   [         2:0] S0_HSIZE     ,
    output   [         1:0] S0_HTRANS    ,
    output   [         3:0] S0_HWBE      ,
    output   [        31:0] S0_HWDATA    ,
    output                  S0_HWRITE    ,
    input                   S0_HCLK,
    input                   clk,
    input                   reset
);
wire hsel_w;
SOC_FPGA_INTF_AHB_S inst (
    .HRESETN_I(S0_HRESETN_I),
    .HADDR(S0_HADDR),
    .HBURST(S0_HBURST),
    .HMASTLOCK(S0_HMASTLOCK),
    .HREADY(S0_HREADY),
    .HPROT(S0_HPROT),
    .HRDATA(S0_HRDATA),
    .HRESP(S0_HRESP),
    .HSEL(hsel_w),
    .HSIZE(S0_HSIZE),
    .HTRANS(S0_HTRANS),
    .HWBE(S0_HWBE),
    .HWDATA(S0_HWDATA),
    .HWRITE(S0_HWRITE),
    .HCLK(S0_HCLK)
);

always @(posedge clk) begin
    if (reset)
        hsel_w <= 0;
    else
        hsel_w <= S0_HSEL;
end

endmodule
