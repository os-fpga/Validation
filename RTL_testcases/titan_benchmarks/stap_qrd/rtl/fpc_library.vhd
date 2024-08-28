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


--***************************************************
--***************************************************
--***                                             ***
--***   ALTERA ADSPB FLOATING POINT LIBRARY       ***
--***                                             ***
--***   FPC_LIBRARY.VHD                           ***
--***                                             ***
--***   Function: Interfaces between ADSBP        ***
--***             components and hcc components   ***
--***             This solves a number of issues: ***
--***               1. 0 or 1-based vectors       ***
--***               2. encapsulation of 'target'  ***
--***               3. Allows VHDL library to be  ***
--***                   isolated from tool        ***
--***               4. Grouping sat/zip with value***
--***                   as one signal             ***
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
--***************************************************


--***************************************************
--***************************************************
--*** SINGLE PRECISION                            ***
--***************************************************
--***************************************************

--***************************************************
--*** fp_addsub_sInternal_2_sInternal             ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_addsub_sInternal_2_sInternal IS
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
END fp_addsub_sInternal_2_sInternal;

ARCHITECTURE rtl OF fp_addsub_sInternal_2_sInternal IS
BEGIN

  cmp: hcc_alufp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,       -- TODO: add support for 36-bit mantissa too
        shiftspeed  => m_fpShiftSpeed,
        addsub_resetval => addsub_resetval
          )
  PORT MAP (
        sysclk  => clock,
        reset   => reset,
        enable  => clk_en,
        addsub  => add_sub(0),

        aa  => dataa(41 DOWNTO 0),
        aasat   => dataa(42),
        aazip   => dataa(43),
        aanan   => dataa(44),

        bb  => datab(41 DOWNTO 0),
        bbsat   => datab(42),
        bbzip   => datab(43),
        bbnan   => dataa(44),

        cc  => result(41 DOWNTO 0),
        ccsat   => result(42),
        cczip   => result(43),
        ccnan   => result(44)
    );
  
END rtl;



--***************************************************
--*** fp_addsub_sInternalSM_2_sInternal           ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_addsub_sInternalSM_2_sInternal IS 
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
END fp_addsub_sInternalSM_2_sInternal;

ARCHITECTURE rtl OF fp_addsub_sInternalSM_2_sInternal IS
BEGIN

  cmp: hcc_alufp1_dot
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        shiftspeed  => m_fpShiftSpeed,
        outputpipe => 1,
        addsub_resetval => addsub_resetval
          )
  PORT MAP (
        sysclk  => clock,
        reset   => reset,
        enable  => clk_en,
        addsub  => add_sub(0),

        aa  => dataa(41 DOWNTO 0),
        aasat   => dataa(42),
        aazip   => dataa(43),
        aanan   => dataa(44),

        bb  => datab(41 DOWNTO 0),
        bbsat   => datab(42),
        bbzip   => datab(43),
        bbnan   => dataa(44),

        cc  => result(41 DOWNTO 0),
        ccsat   => result(42),
        cczip   => result(43),
        ccnan   => result(44)
    );
  
END rtl;



--***************************************************
--*** fp_mult_sNorm_2_sInternal                   ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_sNorm_2_sInternal  IS 
GENERIC ( m_family : string );
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_mult_sNorm_2_sInternal ;

ARCHITECTURE rtl OF fp_mult_sNorm_2_sInternal  IS
  signal res : STD_LOGIC_VECTOR (44 DOWNTO 0);
BEGIN

  cmp: hcc_mulfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        outputscale     => m_fpOutputScale,
        device => deviceFamilyA5(m_family),
        synthesize  => 1
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                bb  => datab(41 DOWNTO 0),
                bbsat   => datab(42),
                bbzip   => datab(43),
                bbnan   => datab(44),
                
                cc  => res(41 DOWNTO 0),
                ccsat   => res(42),
                cczip   => res(43),
            ccnan   => res(44)
            );
   
   result <= res;
             
END rtl;

--***************************************************
--*** fp_mult_sNorm_2_sNorm                       ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_sNorm_2_sNorm IS 
GENERIC ( m_family : string );
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_mult_sNorm_2_sNorm;

ARCHITECTURE rtl OF fp_mult_sNorm_2_sNorm IS
BEGIN

  cmp: hcc_mulfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        outputscale     => m_fpOutputScale,
        multoutput      => 1,
        xoutput         => 0,
        device => deviceFamilyA5(m_family),
        synthesize  => 1
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                bb  => datab(41 DOWNTO 0),
                bbsat   => datab(42),
                bbzip   => datab(43),
                bbnan   => datab(44),
                
                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
            ccnan   => result(44)
            );
             
END rtl;

--***************************************************
--*** fp_mult_sNorm_2_sIEEE                       ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_sNorm_2_sIEEE IS 
GENERIC ( m_family : string );
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_mult_sNorm_2_sIEEE;

ARCHITECTURE rtl OF fp_mult_sNorm_2_sIEEE IS
    signal ccsat : std_logic;
    signal cczip : std_logic;
    signal ccnan : std_logic;
BEGIN

  cmp: hcc_mulfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        outputscale     => m_fpOutputScale,
        device => deviceFamilyA5(m_family),
        synthesize  => 1,
        ieeeoutput => 1,
        xoutput => 0
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                bb  => datab(41 DOWNTO 0),
                bbsat   => datab(42),
                bbzip   => datab(43),
                bbnan   => datab(44),
                
                cc  => result(31 DOWNTO 0),
                ccsat   => ccsat,
                cczip   => cczip,
            ccnan   => ccnan
            );
             
END rtl;

--***************************************************
--*** fp_mult_sIEEE_2_sInternal                   ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_sIEEE_2_sInternal IS 
GENERIC ( m_family : string );
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_mult_sIEEE_2_sInternal;

ARCHITECTURE rtl OF fp_mult_sIEEE_2_sInternal IS
BEGIN

  cmp: hcc_mulfp1vec
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        device => deviceFamily(m_family),
        synthesize  => 1
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa,
                
                bb  => datab,
                
                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
            ccnan   => result(44)
            );
             
END rtl;


