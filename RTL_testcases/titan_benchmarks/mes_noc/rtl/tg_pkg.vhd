-- Template for tg_pkg. Copy this file as a tg_pkg and modify the settings
-- to suit your application. The default values are good for most purposes
-- and usually only simulating_c and num_of_tgs_c, and maybe clk_rate_c
-- have to be changed.

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

library ieee;
use ieee.std_logic_1164.all;

package tg_pkg is

  -- Set this to 1 if you are using a simulator and 0 if you are
  -- using logic synthesis
  constant simulating_c : integer := 0;

  -- Want to use NoC monitor?
  constant use_monitor_c : integer := 0;

  -- Number of TGs in your system (including the master TG)
  constant num_of_tgs_c : integer := 64;

  -- Clock rate for master TG in Hz. This has to be correct for UART to work.
  constant clk_rate_c : integer := 50000000;
  

  -- Set the UART baud rate here. Uart bits should be left at 8.
  constant baud_rate_c : integer := 19200;
  constant stop_bits_c : integer := 2;

  
  -- Master TG has address 0 by default, but you can change it here.
  constant master_addr_c : integer := 0;

  -- Report idle time:
  -- How many clk cycles to wait before starting reporting for NoC
  -- to get empty.
  -- This should work well untouched at 5000,
  -- but if you encounter problems not getting the reports, and
  -- you are using a problematic, slow network with large buffers,
  -- you can try to increase this.
  constant report_idle_time_c : integer := 5000;

  -- NoC monitor synchronization delay;
  -- how many tg clock cycles it takes to get monitor commands
  -- to the destination because of synchronization.
  -- Synchronization takes 4 noc clk cycles.
  -- If you use the NoC monitor, set this to TG freq / NoC freq.
  constant mon_cmd_synch_time_c : integer := 4;


  -----------------------------------------------------------------------------
  -- The rest of the constant should not be changed in normal operation.
  -----------------------------------------------------------------------------

  constant uart_bits_c : integer := 8;

  
  -- Statistic counter lengths:
  constant stat_min_w_c : integer := 16;
  constant stat_max_w_c : integer := 16;
  constant stat_num_w_c : integer := 32;
  constant stat_tot_w_c : integer := 32;
  constant stat_minlat_w_c : integer := 16;
  constant stat_maxlat_w_c : integer := 16;
  constant stat_totlat_w_c : integer := 32;

  -- data widths for path measuring
  constant path_amount_w_c : integer := 16;
  constant path_latency_w_c : integer := 32;

  
  constant max_packet_size_c : integer := 65535;

  constant bus_w_c : integer := 32;
  constant address_w_c : integer := 7;
  constant max_addr_c : integer := 127;
  constant mode_w_c : integer := 2;
  constant timestamp_w_c : integer := 16;
  constant datatype_w_c : integer := 4;
  constant seqnum_w_c : integer := 12;

  constant processing_time_w_c : integer := 16;
  constant tx_length_w_c : integer := 16;
  constant waiting_time_w_c : integer := 16;
  
  
  
end tg_pkg;
