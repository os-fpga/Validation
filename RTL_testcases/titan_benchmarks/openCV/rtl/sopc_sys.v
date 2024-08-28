//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
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

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ISP1761_slave_arbitrator (
                                  // inputs:
                                   ISP1761_slave_readdata,
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_read,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   ISP1761_slave_address,
                                   ISP1761_slave_chipselect_n,
                                   ISP1761_slave_read_n,
                                   ISP1761_slave_readdata_from_sa,
                                   ISP1761_slave_reset_n,
                                   ISP1761_slave_wait_counter_eq_0,
                                   ISP1761_slave_write_n,
                                   ISP1761_slave_writedata,
                                   cpu_data_master_granted_ISP1761_slave,
                                   cpu_data_master_qualified_request_ISP1761_slave,
                                   cpu_data_master_read_data_valid_ISP1761_slave,
                                   cpu_data_master_requests_ISP1761_slave,
                                   d1_ISP1761_slave_end_xfer
                                )
;

  output  [ 17: 0] ISP1761_slave_address;
  output           ISP1761_slave_chipselect_n;
  output           ISP1761_slave_read_n;
  output  [ 31: 0] ISP1761_slave_readdata_from_sa;
  output           ISP1761_slave_reset_n;
  output           ISP1761_slave_wait_counter_eq_0;
  output           ISP1761_slave_write_n;
  output  [ 31: 0] ISP1761_slave_writedata;
  output           cpu_data_master_granted_ISP1761_slave;
  output           cpu_data_master_qualified_request_ISP1761_slave;
  output           cpu_data_master_read_data_valid_ISP1761_slave;
  output           cpu_data_master_requests_ISP1761_slave;
  output           d1_ISP1761_slave_end_xfer;
  input   [ 31: 0] ISP1761_slave_readdata;
  input            clk;
  input   [ 20: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [ 17: 0] ISP1761_slave_address;
  wire             ISP1761_slave_allgrants;
  wire             ISP1761_slave_allow_new_arb_cycle;
  wire             ISP1761_slave_any_bursting_master_saved_grant;
  wire             ISP1761_slave_any_continuerequest;
  wire             ISP1761_slave_arb_counter_enable;
  reg              ISP1761_slave_arb_share_counter;
  wire             ISP1761_slave_arb_share_counter_next_value;
  wire             ISP1761_slave_arb_share_set_values;
  wire             ISP1761_slave_beginbursttransfer_internal;
  wire             ISP1761_slave_begins_xfer;
  wire             ISP1761_slave_chipselect_n;
  wire             ISP1761_slave_counter_load_value;
  wire             ISP1761_slave_end_xfer;
  wire             ISP1761_slave_firsttransfer;
  wire             ISP1761_slave_grant_vector;
  wire             ISP1761_slave_in_a_read_cycle;
  wire             ISP1761_slave_in_a_write_cycle;
  wire             ISP1761_slave_master_qreq_vector;
  wire             ISP1761_slave_non_bursting_master_requests;
  wire             ISP1761_slave_read_n;
  wire    [ 31: 0] ISP1761_slave_readdata_from_sa;
  reg              ISP1761_slave_reg_firsttransfer;
  wire             ISP1761_slave_reset_n;
  reg              ISP1761_slave_slavearbiterlockenable;
  wire             ISP1761_slave_slavearbiterlockenable2;
  wire             ISP1761_slave_unreg_firsttransfer;
  reg              ISP1761_slave_wait_counter;
  wire             ISP1761_slave_wait_counter_eq_0;
  wire             ISP1761_slave_waits_for_read;
  wire             ISP1761_slave_waits_for_write;
  wire             ISP1761_slave_write_n;
  wire    [ 31: 0] ISP1761_slave_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ISP1761_slave;
  wire             cpu_data_master_qualified_request_ISP1761_slave;
  wire             cpu_data_master_read_data_valid_ISP1761_slave;
  wire             cpu_data_master_requests_ISP1761_slave;
  wire             cpu_data_master_saved_grant_ISP1761_slave;
  reg              d1_ISP1761_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ISP1761_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 20: 0] shifted_address_to_ISP1761_slave_from_cpu_data_master;
  wire             wait_for_ISP1761_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ISP1761_slave_end_xfer;
    end


  assign ISP1761_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ISP1761_slave));
  //assign ISP1761_slave_readdata_from_sa = ISP1761_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ISP1761_slave_readdata_from_sa = ISP1761_slave_readdata;

  assign cpu_data_master_requests_ISP1761_slave = ({cpu_data_master_address_to_slave[20] , 20'b0} == 21'h0) & (cpu_data_master_read | cpu_data_master_write);
  //ISP1761_slave_arb_share_counter set values, which is an e_mux
  assign ISP1761_slave_arb_share_set_values = 1;

  //ISP1761_slave_non_bursting_master_requests mux, which is an e_mux
  assign ISP1761_slave_non_bursting_master_requests = cpu_data_master_requests_ISP1761_slave;

  //ISP1761_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign ISP1761_slave_any_bursting_master_saved_grant = 0;

  //ISP1761_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign ISP1761_slave_arb_share_counter_next_value = ISP1761_slave_firsttransfer ? (ISP1761_slave_arb_share_set_values - 1) : |ISP1761_slave_arb_share_counter ? (ISP1761_slave_arb_share_counter - 1) : 0;

  //ISP1761_slave_allgrants all slave grants, which is an e_mux
  assign ISP1761_slave_allgrants = |ISP1761_slave_grant_vector;

  //ISP1761_slave_end_xfer assignment, which is an e_assign
  assign ISP1761_slave_end_xfer = ~(ISP1761_slave_waits_for_read | ISP1761_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_ISP1761_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ISP1761_slave = ISP1761_slave_end_xfer & (~ISP1761_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ISP1761_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign ISP1761_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_ISP1761_slave & ISP1761_slave_allgrants) | (end_xfer_arb_share_counter_term_ISP1761_slave & ~ISP1761_slave_non_bursting_master_requests);

  //ISP1761_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1761_slave_arb_share_counter <= 0;
      else if (ISP1761_slave_arb_counter_enable)
          ISP1761_slave_arb_share_counter <= ISP1761_slave_arb_share_counter_next_value;
    end


  //ISP1761_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1761_slave_slavearbiterlockenable <= 0;
      else if ((|ISP1761_slave_master_qreq_vector & end_xfer_arb_share_counter_term_ISP1761_slave) | (end_xfer_arb_share_counter_term_ISP1761_slave & ~ISP1761_slave_non_bursting_master_requests))
          ISP1761_slave_slavearbiterlockenable <= |ISP1761_slave_arb_share_counter_next_value;
    end


  //cpu/data_master ISP1761/slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = ISP1761_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //ISP1761_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ISP1761_slave_slavearbiterlockenable2 = |ISP1761_slave_arb_share_counter_next_value;

  //cpu/data_master ISP1761/slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = ISP1761_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //ISP1761_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ISP1761_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_ISP1761_slave = cpu_data_master_requests_ISP1761_slave;
  //ISP1761_slave_writedata mux, which is an e_mux
  assign ISP1761_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_ISP1761_slave = cpu_data_master_qualified_request_ISP1761_slave;

  //cpu/data_master saved-grant ISP1761/slave, which is an e_assign
  assign cpu_data_master_saved_grant_ISP1761_slave = cpu_data_master_requests_ISP1761_slave;

  //allow new arb cycle for ISP1761/slave, which is an e_assign
  assign ISP1761_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ISP1761_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ISP1761_slave_master_qreq_vector = 1;

  //ISP1761_slave_reset_n assignment, which is an e_assign
  assign ISP1761_slave_reset_n = reset_n;

  assign ISP1761_slave_chipselect_n = ~cpu_data_master_granted_ISP1761_slave;
  //ISP1761_slave_firsttransfer first transaction, which is an e_assign
  assign ISP1761_slave_firsttransfer = ISP1761_slave_begins_xfer ? ISP1761_slave_unreg_firsttransfer : ISP1761_slave_reg_firsttransfer;

  //ISP1761_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign ISP1761_slave_unreg_firsttransfer = ~(ISP1761_slave_slavearbiterlockenable & ISP1761_slave_any_continuerequest);

  //ISP1761_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1761_slave_reg_firsttransfer <= 1'b1;
      else if (ISP1761_slave_begins_xfer)
          ISP1761_slave_reg_firsttransfer <= ISP1761_slave_unreg_firsttransfer;
    end


  //ISP1761_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ISP1761_slave_beginbursttransfer_internal = ISP1761_slave_begins_xfer;

  //~ISP1761_slave_read_n assignment, which is an e_mux
  assign ISP1761_slave_read_n = ~(((cpu_data_master_granted_ISP1761_slave & cpu_data_master_read))& ~ISP1761_slave_begins_xfer);

  //~ISP1761_slave_write_n assignment, which is an e_mux
  assign ISP1761_slave_write_n = ~(((cpu_data_master_granted_ISP1761_slave & cpu_data_master_write)) & ~ISP1761_slave_begins_xfer & (ISP1761_slave_wait_counter >= 1));

  assign shifted_address_to_ISP1761_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //ISP1761_slave_address mux, which is an e_mux
  assign ISP1761_slave_address = shifted_address_to_ISP1761_slave_from_cpu_data_master >> 2;

  //d1_ISP1761_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ISP1761_slave_end_xfer <= 1;
      else 
        d1_ISP1761_slave_end_xfer <= ISP1761_slave_end_xfer;
    end


  //ISP1761_slave_waits_for_read in a cycle, which is an e_mux
  assign ISP1761_slave_waits_for_read = ISP1761_slave_in_a_read_cycle & wait_for_ISP1761_slave_counter;

  //ISP1761_slave_in_a_read_cycle assignment, which is an e_assign
  assign ISP1761_slave_in_a_read_cycle = cpu_data_master_granted_ISP1761_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ISP1761_slave_in_a_read_cycle;

  //ISP1761_slave_waits_for_write in a cycle, which is an e_mux
  assign ISP1761_slave_waits_for_write = ISP1761_slave_in_a_write_cycle & wait_for_ISP1761_slave_counter;

  //ISP1761_slave_in_a_write_cycle assignment, which is an e_assign
  assign ISP1761_slave_in_a_write_cycle = cpu_data_master_granted_ISP1761_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ISP1761_slave_in_a_write_cycle;

  assign ISP1761_slave_wait_counter_eq_0 = ISP1761_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1761_slave_wait_counter <= 0;
      else 
        ISP1761_slave_wait_counter <= ISP1761_slave_counter_load_value;
    end


  assign ISP1761_slave_counter_load_value = ((ISP1761_slave_in_a_write_cycle & ISP1761_slave_begins_xfer))? 1 :
    ((ISP1761_slave_in_a_read_cycle & ISP1761_slave_begins_xfer))? 1 :
    (~ISP1761_slave_wait_counter_eq_0)? ISP1761_slave_wait_counter - 1 :
    0;

  assign wait_for_ISP1761_slave_counter = ISP1761_slave_begins_xfer | ~ISP1761_slave_wait_counter_eq_0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ISP1761/slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     ISP1761_slave_readdata_from_sa,
                                     ISP1761_slave_wait_counter_eq_0,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_granted_ISP1761_slave,
                                     cpu_data_master_granted_ports_slave,
                                     cpu_data_master_qualified_request_ISP1761_slave,
                                     cpu_data_master_qualified_request_ports_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_ISP1761_slave,
                                     cpu_data_master_read_data_valid_ports_slave,
                                     cpu_data_master_requests_ISP1761_slave,
                                     cpu_data_master_requests_ports_slave,
                                     cpu_data_master_write,
                                     d1_ISP1761_slave_end_xfer,
                                     d1_ports_slave_end_xfer,
                                     reset_n,
                                     s_readdata_from_the_ports_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_readdata,
                                     cpu_data_master_reset_n,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 20: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_reset_n;
  output           cpu_data_master_waitrequest;
  input   [ 31: 0] ISP1761_slave_readdata_from_sa;
  input            ISP1761_slave_wait_counter_eq_0;
  input            clk;
  input   [ 20: 0] cpu_data_master_address;
  input            cpu_data_master_granted_ISP1761_slave;
  input            cpu_data_master_granted_ports_slave;
  input            cpu_data_master_qualified_request_ISP1761_slave;
  input            cpu_data_master_qualified_request_ports_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_ISP1761_slave;
  input            cpu_data_master_read_data_valid_ports_slave;
  input            cpu_data_master_requests_ISP1761_slave;
  input            cpu_data_master_requests_ports_slave;
  input            cpu_data_master_write;
  input            d1_ISP1761_slave_end_xfer;
  input            d1_ports_slave_end_xfer;
  input            reset_n;
  input   [ 31: 0] s_readdata_from_the_ports_from_sa;

  wire    [ 20: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_reset_n;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             r_0;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_data_master_qualified_request_ISP1761_slave | ~cpu_data_master_read | (1 & ~d1_ISP1761_slave_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ISP1761_slave | ~cpu_data_master_write | (1 & ~d1_ISP1761_slave_end_xfer & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_ports_slave | ~cpu_data_master_requests_ports_slave) & ((~cpu_data_master_qualified_request_ports_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_ports_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[20 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_ISP1761_slave}} | ISP1761_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_ports_slave}} | registered_cpu_data_master_readdata);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //cpu_data_master_reset_n assignment, which is an e_assign
  assign cpu_data_master_reset_n = reset_n;

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = {32 {~cpu_data_master_requests_ports_slave}} | s_readdata_from_the_ports_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_tightly_coupled_data_master_0_arbitrator (
                                                      // inputs:
                                                       clk,
                                                       cpu_tightly_coupled_data_master_0_address,
                                                       cpu_tightly_coupled_data_master_0_byteenable,
                                                       cpu_tightly_coupled_data_master_0_clken,
                                                       cpu_tightly_coupled_data_master_0_granted_mem_s2,
                                                       cpu_tightly_coupled_data_master_0_qualified_request_mem_s2,
                                                       cpu_tightly_coupled_data_master_0_read,
                                                       cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2,
                                                       cpu_tightly_coupled_data_master_0_requests_mem_s2,
                                                       cpu_tightly_coupled_data_master_0_write,
                                                       cpu_tightly_coupled_data_master_0_writedata,
                                                       d1_mem_s2_end_xfer,
                                                       mem_s2_readdata_from_sa,
                                                       reset_n,

                                                      // outputs:
                                                       cpu_tightly_coupled_data_master_0_address_to_slave,
                                                       cpu_tightly_coupled_data_master_0_latency_counter,
                                                       cpu_tightly_coupled_data_master_0_readdata,
                                                       cpu_tightly_coupled_data_master_0_readdatavalid,
                                                       cpu_tightly_coupled_data_master_0_waitrequest
                                                    )
;

  output  [ 22: 0] cpu_tightly_coupled_data_master_0_address_to_slave;
  output           cpu_tightly_coupled_data_master_0_latency_counter;
  output  [ 31: 0] cpu_tightly_coupled_data_master_0_readdata;
  output           cpu_tightly_coupled_data_master_0_readdatavalid;
  output           cpu_tightly_coupled_data_master_0_waitrequest;
  input            clk;
  input   [ 22: 0] cpu_tightly_coupled_data_master_0_address;
  input   [  3: 0] cpu_tightly_coupled_data_master_0_byteenable;
  input            cpu_tightly_coupled_data_master_0_clken;
  input            cpu_tightly_coupled_data_master_0_granted_mem_s2;
  input            cpu_tightly_coupled_data_master_0_qualified_request_mem_s2;
  input            cpu_tightly_coupled_data_master_0_read;
  input            cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2;
  input            cpu_tightly_coupled_data_master_0_requests_mem_s2;
  input            cpu_tightly_coupled_data_master_0_write;
  input   [ 31: 0] cpu_tightly_coupled_data_master_0_writedata;
  input            d1_mem_s2_end_xfer;
  input   [ 31: 0] mem_s2_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_tightly_coupled_data_master_0_address_last_time;
  wire    [ 22: 0] cpu_tightly_coupled_data_master_0_address_to_slave;
  reg     [  3: 0] cpu_tightly_coupled_data_master_0_byteenable_last_time;
  wire             cpu_tightly_coupled_data_master_0_latency_counter;
  reg              cpu_tightly_coupled_data_master_0_read_last_time;
  wire    [ 31: 0] cpu_tightly_coupled_data_master_0_readdata;
  wire             cpu_tightly_coupled_data_master_0_readdatavalid;
  wire             cpu_tightly_coupled_data_master_0_run;
  wire             cpu_tightly_coupled_data_master_0_waitrequest;
  reg              cpu_tightly_coupled_data_master_0_write_last_time;
  reg     [ 31: 0] cpu_tightly_coupled_data_master_0_writedata_last_time;
  wire             pre_flush_cpu_tightly_coupled_data_master_0_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_tightly_coupled_data_master_0_qualified_request_mem_s2 | ~(cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write) | (1 & (cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write)))) & ((~cpu_tightly_coupled_data_master_0_qualified_request_mem_s2 | ~(cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write) | (1 & (cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_tightly_coupled_data_master_0_address_to_slave = {10'b1000000000,
    cpu_tightly_coupled_data_master_0_address[12 : 0]};

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_tightly_coupled_data_master_0_readdatavalid = cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_tightly_coupled_data_master_0_readdatavalid = 0 |
    pre_flush_cpu_tightly_coupled_data_master_0_readdatavalid;

  //cpu/tightly_coupled_data_master_0 readdata mux, which is an e_mux
  assign cpu_tightly_coupled_data_master_0_readdata = mem_s2_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_waitrequest = ~cpu_tightly_coupled_data_master_0_run;

  //latent max counter, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_latency_counter = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_tightly_coupled_data_master_0_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_address_last_time <= 0;
      else 
        cpu_tightly_coupled_data_master_0_address_last_time <= cpu_tightly_coupled_data_master_0_address;
    end


  //cpu/tightly_coupled_data_master_0 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_tightly_coupled_data_master_0_waitrequest & (cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write);
    end


  //cpu_tightly_coupled_data_master_0_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_data_master_0_address != cpu_tightly_coupled_data_master_0_address_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_data_master_0_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_tightly_coupled_data_master_0_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_byteenable_last_time <= 0;
      else 
        cpu_tightly_coupled_data_master_0_byteenable_last_time <= cpu_tightly_coupled_data_master_0_byteenable;
    end


  //cpu_tightly_coupled_data_master_0_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_data_master_0_byteenable != cpu_tightly_coupled_data_master_0_byteenable_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_data_master_0_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_tightly_coupled_data_master_0_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_read_last_time <= 0;
      else 
        cpu_tightly_coupled_data_master_0_read_last_time <= cpu_tightly_coupled_data_master_0_read;
    end


  //cpu_tightly_coupled_data_master_0_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_data_master_0_read != cpu_tightly_coupled_data_master_0_read_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_data_master_0_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_tightly_coupled_data_master_0_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_write_last_time <= 0;
      else 
        cpu_tightly_coupled_data_master_0_write_last_time <= cpu_tightly_coupled_data_master_0_write;
    end


  //cpu_tightly_coupled_data_master_0_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_data_master_0_write != cpu_tightly_coupled_data_master_0_write_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_data_master_0_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_tightly_coupled_data_master_0_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_writedata_last_time <= 0;
      else 
        cpu_tightly_coupled_data_master_0_writedata_last_time <= cpu_tightly_coupled_data_master_0_writedata;
    end


  //cpu_tightly_coupled_data_master_0_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_data_master_0_writedata != cpu_tightly_coupled_data_master_0_writedata_last_time) & cpu_tightly_coupled_data_master_0_write)
        begin
          $write("%0d ns: cpu_tightly_coupled_data_master_0_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_tightly_coupled_instruction_master_0_arbitrator (
                                                             // inputs:
                                                              clk,
                                                              cpu_tightly_coupled_instruction_master_0_address,
                                                              cpu_tightly_coupled_instruction_master_0_clken,
                                                              cpu_tightly_coupled_instruction_master_0_granted_mem_s1,
                                                              cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1,
                                                              cpu_tightly_coupled_instruction_master_0_read,
                                                              cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1,
                                                              cpu_tightly_coupled_instruction_master_0_requests_mem_s1,
                                                              d1_mem_s1_end_xfer,
                                                              mem_s1_readdata_from_sa,
                                                              reset_n,

                                                             // outputs:
                                                              cpu_tightly_coupled_instruction_master_0_address_to_slave,
                                                              cpu_tightly_coupled_instruction_master_0_latency_counter,
                                                              cpu_tightly_coupled_instruction_master_0_readdata,
                                                              cpu_tightly_coupled_instruction_master_0_readdatavalid,
                                                              cpu_tightly_coupled_instruction_master_0_waitrequest
                                                           )
;

  output  [ 22: 0] cpu_tightly_coupled_instruction_master_0_address_to_slave;
  output           cpu_tightly_coupled_instruction_master_0_latency_counter;
  output  [ 31: 0] cpu_tightly_coupled_instruction_master_0_readdata;
  output           cpu_tightly_coupled_instruction_master_0_readdatavalid;
  output           cpu_tightly_coupled_instruction_master_0_waitrequest;
  input            clk;
  input   [ 22: 0] cpu_tightly_coupled_instruction_master_0_address;
  input            cpu_tightly_coupled_instruction_master_0_clken;
  input            cpu_tightly_coupled_instruction_master_0_granted_mem_s1;
  input            cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1;
  input            cpu_tightly_coupled_instruction_master_0_read;
  input            cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1;
  input            cpu_tightly_coupled_instruction_master_0_requests_mem_s1;
  input            d1_mem_s1_end_xfer;
  input   [ 31: 0] mem_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_tightly_coupled_instruction_master_0_address_last_time;
  wire    [ 22: 0] cpu_tightly_coupled_instruction_master_0_address_to_slave;
  wire             cpu_tightly_coupled_instruction_master_0_latency_counter;
  reg              cpu_tightly_coupled_instruction_master_0_read_last_time;
  wire    [ 31: 0] cpu_tightly_coupled_instruction_master_0_readdata;
  wire             cpu_tightly_coupled_instruction_master_0_readdatavalid;
  wire             cpu_tightly_coupled_instruction_master_0_run;
  wire             cpu_tightly_coupled_instruction_master_0_waitrequest;
  wire             pre_flush_cpu_tightly_coupled_instruction_master_0_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1 | ~(cpu_tightly_coupled_instruction_master_0_read) | (1 & (cpu_tightly_coupled_instruction_master_0_read))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_tightly_coupled_instruction_master_0_address_to_slave = {10'b1000000000,
    cpu_tightly_coupled_instruction_master_0_address[12 : 0]};

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_tightly_coupled_instruction_master_0_readdatavalid = cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_tightly_coupled_instruction_master_0_readdatavalid = 0 |
    pre_flush_cpu_tightly_coupled_instruction_master_0_readdatavalid;

  //cpu/tightly_coupled_instruction_master_0 readdata mux, which is an e_mux
  assign cpu_tightly_coupled_instruction_master_0_readdata = mem_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_waitrequest = ~cpu_tightly_coupled_instruction_master_0_run;

  //latent max counter, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_latency_counter = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_tightly_coupled_instruction_master_0_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_instruction_master_0_address_last_time <= 0;
      else 
        cpu_tightly_coupled_instruction_master_0_address_last_time <= cpu_tightly_coupled_instruction_master_0_address;
    end


  //cpu/tightly_coupled_instruction_master_0 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_tightly_coupled_instruction_master_0_waitrequest & (cpu_tightly_coupled_instruction_master_0_read);
    end


  //cpu_tightly_coupled_instruction_master_0_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_instruction_master_0_address != cpu_tightly_coupled_instruction_master_0_address_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_instruction_master_0_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_tightly_coupled_instruction_master_0_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_instruction_master_0_read_last_time <= 0;
      else 
        cpu_tightly_coupled_instruction_master_0_read_last_time <= cpu_tightly_coupled_instruction_master_0_read;
    end


  //cpu_tightly_coupled_instruction_master_0_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_tightly_coupled_instruction_master_0_read != cpu_tightly_coupled_instruction_master_0_read_last_time))
        begin
          $write("%0d ns: cpu_tightly_coupled_instruction_master_0_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mem_s1_arbitrator (
                           // inputs:
                            clk,
                            cpu_tightly_coupled_instruction_master_0_address_to_slave,
                            cpu_tightly_coupled_instruction_master_0_clken,
                            cpu_tightly_coupled_instruction_master_0_latency_counter,
                            cpu_tightly_coupled_instruction_master_0_read,
                            mem_s1_readdata,
                            reset_n,

                           // outputs:
                            cpu_tightly_coupled_instruction_master_0_granted_mem_s1,
                            cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1,
                            cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1,
                            cpu_tightly_coupled_instruction_master_0_requests_mem_s1,
                            d1_mem_s1_end_xfer,
                            mem_s1_address,
                            mem_s1_byteenable,
                            mem_s1_chipselect,
                            mem_s1_clken,
                            mem_s1_readdata_from_sa,
                            mem_s1_write,
                            mem_s1_writedata
                         )
;

  output           cpu_tightly_coupled_instruction_master_0_granted_mem_s1;
  output           cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1;
  output           cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1;
  output           cpu_tightly_coupled_instruction_master_0_requests_mem_s1;
  output           d1_mem_s1_end_xfer;
  output  [ 10: 0] mem_s1_address;
  output  [  3: 0] mem_s1_byteenable;
  output           mem_s1_chipselect;
  output           mem_s1_clken;
  output  [ 31: 0] mem_s1_readdata_from_sa;
  output           mem_s1_write;
  output  [ 31: 0] mem_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_tightly_coupled_instruction_master_0_address_to_slave;
  input            cpu_tightly_coupled_instruction_master_0_clken;
  input            cpu_tightly_coupled_instruction_master_0_latency_counter;
  input            cpu_tightly_coupled_instruction_master_0_read;
  input   [ 31: 0] mem_s1_readdata;
  input            reset_n;

  wire             cpu_tightly_coupled_instruction_master_0_arbiterlock;
  wire             cpu_tightly_coupled_instruction_master_0_arbiterlock2;
  wire             cpu_tightly_coupled_instruction_master_0_continuerequest;
  wire             cpu_tightly_coupled_instruction_master_0_granted_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1;
  reg              cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register;
  wire             cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register_in;
  wire             cpu_tightly_coupled_instruction_master_0_requests_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_saved_grant_mem_s1;
  reg              d1_mem_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_mem_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 10: 0] mem_s1_address;
  wire             mem_s1_allgrants;
  wire             mem_s1_allow_new_arb_cycle;
  wire             mem_s1_any_bursting_master_saved_grant;
  wire             mem_s1_any_continuerequest;
  wire             mem_s1_arb_counter_enable;
  reg              mem_s1_arb_share_counter;
  wire             mem_s1_arb_share_counter_next_value;
  wire             mem_s1_arb_share_set_values;
  wire             mem_s1_beginbursttransfer_internal;
  wire             mem_s1_begins_xfer;
  wire    [  3: 0] mem_s1_byteenable;
  wire             mem_s1_chipselect;
  wire             mem_s1_clken;
  wire             mem_s1_end_xfer;
  wire             mem_s1_firsttransfer;
  wire             mem_s1_grant_vector;
  wire             mem_s1_in_a_read_cycle;
  wire             mem_s1_in_a_write_cycle;
  wire             mem_s1_master_qreq_vector;
  wire             mem_s1_non_bursting_master_requests;
  wire    [ 31: 0] mem_s1_readdata_from_sa;
  reg              mem_s1_reg_firsttransfer;
  reg              mem_s1_slavearbiterlockenable;
  wire             mem_s1_slavearbiterlockenable2;
  wire             mem_s1_unreg_firsttransfer;
  wire             mem_s1_waits_for_read;
  wire             mem_s1_waits_for_write;
  wire             mem_s1_write;
  wire    [ 31: 0] mem_s1_writedata;
  wire             p1_cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register;
  wire    [ 22: 0] shifted_address_to_mem_s1_from_cpu_tightly_coupled_instruction_master_0;
  wire             wait_for_mem_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~mem_s1_end_xfer;
    end


  assign mem_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1));
  //assign mem_s1_readdata_from_sa = mem_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mem_s1_readdata_from_sa = mem_s1_readdata;

  assign cpu_tightly_coupled_instruction_master_0_requests_mem_s1 = (({cpu_tightly_coupled_instruction_master_0_address_to_slave[22 : 13] , 13'b0} == 23'h400000) & (cpu_tightly_coupled_instruction_master_0_read)) & cpu_tightly_coupled_instruction_master_0_read;
  //mem_s1_arb_share_counter set values, which is an e_mux
  assign mem_s1_arb_share_set_values = 1;

  //mem_s1_non_bursting_master_requests mux, which is an e_mux
  assign mem_s1_non_bursting_master_requests = cpu_tightly_coupled_instruction_master_0_requests_mem_s1;

  //mem_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign mem_s1_any_bursting_master_saved_grant = 0;

  //mem_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign mem_s1_arb_share_counter_next_value = mem_s1_firsttransfer ? (mem_s1_arb_share_set_values - 1) : |mem_s1_arb_share_counter ? (mem_s1_arb_share_counter - 1) : 0;

  //mem_s1_allgrants all slave grants, which is an e_mux
  assign mem_s1_allgrants = |mem_s1_grant_vector;

  //mem_s1_end_xfer assignment, which is an e_assign
  assign mem_s1_end_xfer = ~(mem_s1_waits_for_read | mem_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_mem_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_mem_s1 = mem_s1_end_xfer & (~mem_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //mem_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign mem_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_mem_s1 & mem_s1_allgrants) | (end_xfer_arb_share_counter_term_mem_s1 & ~mem_s1_non_bursting_master_requests);

  //mem_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s1_arb_share_counter <= 0;
      else if (mem_s1_arb_counter_enable)
          mem_s1_arb_share_counter <= mem_s1_arb_share_counter_next_value;
    end


  //mem_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s1_slavearbiterlockenable <= 0;
      else if ((|mem_s1_master_qreq_vector & end_xfer_arb_share_counter_term_mem_s1) | (end_xfer_arb_share_counter_term_mem_s1 & ~mem_s1_non_bursting_master_requests))
          mem_s1_slavearbiterlockenable <= |mem_s1_arb_share_counter_next_value;
    end


  //cpu/tightly_coupled_instruction_master_0 mem/s1 arbiterlock, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_arbiterlock = mem_s1_slavearbiterlockenable & cpu_tightly_coupled_instruction_master_0_continuerequest;

  //mem_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign mem_s1_slavearbiterlockenable2 = |mem_s1_arb_share_counter_next_value;

  //cpu/tightly_coupled_instruction_master_0 mem/s1 arbiterlock2, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_arbiterlock2 = mem_s1_slavearbiterlockenable2 & cpu_tightly_coupled_instruction_master_0_continuerequest;

  //mem_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign mem_s1_any_continuerequest = 1;

  //cpu_tightly_coupled_instruction_master_0_continuerequest continued request, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_continuerequest = 1;

  assign cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1 = cpu_tightly_coupled_instruction_master_0_requests_mem_s1;
  //cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register_in = cpu_tightly_coupled_instruction_master_0_granted_mem_s1 & cpu_tightly_coupled_instruction_master_0_read & ~mem_s1_waits_for_read;

  //shift register p1 cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register = {cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register, cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register_in};

  //cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register <= 0;
      else 
        cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register <= p1_cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register;
    end


  //local readdatavalid cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1, which is an e_mux
  assign cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1 = cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1_shift_register;

  //mux mem_s1_clken, which is an e_mux
  assign mem_s1_clken = (cpu_tightly_coupled_instruction_master_0_granted_mem_s1)? cpu_tightly_coupled_instruction_master_0_clken :
    1'b1;

  //master is always granted when requested
  assign cpu_tightly_coupled_instruction_master_0_granted_mem_s1 = cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1;

  //cpu/tightly_coupled_instruction_master_0 saved-grant mem/s1, which is an e_assign
  assign cpu_tightly_coupled_instruction_master_0_saved_grant_mem_s1 = cpu_tightly_coupled_instruction_master_0_requests_mem_s1;

  //allow new arb cycle for mem/s1, which is an e_assign
  assign mem_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign mem_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign mem_s1_master_qreq_vector = 1;

  assign mem_s1_chipselect = cpu_tightly_coupled_instruction_master_0_granted_mem_s1;
  //mem_s1_firsttransfer first transaction, which is an e_assign
  assign mem_s1_firsttransfer = mem_s1_begins_xfer ? mem_s1_unreg_firsttransfer : mem_s1_reg_firsttransfer;

  //mem_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign mem_s1_unreg_firsttransfer = ~(mem_s1_slavearbiterlockenable & mem_s1_any_continuerequest);

  //mem_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s1_reg_firsttransfer <= 1'b1;
      else if (mem_s1_begins_xfer)
          mem_s1_reg_firsttransfer <= mem_s1_unreg_firsttransfer;
    end


  //mem_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign mem_s1_beginbursttransfer_internal = mem_s1_begins_xfer;

  //mem_s1_write assignment, which is an e_mux
  assign mem_s1_write = 0;

  assign shifted_address_to_mem_s1_from_cpu_tightly_coupled_instruction_master_0 = cpu_tightly_coupled_instruction_master_0_address_to_slave;
  //mem_s1_address mux, which is an e_mux
  assign mem_s1_address = shifted_address_to_mem_s1_from_cpu_tightly_coupled_instruction_master_0 >> 2;

  //d1_mem_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_mem_s1_end_xfer <= 1;
      else 
        d1_mem_s1_end_xfer <= mem_s1_end_xfer;
    end


  //mem_s1_waits_for_read in a cycle, which is an e_mux
  assign mem_s1_waits_for_read = mem_s1_in_a_read_cycle & 0;

  //mem_s1_in_a_read_cycle assignment, which is an e_assign
  assign mem_s1_in_a_read_cycle = cpu_tightly_coupled_instruction_master_0_granted_mem_s1 & cpu_tightly_coupled_instruction_master_0_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = mem_s1_in_a_read_cycle;

  //mem_s1_waits_for_write in a cycle, which is an e_mux
  assign mem_s1_waits_for_write = mem_s1_in_a_write_cycle & 0;

  //mem_s1_in_a_write_cycle assignment, which is an e_assign
  assign mem_s1_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = mem_s1_in_a_write_cycle;

  assign wait_for_mem_s1_counter = 0;
  //mem_s1_byteenable byte enable port mux, which is an e_mux
  assign mem_s1_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mem/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mem_s2_arbitrator (
                           // inputs:
                            clk,
                            cpu_tightly_coupled_data_master_0_address_to_slave,
                            cpu_tightly_coupled_data_master_0_byteenable,
                            cpu_tightly_coupled_data_master_0_clken,
                            cpu_tightly_coupled_data_master_0_latency_counter,
                            cpu_tightly_coupled_data_master_0_read,
                            cpu_tightly_coupled_data_master_0_write,
                            cpu_tightly_coupled_data_master_0_writedata,
                            mem_s2_readdata,
                            reset_n,

                           // outputs:
                            cpu_tightly_coupled_data_master_0_granted_mem_s2,
                            cpu_tightly_coupled_data_master_0_qualified_request_mem_s2,
                            cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2,
                            cpu_tightly_coupled_data_master_0_requests_mem_s2,
                            d1_mem_s2_end_xfer,
                            mem_s2_address,
                            mem_s2_byteenable,
                            mem_s2_chipselect,
                            mem_s2_clken,
                            mem_s2_readdata_from_sa,
                            mem_s2_write,
                            mem_s2_writedata
                         )
;

  output           cpu_tightly_coupled_data_master_0_granted_mem_s2;
  output           cpu_tightly_coupled_data_master_0_qualified_request_mem_s2;
  output           cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2;
  output           cpu_tightly_coupled_data_master_0_requests_mem_s2;
  output           d1_mem_s2_end_xfer;
  output  [ 10: 0] mem_s2_address;
  output  [  3: 0] mem_s2_byteenable;
  output           mem_s2_chipselect;
  output           mem_s2_clken;
  output  [ 31: 0] mem_s2_readdata_from_sa;
  output           mem_s2_write;
  output  [ 31: 0] mem_s2_writedata;
  input            clk;
  input   [ 22: 0] cpu_tightly_coupled_data_master_0_address_to_slave;
  input   [  3: 0] cpu_tightly_coupled_data_master_0_byteenable;
  input            cpu_tightly_coupled_data_master_0_clken;
  input            cpu_tightly_coupled_data_master_0_latency_counter;
  input            cpu_tightly_coupled_data_master_0_read;
  input            cpu_tightly_coupled_data_master_0_write;
  input   [ 31: 0] cpu_tightly_coupled_data_master_0_writedata;
  input   [ 31: 0] mem_s2_readdata;
  input            reset_n;

  wire             cpu_tightly_coupled_data_master_0_arbiterlock;
  wire             cpu_tightly_coupled_data_master_0_arbiterlock2;
  wire             cpu_tightly_coupled_data_master_0_continuerequest;
  wire             cpu_tightly_coupled_data_master_0_granted_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_qualified_request_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2;
  reg              cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register;
  wire             cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register_in;
  wire             cpu_tightly_coupled_data_master_0_requests_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_saved_grant_mem_s2;
  reg              d1_mem_s2_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_mem_s2;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 10: 0] mem_s2_address;
  wire             mem_s2_allgrants;
  wire             mem_s2_allow_new_arb_cycle;
  wire             mem_s2_any_bursting_master_saved_grant;
  wire             mem_s2_any_continuerequest;
  wire             mem_s2_arb_counter_enable;
  reg              mem_s2_arb_share_counter;
  wire             mem_s2_arb_share_counter_next_value;
  wire             mem_s2_arb_share_set_values;
  wire             mem_s2_beginbursttransfer_internal;
  wire             mem_s2_begins_xfer;
  wire    [  3: 0] mem_s2_byteenable;
  wire             mem_s2_chipselect;
  wire             mem_s2_clken;
  wire             mem_s2_end_xfer;
  wire             mem_s2_firsttransfer;
  wire             mem_s2_grant_vector;
  wire             mem_s2_in_a_read_cycle;
  wire             mem_s2_in_a_write_cycle;
  wire             mem_s2_master_qreq_vector;
  wire             mem_s2_non_bursting_master_requests;
  wire    [ 31: 0] mem_s2_readdata_from_sa;
  reg              mem_s2_reg_firsttransfer;
  reg              mem_s2_slavearbiterlockenable;
  wire             mem_s2_slavearbiterlockenable2;
  wire             mem_s2_unreg_firsttransfer;
  wire             mem_s2_waits_for_read;
  wire             mem_s2_waits_for_write;
  wire             mem_s2_write;
  wire    [ 31: 0] mem_s2_writedata;
  wire             p1_cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register;
  wire    [ 22: 0] shifted_address_to_mem_s2_from_cpu_tightly_coupled_data_master_0;
  wire             wait_for_mem_s2_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~mem_s2_end_xfer;
    end


  assign mem_s2_begins_xfer = ~d1_reasons_to_wait & ((cpu_tightly_coupled_data_master_0_qualified_request_mem_s2));
  //assign mem_s2_readdata_from_sa = mem_s2_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mem_s2_readdata_from_sa = mem_s2_readdata;

  assign cpu_tightly_coupled_data_master_0_requests_mem_s2 = ({cpu_tightly_coupled_data_master_0_address_to_slave[22 : 13] , 13'b0} == 23'h400000) & (cpu_tightly_coupled_data_master_0_read | cpu_tightly_coupled_data_master_0_write);
  //mem_s2_arb_share_counter set values, which is an e_mux
  assign mem_s2_arb_share_set_values = 1;

  //mem_s2_non_bursting_master_requests mux, which is an e_mux
  assign mem_s2_non_bursting_master_requests = cpu_tightly_coupled_data_master_0_requests_mem_s2;

  //mem_s2_any_bursting_master_saved_grant mux, which is an e_mux
  assign mem_s2_any_bursting_master_saved_grant = 0;

  //mem_s2_arb_share_counter_next_value assignment, which is an e_assign
  assign mem_s2_arb_share_counter_next_value = mem_s2_firsttransfer ? (mem_s2_arb_share_set_values - 1) : |mem_s2_arb_share_counter ? (mem_s2_arb_share_counter - 1) : 0;

  //mem_s2_allgrants all slave grants, which is an e_mux
  assign mem_s2_allgrants = |mem_s2_grant_vector;

  //mem_s2_end_xfer assignment, which is an e_assign
  assign mem_s2_end_xfer = ~(mem_s2_waits_for_read | mem_s2_waits_for_write);

  //end_xfer_arb_share_counter_term_mem_s2 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_mem_s2 = mem_s2_end_xfer & (~mem_s2_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //mem_s2_arb_share_counter arbitration counter enable, which is an e_assign
  assign mem_s2_arb_counter_enable = (end_xfer_arb_share_counter_term_mem_s2 & mem_s2_allgrants) | (end_xfer_arb_share_counter_term_mem_s2 & ~mem_s2_non_bursting_master_requests);

  //mem_s2_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s2_arb_share_counter <= 0;
      else if (mem_s2_arb_counter_enable)
          mem_s2_arb_share_counter <= mem_s2_arb_share_counter_next_value;
    end


  //mem_s2_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s2_slavearbiterlockenable <= 0;
      else if ((|mem_s2_master_qreq_vector & end_xfer_arb_share_counter_term_mem_s2) | (end_xfer_arb_share_counter_term_mem_s2 & ~mem_s2_non_bursting_master_requests))
          mem_s2_slavearbiterlockenable <= |mem_s2_arb_share_counter_next_value;
    end


  //cpu/tightly_coupled_data_master_0 mem/s2 arbiterlock, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_arbiterlock = mem_s2_slavearbiterlockenable & cpu_tightly_coupled_data_master_0_continuerequest;

  //mem_s2_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign mem_s2_slavearbiterlockenable2 = |mem_s2_arb_share_counter_next_value;

  //cpu/tightly_coupled_data_master_0 mem/s2 arbiterlock2, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_arbiterlock2 = mem_s2_slavearbiterlockenable2 & cpu_tightly_coupled_data_master_0_continuerequest;

  //mem_s2_any_continuerequest at least one master continues requesting, which is an e_assign
  assign mem_s2_any_continuerequest = 1;

  //cpu_tightly_coupled_data_master_0_continuerequest continued request, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_continuerequest = 1;

  assign cpu_tightly_coupled_data_master_0_qualified_request_mem_s2 = cpu_tightly_coupled_data_master_0_requests_mem_s2;
  //cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register_in = cpu_tightly_coupled_data_master_0_granted_mem_s2 & cpu_tightly_coupled_data_master_0_read & ~mem_s2_waits_for_read;

  //shift register p1 cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register = {cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register, cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register_in};

  //cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register <= 0;
      else 
        cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register <= p1_cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register;
    end


  //local readdatavalid cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2, which is an e_mux
  assign cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2 = cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2_shift_register;

  //mem_s2_writedata mux, which is an e_mux
  assign mem_s2_writedata = cpu_tightly_coupled_data_master_0_writedata;

  //mux mem_s2_clken, which is an e_mux
  assign mem_s2_clken = (cpu_tightly_coupled_data_master_0_granted_mem_s2)? cpu_tightly_coupled_data_master_0_clken :
    1'b1;

  //master is always granted when requested
  assign cpu_tightly_coupled_data_master_0_granted_mem_s2 = cpu_tightly_coupled_data_master_0_qualified_request_mem_s2;

  //cpu/tightly_coupled_data_master_0 saved-grant mem/s2, which is an e_assign
  assign cpu_tightly_coupled_data_master_0_saved_grant_mem_s2 = cpu_tightly_coupled_data_master_0_requests_mem_s2;

  //allow new arb cycle for mem/s2, which is an e_assign
  assign mem_s2_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign mem_s2_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign mem_s2_master_qreq_vector = 1;

  assign mem_s2_chipselect = cpu_tightly_coupled_data_master_0_granted_mem_s2;
  //mem_s2_firsttransfer first transaction, which is an e_assign
  assign mem_s2_firsttransfer = mem_s2_begins_xfer ? mem_s2_unreg_firsttransfer : mem_s2_reg_firsttransfer;

  //mem_s2_unreg_firsttransfer first transaction, which is an e_assign
  assign mem_s2_unreg_firsttransfer = ~(mem_s2_slavearbiterlockenable & mem_s2_any_continuerequest);

  //mem_s2_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mem_s2_reg_firsttransfer <= 1'b1;
      else if (mem_s2_begins_xfer)
          mem_s2_reg_firsttransfer <= mem_s2_unreg_firsttransfer;
    end


  //mem_s2_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign mem_s2_beginbursttransfer_internal = mem_s2_begins_xfer;

  //mem_s2_write assignment, which is an e_mux
  assign mem_s2_write = cpu_tightly_coupled_data_master_0_granted_mem_s2 & cpu_tightly_coupled_data_master_0_write;

  assign shifted_address_to_mem_s2_from_cpu_tightly_coupled_data_master_0 = cpu_tightly_coupled_data_master_0_address_to_slave;
  //mem_s2_address mux, which is an e_mux
  assign mem_s2_address = shifted_address_to_mem_s2_from_cpu_tightly_coupled_data_master_0 >> 2;

  //d1_mem_s2_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_mem_s2_end_xfer <= 1;
      else 
        d1_mem_s2_end_xfer <= mem_s2_end_xfer;
    end


  //mem_s2_waits_for_read in a cycle, which is an e_mux
  assign mem_s2_waits_for_read = mem_s2_in_a_read_cycle & 0;

  //mem_s2_in_a_read_cycle assignment, which is an e_assign
  assign mem_s2_in_a_read_cycle = cpu_tightly_coupled_data_master_0_granted_mem_s2 & cpu_tightly_coupled_data_master_0_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = mem_s2_in_a_read_cycle;

  //mem_s2_waits_for_write in a cycle, which is an e_mux
  assign mem_s2_waits_for_write = mem_s2_in_a_write_cycle & 0;

  //mem_s2_in_a_write_cycle assignment, which is an e_assign
  assign mem_s2_in_a_write_cycle = cpu_tightly_coupled_data_master_0_granted_mem_s2 & cpu_tightly_coupled_data_master_0_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = mem_s2_in_a_write_cycle;

  assign wait_for_mem_s2_counter = 0;
  //mem_s2_byteenable byte enable port mux, which is an e_mux
  assign mem_s2_byteenable = (cpu_tightly_coupled_data_master_0_granted_mem_s2)? cpu_tightly_coupled_data_master_0_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mem/s2 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ports_slave_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 reset_n,
                                 s_readdata_from_the_ports,

                                // outputs:
                                 cpu_data_master_granted_ports_slave,
                                 cpu_data_master_qualified_request_ports_slave,
                                 cpu_data_master_read_data_valid_ports_slave,
                                 cpu_data_master_requests_ports_slave,
                                 d1_ports_slave_end_xfer,
                                 s_address_to_the_ports,
                                 s_re_to_the_ports,
                                 s_readdata_from_the_ports_from_sa,
                                 s_reset_n_to_the_ports,
                                 s_we_to_the_ports,
                                 s_writedata_to_the_ports
                              )
;

  output           cpu_data_master_granted_ports_slave;
  output           cpu_data_master_qualified_request_ports_slave;
  output           cpu_data_master_read_data_valid_ports_slave;
  output           cpu_data_master_requests_ports_slave;
  output           d1_ports_slave_end_xfer;
  output  [  3: 0] s_address_to_the_ports;
  output           s_re_to_the_ports;
  output  [ 31: 0] s_readdata_from_the_ports_from_sa;
  output           s_reset_n_to_the_ports;
  output           s_we_to_the_ports;
  output  [ 31: 0] s_writedata_to_the_ports;
  input            clk;
  input   [ 20: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] s_readdata_from_the_ports;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ports_slave;
  wire             cpu_data_master_qualified_request_ports_slave;
  wire             cpu_data_master_read_data_valid_ports_slave;
  wire             cpu_data_master_requests_ports_slave;
  wire             cpu_data_master_saved_grant_ports_slave;
  reg              d1_ports_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ports_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             ports_slave_allgrants;
  wire             ports_slave_allow_new_arb_cycle;
  wire             ports_slave_any_bursting_master_saved_grant;
  wire             ports_slave_any_continuerequest;
  wire             ports_slave_arb_counter_enable;
  reg              ports_slave_arb_share_counter;
  wire             ports_slave_arb_share_counter_next_value;
  wire             ports_slave_arb_share_set_values;
  wire             ports_slave_beginbursttransfer_internal;
  wire             ports_slave_begins_xfer;
  wire             ports_slave_end_xfer;
  wire             ports_slave_firsttransfer;
  wire             ports_slave_grant_vector;
  wire             ports_slave_in_a_read_cycle;
  wire             ports_slave_in_a_write_cycle;
  wire             ports_slave_master_qreq_vector;
  wire             ports_slave_non_bursting_master_requests;
  reg              ports_slave_reg_firsttransfer;
  reg              ports_slave_slavearbiterlockenable;
  wire             ports_slave_slavearbiterlockenable2;
  wire             ports_slave_unreg_firsttransfer;
  wire             ports_slave_waits_for_read;
  wire             ports_slave_waits_for_write;
  wire    [  3: 0] s_address_to_the_ports;
  wire             s_re_to_the_ports;
  wire    [ 31: 0] s_readdata_from_the_ports_from_sa;
  wire             s_reset_n_to_the_ports;
  wire             s_we_to_the_ports;
  wire    [ 31: 0] s_writedata_to_the_ports;
  wire    [ 20: 0] shifted_address_to_ports_slave_from_cpu_data_master;
  wire             wait_for_ports_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ports_slave_end_xfer;
    end


  assign ports_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ports_slave));
  //assign s_readdata_from_the_ports_from_sa = s_readdata_from_the_ports so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign s_readdata_from_the_ports_from_sa = s_readdata_from_the_ports;

  assign cpu_data_master_requests_ports_slave = ({cpu_data_master_address_to_slave[20 : 6] , 6'b0} == 21'h102000) & (cpu_data_master_read | cpu_data_master_write);
  //ports_slave_arb_share_counter set values, which is an e_mux
  assign ports_slave_arb_share_set_values = 1;

  //ports_slave_non_bursting_master_requests mux, which is an e_mux
  assign ports_slave_non_bursting_master_requests = cpu_data_master_requests_ports_slave;

  //ports_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign ports_slave_any_bursting_master_saved_grant = 0;

  //ports_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign ports_slave_arb_share_counter_next_value = ports_slave_firsttransfer ? (ports_slave_arb_share_set_values - 1) : |ports_slave_arb_share_counter ? (ports_slave_arb_share_counter - 1) : 0;

  //ports_slave_allgrants all slave grants, which is an e_mux
  assign ports_slave_allgrants = |ports_slave_grant_vector;

  //ports_slave_end_xfer assignment, which is an e_assign
  assign ports_slave_end_xfer = ~(ports_slave_waits_for_read | ports_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_ports_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ports_slave = ports_slave_end_xfer & (~ports_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ports_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign ports_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_ports_slave & ports_slave_allgrants) | (end_xfer_arb_share_counter_term_ports_slave & ~ports_slave_non_bursting_master_requests);

  //ports_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ports_slave_arb_share_counter <= 0;
      else if (ports_slave_arb_counter_enable)
          ports_slave_arb_share_counter <= ports_slave_arb_share_counter_next_value;
    end


  //ports_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ports_slave_slavearbiterlockenable <= 0;
      else if ((|ports_slave_master_qreq_vector & end_xfer_arb_share_counter_term_ports_slave) | (end_xfer_arb_share_counter_term_ports_slave & ~ports_slave_non_bursting_master_requests))
          ports_slave_slavearbiterlockenable <= |ports_slave_arb_share_counter_next_value;
    end


  //cpu/data_master ports/slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = ports_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //ports_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ports_slave_slavearbiterlockenable2 = |ports_slave_arb_share_counter_next_value;

  //cpu/data_master ports/slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = ports_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //ports_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ports_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_ports_slave = cpu_data_master_requests_ports_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //s_writedata_to_the_ports mux, which is an e_mux
  assign s_writedata_to_the_ports = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_ports_slave = cpu_data_master_qualified_request_ports_slave;

  //cpu/data_master saved-grant ports/slave, which is an e_assign
  assign cpu_data_master_saved_grant_ports_slave = cpu_data_master_requests_ports_slave;

  //allow new arb cycle for ports/slave, which is an e_assign
  assign ports_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ports_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ports_slave_master_qreq_vector = 1;

  //s_reset_n_to_the_ports assignment, which is an e_assign
  assign s_reset_n_to_the_ports = reset_n;

  //ports_slave_firsttransfer first transaction, which is an e_assign
  assign ports_slave_firsttransfer = ports_slave_begins_xfer ? ports_slave_unreg_firsttransfer : ports_slave_reg_firsttransfer;

  //ports_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign ports_slave_unreg_firsttransfer = ~(ports_slave_slavearbiterlockenable & ports_slave_any_continuerequest);

  //ports_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ports_slave_reg_firsttransfer <= 1'b1;
      else if (ports_slave_begins_xfer)
          ports_slave_reg_firsttransfer <= ports_slave_unreg_firsttransfer;
    end


  //ports_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ports_slave_beginbursttransfer_internal = ports_slave_begins_xfer;

  //s_re_to_the_ports assignment, which is an e_mux
  assign s_re_to_the_ports = cpu_data_master_granted_ports_slave & cpu_data_master_read;

  //s_we_to_the_ports assignment, which is an e_mux
  assign s_we_to_the_ports = cpu_data_master_granted_ports_slave & cpu_data_master_write;

  assign shifted_address_to_ports_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //s_address_to_the_ports mux, which is an e_mux
  assign s_address_to_the_ports = shifted_address_to_ports_slave_from_cpu_data_master >> 2;

  //d1_ports_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ports_slave_end_xfer <= 1;
      else 
        d1_ports_slave_end_xfer <= ports_slave_end_xfer;
    end


  //ports_slave_waits_for_read in a cycle, which is an e_mux
  assign ports_slave_waits_for_read = ports_slave_in_a_read_cycle & 0;

  //ports_slave_in_a_read_cycle assignment, which is an e_assign
  assign ports_slave_in_a_read_cycle = cpu_data_master_granted_ports_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ports_slave_in_a_read_cycle;

  //ports_slave_waits_for_write in a cycle, which is an e_mux
  assign ports_slave_waits_for_write = ports_slave_in_a_write_cycle & 0;

  //ports_slave_in_a_write_cycle assignment, which is an e_assign
  assign ports_slave_in_a_write_cycle = cpu_data_master_granted_ports_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ports_slave_in_a_write_cycle;

  assign wait_for_ports_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ports/slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_sys_reset_clk_domain_synch_module (
                                                // inputs:
                                                 clk,
                                                 data_in,
                                                 reset_n,

                                                // outputs:
                                                 data_out
                                              )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_sys (
                  // 1) global signals:
                   clk,
                   reset_n,

                  // the_ISP1761
                   A_from_the_ISP1761,
                   CS_N_from_the_ISP1761,
                   DC_DACK_from_the_ISP1761,
                   DC_DREQ_to_the_ISP1761,
                   DC_IRQ_to_the_ISP1761,
                   D_to_and_from_the_ISP1761,
                   HC_DACK_from_the_ISP1761,
                   HC_DREQ_to_the_ISP1761,
                   HC_IRQ_to_the_ISP1761,
                   RD_N_from_the_ISP1761,
                   RESET_N_from_the_ISP1761,
                   WR_N_from_the_ISP1761,

                  // the_ports_slave
                   s_address_to_the_ports,
                   s_re_to_the_ports,
                   s_readdata_from_the_ports,
                   s_reset_n_to_the_ports,
                   s_we_to_the_ports,
                   s_writedata_to_the_ports
                )
;

  output  [ 16: 0] A_from_the_ISP1761;
  output           CS_N_from_the_ISP1761;
  output           DC_DACK_from_the_ISP1761;
  inout   [ 31: 0] D_to_and_from_the_ISP1761;
  output           HC_DACK_from_the_ISP1761;
  output           RD_N_from_the_ISP1761;
  output           RESET_N_from_the_ISP1761;
  output           WR_N_from_the_ISP1761;
  output  [  3: 0] s_address_to_the_ports;
  output           s_re_to_the_ports;
  output           s_reset_n_to_the_ports;
  output           s_we_to_the_ports;
  output  [ 31: 0] s_writedata_to_the_ports;
  input            DC_DREQ_to_the_ISP1761;
  input            DC_IRQ_to_the_ISP1761;
  input            HC_DREQ_to_the_ISP1761;
  input            HC_IRQ_to_the_ISP1761;
  input            clk;
  input            reset_n;
  input   [ 31: 0] s_readdata_from_the_ports;

  wire    [ 16: 0] A_from_the_ISP1761;
  wire             CS_N_from_the_ISP1761;
  wire             DC_DACK_from_the_ISP1761;
  wire    [ 31: 0] D_to_and_from_the_ISP1761;
  wire             HC_DACK_from_the_ISP1761;
  wire    [ 17: 0] ISP1761_slave_address;
  wire             ISP1761_slave_chipselect_n;
  wire             ISP1761_slave_irq;
  wire             ISP1761_slave_read_n;
  wire    [ 31: 0] ISP1761_slave_readdata;
  wire    [ 31: 0] ISP1761_slave_readdata_from_sa;
  wire             ISP1761_slave_reset_n;
  wire             ISP1761_slave_wait_counter_eq_0;
  wire             ISP1761_slave_write_n;
  wire    [ 31: 0] ISP1761_slave_writedata;
  wire             RD_N_from_the_ISP1761;
  wire             RESET_N_from_the_ISP1761;
  wire             WR_N_from_the_ISP1761;
  wire             clk_reset_n;
  wire    [ 20: 0] cpu_data_master_address;
  wire    [ 20: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_granted_ISP1761_slave;
  wire             cpu_data_master_granted_ports_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_ISP1761_slave;
  wire             cpu_data_master_qualified_request_ports_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_ISP1761_slave;
  wire             cpu_data_master_read_data_valid_ports_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_ISP1761_slave;
  wire             cpu_data_master_requests_ports_slave;
  wire             cpu_data_master_reset_n;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 22: 0] cpu_tightly_coupled_data_master_0_address;
  wire    [ 22: 0] cpu_tightly_coupled_data_master_0_address_to_slave;
  wire    [  3: 0] cpu_tightly_coupled_data_master_0_byteenable;
  wire             cpu_tightly_coupled_data_master_0_clken;
  wire             cpu_tightly_coupled_data_master_0_granted_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_latency_counter;
  wire             cpu_tightly_coupled_data_master_0_qualified_request_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_read;
  wire             cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2;
  wire    [ 31: 0] cpu_tightly_coupled_data_master_0_readdata;
  wire             cpu_tightly_coupled_data_master_0_readdatavalid;
  wire             cpu_tightly_coupled_data_master_0_requests_mem_s2;
  wire             cpu_tightly_coupled_data_master_0_waitrequest;
  wire             cpu_tightly_coupled_data_master_0_write;
  wire    [ 31: 0] cpu_tightly_coupled_data_master_0_writedata;
  wire    [ 22: 0] cpu_tightly_coupled_instruction_master_0_address;
  wire    [ 22: 0] cpu_tightly_coupled_instruction_master_0_address_to_slave;
  wire             cpu_tightly_coupled_instruction_master_0_clken;
  wire             cpu_tightly_coupled_instruction_master_0_granted_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_latency_counter;
  wire             cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_read;
  wire             cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1;
  wire    [ 31: 0] cpu_tightly_coupled_instruction_master_0_readdata;
  wire             cpu_tightly_coupled_instruction_master_0_readdatavalid;
  wire             cpu_tightly_coupled_instruction_master_0_requests_mem_s1;
  wire             cpu_tightly_coupled_instruction_master_0_waitrequest;
  wire             d1_ISP1761_slave_end_xfer;
  wire             d1_mem_s1_end_xfer;
  wire             d1_mem_s2_end_xfer;
  wire             d1_ports_slave_end_xfer;
  wire    [ 10: 0] mem_s1_address;
  wire    [  3: 0] mem_s1_byteenable;
  wire             mem_s1_chipselect;
  wire             mem_s1_clken;
  wire    [ 31: 0] mem_s1_readdata;
  wire    [ 31: 0] mem_s1_readdata_from_sa;
  wire             mem_s1_write;
  wire    [ 31: 0] mem_s1_writedata;
  wire    [ 10: 0] mem_s2_address;
  wire    [  3: 0] mem_s2_byteenable;
  wire             mem_s2_chipselect;
  wire             mem_s2_clken;
  wire    [ 31: 0] mem_s2_readdata;
  wire    [ 31: 0] mem_s2_readdata_from_sa;
  wire             mem_s2_write;
  wire    [ 31: 0] mem_s2_writedata;
  wire             reset_n_sources;
  wire    [  3: 0] s_address_to_the_ports;
  wire             s_re_to_the_ports;
  wire    [ 31: 0] s_readdata_from_the_ports_from_sa;
  wire             s_reset_n_to_the_ports;
  wire             s_we_to_the_ports;
  wire    [ 31: 0] s_writedata_to_the_ports;
  ISP1761_slave_arbitrator the_ISP1761_slave
    (
      .ISP1761_slave_address                           (ISP1761_slave_address),
      .ISP1761_slave_chipselect_n                      (ISP1761_slave_chipselect_n),
      .ISP1761_slave_read_n                            (ISP1761_slave_read_n),
      .ISP1761_slave_readdata                          (ISP1761_slave_readdata),
      .ISP1761_slave_readdata_from_sa                  (ISP1761_slave_readdata_from_sa),
      .ISP1761_slave_reset_n                           (ISP1761_slave_reset_n),
      .ISP1761_slave_wait_counter_eq_0                 (ISP1761_slave_wait_counter_eq_0),
      .ISP1761_slave_write_n                           (ISP1761_slave_write_n),
      .ISP1761_slave_writedata                         (ISP1761_slave_writedata),
      .clk                                             (clk),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_ISP1761_slave           (cpu_data_master_granted_ISP1761_slave),
      .cpu_data_master_qualified_request_ISP1761_slave (cpu_data_master_qualified_request_ISP1761_slave),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ISP1761_slave   (cpu_data_master_read_data_valid_ISP1761_slave),
      .cpu_data_master_requests_ISP1761_slave          (cpu_data_master_requests_ISP1761_slave),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_ISP1761_slave_end_xfer                       (d1_ISP1761_slave_end_xfer),
      .reset_n                                         (clk_reset_n)
    );

  ISP1761 the_ISP1761
    (
      .A           (A_from_the_ISP1761),
      .CS_N        (CS_N_from_the_ISP1761),
      .D           (D_to_and_from_the_ISP1761),
      .DC_DACK     (DC_DACK_from_the_ISP1761),
      .DC_DREQ     (DC_DREQ_to_the_ISP1761),
      .DC_IRQ      (DC_IRQ_to_the_ISP1761),
      .HC_DACK     (HC_DACK_from_the_ISP1761),
      .HC_DREQ     (HC_DREQ_to_the_ISP1761),
      .HC_IRQ      (HC_IRQ_to_the_ISP1761),
      .RD_N        (RD_N_from_the_ISP1761),
      .RESET_N     (RESET_N_from_the_ISP1761),
      .WR_N        (WR_N_from_the_ISP1761),
      .s_address   (ISP1761_slave_address),
      .s_cs_n      (ISP1761_slave_chipselect_n),
      .s_irq       (ISP1761_slave_irq),
      .s_read_n    (ISP1761_slave_read_n),
      .s_readdata  (ISP1761_slave_readdata),
      .s_reset_n   (ISP1761_slave_reset_n),
      .s_write_n   (ISP1761_slave_write_n),
      .s_writedata (ISP1761_slave_writedata)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .ISP1761_slave_readdata_from_sa                  (ISP1761_slave_readdata_from_sa),
      .ISP1761_slave_wait_counter_eq_0                 (ISP1761_slave_wait_counter_eq_0),
      .clk                                             (clk),
      .cpu_data_master_address                         (cpu_data_master_address),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_ISP1761_slave           (cpu_data_master_granted_ISP1761_slave),
      .cpu_data_master_granted_ports_slave             (cpu_data_master_granted_ports_slave),
      .cpu_data_master_qualified_request_ISP1761_slave (cpu_data_master_qualified_request_ISP1761_slave),
      .cpu_data_master_qualified_request_ports_slave   (cpu_data_master_qualified_request_ports_slave),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ISP1761_slave   (cpu_data_master_read_data_valid_ISP1761_slave),
      .cpu_data_master_read_data_valid_ports_slave     (cpu_data_master_read_data_valid_ports_slave),
      .cpu_data_master_readdata                        (cpu_data_master_readdata),
      .cpu_data_master_requests_ISP1761_slave          (cpu_data_master_requests_ISP1761_slave),
      .cpu_data_master_requests_ports_slave            (cpu_data_master_requests_ports_slave),
      .cpu_data_master_reset_n                         (cpu_data_master_reset_n),
      .cpu_data_master_waitrequest                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                           (cpu_data_master_write),
      .d1_ISP1761_slave_end_xfer                       (d1_ISP1761_slave_end_xfer),
      .d1_ports_slave_end_xfer                         (d1_ports_slave_end_xfer),
      .reset_n                                         (clk_reset_n),
      .s_readdata_from_the_ports_from_sa               (s_readdata_from_the_ports_from_sa)
    );

  cpu_tightly_coupled_data_master_0_arbitrator the_cpu_tightly_coupled_data_master_0
    (
      .clk                                                        (clk),
      .cpu_tightly_coupled_data_master_0_address                  (cpu_tightly_coupled_data_master_0_address),
      .cpu_tightly_coupled_data_master_0_address_to_slave         (cpu_tightly_coupled_data_master_0_address_to_slave),
      .cpu_tightly_coupled_data_master_0_byteenable               (cpu_tightly_coupled_data_master_0_byteenable),
      .cpu_tightly_coupled_data_master_0_clken                    (cpu_tightly_coupled_data_master_0_clken),
      .cpu_tightly_coupled_data_master_0_granted_mem_s2           (cpu_tightly_coupled_data_master_0_granted_mem_s2),
      .cpu_tightly_coupled_data_master_0_latency_counter          (cpu_tightly_coupled_data_master_0_latency_counter),
      .cpu_tightly_coupled_data_master_0_qualified_request_mem_s2 (cpu_tightly_coupled_data_master_0_qualified_request_mem_s2),
      .cpu_tightly_coupled_data_master_0_read                     (cpu_tightly_coupled_data_master_0_read),
      .cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2   (cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2),
      .cpu_tightly_coupled_data_master_0_readdata                 (cpu_tightly_coupled_data_master_0_readdata),
      .cpu_tightly_coupled_data_master_0_readdatavalid            (cpu_tightly_coupled_data_master_0_readdatavalid),
      .cpu_tightly_coupled_data_master_0_requests_mem_s2          (cpu_tightly_coupled_data_master_0_requests_mem_s2),
      .cpu_tightly_coupled_data_master_0_waitrequest              (cpu_tightly_coupled_data_master_0_waitrequest),
      .cpu_tightly_coupled_data_master_0_write                    (cpu_tightly_coupled_data_master_0_write),
      .cpu_tightly_coupled_data_master_0_writedata                (cpu_tightly_coupled_data_master_0_writedata),
      .d1_mem_s2_end_xfer                                         (d1_mem_s2_end_xfer),
      .mem_s2_readdata_from_sa                                    (mem_s2_readdata_from_sa),
      .reset_n                                                    (clk_reset_n)
    );

  cpu_tightly_coupled_instruction_master_0_arbitrator the_cpu_tightly_coupled_instruction_master_0
    (
      .clk                                                               (clk),
      .cpu_tightly_coupled_instruction_master_0_address                  (cpu_tightly_coupled_instruction_master_0_address),
      .cpu_tightly_coupled_instruction_master_0_address_to_slave         (cpu_tightly_coupled_instruction_master_0_address_to_slave),
      .cpu_tightly_coupled_instruction_master_0_clken                    (cpu_tightly_coupled_instruction_master_0_clken),
      .cpu_tightly_coupled_instruction_master_0_granted_mem_s1           (cpu_tightly_coupled_instruction_master_0_granted_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_latency_counter          (cpu_tightly_coupled_instruction_master_0_latency_counter),
      .cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1 (cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_read                     (cpu_tightly_coupled_instruction_master_0_read),
      .cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1   (cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_readdata                 (cpu_tightly_coupled_instruction_master_0_readdata),
      .cpu_tightly_coupled_instruction_master_0_readdatavalid            (cpu_tightly_coupled_instruction_master_0_readdatavalid),
      .cpu_tightly_coupled_instruction_master_0_requests_mem_s1          (cpu_tightly_coupled_instruction_master_0_requests_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_waitrequest              (cpu_tightly_coupled_instruction_master_0_waitrequest),
      .d1_mem_s1_end_xfer                                                (d1_mem_s1_end_xfer),
      .mem_s1_readdata_from_sa                                           (mem_s1_readdata_from_sa),
      .reset_n                                                           (clk_reset_n)
    );

  cpu the_cpu
    (
      .clk                (clk),
      .d_address          (cpu_data_master_address),
      .d_byteenable       (cpu_data_master_byteenable),
      .d_irq              (cpu_data_master_irq),
      .d_read             (cpu_data_master_read),
      .d_readdata         (cpu_data_master_readdata),
      .d_waitrequest      (cpu_data_master_waitrequest),
      .d_write            (cpu_data_master_write),
      .d_writedata        (cpu_data_master_writedata),
      .dcm0_address       (cpu_tightly_coupled_data_master_0_address),
      .dcm0_byteenable    (cpu_tightly_coupled_data_master_0_byteenable),
      .dcm0_clken         (cpu_tightly_coupled_data_master_0_clken),
      .dcm0_read          (cpu_tightly_coupled_data_master_0_read),
      .dcm0_readdata      (cpu_tightly_coupled_data_master_0_readdata),
      .dcm0_readdatavalid (cpu_tightly_coupled_data_master_0_readdatavalid),
      .dcm0_waitrequest   (cpu_tightly_coupled_data_master_0_waitrequest),
      .dcm0_write         (cpu_tightly_coupled_data_master_0_write),
      .dcm0_writedata     (cpu_tightly_coupled_data_master_0_writedata),
      .icm0_address       (cpu_tightly_coupled_instruction_master_0_address),
      .icm0_clken         (cpu_tightly_coupled_instruction_master_0_clken),
      .icm0_read          (cpu_tightly_coupled_instruction_master_0_read),
      .icm0_readdata      (cpu_tightly_coupled_instruction_master_0_readdata),
      .icm0_readdatavalid (cpu_tightly_coupled_instruction_master_0_readdatavalid),
      .icm0_waitrequest   (cpu_tightly_coupled_instruction_master_0_waitrequest),
      .reset_n            (cpu_data_master_reset_n)
    );

  mem_s1_arbitrator the_mem_s1
    (
      .clk                                                               (clk),
      .cpu_tightly_coupled_instruction_master_0_address_to_slave         (cpu_tightly_coupled_instruction_master_0_address_to_slave),
      .cpu_tightly_coupled_instruction_master_0_clken                    (cpu_tightly_coupled_instruction_master_0_clken),
      .cpu_tightly_coupled_instruction_master_0_granted_mem_s1           (cpu_tightly_coupled_instruction_master_0_granted_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_latency_counter          (cpu_tightly_coupled_instruction_master_0_latency_counter),
      .cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1 (cpu_tightly_coupled_instruction_master_0_qualified_request_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_read                     (cpu_tightly_coupled_instruction_master_0_read),
      .cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1   (cpu_tightly_coupled_instruction_master_0_read_data_valid_mem_s1),
      .cpu_tightly_coupled_instruction_master_0_requests_mem_s1          (cpu_tightly_coupled_instruction_master_0_requests_mem_s1),
      .d1_mem_s1_end_xfer                                                (d1_mem_s1_end_xfer),
      .mem_s1_address                                                    (mem_s1_address),
      .mem_s1_byteenable                                                 (mem_s1_byteenable),
      .mem_s1_chipselect                                                 (mem_s1_chipselect),
      .mem_s1_clken                                                      (mem_s1_clken),
      .mem_s1_readdata                                                   (mem_s1_readdata),
      .mem_s1_readdata_from_sa                                           (mem_s1_readdata_from_sa),
      .mem_s1_write                                                      (mem_s1_write),
      .mem_s1_writedata                                                  (mem_s1_writedata),
      .reset_n                                                           (clk_reset_n)
    );

  mem_s2_arbitrator the_mem_s2
    (
      .clk                                                        (clk),
      .cpu_tightly_coupled_data_master_0_address_to_slave         (cpu_tightly_coupled_data_master_0_address_to_slave),
      .cpu_tightly_coupled_data_master_0_byteenable               (cpu_tightly_coupled_data_master_0_byteenable),
      .cpu_tightly_coupled_data_master_0_clken                    (cpu_tightly_coupled_data_master_0_clken),
      .cpu_tightly_coupled_data_master_0_granted_mem_s2           (cpu_tightly_coupled_data_master_0_granted_mem_s2),
      .cpu_tightly_coupled_data_master_0_latency_counter          (cpu_tightly_coupled_data_master_0_latency_counter),
      .cpu_tightly_coupled_data_master_0_qualified_request_mem_s2 (cpu_tightly_coupled_data_master_0_qualified_request_mem_s2),
      .cpu_tightly_coupled_data_master_0_read                     (cpu_tightly_coupled_data_master_0_read),
      .cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2   (cpu_tightly_coupled_data_master_0_read_data_valid_mem_s2),
      .cpu_tightly_coupled_data_master_0_requests_mem_s2          (cpu_tightly_coupled_data_master_0_requests_mem_s2),
      .cpu_tightly_coupled_data_master_0_write                    (cpu_tightly_coupled_data_master_0_write),
      .cpu_tightly_coupled_data_master_0_writedata                (cpu_tightly_coupled_data_master_0_writedata),
      .d1_mem_s2_end_xfer                                         (d1_mem_s2_end_xfer),
      .mem_s2_address                                             (mem_s2_address),
      .mem_s2_byteenable                                          (mem_s2_byteenable),
      .mem_s2_chipselect                                          (mem_s2_chipselect),
      .mem_s2_clken                                               (mem_s2_clken),
      .mem_s2_readdata                                            (mem_s2_readdata),
      .mem_s2_readdata_from_sa                                    (mem_s2_readdata_from_sa),
      .mem_s2_write                                               (mem_s2_write),
      .mem_s2_writedata                                           (mem_s2_writedata),
      .reset_n                                                    (clk_reset_n)
    );

  mem the_mem
    (
      .address     (mem_s1_address),
      .address2    (mem_s2_address),
      .byteenable  (mem_s1_byteenable),
      .byteenable2 (mem_s2_byteenable),
      .chipselect  (mem_s1_chipselect),
      .chipselect2 (mem_s2_chipselect),
      .clk         (clk),
      .clk2        (clk),
      .clken       (mem_s1_clken),
      .clken2      (mem_s2_clken),
      .readdata    (mem_s1_readdata),
      .readdata2   (mem_s2_readdata),
      .write       (mem_s1_write),
      .write2      (mem_s2_write),
      .writedata   (mem_s1_writedata),
      .writedata2  (mem_s2_writedata)
    );

  ports_slave_arbitrator the_ports_slave
    (
      .clk                                           (clk),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_ports_slave           (cpu_data_master_granted_ports_slave),
      .cpu_data_master_qualified_request_ports_slave (cpu_data_master_qualified_request_ports_slave),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ports_slave   (cpu_data_master_read_data_valid_ports_slave),
      .cpu_data_master_requests_ports_slave          (cpu_data_master_requests_ports_slave),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_ports_slave_end_xfer                       (d1_ports_slave_end_xfer),
      .reset_n                                       (clk_reset_n),
      .s_address_to_the_ports                        (s_address_to_the_ports),
      .s_re_to_the_ports                             (s_re_to_the_ports),
      .s_readdata_from_the_ports                     (s_readdata_from_the_ports),
      .s_readdata_from_the_ports_from_sa             (s_readdata_from_the_ports_from_sa),
      .s_reset_n_to_the_ports                        (s_reset_n_to_the_ports),
      .s_we_to_the_ports                             (s_we_to_the_ports),
      .s_writedata_to_the_ports                      (s_writedata_to_the_ports)
    );

  //reset is asserted asynchronously and deasserted synchronously
  sopc_sys_reset_clk_domain_synch_module sopc_sys_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0);

  //cpu_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "/pkgs/altera/quartus/quartus10.0/linux/quartus/eda/sim_lib/altera_mf.v"
`include "/pkgs/altera/quartus/quartus10.0/linux/quartus/eda/sim_lib/220model.v"
`include "/pkgs/altera/quartus/quartus10.0/linux/quartus/eda/sim_lib/sgate.v"
`include "ISP1761.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu.v"
`include "mem.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 16: 0] A_from_the_ISP1761;
  wire             CS_N_from_the_ISP1761;
  wire             DC_DACK_from_the_ISP1761;
  wire             DC_DREQ_to_the_ISP1761;
  wire             DC_IRQ_to_the_ISP1761;
  wire    [ 31: 0] D_to_and_from_the_ISP1761;
  wire             HC_DACK_from_the_ISP1761;
  wire             HC_DREQ_to_the_ISP1761;
  wire             HC_IRQ_to_the_ISP1761;
  wire             ISP1761_slave_irq;
  wire             RD_N_from_the_ISP1761;
  wire             RESET_N_from_the_ISP1761;
  wire             WR_N_from_the_ISP1761;
  reg              clk;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              reset_n;
  wire    [  3: 0] s_address_to_the_ports;
  wire             s_re_to_the_ports;
  wire    [ 31: 0] s_readdata_from_the_ports;
  wire             s_reset_n_to_the_ports;
  wire             s_we_to_the_ports;
  wire    [ 31: 0] s_writedata_to_the_ports;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  sopc_sys DUT
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

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on