--***************************************************
--*** fp_mult_sIEEE_2_sInternalSM                 ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_sIEEE_2_sInternalSM IS 
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
END fp_mult_sIEEE_2_sInternalSM;

ARCHITECTURE rtl OF fp_mult_sIEEE_2_sInternalSM IS
BEGIN

  cmp: hcc_mulfp1_dot
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        device => deviceFamily(m_family),
        optimization	=>	m_dotopt,
        synthesize  => 0
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa,
                
                bb  => datab,
                
                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
            ccnan   => result(44)
            );
             
END rtl;


--***************************************************
--*** fp_div_sNorm_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_div_sNorm_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_div_sNorm_2_sIEEE;

ARCHITECTURE rtl OF fp_div_sNorm_2_sIEEE IS
    signal ccsat : std_logic;
    signal cczip : std_logic;
    signal ccnan : std_logic;
BEGIN

  cmp: hcc_divfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
            roundconvert    => m_fpRoundConvert,
            synthesize  => 1,
            ieeeoutput => 1,
            xoutput => 0
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                bb  => datab(41 DOWNTO 0),
                bbsat   => datab(42),
                bbzip   => datab(43),
                bbnan   => datab(44),
                
                cc  => result(31 DOWNTO 0),
                ccsat   => ccsat,
                cczip   => cczip,
            ccnan   => ccnan
            );
                  
END rtl;


--***************************************************
--*** fp_div_sNorm_2_sInternal                    ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_div_sNorm_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_div_sNorm_2_sInternal;

ARCHITECTURE rtl OF fp_div_sNorm_2_sInternal IS
BEGIN

  cmp: hcc_divfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
            roundconvert    => m_fpRoundConvert,
            synthesize  => 1,
            ieeeoutput => 0,
            xoutput => 1
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                bb  => datab(41 DOWNTO 0),
                bbsat   => datab(42),
                bbzip   => datab(43),
                bbnan   => datab(44),
                
                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
            ccnan   => result(44)
            );
                  
END rtl;


--***************************************************
--*** fp_mult_dNorm_2_dIEEE                       ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_dNorm_2_dIEEE IS 
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
END fp_mult_dNorm_2_dIEEE;

ARCHITECTURE rtl OF fp_mult_dNorm_2_dIEEE IS
    signal ccsat : std_logic;
    signal cczip : std_logic;
    signal ccnan : std_logic;
BEGIN

  cmp: hcc_mulfp2x
  GENERIC MAP (
            synthesize  => 1,
            ieeeoutput => 1,
            xoutput => 0,
            device => deviceFamily(m_family)
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(66 DOWNTO 0),
                aasat   => dataa(67),
                aazip   => dataa(68),
                aanan   => dataa(69),
                
                bb  => datab(66 DOWNTO 0),
                bbsat   => datab(67),
                bbzip   => datab(68),
                bbnan   => datab(69),
                
                cc  => result(63 DOWNTO 0),
                ccsat   => ccsat,
                cczip   => cczip,
            ccnan   => ccnan
            );
             
END rtl;


--***************************************************
--*** fp_div_dNorm_2_dIEEE                        ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_div_dNorm_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END fp_div_dNorm_2_dIEEE;

ARCHITECTURE rtl OF fp_div_dNorm_2_dIEEE IS
    signal ccsat : std_logic;
    signal cczip : std_logic;
    signal ccnan : std_logic;
BEGIN

  cmp: hcc_divfp2x
  GENERIC MAP (
            synthesize  => 1,
            ieeeoutput => 1,
            xoutput => 0,
            divoutput => 0
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(66 DOWNTO 0),
                aasat   => dataa(67),
                aazip   => dataa(68),
                aanan   => dataa(69),
                
                bb  => datab(66 DOWNTO 0),
                bbsat   => datab(67),
                bbzip   => datab(68),
                bbnan   => datab(69),
                
                cc  => result(63 DOWNTO 0),
                ccsat   => ccsat,
                cczip   => cczip,
            ccnan   => ccnan
            );
             
END rtl;


--***************************************************
--*** fp_div_dNorm_2_dInternal                    ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_div_dNorm_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END fp_div_dNorm_2_dInternal;

ARCHITECTURE rtl OF fp_div_dNorm_2_dInternal IS
    signal ccsat : std_logic;
    signal cczip : std_logic;
    signal ccnan : std_logic;
BEGIN

  cmp: hcc_divfp2x
  GENERIC MAP (
            synthesize  => 1,
            ieeeoutput => 0,
            xoutput => 1,
            divoutput => 0
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(66 DOWNTO 0),
                aasat   => dataa(67),
                aazip   => dataa(68),
                aanan   => dataa(69),
                
                bb  => datab(66 DOWNTO 0),
                bbsat   => datab(67),
                bbzip   => datab(68),
                bbnan   => datab(69),
                
                cc  => result(76 DOWNTO 0),
                ccsat   => result(77),
                cczip   => result(78),
            ccnan   => result(79)
            );
             
END rtl;





--***************************************************
--*** fp_exp_sIEEE_2_sIEEE                          ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_exp_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_exp_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_exp_sIEEE_2_sIEEE IS

    signal nanOut : std_logic;
    signal overflowOut : std_logic;
    signal underflowOut : std_logic;
BEGIN

  cmp: fp_exp
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                
                nanOut => nanOut,
                overflowOut => overflowOut,
                underflowOut    => underflowOut
            );
                  
END rtl;


--***************************************************
--*** fp_log_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_log_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_log_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_log_sIEEE_2_sIEEE IS

    signal nanOut : std_logic;
    signal overflowOut : std_logic;
    signal zeroOut : std_logic;
BEGIN

  cmp: fp_log
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                
                nanOut => nanOut,
                overflowOut => overflowOut,
                zeroOut => zeroOut
            );
                  
END rtl;

--***************************************************
--*** fp_recip_sIEEE_2_sIEEE                          ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_recip_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_recip_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_recip_sIEEE_2_sIEEE IS

    signal nanOut : std_logic;
    signal invalidOut : std_logic;
    signal divideByZeroOut : std_logic;
