-- COPYRIGHT (C) 2022 by Jens Gutschmidt / VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or any
-- later version.
-- 
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
-- Created: 24-02-2022 13:24:00
--
-----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

PACKAGE memory_vhd_v03_pkg IS
  
  -- /////////////////\\\\\\\\\\\\\\\\\\\
  -- ************************************
  -- ***         User Settings        ***
  -- ************************************

   -- Wishbone Bus
   CONSTANT WB_DATA_WIDTH                : integer := 32; -- Wishbone Data Bus width
   CONSTANT WB_ADDR_WIDTH                : integer := 5; -- Wishbone Address Bus width

   CONSTANT VENDOR      : string         :=   "generic"; -- (generic, altera, xilinx)
                                                         --  NOT IMPLEMENTED YET

  -- Bus width (DATA_T) of all memories (all are equal)
  -- Chose a value high enough to hold all possible values cumulated in
  -- y_inj_reg, 
  -- Memory t,
  -- Memory bias,
  -- Memory w
   CONSTANT DATA_WIDTH                   : integer := 8;

  -- Address width of s input vector memory (maximum number of components/inputs = 2**MEM_S_ADDR_WIDTH)
   CONSTANT MEM_S_ADDR_WIDTH             : integer := 3;  -- = 8

  -- Address width of t output vector memory (maximum number of neurons/outputs = 2**MEM_T_ADDR_WIDTH)
   CONSTANT MEM_T_ADDR_WIDTH             : integer := 2;  -- = 4
  -- /////////////////\\\\\\\\\\\\\\\\\\\
  -- /////////////////\\\\\\\\\\\\\\\\\\\
  


  -- ************************************
  -- ***       System Constants       ***
  -- ***        DO NOT CHANGE         ***
  -- ************************************
  -- Number of maximum usable components/inputs - 1
   CONSTANT I_MAX                        : integer := ( 2 ** MEM_S_ADDR_WIDTH ) - 1;
  -- Number of maximum usable neurons/outputs - 1
   CONSTANT J_MAX                        : integer := ( 2 ** MEM_T_ADDR_WIDTH ) - 1;
   
  -- Width of Memory Latency counter (mem_rd_lat_reg)
   CONSTANT MEM_LAT_CNT_WIDTH            : integer := 7; -- At least 3 bits width -> latency 0...2
  -- Value to reach for leaving counting loops
   CONSTANT MEM_LAT_CNT_TRANSITION       : integer := ( 2 ** MEM_LAT_CNT_WIDTH ) - 1;
   
  -- Number of memory write lines (to build up the RD/WR vector
   CONSTANT MEM_WR_LINES                 : integer := 5;
   CONSTANT MEM_S_BITPOS                 : integer := MEM_WR_LINES - 5;
   CONSTANT MEM_T_BITPOS                 : integer := MEM_WR_LINES - 4;
   CONSTANT MEM_W_BITPOS                 : integer := MEM_WR_LINES - 3;
   CONSTANT MEM_Y_BITPOS                 : integer := MEM_WR_LINES - 2;
   CONSTANT MEM_BIAS_BITPOS              : integer := MEM_WR_LINES - 1;
  
  -- Status READY FOR COMMANDS bit position
   CONSTANT STAT_RDY                     : integer := 0;
  -- Status Latency Messurement in progress
   CONSTANT STAT_LAT_RUN                 : integer := 1;
  -- Status Controller is NOT ready -> RESET (while start of function TRAIN)
   CONSTANT STAT_NOT_RDY                 : integer := 2;
  -- Status Interrupt Enable
   CONSTANT STAT_INT_EN                  : integer := 3;
  -- Status Memory Error
   CONSTANT STAT_MEMERR                  : integer := 4;
  -- Status DATA OUTPUT READY bit position
   CONSTANT STAT_RD_WR_COMPLETE          : integer := 5;
  -- Status Interrupt TEST pending
   CONSTANT STAT_INT_TEST                : integer := 6;
  -- Status Interrupt TRAIN pending
   CONSTANT STAT_INT_TRAIN               : integer := 7;


  -- Calculate all memory address widths and other dependencies
  -- s input memory depth
   CONSTANT MEM_S_DEPTH                  : integer := ( 2**MEM_S_ADDR_WIDTH ) - 1;
  -- t output memory depth
   CONSTANT MEM_T_DEPTH                  : integer := ( 2**MEM_T_ADDR_WIDTH ) - 1;
  -- w (weights) memory address width calculation
   CONSTANT MEM_W_ADDR_WIDTH             : integer := MEM_S_ADDR_WIDTH + MEM_T_ADDR_WIDTH;
  -- w (weights) memory depths calculation
   CONSTANT MEM_W_DEPTH                  : integer := ( 2**MEM_W_ADDR_WIDTH ) - 1;

  -- ************************************
  -- Wishbone Address Map
   CONSTANT WB_STAT_A                    : integer :=  0; -- 
   CONSTANT WB_THRES                     : integer :=  1; -- 
   CONSTANT WB_BIAS                      : integer :=  2; -- 
   CONSTANT WB_OFFSET                    : integer :=  3; -- 
   CONSTANT WB_MAXEPOCH                  : integer :=  4; -- 
   CONSTANT WB_UNUSED_X05                : integer :=  5; -- DO NOT USE, for feature use
   CONSTANT WB_UNUSED_X06                : integer :=  6; -- DO NOT USE, for feature use
   CONSTANT WB_STARTI                    : integer :=  7; -- 
   CONSTANT WB_STOPI                     : integer :=  8; -- 
   CONSTANT WB_STARTJ                    : integer :=  9; -- 

   CONSTANT WB_STOPJ                     : integer := 10; -- 
   CONSTANT WB_EPOCH                     : integer := 11; -- 
   CONSTANT WB_WRLAT                     : integer := 12; -- 
   CONSTANT WB_RDLAT                     : integer := 13; -- 
   CONSTANT WB_ALLLAT                    : integer := 14; -- 
   CONSTANT WB_START3                    : integer := 15; -- 
   CONSTANT WB_START4                    : integer := 16; -- 
   CONSTANT WB_START5_S                  : integer := 17; -- 
   CONSTANT WB_START5_T                  : integer := 18; -- 
   CONSTANT WB_START5_W                  : integer := 19; -- 

   CONSTANT WB_START5_Y                  : integer := 20; -- 
   CONSTANT WB_START5_BIAS               : integer := 21; -- 
   CONSTANT WB_START6                    : integer := 22; -- 
   CONSTANT WB_IMAX                      : integer := 23; -- 
   CONSTANT WB_JMAX                      : integer := 24; -- 
   CONSTANT WB_MEMDATA_WIDTH             : integer := 25; -- 
  -- ************************************
  
  -- ************************************
  -- ***       Type Definitions       ***
  -- ************************************
  -- Wishbone data and address types
   SUBTYPE  WB_DATA_WIDTH_T              IS std_logic_vector ( WB_DATA_WIDTH-1 downto 0 );
   SUBTYPE  WB_ADDR_WIDTH_T              IS std_logic_vector ( WB_ADDR_WIDTH-1 downto 0 );

  -- Data bus type for all memories
   SUBTYPE DATA_T                        IS std_logic_vector ( DATA_WIDTH-1 downto 0 );
   SUBTYPE DATA_N                        IS integer range DATA_WIDTH-1 downto 0;
   
  -- Memory Latency counter type
   SUBTYPE MEM_LAT_CNT_WIDTH_T           IS std_logic_vector ( MEM_LAT_CNT_WIDTH-1 downto 0 );
  -- Vector bus to select memory RD or WR
   SUBTYPE MEM_WR_LINES_T                IS std_logic_vector ( MEM_WR_LINES-1 downto 0 );
   
  -- Declare the types for all memory address busses
  -- s input memory
   SUBTYPE ADDRESS_S_T                   IS std_logic_vector ( MEM_S_ADDR_WIDTH-1 downto 0 );
   SUBTYPE ADDRESS_S_N                   IS integer range MEM_S_ADDR_WIDTH-1 downto 0;
   SUBTYPE ADDRESS_S_ZERO_T              IS std_logic_vector ( MEM_S_ADDR_WIDTH-1 downto 1 );
  -- t input/output memory
   SUBTYPE ADDRESS_T_T                   IS std_logic_vector ( MEM_T_ADDR_WIDTH-1 downto 0 );
   SUBTYPE ADDRESS_T_N                   IS integer range MEM_T_ADDR_WIDTH-1 downto 0;
   SUBTYPE ADDRESS_T_ZERO_T              IS std_logic_vector ( MEM_T_ADDR_WIDTH-1 downto 1 );
  -- w (weigths) memory
   SUBTYPE ADDRESS_W_T                   IS std_logic_vector ( MEM_W_ADDR_WIDTH-1 downto 0 );
  
  -- Declare the types for all memory arrays
  -- s input memory
   TYPE S_RAM_T                          IS ARRAY ( MEM_S_DEPTH DOWNTO 0 ) OF std_logic_vector( DATA_WIDTH-1 DOWNTO 0 );
  -- t output memory
   TYPE T_RAM_T                          IS ARRAY ( MEM_T_DEPTH DOWNTO 0 ) OF std_logic_vector( DATA_WIDTH-1 DOWNTO 0 );
  -- w (weights) memory
   TYPE W_RAM_T                          IS ARRAY ( MEM_W_DEPTH DOWNTO 0 ) OF std_logic_vector( DATA_WIDTH-1 DOWNTO 0 );
  -- ************************************
  
   SUBTYPE SIM_STATE_T IS integer; 

   CONSTANT ST0         : SIM_STATE_T := 0;
   CONSTANT INIT        : SIM_STATE_T := 1;
   CONSTANT WR1         : SIM_STATE_T := 2;
   CONSTANT WR_13_BURST : SIM_STATE_T := 3;
   CONSTANT WR_13_END   : SIM_STATE_T := 4;
   CONSTANT WR_7_SINGLE : SIM_STATE_T := 5;
   CONSTANT WR_7_END    : SIM_STATE_T := 6;
   CONSTANT ST7         : SIM_STATE_T := 7;
  
END memory_vhd_v03_pkg;


