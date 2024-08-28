-- Copyright (c) 2009 by Tampere University of Technology

-- This file is part of Traffic generator.

-- Traffic generator is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- Traffic generator is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with Traffic generator.
-- If not, see <http://www.gnu.org/licenses/>.


package mon_pkg is

  -- OBS!! Set this to the clock rate of NoC! Otherwise UART won't work
  -- with correct baud rate.
  constant mon_clk_rate_c : integer := 25000000;


  -- 0: MESH or RING
  --    or any type of network that has links with FIFOs accessed with empty
  --    and read_enable signals.
  -- 1: HIBI
  -- 2: CROSSBAR
  constant mon_noc_type_c : integer := 0;
  
  ----------------------------------------------------------------------------
  -- Monitor counter widths.
  -- If you change these, you also have to change reporting space bars at
  -- interface.vhd
  ----------------------------------------------------------------------------

  -- For MESH and RING:
  constant re_count_bits_c          : integer := 16;  --32
  constant not_re_count_bits_c      : integer := 16;  --32
  constant not_re_case_count_bits_c : integer := 12;  --32
  constant not_re_max_count_bits_c  : integer := 12;  --16

  -- For HIBI:
  constant av_count_bits_c : integer := 32;
  constant lock_count_bits_c : integer := 32;

  constant transfer_min_bits_c : integer := 16;
  constant transfer_max_bits_c : integer := 16;
  constant transfer_tot_bits_c : integer := 32;
  constant num_transfers_bits_c : integer := 16;
  constant target_fifo_fulls_bits_c : integer := 16;
  constant target_fifo_full_cases_bits_c : integer := 16;
  constant target_fifo_full_maxcase_bits_c : integer := 8;

  -- For XBAR:
  constant hold_bits_c : integer := 32;
  constant grantwait_bits_c : integer := 16;
  constant grantwait_case_bits_c : integer := 12;
  constant grantwait_max_bits_c : integer := 12;
  
  
  -- Monitor commands:
  -- 00 normal operation
  -- 01 disable counting (stall counters)
  -- 10 reset counters
  -- 11 do report
  constant mon_command_width_c : integer := 2;

end mon_pkg;