BEGIN

  cmp: fp_inv
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                
                nanOut => nanOut,
                invalidOut => invalidOut,
                divideByZeroOut => divideByZeroOut
            );
                  
END rtl;


--***************************************************
--*** fp_recipSqRt_sIEEE_2_sIEEE                  ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_recipSqRt_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_recipSqRt_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_recipSqRt_sIEEE_2_sIEEE IS

    signal nanOut : std_logic;
    signal invalidOut : std_logic;
BEGIN

  cmp: fp_invsqr
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                
                nanOut => nanOut,
                invalidOut => invalidOut
            );
                  
END rtl;


--***************************************************
--*** fp_sin_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_sin_sIEEE_2_sIEEE IS 
GENERIC (m_family : string);
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_sin_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_sin_sIEEE_2_sIEEE IS
BEGIN
  cmp: fp_sin
    GENERIC MAP(device => deviceFamily(m_Family))
    PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
    
        signin => dataa(31),
        exponentin => dataa(30 downto 23),
        mantissain => dataa(22 downto 0),
    
        signout => result(31),
        exponentout => result(30 downto 23),
        mantissaout => result(22 downto 0)
    );
END rtl;

--***************************************************
--*** fp_cos_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_cos_sIEEE_2_sIEEE IS 
GENERIC (m_family : string);
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_cos_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_cos_sIEEE_2_sIEEE IS
BEGIN
  cmp: fp_cos
    GENERIC MAP(device => deviceFamily(m_Family))
    PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
    
        signin => dataa(31),
        exponentin => dataa(30 downto 23),
        mantissain => dataa(22 downto 0),
    
        signout => result(31),
        exponentout => result(30 downto 23),
        mantissaout => result(22 downto 0)
    );
END rtl;


--***************************************************
--*** fp_tan_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_tan_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_tan_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_tan_sIEEE_2_sIEEE IS
BEGIN

  cmp: fp_tan
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0)
            );
                  
END rtl;



--***************************************************
--*** fp_asin_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_asin_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_asin_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_asin_sIEEE_2_sIEEE IS
BEGIN

  cmp: fp_asin
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0)
            );
                  
END rtl;

--***************************************************
--*** fp_acos_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_acos_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_acos_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_acos_sIEEE_2_sIEEE IS
BEGIN

  cmp: fp_acos
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0)
            );
                  
END rtl;


--***************************************************
--*** fp_atan_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_atan_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_atan_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_atan_sIEEE_2_sIEEE IS
BEGIN

  cmp: fp_atan
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0)
            );
                  
END rtl;

--***************************************************
--*** fp_ldexp_sIEEE_2_sIEEE                      ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_ldexp_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_ldexp_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_ldexp_sIEEE_2_sIEEE IS
  SIGNAL sat : STD_LOGIC;
  SIGNAL zip : STD_LOGIC;
  SIGNAL nan : STD_LOGIC;
BEGIN

  cmp: fp_ldexp
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                bb => datab,
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                satout => sat,
                zeroout => zip,
                nanout => nan
            );
END rtl;

--***************************************************
--*** fp_ldexp_dIEEE_2_dIEEE                      ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_ldexp_dIEEE_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END fp_ldexp_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_ldexp_dIEEE_2_dIEEE IS
  SIGNAL sat : STD_LOGIC;
  SIGNAL zip : STD_LOGIC;
  SIGNAL nan : STD_LOGIC;
BEGIN

  cmp: dp_ldexp
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                bb => datab,
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                satout => sat,
                zeroout => zip,
                nanout => nan
            );
END rtl;



--***************************************************
--*** cast_sIEEE_2_sNorm                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sIEEE_2_sNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_sIEEE_2_sNorm;

ARCHITECTURE rtl OF cast_sIEEE_2_sNorm IS

    signal res : std_logic_vector (44 downto 0);
    signal as : std_logic;
    signal ae : std_logic_vector (7 downto 0);
    signal am : std_logic_vector (23 downto 0);
    signal re : std_logic_vector (9 downto 0);
    signal rm : std_logic_vector (31 downto 0);
    signal exp : INTEGER;
BEGIN

  cmp: hcc_castftox
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        mantissa => m_SingleMantissaWidth,      
        outputpipe => m_fpOutputPipe
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(31 DOWNTO 0),
                cc => res(41 DOWNTO 0),
                ccsat => res(42),
                cczip   => res(43),
                ccnan   => res(44)
            );
            
   result <= res;
   
   as <= dataa(31);
   ae <= dataa(30 downto 23);
   am <= '1' & dataa(22 downto 0);
   
   re <= res(9 downto 0);
   rm <= res(41 downto 10);
      
END rtl;


--***************************************************
--*** cast_sIEEE_2_sInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sIEEE_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_sIEEE_2_sInternal;

ARCHITECTURE rtl OF cast_sIEEE_2_sInternal IS
BEGIN

  cmp: hcc_castftox
  GENERIC MAP (
        target => 0,
        roundconvert => m_fpRoundConvert,
        mantissa => m_SingleMantissaWidth,      
        outputpipe => m_fpOutputPipe
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(31 DOWNTO 0),
                cc => result(41 DOWNTO 0),
                ccsat => result(42),
                cczip => result(43),
                ccnan => result(44)
            );
      
END rtl;

--***************************************************
--*** cast_sIEEE_2_dIEEE                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sIEEE_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END cast_sIEEE_2_dIEEE;

ARCHITECTURE rtl OF cast_sIEEE_2_dIEEE IS
component hcc_castftod IS          
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
end component;

BEGIN
  cmp: hcc_castftod
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
        aa => dataa(31 DOWNTO 0),
        cc => result(63 DOWNTO 0));
      
END rtl;

--***************************************************
--*** cast_dInternal_2_sIEEE                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dInternal_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END cast_dInternal_2_sIEEE;

ARCHITECTURE rtl OF cast_dInternal_2_sIEEE IS
BEGIN
      
  cmp: hcc_castytof
  GENERIC MAP (
        roundconvert => m_fpRoundConvert
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan   => dataa(79),

                cc  => result
            );
END rtl;


