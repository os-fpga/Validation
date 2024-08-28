  //Example instantiation for system 'sopc_sys'
  sopc_sys sopc_sys_inst
    (
      .A_from_the_ISP1761        (A_from_the_ISP1761),
      .CS_N_from_the_ISP1761     (CS_N_from_the_ISP1761),
      .DC_DACK_from_the_ISP1761  (DC_DACK_from_the_ISP1761),
      .DC_DREQ_to_the_ISP1761    (DC_DREQ_to_the_ISP1761),
      .DC_IRQ_to_the_ISP1761     (DC_IRQ_to_the_ISP1761),
      .D_to_and_from_the_ISP1761 (D_to_and_from_the_ISP1761),
      .HC_DACK_from_the_ISP1761  (HC_DACK_from_the_ISP1761),
      .HC_DREQ_to_the_ISP1761    (HC_DREQ_to_the_ISP1761),
      .HC_IRQ_to_the_ISP1761     (HC_IRQ_to_the_ISP1761),
      .RD_N_from_the_ISP1761     (RD_N_from_the_ISP1761),
      .RESET_N_from_the_ISP1761  (RESET_N_from_the_ISP1761),
      .WR_N_from_the_ISP1761     (WR_N_from_the_ISP1761),
      .clk                       (clk),
      .reset_n                   (reset_n),
      .s_address_to_the_ports    (s_address_to_the_ports),
      .s_re_to_the_ports         (s_re_to_the_ports),
      .s_readdata_from_the_ports (s_readdata_from_the_ports),
      .s_reset_n_to_the_ports    (s_reset_n_to_the_ports),
      .s_we_to_the_ports         (s_we_to_the_ports),
      .s_writedata_to_the_ports  (s_writedata_to_the_ports)
    );

