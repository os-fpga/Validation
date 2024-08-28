-- (C) 2010 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions, and any output
-- files any of the foregoing (including device programming or simulation
-- files), and any associated documentation or information are expressly subject
-- to the terms and conditions of the Altera Program License Subscription
-- Agreement, Altera MegaCore Function License Agreement, or other applicable
-- license agreement, including, without limitation, that your use is for the
-- sole purpose of programming logic devices manufactured by Altera and sold by
-- Altera or its authorized distributors.  Please refer to the applicable
-- agreement for further details.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FPC_LIBRARY_PACKAGE.VHD                   ***
--***                                             ***
--***   Function: Component Declarations of       ***
--***   ADSPB instantiated functions. Provides    ***
--***   interface between ADSPB tool's types      ***
--***   and hcc library elements                  ***
--***                                             ***
--***   25/07/09 SWP                              ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

PACKAGE fpc_library_package IS

    constant m_fpOutputScale            : integer := 0;     -- -ni: Fully pre-normalize single precision multipliers
    constant m_fpRoundConvert           : integer := 0;     -- -rc: all conversions between signed and unsigned numbers
    constant m_fpDoubleSpeed            : integer := 1;     -- -ds: Pipeline longer additions
    constant m_fpOutputPipe             : integer := 1;     -- -op: Optimize away registers on simple internal output nodes
    constant m_fpNormalisationSpeed     : integer := 3;     -- -ns: Normalization block performance (1,2 or 3)
    constant m_SingleMantissaWidth      : integer := 32;    -- -mm: 0=>32-bit, 1=>36-bit
    constant m_fpShiftSpeed             : integer := 1;     -- -ps: Remove pipelines out of large alignments

  function deviceFamilyA5( f : string ) return integer;
  function deviceFamily( f : string ) return integer;
  function deviceFamilyS3( f : string ) return integer;

  function sIEEE_2_real (arg : STD_LOGIC_VECTOR(31 DOWNTO 0)) return REAL;
  function sNorm_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function sInternal_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function sInternalSM_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function dIEEE_2_real (arg : STD_LOGIC_VECTOR(63 DOWNTO 0)) return REAL;
  function dNorm_2_real (arg : STD_LOGIC_VECTOR(69 DOWNTO 0)) return REAL;
  function dInternal_2_real (arg : STD_LOGIC_VECTOR(79 DOWNTO 0)) return REAL;
  function vIEEE_2_real (arg : STD_LOGIC_VECTOR; expWidth : INTEGER; fracWidth : INTEGER) return REAL;
  
  function sIEEEisEqual (a, b : STD_LOGIC_VECTOR(31 DOWNTO 0); threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN;
  function dIEEEisEqual (a, b : STD_LOGIC_VECTOR(63 DOWNTO 0); threshold : REAL := 0.000001; zero_threshold : REAL := 0.0000000001) return BOOLEAN;
  function vIEEEisEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN;
  function vIEEEisExactEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN;
  function vIEEEisSubnormal (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN;
  function vIEEEisZero (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN;

--***************************************************
--*** Single Precision                            ***
--***************************************************


  COMPONENT fp_mult_sNorm_2_sInternal
  GENERIC ( m_family : string );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_mult_sNorm_2_sNorm
  GENERIC ( m_family : string );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_mult_sNorm_2_sIEEE
  GENERIC ( m_family : string );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_mult_sIEEE_2_sInternal IS 
  GENERIC ( m_family : string );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  
  COMPONENT fp_mult_sIEEE_2_sInternalSM
  GENERIC (
	m_family : string;
	m_dotopt : positive
	);
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_div_sNorm_2_sInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_div_sNorm_2_sIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_addsub_sInternal_2_sInternal
  GENERIC (
        addsub_resetval : STD_LOGIC
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        add_sub : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_addsub_sInternalSM_2_sInternal
  GENERIC (
        addsub_resetval : STD_LOGIC
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        add_sub : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_exp_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_log_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_recip_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_recipSqRt_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_sin_sIEEE_2_sIEEE IS
  GENERIC (m_family : string);
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_cos_sIEEE_2_sIEEE IS 
  GENERIC (m_family : string);
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_tan_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_asin_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_acos_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_atan_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT cast_sIEEE_2_sNorm
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sIEEE_2_dIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;
  
  COMPONENT cast_sIEEE_2_sInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dIEEE_2_sInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sIEEE_2_dInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sInternal_2_sNorm
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;

  COMPONENT cast_sInternal_2_sIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sInternal_2_fixed
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0)
       );
  END COMPONENT;

COMPONENT cast_sNorm_2_sIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
COMPONENT cast_sNorm_2_sInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sInternal_2_dInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_sNorm_2_fixed
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0)
       );
  END COMPONENT;

  
--***************************************************
--*** Double Precision                            ***
--***************************************************

  COMPONENT fp_mult_dNorm_2_dInternal
  GENERIC (
	m_family : string
	);
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_mult_dNorm_2_dIEEE
  GENERIC (
	m_family : string
	);
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
       );
  END COMPONENT;

  COMPONENT fp_div_dNorm_2_dIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
       );
  END COMPONENT;

  COMPONENT fp_div_dNorm_2_dInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;

  COMPONENT fp_addsub_dInternal_2_dInternal
  GENERIC (
        addsub_resetval : STD_LOGIC
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        add_sub : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_exp_dIEEE_2_dIEEE
  GENERIC (
        m_family : string
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_log_dIEEE_2_dIEEE
  GENERIC (
        m_family : string
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_recip_dIEEE_2_dIEEE
  GENERIC (
        m_family : string
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_recipSqRt_dIEEE_2_dIEEE
  GENERIC (
        m_family : string
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_ldexp_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_ldexp_dIEEE_2_dIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT cast_dIEEE_2_dNorm
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (69 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dIEEE_2_dInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dInternal_2_dNorm
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (69 DOWNTO 0)
       );
  END COMPONENT;

  COMPONENT cast_dInternal_2_dIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_fixed_2_sNorm
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT cast_fixed_2_sInternal
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT cast_fixed_2_sIEEE
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT cast_fixed_2_dIEEE
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;
  
  COMPONENT cast_fixed_2_dInternal IS 
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
  END COMPONENT;
  
  
  COMPONENT cast_sIEEE_2_Fixed
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dIEEE_2_Fixed
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dInternal_2_Fixed
  GENERIC (
        unsigned : integer;
        iWidth   : integer;
        fWidth   : integer
        );
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (iWidth+fWidth-1 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dInternal_2_sIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_abs_sIEEE_2_sIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT cast_dInternal_2_sInternal
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_abs_dIEEE_2_dIEEE
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
       );
  END COMPONENT;
  
  COMPONENT fp_norm_sInternal_2_sInternal IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;


  COMPONENT fp_norm_dInternal_2_dInternal IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_sIEEE_2_sIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_sNorm_2_sNorm IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_sInternal_2_sInternal IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_dIEEE_2_dIEEE IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_dNorm_2_dNorm IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
  END COMPONENT;

  COMPONENT fp_negate_dInternal_2_dInternal IS 
  PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
  END COMPONENT;

END fpc_library_package;

PACKAGE BODY fpc_library_package is

  function sIEEE_2_real (arg : STD_LOGIC_VECTOR(31 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8;
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        if arg(31) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        frac                    := REAL(to_integer (UNSIGNED(arg(22 DOWNTO 0)))) / (2.0 ** 23);
        expon                   := to_integer (UNSIGNED(arg (30 downto 23)));
        exp                     := expon - expon_base;
        if exp > expon_base then
            sign := sign * 9.999e+307; -- NaN or Inf
        elsif expon = 0 then
            sign                := 0.0; -- denormalized rounded to zero
        else
            sign                := sign * (2.0 ** exp) * (1.0 + frac);
        end if;
        return sign;
  end sIEEE_2_real;

  function sNorm_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(41 DOWNTO 10)))) / (2.0 ** 30); -- SS.FFFFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;
        sign                    := (2.0 ** exp) * frac;
        return sign;
  end sNorm_2_real;

  function sInternal_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(41 DOWNTO 10)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;
        sign                    := (2.0 ** exp) * frac;
        return sign;
  end sInternal_2_real;
  

  function sInternalSM_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (UNSIGNED(arg(42 DOWNTO 10)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;
        sign                    := (2.0 ** exp) * frac;
        return sign;
  end sInternalSM_2_real;
  
  

  function dIEEE_2_real (arg : STD_LOGIC_VECTOR(63 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11;
    variable frac           : REAL    := 0.0;       -- Fraction
    variable fraclo         : REAL    := 0.0;       -- Fraction (low order bits)
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        if arg(63) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        frac                    := REAL(to_integer (SIGNED('0' & arg(51 DOWNTO 21)))) / (2.0 ** 31); -- ignore low bits to fit within VHDL types
        fraclo                  := REAL(to_integer (SIGNED('0' & arg(20 DOWNTO 0)))) / (2.0 ** 52);
        expon                   := to_integer (SIGNED('0' & arg (62 downto 52)));
        exp                     := expon - expon_base;
		-- Fatal error (vsim-3421) if outside range -1e+308 +1e+308 which can still happen if exp = 1023
        if exp >= 1023 then
            sign                := sign * 9.999e+307;
        elsif expon = 0 then
            sign                := 0.0;
            -- ignore denormalized mantissa
        else
            sign                := sign * (2.0 ** exp) * (1.0 + frac + fraclo);
        end if;
        return sign;
  end dIEEE_2_real;

  function dNorm_2_real (arg : STD_LOGIC_VECTOR(69 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11; -- the binary point is at 10 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(66 DOWNTO 35)))) / (2.0 ** 30); -- SS.FFFFF...FF
        expon                   := to_integer (UNSIGNED(arg (12 downto 0)));
        exp                     := expon - expon_base;
        if exp >= 1024 then
            sign                := 0.0;
        else
            sign                := (2.0 ** exp) * frac;
        end if;
        return sign;
  end dNorm_2_real;

  function dInternal_2_real (arg : STD_LOGIC_VECTOR(79 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11; -- the binary point is at 10 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
    variable sign_bit       : STD_LOGIC;
                     
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(76 DOWNTO 45)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (12 downto 0)));
        exp                     := expon - expon_base;
        sign_bit                := arg(76);
        if exp >= 1024 then
        -- perhaps 
        -- or (arg(74) /= sign_bit and exp >= 1023) or (arg(74) /= sign_bit and arg(75) /= sign_bit and exp >= 1022) then
            sign                := 0.0;
        else
            sign                := (2.0 ** exp) * frac;
        end if;
        return sign;
  end dInternal_2_real;

  function vIEEE_2_real (arg : STD_LOGIC_VECTOR; expWidth : INTEGER; fracWidth : INTEGER) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable exponBase      : INTEGER;  -- exponent offset
    variable frac           : REAL    := 0.0;       -- Fraction
    variable fraclo         : REAL    := 0.0;       -- Fraction (low order bits)
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        exponBase              := 2**(expWidth-1) -1;
        if arg(arg'high) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        if fracWidth > 31 then
            frac   := REAL(to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))))) / (2.0 ** 31);
            fraclo := REAL(to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)))) / (2.0 ** fracWidth);
        else
            frac   := REAL(to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)))) / (2.0 ** fracWidth);
            fraclo := 0.0;
        end if;
        expon      := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
        exp        := expon - exponBase;
        if exp > exponBase or exp >= 1023 then
            sign   := sign * 9.999e+307; -- NaN or Inf
        elsif expon = 0 then
            sign   := 0.0; -- denormalized rounded to zero
        else
            sign   := sign * (2.0 ** exp) * (1.0 + frac + fraclo);
        end if;
        return sign;
  end vIEEE_2_real;

  function sIEEEisNan (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        return a(30 downto 23) = "11111111" and a(22 downto 0) /= "00000000000000000000000";
  end sIEEEisNan;
  
  function sIEEEisInf (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        -- ignore sign bit since this returns true for -inf and +inf
        if a(30 downto 0) = "1111111100000000000000000000000" then
        --if a(30 downto 23) = "11111111" then
          return TRUE;
        else
          return FALSE;
        end if;
  end sIEEEisInf;

  function sIEEEisNegative (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        return a(31) = '1';
  end sIEEEisNegative;
  
  function sIEEEisEqual (a, b : STD_LOGIC_VECTOR(31 DOWNTO 0); threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;

  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;
        
        -- treat all NaNs as equal
        if sIEEEisNan(a) and sIEEEisNan(b) then
          return TRUE;
        end if;
        
        -- if they're both infinite then they match assuming the sign is right
        if sIEEEisInf(a) and sIEEEisInf(b) then
          return sIEEEisNegative(a) = sIEEEisNegative(b);
        end if;
        
        -- if only one is infinite then mismatch
        if sIEEEisInf(a) or sIEEEisInf(b) then
          return FALSE;
        end if;
        a_real := sIEEE_2_real(a);
        b_real := sIEEE_2_real(b);
        
        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;
        
        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;
        
        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end sIEEEisEqual;

  function dIEEEisNan (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        return a(62 downto 52) = "11111111111" and a(51 downto 0) /= "0000000000000000000000000000000000000000000000000000";
  end dIEEEisNan;
  
  function dIEEEisInf (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        -- ignore sign bit since this returns true for -inf and +inf
        if a(62 downto 0) = "111111111110000000000000000000000000000000000000000000000000000" then
        --if a(62 downto 52) = "11111111111" then
          return TRUE;
        else
          return FALSE;
        end if;
  end dIEEEisInf;

  function dIEEEisNegative (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        return a(63) = '1';
  end dIEEEisNegative;


  function dIEEEisEqual (a, b : STD_LOGIC_VECTOR(63 DOWNTO 0); threshold : REAL := 0.000001; zero_threshold : REAL := 0.0000000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;

  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;
        
        -- treat all NaNs as equal
        if dIEEEisNan(a) and dIEEEisNan(b) then
          return TRUE;
        end if;
        
        -- if they're both infinite then they match assuming the sign is right
        if dIEEEisInf(a) and dIEEEisInf(b) then
          return dIEEEisNegative(a) = dIEEEisNegative(b);
        end if;
 
        -- if only one is infinite then mismatch
        if dIEEEisInf(a) or dIEEEisInf(b) then
          return FALSE;
        end if;
        a_real := dIEEE_2_real(a);
        b_real := dIEEE_2_real(b);
        
        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;
        
        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;
        
        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end dIEEEisEqual;

  function vIEEEisNan (arg : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable expon : INTEGER;
    variable expmax : INTEGER;
    variable frac : INTEGER;
  begin
    expon := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
    expmax := 2**expWidth - 1;
    if (expon /= expmax) then
        return FALSE;
    end if;
    if fracWidth > 31 then
        frac := to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))));
        if (frac /= 0) then
            return TRUE;
        end if;
        frac := to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)));
        return (frac /= 0);
    end if;

    frac := to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)));
    return (frac /= 0);
  end vIEEEisNan;
  
  function vIEEEisInf (arg : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable expon : INTEGER;
    variable expmax : INTEGER;
    variable frac : INTEGER;
  begin
        -- ignore sign bit since this returns true for -inf and +inf
    expon := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
    expmax := 2**expWidth - 1;
    if (expon /= expmax) then
        return FALSE;
    end if;
    if fracWidth > 31 then
        frac := to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))));
        if (frac /= 0) then
            return FALSE;
        end if;
        frac := to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)));
        return (frac = 0);
    end if;

    frac := to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)));
    return (frac = 0);
  end vIEEEisInf;

  function vIEEEisNegative (arg : STD_LOGIC_VECTOR; we, wf : INTEGER) return BOOLEAN is
  begin
        return arg(arg'high) = '1';
  end vIEEEisNegative;


  function vIEEEisEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;

  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;
        
        -- treat all NaNs as equal
        if vIEEEisNan(a, expWidth, fracWidth) and vIEEEisNan(b, expWidth, fracWidth) then
          return TRUE;
        end if;
        
        -- if they're both infinite then they match assuming the sign is right
        if vIEEEisInf(a, expWidth, fracWidth) and vIEEEisInf(b, expWidth, fracWidth) then
          return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
        end if;
 
        -- if only one is infinite then mismatch
        if vIEEEisInf(a, expWidth, fracWidth) or vIEEEisInf(b, expWidth, fracWidth) then
          return FALSE;
        end if;
        a_real := vIEEE_2_real(a, expWidth, fracWidth);
        b_real := vIEEE_2_real(b, expWidth, fracWidth);
        
        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;
        
        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;
        
        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end vIEEEisEqual;

    function vIEEEisExactEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;
        
        -- treat all NaNs as equal
        if vIEEEisNan(a, expWidth, fracWidth) and vIEEEisNan(b, expWidth, fracWidth) then
          return TRUE;
        end if;
        
        -- if they're both infinite then they match assuming the sign is right
        if vIEEEisInf(a, expWidth, fracWidth) and vIEEEisInf(b, expWidth, fracWidth) then
          return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
        end if;
 
        -- if only one is infinite then mismatch
        if vIEEEisInf(a, expWidth, fracWidth) or vIEEEisInf(b, expWidth, fracWidth) then
            return FALSE;
        end if;
        
        if (vIEEEisSubnormal(a, expWidth, fracWidth) or vIEEEisZero(a, expWidth, fracWidth)) and 
           (vIEEEisSubnormal(a, expWidth, fracWidth) or vIEEEisZero(a, expWidth, fracWidth)) then
            return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
        end if;
        
        if (a = b) then
            return TRUE;
        end if;
        
        return FALSE;
    end vIEEEisExactEqual;
    
    function vIEEEisSubnormal (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable fracA: integer;
    variable expA : integer;
    begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) then
          return FALSE;
        end if;
        
        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto 0)));
        expA  := to_integer (UNSIGNED(a(expWidth+fracWidth-1 downto fracWidth)));
        
        if (expA = 0 and fracA /= 0) then 
           return TRUE;
        end if;
        
        return FALSE;
    end vIEEEisSubnormal;

    function vIEEEisZero (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable fracA: integer;
    variable expA : integer;
    begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) then
          return FALSE;
        end if;
        
        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto 0)));
        expA  := to_integer (UNSIGNED(a(expWidth+fracWidth-1 downto fracWidth)));
        
        if (expA = 0 and fracA = 0) then 
           return TRUE;
        end if;

        return FALSE;

    end vIEEEisZero;
    
    FUNCTION deviceFamilyA5 ( f : string )
        RETURN integer IS
    BEGIN
        ASSERT f = "Stratix II" or f = "Stratix III" or f = "Stratix IV" or f = "Stratix V" or f = "Arria V" REPORT "fpc library : unknown device family" SEVERITY failure;
        IF f = "Stratix II" THEN
            RETURN 0;
        ELSIF f = "Stratix V" THEN
            RETURN 2;
        ELSIF f = "Arria V" THEN
            RETURN 3;
        END IF;
        RETURN 1;	-- "Stratix III" and "Stratix IV"
    END FUNCTION deviceFamilyA5;

    FUNCTION deviceFamily ( f : string )
        RETURN integer IS
    BEGIN
        ASSERT f = "Stratix II" or f = "Stratix III" or f = "Stratix IV" or f = "Stratix V" or f = "Arria V" REPORT "fpc library : unknown device family" SEVERITY failure;
        IF f = "Stratix II" THEN
            RETURN 0;
        ELSIF f = "Stratix V" or f = "Arria V" THEN
            RETURN 2;
        END IF;
        RETURN 1;   -- "Stratix III" and "Stratix IV"
    END FUNCTION deviceFamily;

    FUNCTION deviceFamilyS3 ( f : string )
        RETURN integer IS
    BEGIN
        ASSERT f = "Stratix II" or f = "Stratix III" or f = "Stratix IV" or f = "Stratix V" or f = "Arria V" REPORT "fpc library : unknown device family" SEVERITY failure;
        IF f = "Stratix II" THEN
            RETURN 0;
        END IF;
        RETURN 1;	-- "Stratix III" and "Stratix IV"
        -- "Stratix V" also though many FPC components have not yet been optimized for this family
    END FUNCTION deviceFamilyS3;

END fpc_library_package;


