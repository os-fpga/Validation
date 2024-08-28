//Legal Notice: (C)2008 Altera Corporation. All rights reserved.  Your
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

module ddr2_24x64_8_example_driver (
                                     // inputs:
                                      clk,
                                      local_rdata,
                                      local_rdata_valid,
                                      local_ready,
                                      local_wdata_req,
                                      reset_n,

                                     // outputs:
                                      local_bank_addr,
                                      local_be,
                                      local_col_addr,
                                      local_cs_addr,
                                      local_read_req,
                                      local_row_addr,
                                      local_size,
                                      local_wdata,
                                      local_write_req,
                                      pnf_per_byte,
                                      pnf_persist,
                                      test_complete
                                   )
  /* synthesis ALTERA_ATTRIBUTE = "MESSAGE_DISABLE=14130;MESSAGE_DISABLE=14110" */ ;

  output  [  1: 0] local_bank_addr;
  output  [ 15: 0] local_be;
  output  [  9: 0] local_col_addr;
  output           local_cs_addr;
  output           local_read_req;
  output  [ 12: 0] local_row_addr;
  output  [  1: 0] local_size;
  output  [127: 0] local_wdata;
  output           local_write_req;
  output  [ 15: 0] pnf_per_byte;
  output           pnf_persist;
  output           test_complete;
  input            clk;
  input   [127: 0] local_rdata;
  input            local_rdata_valid;
  input            local_ready;
  input            local_wdata_req;
  input            reset_n;

  wire    [  1: 0] LOCAL_BURST_LEN_s;
  wire    [  1: 0] MAX_BANK;
  wire             MAX_CHIPSEL;
  wire    [  9: 0] MAX_COL;
  wire    [ 12: 0] MAX_ROW;
  wire             MIN_CHIPSEL;
  wire             avalon_burst_mode;
  wire             avalon_read_burst_max_address;
  reg     [  1: 0] bank_addr;
  wire    [ 15: 0] be;
  reg     [  2: 0] burst_beat_count;
  reg              burst_begin;
  reg     [  9: 0] col_addr;
  wire    [ 15: 0] compare;
  reg     [ 15: 0] compare_reg;
  reg     [ 15: 0] compare_valid;
  reg     [ 15: 0] compare_valid_reg;
  reg              cs_addr;
  wire    [127: 0] dgen_data;
  reg              dgen_enable;
  reg     [127: 0] dgen_ldata;
  reg              dgen_load;
  wire             dgen_pause;
  reg              last_rdata_valid;
  reg              last_wdata_req;
  wire    [  1: 0] local_bank_addr;
  wire    [ 15: 0] local_be;
  wire    [  9: 0] local_col_addr;
  wire             local_cs_addr;
  wire             local_read_req;
  wire    [ 12: 0] local_row_addr;
  wire    [  1: 0] local_size;
  wire    [127: 0] local_wdata;
  wire             local_write_req;
  wire    [ 15: 0] pnf_per_byte;
  reg              pnf_persist;
  reg              pnf_persist1;
  wire             reached_max_address;
  reg              reached_max_count;
  reg              read_req;
  reg     [  7: 0] reads_remaining;
  reg              reset_address;
  reg     [ 12: 0] row_addr;
  wire    [  1: 0] size;
  reg     [  3: 0] state;
  reg              test_complete;
  reg              wait_first_write_data;
  wire    [127: 0] wdata;
  wire             wdata_req;
  reg              write_req;
  reg     [  7: 0] writes_remaining;
  assign avalon_burst_mode = 0;
  assign MIN_CHIPSEL = 0;
  assign MAX_CHIPSEL = 0;
  assign MAX_ROW = 3;
  assign MAX_BANK = 3;
  assign MAX_COL = 16;
  //


  assign local_cs_addr = cs_addr;

  assign local_row_addr = row_addr;
  assign local_bank_addr = bank_addr;
  assign local_col_addr = col_addr;
  assign local_write_req = write_req;
  assign local_read_req = read_req;
  assign local_wdata = wdata;
  assign wdata = dgen_data;
  //The LOCAL_BURST_LEN_s is a signal used insted of the parameter LOCAL_BURST_LEN
  assign LOCAL_BURST_LEN_s = 2;
  //LOCAL INTERFACE (NON-AVALON)
  assign wdata_req = local_wdata_req;

  //// Generate new data (enable lfsr) when writing or reading valid data
  assign dgen_pause = ~ (last_wdata_req | local_rdata_valid);

  //


  assign local_be = be;

  assign be = {16 {1'b1}};
  assign pnf_per_byte = compare_valid_reg;
  assign local_size = size;
  //FIX
  assign size = LOCAL_BURST_LEN_s[1 : 0];

  assign reached_max_address = (col_addr >= (MAX_COL - (2 * 2))) && (row_addr == MAX_ROW) && (bank_addr == MAX_BANK) && (cs_addr == MAX_CHIPSEL);
  assign avalon_read_burst_max_address = (col_addr >= (MAX_COL - (2 * 2))) && (row_addr == MAX_ROW) && (bank_addr == MAX_BANK) && (cs_addr == MAX_CHIPSEL);
  ddr2_24x64_8_ex_lfsr8 LFSRGEN_0_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[7 : 0]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[7 : 0]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_0_lfsr_inst.seed = 1;

  // 8 bit comparator per local byte lane
  assign compare[0] = dgen_data[7 : 0] == local_rdata[7 : 0];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_1_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[15 : 8]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[15 : 8]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_1_lfsr_inst.seed = 11;

  // 8 bit comparator per local byte lane
  assign compare[1] = dgen_data[15 : 8] == local_rdata[15 : 8];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_2_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[23 : 16]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[23 : 16]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_2_lfsr_inst.seed = 21;

  // 8 bit comparator per local byte lane
  assign compare[2] = dgen_data[23 : 16] == local_rdata[23 : 16];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_3_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[31 : 24]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[31 : 24]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_3_lfsr_inst.seed = 31;

  // 8 bit comparator per local byte lane
  assign compare[3] = dgen_data[31 : 24] == local_rdata[31 : 24];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_4_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[39 : 32]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[39 : 32]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_4_lfsr_inst.seed = 41;

  // 8 bit comparator per local byte lane
  assign compare[4] = dgen_data[39 : 32] == local_rdata[39 : 32];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_5_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[47 : 40]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[47 : 40]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_5_lfsr_inst.seed = 51;

  // 8 bit comparator per local byte lane
  assign compare[5] = dgen_data[47 : 40] == local_rdata[47 : 40];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_6_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[55 : 48]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[55 : 48]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_6_lfsr_inst.seed = 61;

  // 8 bit comparator per local byte lane
  assign compare[6] = dgen_data[55 : 48] == local_rdata[55 : 48];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_7_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[63 : 56]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[63 : 56]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_7_lfsr_inst.seed = 71;

  // 8 bit comparator per local byte lane
  assign compare[7] = dgen_data[63 : 56] == local_rdata[63 : 56];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_8_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[71 : 64]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[71 : 64]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_8_lfsr_inst.seed = 81;

  // 8 bit comparator per local byte lane
  assign compare[8] = dgen_data[71 : 64] == local_rdata[71 : 64];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_9_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[79 : 72]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[79 : 72]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_9_lfsr_inst.seed = 91;

  // 8 bit comparator per local byte lane
  assign compare[9] = dgen_data[79 : 72] == local_rdata[79 : 72];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_10_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[87 : 80]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[87 : 80]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_10_lfsr_inst.seed = 101;

  // 8 bit comparator per local byte lane
  assign compare[10] = dgen_data[87 : 80] == local_rdata[87 : 80];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_11_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[95 : 88]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[95 : 88]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_11_lfsr_inst.seed = 111;

  // 8 bit comparator per local byte lane
  assign compare[11] = dgen_data[95 : 88] == local_rdata[95 : 88];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_12_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[103 : 96]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[103 : 96]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_12_lfsr_inst.seed = 121;

  // 8 bit comparator per local byte lane
  assign compare[12] = dgen_data[103 : 96] == local_rdata[103 : 96];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_13_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[111 : 104]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[111 : 104]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_13_lfsr_inst.seed = 131;

  // 8 bit comparator per local byte lane
  assign compare[13] = dgen_data[111 : 104] == local_rdata[111 : 104];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_14_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[119 : 112]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[119 : 112]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_14_lfsr_inst.seed = 141;

  // 8 bit comparator per local byte lane
  assign compare[14] = dgen_data[119 : 112] == local_rdata[119 : 112];

  ddr2_24x64_8_ex_lfsr8 LFSRGEN_15_lfsr_inst
    (
      .clk (clk),
      .data (dgen_data[127 : 120]),
      .enable (dgen_enable),
      .ldata (dgen_ldata[127 : 120]),
      .load (dgen_load),
      .pause (dgen_pause),
      .reset_n (reset_n)
    );

  defparam LFSRGEN_15_lfsr_inst.seed = 151;

  // 8 bit comparator per local byte lane
  assign compare[15] = dgen_data[127 : 120] == local_rdata[127 : 120];

  //
  //-----------------------------------------------------------------
  //Main clocked process
  //-----------------------------------------------------------------
  //Read / Write control state machine & address counter
  //-----------------------------------------------------------------
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          //Reset - asynchronously force all register outputs LOW
          state <= 1'b0;

          write_req <= 1'b0;
          read_req <= 1'b0;
          burst_begin <= 0;
          burst_beat_count <= 0;
          cs_addr <= 0;
          row_addr <= 0;
          bank_addr <= 0;
          col_addr <= 0;
          dgen_enable <= 1'b0;
          dgen_load <= 1'b0;
          wait_first_write_data <= 1'b0;
          reached_max_count <= 1'b0;
          test_complete <= 1'b0;
          writes_remaining <= 0;
          reads_remaining <= 0;
          reset_address <= 1'b0;
        end
      else 
        begin
          reset_address <= 1'b0;
          reached_max_count <= reached_max_address;
          read_req <= 1'b0;
          write_req <= 1'b0;
          dgen_load <= 1'b0;
          test_complete <= 1'b0;
          if (last_wdata_req)
              wait_first_write_data <= 0;
          if (write_req && local_ready)
            begin
              if (wdata_req)
                  writes_remaining <= writes_remaining + (size - 1);
              else 
                writes_remaining <= writes_remaining + size;
            end
          else if ((wdata_req) && (writes_remaining > 0))
              //size
              writes_remaining <= writes_remaining - 1'b1;

          else 
            writes_remaining <= writes_remaining;
          if (read_req && local_ready)
            begin
              if (local_rdata_valid)
                  reads_remaining <= reads_remaining + (size - 1);
              else 
                reads_remaining <= reads_remaining + size;
            end
          else if ((local_rdata_valid) && (reads_remaining > 0))
              reads_remaining <= reads_remaining - 1'b1;
          else 
            reads_remaining <= reads_remaining;
          case (state)
          
              4'd0: begin
                  reached_max_count <= 0;
                  if (avalon_burst_mode == 0)
                      state <= 1;
                  else 
                    begin
                      burst_begin <= 1;
                      write_req <= 1'b1;
                      state <= 10;
                    end
                  dgen_enable <= 1'b1;
                  //Reset just in case!
                  writes_remaining <= 0;
          
                  reads_remaining <= 0;
              end // 4'd0 
          
              4'd1: begin
                  write_req <= 1'b1;
                  dgen_enable <= 1'b1;
                  if (local_ready && write_req)
                      if (reached_max_count)
                        begin
                          state <= 2;
                          write_req <= 1'b0;
                          reset_address <= 1'b1;
                        end
              end // 4'd1 
          
              4'd10: begin
                  reset_address <= 1'b0;
                  write_req <= 1'b1;
                  burst_begin <= 0;
                  if (local_ready)
                    begin
                      burst_beat_count <= burst_beat_count + 1;
                      state <= 12;
                    end
              end // 4'd10 
          
              4'd11: begin
                  reset_address <= 1'b0;
                  read_req <= 1'b1;
                  if (! local_ready)
                    begin
                      burst_begin <= 0;
                      state <= 13;
                    end
                  if (avalon_read_burst_max_address)
                    begin
                      read_req <= 1'b0;
                      reset_address <= 1'b1;
                      test_complete <= 1'b1;
                      burst_beat_count <= 0;
                      state <= 4;
                    end
              end // 4'd11 
          
              4'd12: begin
                  write_req <= 1'b1;
                  if (local_ready)
                      if (burst_beat_count == size - 1)
                        begin
                          if (reached_max_count)
                            begin
                              write_req <= 1'b0;
                              burst_beat_count <= 0;
                              reset_address <= 1'b1;
                              dgen_enable <= 1'b0;
                              state <= 2;
                            end
                          else 
                            begin
                              burst_begin <= 1;
                              write_req <= 1'b1;
                              burst_beat_count <= 0;
                              state <= 10;
                            end
                        end
                      else 
                        burst_beat_count <= burst_beat_count + 1;
              end // 4'd12 
          
              4'd13: begin
                  read_req <= 1'b1;
                  if (local_ready)
                    begin
                      burst_begin <= 1;
                      read_req <= 1'b1;
                      state <= 11;
                    end
                  else if (avalon_read_burst_max_address)
                    begin
                      read_req <= 1'b0;
                      reset_address <= 1'b1;
                      test_complete <= 1'b1;
                      dgen_enable <= 1'b0;
                      state <= 4;
                    end
              end // 4'd13 
          
              4'd2: begin
                  if (avalon_burst_mode == 0)
                    begin
                      if (writes_remaining == 0)
                        begin
                          state <= 3;
                          dgen_enable <= 1'b0;
                        end
                    end
                  else 
                    begin
                      dgen_enable <= 1'b1;
                      burst_begin <= 1;
                      read_req <= 1'b1;
                      reset_address <= 1'b0;
                      state <= 11;
                    end
              end // 4'd2 
          
              4'd3: begin
                  read_req <= 1'b1;
                  dgen_enable <= 1'b1;
                  if (local_ready && read_req)
                      if (reached_max_count)
                        begin
                          state <= 4;
                          read_req <= 1'b0;
                          reset_address <= 1'b1;
                        end
              end // 4'd3 
          
              4'd4: begin
                  if (avalon_burst_mode == 0)
                    begin
                      if (reads_remaining == 0)
                        begin
                          state <= 0;
                          dgen_enable <= 1'b0;
                          test_complete <= 1'b1;
                        end
                    end
                  else 
                    begin
                      if (reads_remaining == 1)
                          dgen_enable <= 1'b0;
                      if (reads_remaining == 0)
                        begin
                          dgen_enable <= 1'b1;
                          burst_begin <= 1;
                          write_req <= 1'b1;
                          read_req <= 1'b0;
                          reset_address <= 1'b0;
                          burst_beat_count <= 0;
                          state <= 10;
                        end
                    end
              end // 4'd4 
          
          endcase // state
          if (reset_address)
            begin
              //(others => '0')
              cs_addr <= MIN_CHIPSEL;

              row_addr <= 0;
              bank_addr <= 0;
              col_addr <= 0;
            end
          else if ((((local_ready && write_req) && (state == 1))) || ((local_ready && read_req) && (state == 3)) || ((local_ready) && ((state == 7) || (state == 10) || (state == 11) || (state == 13))))
              if (col_addr >= MAX_COL)
                begin
                  col_addr <= 0;
                  if (row_addr == MAX_ROW)
                    begin
                      row_addr <= 0;
                      if (bank_addr == MAX_BANK)
                        begin
                          bank_addr <= 0;
                          if (cs_addr == MAX_CHIPSEL)
                              //reached_max_count <= TRUE
                              //(others => '0')
                              cs_addr <= MIN_CHIPSEL;

                          else 
                            cs_addr <= cs_addr + 1'b1;
                        end
                      else 
                        bank_addr <= bank_addr + 1'b1;
                    end
                  else 
                    row_addr <= row_addr + 1'b1;
                end
              else 
                col_addr <= col_addr + (2 * 2);
        end
    end


  //------------------------------------------------------------
  //LFSR re-load data storage
  //Comparator masking and test pass signal generation
  //------------------------------------------------------------
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          dgen_ldata <= 0;
          last_wdata_req <= 1'b0;
          //all ones
          compare_valid <= {16 {1'b1}};

          //all ones
          compare_valid_reg <= {16 {1'b1}};

          pnf_persist <= 1'b1;
          pnf_persist1 <= 1'b1;
          //all ones
          compare_reg <= {16 {1'b1}};

          last_rdata_valid <= 1'b0;
        end
      else 
        begin
          last_wdata_req <= wdata_req;
          last_rdata_valid <= local_rdata_valid;
          compare_reg <= compare;
          if (wdata_req)
              //Store the data from the first write in a burst 
              //Used to reload the lfsr for the first read in a burst in WRITE 1, READ 1 mode

              if (wait_first_write_data)
                  dgen_ldata <= dgen_data;
          //Enable the comparator result when read data is valid
          if (last_rdata_valid)
              compare_valid <= compare_reg;
          //Create the overall persistent passnotfail output
          if (~&compare_valid)
              pnf_persist1 <= 1'b0;
          //Extra register stage to help Tco / Fmax on comparator output pins
          compare_valid_reg <= compare_valid;

          pnf_persist <= pnf_persist1;
        end
    end



endmodule