--***************************************************
--*** cast_dIEEE_2_sInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dIEEE_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_dIEEE_2_sInternal;

ARCHITECTURE rtl OF cast_dIEEE_2_sInternal IS
    signal mid : std_logic_vector (79 downto 0);
BEGIN

  cmp1: hcc_castdtoy
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        outputpipe => m_fpOutputPipe,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(63 DOWNTO 0),
                
                cc => mid(76 DOWNTO 0),
                ccsat => mid(77),
                cczip => mid(78),
                ccNAN => mid(79)
            );


  cmp2: hcc_castytox
  GENERIC MAP (
                roundconvert=>m_fpRoundConvert,
                mantissa=>m_SingleMantissaWidth)
  PORT MAP (
                sysclk=>clock,
                reset=>reset,
                enable=>clk_en,
                
                aa=>mid(76 DOWNTO 0),
                aasat=>mid(77),
                aazip=>mid(78),
                aanan=>mid(79),
            
                cc => result(41 DOWNTO 0),
                ccsat => result(42),
                cczip => result(43),
                ccnan => result(44)
            );

--  cmp: hcc_castdtox
--  GENERIC MAP (
--          target => 0,
--          roundconvert => m_fpRoundConvert,
--      mantissa => m_SingleMantissaWidth,      
--          doublespeed => m_fpDoubleSpeed
--                  )
--  PORT MAP (
--          sysclk => clock,
--          reset => reset,
--          enable => clk_en,
--            
--              aa => dataa(63 DOWNTO 0),
--              cc => result(41 DOWNTO 0),
--              ccsat => result(42),
--              cczip => result(43),
--              ccnan => result(44)
--            );
      
END rtl;


--***************************************************
--*** cast_sIEEE_2_dInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sIEEE_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END cast_sIEEE_2_dInternal;

ARCHITECTURE rtl OF cast_sIEEE_2_dInternal IS
BEGIN

  cmp: hcc_castftoy
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        mantissa => m_SingleMantissaWidth,      
        outputpipe => m_fpOutputPipe
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(31 DOWNTO 0),
                cc => result(76 DOWNTO 0),
                ccsat => result(77),
                cczip => result(78),
                ccnan => result(79)
            );
      
END rtl;


--***************************************************
--*** cast_sInternal_2_sNorm                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sInternal_2_sNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_sInternal_2_sNorm;

ARCHITECTURE rtl OF cast_sInternal_2_sNorm IS
BEGIN

  cmp: hcc_normfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        inputnormalize  => 1,
        roundnormalize  => 0,
        normspeed   => 2, --min(2, m_fpNormalisationSpeed), if 3 is used then zip pipeline is broken
                target      => 0                
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),

                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
                ccnan   => result(44)
            );

END rtl;

--***************************************************
--*** cast_sInternal_2_sIEEE                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sInternal_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END cast_sInternal_2_sIEEE;

ARCHITECTURE rtl OF cast_sInternal_2_sIEEE IS
BEGIN

  cmp: hcc_castxtof
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        normspeed   => 2 -- m_fpNormalisationSpeed
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),

                cc  => result(31 DOWNTO 0)
            );

END rtl;


--***************************************************
--*** cast_sNorm_2_sIEEE                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sNorm_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END cast_sNorm_2_sIEEE;

ARCHITECTURE rtl OF cast_sNorm_2_sIEEE IS
  signal x : STD_LOGIC_VECTOR(41 DOWNTO 0);
BEGIN

    -- truncation; no rounding
    x <= dataa(41) & dataa(41) & dataa(41) & dataa(41) & dataa(41 DOWNTO 14) & dataa(9 downto 0);

  cmp: hcc_castxtof
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        normspeed   => 2 --maximum 2 m_fpNormalisationSpeed
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            -- truncation; no rounding
        aa  => x,
        aasat   => dataa(42),
        aazip   => dataa(43),
        aanan   => dataa(44),
        cc  => result(31 DOWNTO 0)
      );

END rtl;

--***************************************************
--*** cast_sInternal_2_fixed                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sInternal_2_fixed IS 
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
  END cast_sInternal_2_fixed;

ARCHITECTURE rtl OF cast_sInternal_2_fixed IS
    signal mid : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  cmp: hcc_castxtof
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        normspeed   => 2 -- m_fpNormalisationSpeed
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
        aa  => dataa(41 DOWNTO 0),
        aasat   => dataa(42),
        aazip   => dataa(43),
        aanan   => dataa(44),

        cc  => mid(31 DOWNTO 0)
            );
            
  cmp1: dp_floatfix
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
        precision => 0,     -- single
        speed => 1                  
              )
    PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
  
        sign     => mid(31),
        exponent => mid(30 downto 23),
        mantissa => mid(22 downto 0),

        fixed_number    => result
             );

END rtl;

--***************************************************
--*** cast_sNorm_2_sInternal                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sNorm_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_sNorm_2_sInternal;

ARCHITECTURE rtl OF cast_sNorm_2_sInternal IS
BEGIN
    -- truncation; no rounding
    result <= dataa(44 DOWNTO 42) & dataa(41) & dataa(41) & dataa(41) & dataa(41) & dataa(41 DOWNTO 14) & dataa(9 downto 0);

END rtl;

--***************************************************
--*** cast_sInternal_2_dInternal                  ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sInternal_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END cast_sInternal_2_dInternal;

ARCHITECTURE rtl OF cast_sInternal_2_dInternal IS
BEGIN

  cmp: hcc_castxtoy
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth
              )
  PORT MAP (
            
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),

                cc  => result(76 DOWNTO 0),
                ccsat   => result(77),
                cczip   => result(78),
                ccnan   => result(79)
            );

END rtl;

--***************************************************
--*** cast_sNorm_2_fixed                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sNorm_2_fixed IS 
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
  END cast_sNorm_2_fixed;

