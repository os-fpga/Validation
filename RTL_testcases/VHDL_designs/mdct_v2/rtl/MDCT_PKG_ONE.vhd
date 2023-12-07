--------------------------------------------------------------------------------
--                                                                            --
--                          V H D L    F I L E                                --
--                          COPYRIGHT (C) 2006                                --
--                                                                            --
--------------------------------------------------------------------------------
--
-- Title       : MDCT_PKG
-- Design      : MDCT Core
-- Author      : Michal Krepa
--
--------------------------------------------------------------------------------
--
-- File        : MDCT_PKG.VHD
-- Created     : Sat Mar 5 2006
--
--------------------------------------------------------------------------------
--
--  Description : Package for MDCT core
--
--------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use ieee.numeric_std.all;
  
package MDCT_PKG_ONE is
    
  constant IP_W_1                 : INTEGER := 8; 
  constant OP_W_1                 : INTEGER := 12; 
  constant N                      : INTEGER := 8;
  constant COE_W_1                : INTEGER := 12;
  constant ROMDATA_W              : INTEGER := COE_W_1+2;
  constant ROMADDR_W              : INTEGER := 6;
  constant RAMDATA_W_1            : INTEGER := 10;
  constant RAMADRR_W_1            : INTEGER := 6;
  constant COL_MAX_1              : INTEGER := N-1;
  constant ROW_MAX_1              : INTEGER := N-1;
  constant LEVEL_SHIFT_1          : INTEGER := 128;
  constant DA_W                   : INTEGER := ROMDATA_W+IP_W_1;
  constant DA2_W_1                : INTEGER := DA_W+2;
  -- 2's complement numbers

	constant AP : INTEGER := 1448;
	constant BP : INTEGER := 1892;
	constant CP : INTEGER := 784;
	constant DP : INTEGER := 2009;
	constant EP : INTEGER := 1703;
	constant FP : INTEGER := 1138;
	constant GP : INTEGER := 400;
	constant AM : INTEGER := -1448;
	constant BM : INTEGER := -1892;
	constant CM : INTEGER := -784;
	constant DM : INTEGER := -2009;
	constant EM : INTEGER := -1703;
	constant FM : INTEGER := -1138;
	constant GM : INTEGER := -400;
	
  type T_ROM1DATAO_1  is array(0 to 8) of STD_LOGIC_VECTOR(ROMDATA_W-1 downto 0);
  type T_ROM1ADDRO_1  is array(0 to 8) of STD_LOGIC_VECTOR(ROMADDR_W-1 downto 0);
  
  type T_ROM2DATAO_1  is array(0 to 10) of STD_LOGIC_VECTOR(ROMDATA_W-1 downto 0);
  type T_ROM2ADDRO_1  is array(0 to 10) of STD_LOGIC_VECTOR(ROMADDR_W-1 downto 0);
  

end MDCT_PKG_ONE;
