module SOC_FPGA_INTF_AHB_S (
    output logic  		  S0_HRESETN_I  ,
    output logic   [        31:0] S0_HADDR     ,
    output logic   [         2:0] S0_HBURST    ,  //check
    output logic                  S0_HMASTLOCK ,
    input  logic                  S0_HREADY    ,
    output logic   [         3:0] S0_HPROT     ,
    input  logic   [        31:0] S0_HRDATA    ,
    input  logic                  S0_HRESP     ,
    output logic                  S0_HSEL      ,
    output logic   [         2:0] S0_HSIZE     ,  //check
    output logic   [         1:0] S0_HTRANS    ,  //check
    output logic   [         3:0] S0_HWBE      ,
    output logic   [        31:0] S0_HWDATA    ,
    output logic                  S0_HWRITE    ,  // check
    input  logic                  S0_HCLK
);


amba_ahb_slave u_AhbSlave1(
  
  .hresetn   ( S0_HRESETN_I   ),
  .haddr      ( S0_HADDR),
  .hburst     ( S0_HBURST),
  .hmastlock (),
  .hready (S0_HREADY ),
  .hprot(S0_HPROT),
  .hrdata     (  S0_HRDATA   ),
  .hresp      ( S0_HRESP     ),
  .hsel     (   S0_HSEL  ),
  .hsize      (S0_HSIZE ),
  .htrans     ( S0_HTRANS),
  .hwbe(),
  .hwdata     (  S0_HWDATA ),
  .hwrite     (S0_HWRITE ),
  .hclk       (  S0_HCLK    )
  
  
 
  
 // .hready (hreadyout_1 ),
 // .addr        (m_addr),
  //.w_data      (w_data),
  //.r_data      (r_data),
//  .wr_en       (wr_en)
 // .mem_mask    (mem_mask)
);


endmodule