ARCHITECTURE rtl OF cast_sNorm_2_fixed IS
    signal x : STD_LOGIC_VECTOR (41 DOWNTO 0);
    signal mid : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  -- truncation; no rounding
  x <= dataa(41) & dataa(41) & dataa(41) & dataa(41) & dataa(41 DOWNTO 14) & dataa(9 downto 0);

  cmp: hcc_castxtof
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,
        normspeed   => 2 -- m_fpNormalisationSpeed
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,

        aa  => x,
        aasat   => dataa(42),
        aazip   => dataa(43),
        aanan   => dataa(44),

        cc  => mid(31 DOWNTO 0)
            );
            
  cmp1: dp_floatfix
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
        precision => 0,     -- single
        speed => 1                  
              )
    PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
  
        sign     => mid(31),
        exponent => mid(30 downto 23),
        mantissa => mid(22 downto 0),

        fixed_number    => result
             );

END rtl;







--***************************************************
--***************************************************
--*** DOUBLE PRECISION                            ***
--***************************************************
--***************************************************

--***************************************************
--*** fp_addsub_dInternal_2_dInternal             ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_addsub_dInternal_2_dInternal IS
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
END fp_addsub_dInternal_2_dInternal;

ARCHITECTURE rtl OF fp_addsub_dInternal_2_dInternal IS
BEGIN

  cmp: hcc_alufp2x
  GENERIC MAP (
        shiftspeed  => m_fpShiftSpeed,
        doublespeed => m_fpDoubleSpeed,
        synthesize  => 1,
        addsub_resetval => addsub_resetval
          )
  PORT MAP (
        sysclk  => clock,
        reset   => reset,
        enable  => clk_en,
        addsub  => add_sub(0),

        aa  => dataa(76 DOWNTO 0),
        aasat   => dataa(77),
        aazip   => dataa(78),
        aanan  => dataa(79),
        bb  => datab(76 DOWNTO 0),
        bbsat   => datab(77),
        bbzip   => datab(78),
        bbnan => datab(79),
        cc  => result(76 DOWNTO 0),
        ccsat   => result(77),
        cczip   => result(78),
        ccnan => result(79));
  
END rtl;

--***************************************************
--*** fp_mult_dNorm_2_dInternal                   ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_mult_dNorm_2_dInternal IS 
GENERIC ( m_family : string );
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        datab :   IN STD_LOGIC_VECTOR (69 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END fp_mult_dNorm_2_dInternal;

ARCHITECTURE rtl OF fp_mult_dNorm_2_dInternal IS
BEGIN

  cmp: hcc_mulfp2x
  GENERIC MAP (
        ieeeoutput  => 0,
        xoutput     => 1,
        multoutput  => 0,
        device => deviceFamily(m_family),
        roundconvert    => m_fpRoundConvert,
        roundnormalize  => 0,
        doublespeed     => m_fpDoubleSpeed,
        outputpipe  => m_fpOutputPipe,
        synthesize  => 1
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
        
                aa  => dataa(66 DOWNTO 0),
                aasat   => dataa(67),
                aazip   => dataa(68),
                aanan   => dataa(69),
                
                bb  => datab(66 DOWNTO 0),
                bbsat   => datab(67),
                bbzip   => datab(68),
                bbnan   => datab(69),
                
                cc  => result(76 DOWNTO 0),
                ccsat   => result(77),
                cczip   => result(78),
                ccnan   => result(79)
            );

  
END rtl;


--***************************************************
--*** fp_exp_dIEEE_2_dIEEE                          ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_exp_dIEEE_2_dIEEE IS 
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
END fp_exp_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_exp_dIEEE_2_dIEEE IS

    signal nanOut : std_logic;
    signal overflowOut : std_logic;
    signal underflowOut : std_logic;
BEGIN

  cmp: dp_exp
  GENERIC MAP (
                 roundconvert => m_fpRoundConvert,
                 doubleaccuracy => 0,                  -- 0 = pruned multiplier, 1 = normal multiplier
                 doublespeed => m_fpDoubleSpeed,
                 device => deviceFamilyS3(m_family)		-- (0 = Stratix II, 1 = Stratix III/IV)
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                
                nanOut => nanOut,
                overflowOut => overflowOut,
                underflowOut    => underflowOut
            );
                  
END rtl;


--***************************************************
--*** fp_log_dIEEE_2_dIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_log_dIEEE_2_dIEEE IS 
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
END fp_log_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_log_dIEEE_2_dIEEE IS

    signal nanOut : std_logic;
    signal overflowOut : std_logic;
    signal zeroOut : std_logic;
BEGIN

  cmp: dp_log
  GENERIC MAP (
                 roundconvert => m_fpRoundConvert,
                 doublespeed => m_fpDoubleSpeed,
                 device => deviceFamilyS3(m_family)		-- (0 = Stratix II, 1 = Stratix III/IV)
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                
                nanOut => nanOut,
                overflowOut => overflowOut,
                zeroOut => zeroOut
            );
                  
END rtl;

--***************************************************
--*** fp_recip_dIEEE_2_dIEEE                          ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_recip_dIEEE_2_dIEEE IS 
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
END fp_recip_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_recip_dIEEE_2_dIEEE IS

    signal nanOut : std_logic;
    signal invalidOut : std_logic;
    signal divideByZeroOut : std_logic;
BEGIN

  cmp: dp_inv
  GENERIC MAP (
                 roundconvert => m_fpRoundConvert,
                 doubleaccuracy => 0,                  -- 0 = pruned multiplier, 1 = normal multiplier
                 doublespeed => m_fpDoubleSpeed,
                 device => deviceFamilyS3(m_family)		-- (0 = Stratix II, 1 = Stratix III/IV)
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                
                nanOut => nanOut,
                invalidOut => invalidOut,
                divideByZeroOut => divideByZeroOut
            );
                  
END rtl;


--***************************************************
--*** fp_recipSqRt_dIEEE_2_dIEEE                          ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_recipSqRt_dIEEE_2_dIEEE IS 
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
END fp_recipSqRt_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_recipSqRt_dIEEE_2_dIEEE IS

    signal nanOut : std_logic;
    signal invalidOut : std_logic;
BEGIN

  cmp: dp_invsqr
  GENERIC MAP (
                 doubleaccuracy => 0,                  -- 0 = pruned multiplier, 1 = normal multiplier
                 doublespeed => m_fpDoubleSpeed,
                 device => deviceFamilyS3(m_family)		-- (0 = Stratix II, 1 = Stratix III/IV)
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                
                nanOut => nanOut,
                invalidOut => invalidOut
            );
                  
END rtl;













--***************************************************
--*** cast_dIEEE_2_dNorm                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dIEEE_2_dNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (69 DOWNTO 0)
     );
END cast_dIEEE_2_dNorm;

ARCHITECTURE rtl OF cast_dIEEE_2_dNorm IS
BEGIN

  cmp: hcc_castdtoy
  GENERIC MAP (
        target => 0,
        roundconvert => m_fpRoundConvert,
        outputpipe => m_fpOutputPipe,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(63 DOWNTO 0),
                cc => result(66 DOWNTO 0),
                ccsat => result(67),
                cczip => result(68)
            );
            
  result(69) <= '0';        -- no nan

END rtl;


--***************************************************
--*** cast_dIEEE_2_dInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dIEEE_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END cast_dIEEE_2_dInternal;

ARCHITECTURE rtl OF cast_dIEEE_2_dInternal IS
BEGIN

  cmp: hcc_castdtoy
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        outputpipe => m_fpOutputPipe,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => dataa(63 DOWNTO 0),
                cc => result(76 DOWNTO 0),
                ccsat => result(77),
                cczip => result(78),
                ccNAN => result(79)
            );

END rtl;


--***************************************************
--*** cast_dInternal_2_dNorm                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dInternal_2_dNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (69 DOWNTO 0)
     );
END cast_dInternal_2_dNorm;

ARCHITECTURE rtl OF cast_dInternal_2_dNorm IS
BEGIN

  cmp: hcc_normfp2x
  GENERIC MAP (
        roundconvert => m_fpRoundConvert,
        roundnormalize => 0,
        normspeed => m_fpNormalisationSpeed,
                doublespeed => m_fpDoubleSpeed,
                target => 0,
                synthesize => 1                 
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan => dataa(79),

                cc  => result(66 DOWNTO 0),
                ccsat   => result(67),
                cczip   => result(68),
                ccnan   => result(69)
            );

END rtl;

--***************************************************
--*** cast_dInternal_2_dIEEE                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dInternal_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END cast_dInternal_2_dIEEE;

ARCHITECTURE rtl OF cast_dInternal_2_dIEEE IS
BEGIN

  cmp: hcc_castytod
  GENERIC MAP (
        roundconvert => m_fpRoundConvert,
        normspeed => m_fpNormalisationSpeed,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1                 
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan => dataa(79),

                cc  => result(63 DOWNTO 0)
            );

END rtl;


--***************************************************
--*** cast_fixed_2_sNorm                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_fixed_2_sNorm IS 
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
END cast_fixed_2_sNorm;

ARCHITECTURE rtl OF cast_fixed_2_sNorm IS
  signal ccsign : STD_LOGIC;
  signal ccexponent : STD_LOGIC_VECTOR (7 DOWNTO 0);
  signal ccmantissa : STD_LOGIC_VECTOR (22 DOWNTO 0);
  signal res : STD_LOGIC_VECTOR (44 DOWNTO 0);
  signal ccIEEE : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  -- Firstly, convert integer to SIEEE
  cmp1: dp_fixfloat
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 0,     -- single
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                fixed_number    => dataa,

                sign     => ccsign,
                exponent => ccexponent,
                mantissa => ccmantissa
            );
            
  ccIEEE <= ccsign & ccexponent & ccmantissa;
  
  -- then convert that to sNorm
  cmp2: hcc_castftox
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        mantissa => m_SingleMantissaWidth,      
        outputpipe => m_fpOutputPipe
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => ccIEEE,
                cc => res(41 DOWNTO 0),
                ccsat => res(42),
                cczip   => res(43),
                ccnan   => res(44)
            );
            
   result <= res;
            
END rtl;

--***************************************************
--*** cast_fixed_2_sInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_fixed_2_sInternal IS 
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
END cast_fixed_2_sInternal;

ARCHITECTURE rtl OF cast_fixed_2_sInternal IS
  signal ccsign : STD_LOGIC;
  signal ccexponent : STD_LOGIC_VECTOR (7 DOWNTO 0);
  signal ccmantissa : STD_LOGIC_VECTOR (22 DOWNTO 0);
  signal res : STD_LOGIC_VECTOR (44 DOWNTO 0);
  signal ccIEEE : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  -- Firstly, convert integer to SIEEE
  cmp1: dp_fixfloat
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 0,     -- single
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                fixed_number    => dataa,

                sign     => ccsign,
                exponent => ccexponent,
                mantissa => ccmantissa
            );
            
  ccIEEE <= ccsign & ccexponent & ccmantissa;
  
  -- then convert that to sInternal
  cmp2: hcc_castftox
  GENERIC MAP (
        target => 0,
        roundconvert => m_fpRoundConvert,
        mantissa => m_SingleMantissaWidth,      
        outputpipe => m_fpOutputPipe
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => ccIEEE,
                cc => res(41 DOWNTO 0),
                ccsat => res(42),
                cczip   => res(43),
                ccnan   => res(44)
            );
            
   result <= res;
            
END rtl;


--***************************************************
--*** cast_fixed_2_sIEEE                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_fixed_2_sIEEE IS 
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
END cast_fixed_2_sIEEE;

ARCHITECTURE rtl OF cast_fixed_2_sIEEE IS
  signal ccsign : STD_LOGIC;
  signal ccexponent : STD_LOGIC_VECTOR (7 DOWNTO 0);
  signal ccmantissa : STD_LOGIC_VECTOR (22 DOWNTO 0);
BEGIN

  cmp1: dp_fixfloat
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 0,     -- single
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                fixed_number    => dataa,

                sign     => ccsign,
                exponent => ccexponent,
                mantissa => ccmantissa
            );
            
  result <= ccsign & ccexponent & ccmantissa;
             
END rtl;


--***************************************************
--*** cast_fixed_2_dIEEE                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_fixed_2_dIEEE IS 
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
END cast_fixed_2_dIEEE;

ARCHITECTURE rtl OF cast_fixed_2_dIEEE IS
  signal ccsign : STD_LOGIC;
  signal ccexponent : STD_LOGIC_VECTOR (10 DOWNTO 0);
  signal ccmantissa : STD_LOGIC_VECTOR (51 DOWNTO 0);
BEGIN

  cmp1: dp_fixfloat
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 1,     -- double
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                fixed_number    => dataa,

                sign     => ccsign,
                exponent => ccexponent,
                mantissa => ccmantissa
            );
            
  result <= ccsign & ccexponent & ccmantissa;
             
END rtl;

--***************************************************
--*** cast_sIEEE_2_fixed                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_sIEEE_2_fixed IS 
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
END cast_sIEEE_2_fixed;

ARCHITECTURE rtl OF cast_sIEEE_2_fixed IS
BEGIN

  cmp1: dp_floatfix
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 0,     -- single
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,

                sign     => dataa(31),
                exponent => dataa(30 downto 23),
                mantissa => dataa(22 downto 0),
            
                fixed_number    => result
            );
            
END rtl;

--***************************************************
--*** cast_dIEEE_2_fixed                          ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dIEEE_2_fixed IS 
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
END cast_dIEEE_2_fixed;

ARCHITECTURE rtl OF cast_dIEEE_2_fixed IS
BEGIN

  cmp1: dp_floatfix
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 1,     -- double
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,

                sign     => dataa(63),
                exponent => dataa(62 downto 52),
                mantissa => dataa(51 downto 0),
            
                fixed_number    => result
            );
            
END rtl;

--***************************************************
--*** cast_dInternal_2_fixed                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dInternal_2_fixed IS 
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
END cast_dInternal_2_fixed;

ARCHITECTURE rtl OF cast_dInternal_2_fixed IS
  signal mid : STD_LOGIC_VECTOR (63 DOWNTO 0);
BEGIN

  cmp: hcc_castytod
  GENERIC MAP (
        roundconvert => m_fpRoundConvert,
        normspeed => m_fpNormalisationSpeed,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1                 
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan => dataa(79),

                cc  => mid(63 DOWNTO 0)
            );

  cmp1: dp_floatfix
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 1,     -- double
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,

                sign     => mid(63),
                exponent => mid(62 downto 52),
                mantissa => mid(51 downto 0),
            
                fixed_number    => result
            );
            
END rtl;

--***************************************************
--*** cast_fixed_2_dInternal                      ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_fixed_2_dInternal IS 
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
END cast_fixed_2_dInternal;

ARCHITECTURE rtl OF cast_fixed_2_dInternal IS
  signal ccsign : STD_LOGIC;
  signal ccexponent : STD_LOGIC_VECTOR (10 DOWNTO 0);
  signal ccmantissa : STD_LOGIC_VECTOR (51 DOWNTO 0);
  signal res : STD_LOGIC_VECTOR (79 DOWNTO 0);
  signal ccIEEE : STD_LOGIC_VECTOR (63 DOWNTO 0);
BEGIN

  -- Firstly, convert integer to dIEEE
  cmp1: dp_fixfloat
  GENERIC MAP (
        unsigned => unsigned,
        decimal => iWidth,
        fractional => fWidth,
                precision => 1,     -- double
                speed => 1                  
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                fixed_number    => dataa,

                sign     => ccsign,
                exponent => ccexponent,
                mantissa => ccmantissa
            );
            
  ccIEEE <= ccsign & ccexponent & ccmantissa;
  
  -- then convert that to dInternal            
  cmp: hcc_castdtoy
  GENERIC MAP (
        target => 1,
        roundconvert => m_fpRoundConvert,
        outputpipe => m_fpOutputPipe,
                doublespeed => m_fpDoubleSpeed,
                synthesize => 1
                )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa => ccIEEE,
                cc => result(76 DOWNTO 0),
                ccsat => result(77),
                cczip => result(78),
                ccNAN => result(79)
            );

END rtl;

--***************************************************
--*** cast_dInternal_2_sInternal                  ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY cast_dInternal_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END cast_dInternal_2_sInternal;

ARCHITECTURE rtl OF cast_dInternal_2_sInternal IS
BEGIN

  cmp: hcc_castytox
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth
              )
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan   => dataa(79),

                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
                ccnan   => result(44)
            );

END rtl;


--***************************************************
--*** fp_abs_sIEEE_2_sIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_abs_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_abs_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_abs_sIEEE_2_sIEEE IS
  signal nanOut : STD_LOGIC;
  signal satOut : STD_LOGIC;
  signal zeroOut : STD_LOGIC;
BEGIN

  cmp: fp_fabs
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(31),
                exponentin => dataa(30 downto 23),
                mantissain => dataa(22 downto 0),
                
                signout => result(31),
                exponentout => result(30 downto 23),
                mantissaout => result(22 downto 0),
                
                nanOut => nanOut,
                satOut => satOut,
                zeroOut => zeroOut
            );
 END rtl;

--***************************************************
--*** fp_abs_dIEEE_2_dIEEE                        ***
--***************************************************


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
USE STD.TEXTIO.ALL;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_abs_dIEEE_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END fp_abs_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_abs_dIEEE_2_dIEEE IS
  signal nanOut : STD_LOGIC;
  signal satOut : STD_LOGIC;
  signal zeroOut : STD_LOGIC;
BEGIN
  cmp: dp_fabs
  PORT MAP (
        sysclk => clock,
        reset => reset,
        enable => clk_en,
            
                signin => dataa(63),
                exponentin => dataa(62 downto 52),
                mantissain => dataa(51 downto 0),
                
                signout => result(63),
                exponentout => result(62 downto 52),
                mantissaout => result(51 downto 0),
                
                nanOut => nanOut,
                satOut => satOut,
                zeroOut => zeroOut
            );
END rtl;

--***************************************************
--*** fp_norm_sInternal_2_sInternal               ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_norm_sInternal_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_norm_sInternal_2_sInternal;

ARCHITECTURE rtl OF fp_norm_sInternal_2_sInternal IS
BEGIN

  cmp: hcc_normfp1x
  GENERIC MAP (
        mantissa    => m_SingleMantissaWidth,       -- TODO: add support for 36-bit mantissa too
        target          => 2 -- adder
          )
  PORT MAP (
        sysclk  => clock,
        reset   => reset,
        enable  => clk_en,
                
                aa  => dataa(41 DOWNTO 0),
                aasat   => dataa(42),
                aazip   => dataa(43),
                aanan   => dataa(44),
                
                cc  => result(41 DOWNTO 0),
                ccsat   => result(42),
                cczip   => result(43),
                ccnan   => result(44)
            );
  
END rtl;


--***************************************************
--*** fp_norm_dInternal_2_dInternal               ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
USE ieee.math_real.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_norm_dInternal_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END fp_norm_dInternal_2_dInternal;

ARCHITECTURE rtl OF fp_norm_dInternal_2_dInternal IS
BEGIN

  cmp: hcc_normfp2x
  GENERIC MAP (
                doublespeed     => m_fpDoubleSpeed,
        target          => 1 -- internal
          )
  PORT MAP (
        sysclk  => clock,
        reset   => reset,
        enable  => clk_en,
                
                aa  => dataa(76 DOWNTO 0),
                aasat   => dataa(77),
                aazip   => dataa(78),
                aanan   => dataa(79),
                
                cc  => result(76 DOWNTO 0),
                ccsat   => result(77),
                cczip   => result(78),
                ccnan   => result(79)
            );
  
END rtl;


--***************************************************
--*** fp_negate_sIEEE_2_sIEEE                     ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_sIEEE_2_sIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
     );
END fp_negate_sIEEE_2_sIEEE;

ARCHITECTURE rtl OF fp_negate_sIEEE_2_sIEEE IS
BEGIN

  result <= (not dataa(31)) & dataa(30 downto 0); -- flip sign
      
END rtl;


--***************************************************
--*** fp_negate_sNorm_2_sNorm                     ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_unsigned.all;
--USE ieee.std_logic_arith.all; 
use IEEE.NUMERIC_STD.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_sNorm_2_sNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_negate_sNorm_2_sNorm;

ARCHITECTURE rtl OF fp_negate_sNorm_2_sNorm IS
  signal oMant : STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal oExp  : STD_LOGIC_VECTOR ( 9 DOWNTO 0);
  signal oFlags: STD_LOGIC_VECTOR ( 2 DOWNTO 0);
BEGIN

  oMant <= not(dataa(41 DOWNTO 10));-- 1's complement
  oExp <= dataa(9 DOWNTO 0);
  oFlags <= dataa(44 downto 42);
  
  result <= oFlags & oMant & oExp;

END rtl;


--***************************************************
--*** fp_negate_sInternal_2_sInternal             ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_unsigned.all;
--USE ieee.std_logic_arith.all; 
use IEEE.NUMERIC_STD.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_sInternal_2_sInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (44 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (44 DOWNTO 0)
     );
END fp_negate_sInternal_2_sInternal;

ARCHITECTURE rtl OF fp_negate_sInternal_2_sInternal IS
  signal oMant : STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal oExp  : STD_LOGIC_VECTOR ( 9 DOWNTO 0);
  signal oFlags: STD_LOGIC_VECTOR ( 2 DOWNTO 0);
BEGIN

  oMant <= not(dataa(41 DOWNTO 10));-- 1's complement
  oExp <= dataa(9 DOWNTO 0);
  oFlags <= dataa(44 downto 42);
  
  result <= oFlags & oMant & oExp;

END rtl;

--***************************************************
--*** fp_negate_dIEEE_2_dIEEE                     ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_dIEEE_2_dIEEE IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
     );
END fp_negate_dIEEE_2_dIEEE;

ARCHITECTURE rtl OF fp_negate_dIEEE_2_dIEEE IS
BEGIN

  result <= (not dataa(63)) & dataa(62 downto 0); -- flip sign
      
END rtl;


--***************************************************
--*** fp_negate_dNorm_2_dNorm                     ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_unsigned.all;
--USE ieee.std_logic_arith.all; 
use IEEE.NUMERIC_STD.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_dNorm_2_dNorm IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END fp_negate_dNorm_2_dNorm;

ARCHITECTURE rtl OF fp_negate_dNorm_2_dNorm IS
  signal oMant : STD_LOGIC_VECTOR (63 DOWNTO 0);
  signal oExp  : STD_LOGIC_VECTOR (12 DOWNTO 0);
  signal oFlags: STD_LOGIC_VECTOR ( 2 DOWNTO 0);
BEGIN

  oMant <= not(dataa(76 DOWNTO 13));-- 1's complement
  oExp <= dataa(12 DOWNTO 0);
  oFlags <= dataa(79 downto 77);
  
  result <= oFlags & oMant & oExp;

END rtl;


--***************************************************
--*** fp_negate_dInternal_2_dInternal             ***
--***************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_unsigned.all;
--USE ieee.std_logic_arith.all; 
use IEEE.NUMERIC_STD.all;
LIBRARY lpm;
USE lpm.all;

USE work.hcc_package.all;
USE work.math_package.all;
USE work.fpc_library_package.all;

ENTITY fp_negate_dInternal_2_dInternal IS 
PORT (
        clock :   IN STD_LOGIC;
        reset :   IN STD_LOGIC;
        clk_en :  IN STD_LOGIC;
        dataa :   IN STD_LOGIC_VECTOR (79 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 0)
     );
END fp_negate_dInternal_2_dInternal;

ARCHITECTURE rtl OF fp_negate_dInternal_2_dInternal IS
  signal oMant : STD_LOGIC_VECTOR (63 DOWNTO 0);
  signal oExp  : STD_LOGIC_VECTOR (12 DOWNTO 0);
  signal oFlags: STD_LOGIC_VECTOR ( 2 DOWNTO 0);
BEGIN

  oMant <= not(dataa(76 DOWNTO 13));-- 1's complement
  oExp <= dataa(12 DOWNTO 0);
  oFlags <= dataa(79 downto 77);
  
  result <= oFlags & oMant & oExp;

END rtl;



