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
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   HCC_MA2_27Ux27S_L2.VHD                    ***
--***                                             ***
--***   Function: Sum-of-2 27x27 mixed sign       ***
--***                                             ***
--***  2012-04-05 SPF                             ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** NOTES                                       ***
--***************************************************

--*** Calculates a0*b0 + a1*b1 using 2 pipeline cycles.
--*** Designed for use with Variable Precision DSP block.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hcc_MA2_27Ux27S_L2 IS
    GENERIC
    (
        widthaa : positive := 27;
        widthbb : positive := 27;
        widthcc : positive := 55
    );
    PORT
    (
        aclr    : IN STD_LOGIC  := '0';
        clk     : IN STD_LOGIC  := '1';
        a0      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        a1      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        b0      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        b1      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        en      : IN STD_LOGIC  := '1';
        result  : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
    );
END hcc_MA2_27Ux27S_L2;

architecture rtl of hcc_MA2_27Ux27S_L2 is
    constant PROD_WIDTH : positive := widthaa + widthbb + 1;
    constant SUM2_WIDTH : positive := PROD_WIDTH + 1;

    signal a0_reg, a1_reg : signed(widthaa+1 downto 1);
    signal b0_reg, b1_reg : signed(widthbb downto 1);
    signal p0_res, p1_res : signed(SUM2_WIDTH downto 1);
    signal s1_reg : signed(SUM2_WIDTH downto 1);
begin
    -- first DSP block
    p0_res <= RESIZE(a0_reg * b0_reg,SUM2_WIDTH);
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a0_reg <= (OTHERS => '0');
            b0_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a0_reg <= SIGNED('0' & a0);
                b0_reg <= SIGNED(b0);
            end if;
        END IF;
    END PROCESS;

    -- second DSP block
    p1_res <= RESIZE(a1_reg * b1_reg,SUM2_WIDTH);
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a1_reg <= (OTHERS => '0');
            b1_reg <= (OTHERS => '0');
            s1_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a1_reg <= SIGNED('0' & a1);
                b1_reg <= SIGNED(b1);
                s1_reg <= p0_res + p1_res;
            end if;
        END IF;
    END PROCESS;

    result <= STD_LOGIC_VECTOR(RESIZE(s1_reg,widthcc));
end rtl;
--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   HCC_MA2_27Ux27U_L2.VHD                    ***
--***                                             ***
--***   Function: Sum-of-2 27x27 unsigned         ***
--***                                             ***
--***  2012-04-05 SPF                             ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** NOTES                                       ***
--***************************************************

--*** Calculates a0*b0 + a1*b1 using 2 pipeline cycles.
--*** Designed for use with Variable Precision DSP block.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hcc_MA2_27Ux27U_L2 IS
    GENERIC
    (
        widthaa : positive := 27;
        widthbb : positive := 27;
        widthcc : positive := 55
    );
    PORT
    (
        aclr    : IN STD_LOGIC  := '0';
        clk     : IN STD_LOGIC  := '1';
        a0      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        a1      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        b0      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        b1      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        en      : IN STD_LOGIC  := '1';
        result  : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
    );
END hcc_MA2_27Ux27U_L2;

architecture rtl of hcc_MA2_27Ux27U_L2 is
    constant PROD_WIDTH : positive := widthaa + widthbb;
    constant SUM2_WIDTH : positive := PROD_WIDTH + 1;

    signal a0_reg, a1_reg : unsigned(widthaa downto 1);
    signal b0_reg, b1_reg : unsigned(widthbb downto 1);
    signal p0_res, p1_res : unsigned(SUM2_WIDTH downto 1);
    signal s1_reg : unsigned(SUM2_WIDTH downto 1);
begin
    -- first DSP block
    p0_res <= RESIZE(a0_reg * b0_reg,SUM2_WIDTH);
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a0_reg <= (OTHERS => '0');
            b0_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a0_reg <= UNSIGNED(a0);
                b0_reg <= UNSIGNED(b0);
            end if;
        END IF;
    END PROCESS;

    -- second DSP block
    p1_res <= RESIZE(a1_reg * b1_reg,SUM2_WIDTH);
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a1_reg <= (OTHERS => '0');
            b1_reg <= (OTHERS => '0');
            s1_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a1_reg <= UNSIGNED(a1);
                b1_reg <= UNSIGNED(b1);
                s1_reg <= p0_res + p1_res;
            end if;
        END IF;
    END PROCESS;

    result <= STD_LOGIC_VECTOR(RESIZE(s1_reg,widthcc));
end rtl;
--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   HCC_MA2_27Ux27U_L3.VHD                    ***
--***                                             ***
--***   Function: Sum-of-2 27x27 unsigned         ***
--***                                             ***
--***  2012-04-05 SPF                             ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** NOTES                                       ***
--***************************************************

--*** Calculates a0*b0 + a1*b1 using 3 pipeline cycles.
--*** Designed for use with Variable Precision DSP block.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hcc_MA2_27Ux27U_L3 IS
    GENERIC
    (
        widthaa : positive := 27;
        widthbb : positive := 27;
        widthcc : positive := 55
    );
    PORT
    (
        aclr    : IN STD_LOGIC  := '0';
        clk     : IN STD_LOGIC  := '1';
        a0      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        a1      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1) := (OTHERS => '0');
        b0      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        b1      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1) := (OTHERS => '0');
        en      : IN STD_LOGIC  := '1';
        result  : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
    );
END hcc_MA2_27Ux27U_L3;

architecture rtl of hcc_MA2_27Ux27U_L3 is
    constant PROD_WIDTH : positive := widthaa+widthbb;
    constant SUM2_WIDTH : positive := PROD_WIDTH + 1;

    signal a0_reg, a1_reg, a1_del_reg : unsigned(widthaa downto 1);
    signal b0_reg, b1_reg, b1_del_reg : unsigned(widthbb downto 1);
    signal p0_reg, p1_res : unsigned(SUM2_WIDTH downto 1);
    signal s1_reg : unsigned(SUM2_WIDTH downto 1);
begin
    -- external registers to match pipeline delay
    process (clk, aclr)
    begin
        if (aclr = '1') then
            a1_del_reg <= (others => '0');
            b1_del_reg <= (others => '0');
        elsif (rising_edge(clk)) then
            if (en = '1') then
                a1_del_reg <= UNSIGNED(a1);
                b1_del_reg <= UNSIGNED(b1);
            end if;
        end if;
    end process;

    -- first DSP block
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a0_reg <= (OTHERS => '0');
            b0_reg <= (OTHERS => '0');
            p0_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a0_reg <= UNSIGNED(a0);
                b0_reg <= UNSIGNED(b0);
                p0_reg <= RESIZE(a0_reg * b0_reg,SUM2_WIDTH);
            end if;
        END IF;
    END PROCESS;

    -- second DSP block
    p1_res <= RESIZE(a1_reg * b1_reg,SUM2_WIDTH);
    PROCESS (clk, aclr)
    BEGIN
        IF (aclr = '1') THEN
            a1_reg <= (OTHERS => '0');
            b1_reg <= (OTHERS => '0');
            s1_reg <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            if (en = '1') then
                a1_reg <= a1_del_reg;
                b1_reg <= b1_del_reg;
                s1_reg <= p0_reg + p1_res;
            end if;
        END IF;
    END PROCESS;

    result <= STD_LOGIC_VECTOR(RESIZE(s1_reg,widthcc));
end rtl;

LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ADDPIPEB.VHD                          ***
--***                                             ***
--***   Function: Behavioral Pipelined Adder      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_addpipeb IS
GENERIC (
         width : positive := 64;
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      carryin : IN STD_LOGIC;
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END hcc_addpipeb;

ARCHITECTURE rtl of hcc_addpipeb IS

  type pipefftype IS ARRAY (pipes DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  
  signal delff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal pipeff : pipefftype;
  signal ccnode : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal zerovec : STD_LOGIC_VECTOR (width-1 DOWNTO 1);

BEGIN
  
  gza: FOR k IN 1 TO width-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  ccnode <= aa + bb + (zerovec & carryin);
  
  gda: IF (pipes = 1) GENERATE
  
    pda: PROCESS (sysclk,reset)
    BEGIN

      IF (reset = '1') THEN
    
        FOR k IN 1 TO width LOOP
          delff(k) <= '0';
        END LOOP;
     
      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN   
          delff <= ccnode;
        END IF;

      END IF;

    END PROCESS;
    
    cc <= delff;
    
  END GENERATE;
  
  gpa: IF (pipes > 1) GENERATE
  
    ppa: PROCESS (sysclk,reset)
    BEGIN

      IF (reset = '1') THEN
        
        FOR k IN 1 TO pipes LOOP 
          FOR j IN 1 TO width LOOP
            pipeff(k)(j) <= '0';
          END LOOP;
        END LOOP;
   
      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN   
          pipeff(1)(width DOWNTO 1) <= ccnode;
          FOR k IN 2 TO pipes LOOP
            pipeff(k)(width DOWNTO 1) <= pipeff(k-1)(width DOWNTO 1);
          END LOOP;
        END IF;

      END IF;

    END PROCESS;

    cc <= pipeff(pipes)(width DOWNTO 1);
          
  END GENERATE;
  
END rtl;


LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ADDPIPES.VHD                          ***
--***                                             ***
--***   Function: Synthesizable Pipelined Adder   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_addpipes IS
GENERIC (
         width : positive := 64;
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      carryin : IN STD_LOGIC;
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END hcc_addpipes;

ARCHITECTURE syn of hcc_addpipes IS

  component lpm_add_sub
  GENERIC (
		     lpm_direction		: STRING;
		     lpm_hint		: STRING;
		     lpm_pipeline		: NATURAL;
		     lpm_type		: STRING;
		     lpm_width		: NATURAL
	       );
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0);
			cin	: IN STD_LOGIC ;
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0)
	     );
  end component;

BEGIN
  
  addtwo: lpm_add_sub
  GENERIC MAP (
		       lpm_direction => "ADD",
		       lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES",
		       lpm_pipeline => pipes,
		       lpm_type => "LPM_ADD_SUB",
		       lpm_width => width
	           )
  PORT MAP (
  		    dataa => aa,
		    datab => bb,
		    cin => carryin,
		    clken => enable,
		    aclr => reset,
		    clock => sysclk,
		    result => cc
	       );  
  
END syn;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP1_DOT.VHD                        ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   Adder (Signed Magnitude for first level   ***
--***   Vector Optimized Structure)               ***
--***                                             ***
--***   15/10/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--*** TBD - what if exponents negative ***

ENTITY hcc_alufp1_dot IS 
GENERIC (
         mantissa : positive := 32;
         shiftspeed : integer := 0;
         outputpipe : integer := 1; -- 0 = no pipe, 1 = pipe (for this function only - input, not output pipes affected)
         addsub_resetval : std_logic
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_alufp1_dot;

ARCHITECTURE rtl OF hcc_alufp1_dot IS
  
  type exponentbasefftype IS ARRAY (3+shiftspeed DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  -- input registers and nodes
  signal aasignff, bbsignff : STD_LOGIC;
  signal aamantissaff, bbmantissaff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexponentff, bbexponentff : STD_LOGIC_VECTOR (10 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal aananff, bbnanff : STD_LOGIC; 
  signal addsubff : STD_LOGIC;
  signal aasignnode, bbsignnode : STD_LOGIC;
  signal aamantissanode, bbmantissanode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexponentnode, bbexponentnode : STD_LOGIC_VECTOR (10 DOWNTO 1); 
  signal aasatnode, aazipnode, bbsatnode, bbzipnode : STD_LOGIC;
  signal aanannode, bbnannode : STD_LOGIC;  
  signal addsubnode : STD_LOGIC;
  
  signal mantissaleftff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissarightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissaleftdelayff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal exponentshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exponentbaseff : exponentbasefftype;
  signal invertleftff, invertrightff : STD_LOGIC_VECTOR (2+shiftspeed DOWNTO 1);
  signal shiftcheckff, shiftcheckdelayff : STD_LOGIC;
  signal aluleftff, alurightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1);

  signal mantissaleftnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal zeroaluright : STD_LOGIC;
  signal aluleftnode, alurightnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal alucarrybitnode : STD_LOGIC;    
  signal subexponentone, subexponenttwo : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal shiftcheck : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal shiftcheckbit : STD_LOGIC;
  signal shiftbusnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  component hcc_rsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftpipe36 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftcomb36 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;
    
BEGIN

  pin: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      aasignff <= '0';
      bbsignff <= '0';
      FOR k IN 1 TO mantissa LOOP 
        aamantissaff(k) <= '0';
        bbmantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP 
        aaexponentff(k) <= '0';
        bbexponentff(k) <= '0';
      END LOOP;
      aasatff <= '0';
	  bbsatff <= '0';
      aazipff <= '0';
	  bbzipff <= '0';
      aananff <= '0';
	  bbnanff <= '0';
      addsubff <= addsub_resetval;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN

        aasignff <= aa(mantissa+10);
        bbsignff <= bb(mantissa+10);
        aamantissaff <= '0'& aa(mantissa+9 DOWNTO 11);
        bbmantissaff <= '0'& bb(mantissa+9 DOWNTO 11);
        aaexponentff <= aa(10 DOWNTO 1);
        bbexponentff <= bb(10 DOWNTO 1);
        aasatff <= aasat;
        bbsatff <= bbsat;
        aazipff <= aazip;
        bbzipff <= bbzip;
        aananff <= aanan;
        bbnanff <= bbnan;
        addsubff <= addsub;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gina: IF (outputpipe = 1) GENERATE
    aasignnode <= aasignff;
    aamantissanode <= aamantissaff;
    aaexponentnode <= aaexponentff;
    bbsignnode <= bbsignff;
    bbmantissanode <= bbmantissaff;
    bbexponentnode <= bbexponentff;
    aasatnode <= aasatff;
    bbsatnode <= bbsatff;
    aazipnode <= aazipff;
    bbzipnode <= bbzipff;
    aanannode <= aananff;
    bbnannode <= bbnanff;
    addsubnode <= addsubff;
  END GENERATE;

  ginb: IF (outputpipe = 0) GENERATE
    aasignnode <= aa(mantissa+10);
    bbsignnode <= bb(mantissa+10);
    aamantissanode <= '0'& aa(mantissa+9 DOWNTO 11);
    bbmantissanode <= '0'& bb(mantissa+9 DOWNTO 11);
    aaexponentnode <= aa(10 DOWNTO 1);
    bbexponentnode <= bb(10 DOWNTO 1);
    aasatnode <= aasat;
    bbsatnode <= bbsat;
    aazipnode <= aazip;
    bbzipnode <= bbzip;
    aanannode <= aanan;
    bbnannode <= bbnan;
    addsubnode <= addsub;
  END GENERATE;
  
    paa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN

        FOR k IN 1 TO mantissa LOOP
          mantissaleftff(k) <= '0';
          mantissarightff(k) <= '0';
          mantissaleftdelayff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          exponentshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          FOR j IN 1 TO 10 LOOP
            exponentbaseff(k)(j) <= '0';
          END LOOP;
        END LOOP;
        FOR k IN 1 TO 2+shiftspeed LOOP
          invertleftff(k) <= '0';
          invertrightff(k) <= '0';
        END LOOP;
        shiftcheckff <= '0';
        shiftcheckdelayff <= '0';
        FOR k IN 1 TO mantissa LOOP
          aluleftff(k) <= '0';
          alurightff(k) <= '0';
          aluff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          ccsatff(k) <= '0';
          cczipff(k) <= '0';
          ccnanff(k) <= '0';
        END LOOP;
         
      ELSIF (rising_edge(sysclk)) THEN
            
        IF (enable = '1') THEN

          FOR k IN 1 TO mantissa LOOP
            mantissaleftff(k) <= (aamantissanode(k) AND NOT(switch)) OR (bbmantissanode(k) AND switch);
            mantissarightff(k) <= (bbmantissanode(k) AND NOT(switch)) OR (aamantissanode(k) AND switch);
          END LOOP;
          -- only use if shiftspeed = 1
          mantissaleftdelayff <= mantissaleftff;
        
          FOR k IN 1 TO 10 LOOP
            exponentshiftff(k) <= (subexponentone(k) AND NOT(switch)) OR (subexponenttwo(k) AND switch);
          END LOOP;
          
          FOR k IN 1 TO 10 LOOP
            exponentbaseff(1)(k) <= (aaexponentnode(k) AND NOT(switch)) OR (bbexponentnode(k) AND switch); 
          END LOOP;
          FOR k IN 2 TO 3+shiftspeed  LOOP
            exponentbaseff(k)(10 DOWNTO 1) <= exponentbaseff(k-1)(10 DOWNTO 1); 
          END LOOP;

          invertleftff(1) <= ((aasignnode AND NOT(switch)) OR (bbsignnode AND switch)) XOR (addsubnode AND switch);
          invertrightff(1) <= ((bbsignnode AND NOT(switch)) OR (aasignnode AND switch)) XOR (addsubnode AND NOT(switch));
          FOR k IN 2 TO 2+shiftspeed LOOP
            invertleftff(k) <= invertleftff(k-1);
            invertrightff(k) <= invertrightff(k-1);
          END LOOP;

          shiftcheckff <= shiftcheckbit;
          shiftcheckdelayff <= shiftcheckff;
          
          aluleftff <= mantissaleftnode;
          alurightff <= shiftbusnode;
        
          aluff <= aluleftnode + alurightnode + alucarrybitnode;

          ccsatff(1) <= aasatnode OR bbsatnode;
          cczipff(1) <= aazipnode AND bbzipnode;
          -- add/sub infinity is invalid OP, NAN out
          ccnanff(1) <= aanannode OR bbnannode OR aasatnode OR bbsatnode;
          FOR k IN 2 TO 3+shiftspeed LOOP
            ccsatff(k) <= ccsatff(k-1); 
            cczipff(k) <= cczipff(k-1);
            ccnanff(k) <= ccnanff(k-1);
          END LOOP;      
          
        END IF;
        
      END IF;
      
    END PROCESS;

    gmsa: IF (shiftspeed = 0) GENERATE
      mantissaleftnode <= mantissaleftff;
      zeroaluright <= shiftcheckff;
    END GENERATE;
    gmsb: IF (shiftspeed = 1) GENERATE
      mantissaleftnode <= mantissaleftdelayff;
      zeroaluright <= shiftcheckdelayff;
    END GENERATE;
    
    gma: FOR k IN 1 TO mantissa GENERATE
      aluleftnode(k) <= aluleftff(k) XOR invertleftff(2+shiftspeed);
      alurightnode(k) <= (alurightff(k) XOR invertrightff(2+shiftspeed)) AND NOT(zeroaluright);
    END GENERATE;
  
    -- carrybit into ALU only if larger value is negated
    alucarrybitnode <= invertleftff(2+shiftspeed);
   
    subexponentone <= aaexponentnode(10 DOWNTO 1) - bbexponentnode(10 DOWNTO 1);
    subexponenttwo <= bbexponentnode(10 DOWNTO 1) - aaexponentnode(10 DOWNTO 1);
  
    switch <= subexponentone(10);

  gsa: IF (mantissa = 32) GENERATE
  
    -- 31 ok, 32 not
    shiftcheck <= "0000000000";
    -- if '1', then zero right bus
    shiftcheckbit <= exponentshiftff(10) OR exponentshiftff(9) OR exponentshiftff(8) OR 
                     exponentshiftff(7) OR exponentshiftff(6);
   
    gsb: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb32
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsc: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  gsd: IF (mantissa = 36) GENERATE
  
    -- 35 ok, 36 not
    shiftcheck <= exponentshiftff - "0000100100"; 
    -- if '1', then zero right bus
    shiftcheckbit <= NOT(shiftcheck(10));
    
    gse: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb36
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsf: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  --*** OUTPUT ***
  cc <= aluff & exponentbaseff(3+shiftspeed)(10 DOWNTO 1);
  ccsat <= ccsatff(3+shiftspeed);
  cczip <= cczipff(3+shiftspeed);
  ccnan <= ccnanff(3+shiftspeed);
    
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP1X.VHD                           ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***             Adder                           ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***   04/05/10 - optimized structure            ***
--***   15/10/10 - bug in shiftcheckbit           ***
--***                                             ***
--***************************************************

ENTITY hcc_alufp1x IS 
GENERIC (
         mantissa : positive := 32;
         shiftspeed : integer := 0;
         outputpipe : integer := 1; -- 0 = no pipe, 1 = pipe (for this function only - input, not output pipes affected)
         addsub_resetval : std_logic
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_alufp1x;

ARCHITECTURE rtl OF hcc_alufp1x IS
  
  type exponentbasefftype IS ARRAY (3+shiftspeed DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  -- input registers and nodes
  signal aaff, bbff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal aananff, bbnanff : STD_LOGIC; 
  signal addsubff : STD_LOGIC;
  signal aanode, bbnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1); 
  signal aasatnode, aazipnode, bbsatnode, bbzipnode : STD_LOGIC;
  signal aanannode, bbnannode : STD_LOGIC;  
  signal addsubnode : STD_LOGIC;
  
  signal addsubctlff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1); 
  signal mantissaleftff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissarightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissaleftdelayff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal exponentshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exponentbaseff : exponentbasefftype;
  signal invertleftff, invertrightff : STD_LOGIC_VECTOR (2+shiftspeed DOWNTO 1);
  signal shiftcheckff, shiftcheckdelayff : STD_LOGIC;
  signal aluleftff, alurightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1);

  signal mantissaleftnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal zeroaluright : STD_LOGIC;
  signal aluleftnode, alurightnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal alucarrybitnode : STD_LOGIC;    
  signal subexponentone, subexponenttwo : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal shiftcheck : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal shiftcheckbit : STD_LOGIC;
  signal shiftbusnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  
  component hcc_rsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftpipe36 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftcomb36 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;
    
BEGIN

  pin: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO mantissa+10 LOOP 
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      addsubff <= addsub_resetval;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN

        aaff <= aa;
        bbff <= bb;
        aasatff <= aasat;
        bbsatff <= bbsat;
        aazipff <= aazip;
        bbzipff <= bbzip;
        aananff <= aanan;
        bbnanff <= bbnan;
        addsubff <= addsub;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gina: IF (outputpipe = 1) GENERATE
    aanode <= aaff;
    bbnode <= bbff;
    aasatnode <= aasatff;
    bbsatnode <= bbsatff;
    aazipnode <= aazipff;
    bbzipnode <= bbzipff;
    aanannode <= aananff;
    bbnannode <= bbnanff;
    addsubnode <= addsubff;
  END GENERATE;

  ginb: IF (outputpipe = 0) GENERATE
    aanode <= aa;
    bbnode <= bb;
    aasatnode <= aasat;
    bbsatnode <= bbsat;
    aazipnode <= aazip;
    bbzipnode <= bbzip;
    aanannode <= aanan;
    bbnannode <= bbnan;
    addsubnode <= addsub;
  END GENERATE;
  
    paa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN

        FOR k IN 1 TO 3+shiftspeed LOOP
          addsubctlff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO mantissa LOOP
          mantissaleftff(k) <= '0';
          mantissarightff(k) <= '0';
          mantissaleftdelayff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          exponentshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          FOR j IN 1 TO 10 LOOP
            exponentbaseff(k)(j) <= '0';
          END LOOP;
        END LOOP;
        FOR k IN 1 TO 2+shiftspeed LOOP
          invertleftff(k) <= '0';
          invertrightff(k) <= '0';
        END LOOP;
        shiftcheckff <= '0';
        shiftcheckdelayff <= '0';
        FOR k IN 1 TO mantissa LOOP
          aluleftff(k) <= '0';
          alurightff(k) <= '0';
          aluff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          ccsatff(k) <= '0';
          cczipff(k) <= '0';
          ccnanff(k) <= '0';
        END LOOP;
         
      ELSIF (rising_edge(sysclk)) THEN
            
        IF (enable = '1') THEN
          
          addsubctlff(1) <= addsubnode;
          FOR k IN 2 TO 2+shiftspeed LOOP
            addsubctlff(k) <= addsubctlff(k-1);
          END LOOP;
        
          FOR k IN 1 TO mantissa LOOP
            mantissaleftff(k) <= (aanode(k+10) AND NOT(switch)) OR (bbnode(k+10) AND switch);
            mantissarightff(k) <= (bbnode(k+10) AND NOT(switch)) OR (aanode(k+10) AND switch);
          END LOOP;
          -- only use if shiftspeed = 1
          mantissaleftdelayff <= mantissaleftff;
        
          FOR k IN 1 TO 10 LOOP
            exponentshiftff(k) <= (subexponentone(k) AND NOT(switch)) OR (subexponenttwo(k) AND switch);
          END LOOP;
          
          FOR k IN 1 TO 10 LOOP
            exponentbaseff(1)(k) <= (aanode(k) AND NOT(switch)) OR (bbnode(k) AND switch); 
          END LOOP;
          FOR k IN 2 TO 3+shiftspeed  LOOP
            exponentbaseff(k)(10 DOWNTO 1) <= exponentbaseff(k-1)(10 DOWNTO 1); 
          END LOOP;

          invertleftff(1) <= addsubnode AND switch; 
          invertrightff(1) <= addsubnode AND NOT(switch); 
          FOR k IN 2 TO 2+shiftspeed LOOP
            invertleftff(k) <= invertleftff(k-1);
            invertrightff(k) <= invertrightff(k-1);
          END LOOP;

          shiftcheckff <= shiftcheckbit;
          shiftcheckdelayff <= shiftcheckff;
          
          aluleftff <= mantissaleftnode;
          alurightff <= shiftbusnode;
        
          aluff <= aluleftnode + alurightnode + alucarrybitnode;

          ccsatff(1) <= aasatnode OR bbsatnode;
          cczipff(1) <= aazipnode AND bbzipnode;
          -- add/sub infinity is invalid OP, NAN out
          ccnanff(1) <= aanannode OR bbnannode OR aasatnode OR bbsatnode;
          FOR k IN 2 TO 3+shiftspeed LOOP
            ccsatff(k) <= ccsatff(k-1); 
            cczipff(k) <= cczipff(k-1);
            ccnanff(k) <= ccnanff(k-1);
          END LOOP;      
          
        END IF;
        
      END IF;
      
    END PROCESS;

    gmsa: IF (shiftspeed = 0) GENERATE
      mantissaleftnode <= mantissaleftff;
      zeroaluright <= shiftcheckff;
    END GENERATE;
    gmsb: IF (shiftspeed = 1) GENERATE
      mantissaleftnode <= mantissaleftdelayff;
      zeroaluright <= shiftcheckdelayff;
    END GENERATE;
    
    gma: FOR k IN 1 TO mantissa GENERATE
      aluleftnode(k) <= aluleftff(k) XOR invertleftff(2+shiftspeed);
      alurightnode(k) <= (alurightff(k) XOR invertrightff(2+shiftspeed)) AND NOT(zeroaluright);
    END GENERATE;
  
    alucarrybitnode <= addsubctlff(2+shiftspeed);
   
    subexponentone <= aanode(10 DOWNTO 1) - bbnode(10 DOWNTO 1);
    subexponenttwo <= bbnode(10 DOWNTO 1) - aanode(10 DOWNTO 1);
  
    switch <= subexponentone(10);

  gsa: IF (mantissa = 32) GENERATE
  
    -- 31 ok, 32 not
    shiftcheck <= "0000000000";
    -- if '1', then zero right bus
    -- 15/10/10 - was down to exponentshiftff(5) - zeroed any shift >= 16. Old design was ok because it
    -- used shiftcheck subtract 31, not caught because unlikely to cause differences for small designs
    shiftcheckbit <= exponentshiftff(10) OR exponentshiftff(9) OR exponentshiftff(8) OR 
                     exponentshiftff(7) OR exponentshiftff(6);
   
    gsb: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb32
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsc: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  gsd: IF (mantissa = 36) GENERATE
  
    -- 35 ok, 36 not
    shiftcheck <= exponentshiftff - "0000100100"; 
    -- if '1', then zero right bus
    shiftcheckbit <= NOT(shiftcheck(10));
    
    gse: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb36
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsf: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  --*** OUTPUT ***
  cc <= aluff & exponentbaseff(3+shiftspeed)(10 DOWNTO 1);
  ccsat <= ccsatff(3+shiftspeed);
  cczip <= cczipff(3+shiftspeed);
  ccnan <= ccnanff(3+shiftspeed);
 
   --*** DEBUG SECTION ***
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  ccexp <= exponentbaseff(3+shiftspeed)(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  ccman <= aluff;
   
END rtl;


LIBRARY ieee;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP2X.VHD                           ***
--***                                             ***
--***   Function: Double Precision Floating Point ***
--***             Adder                           ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_alufp2x IS 
GENERIC (
         shiftspeed : integer := 1; -- '0' for comb. shift, '1' for piped shift
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1;
         addsub_resetval : std_logic
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;

	  cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
	  ccsat, cczip, ccnan : OUT STD_LOGIC
	 );
END hcc_alufp2x;

ARCHITECTURE rtl OF hcc_alufp2x IS
  
  type expbasefftype IS ARRAY (3+shiftspeed+doublespeed DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type manfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (77 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;  
  signal aananff, bbnanff : STD_LOGIC;
  signal manleftff, manrightff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal manleftdelff, manleftdeldelff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal manalignff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal expbaseff : expbasefftype;
  signal expshiftff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal subexpone, subexptwo : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal expzerochk : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expzerochkff : STD_LOGIC;
  signal addsubff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1); 
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3+shiftspeed+doublespeed DOWNTO 1);  
  signal invertleftff, invertrightff : STD_LOGIC;
  signal invertleftdelff, invertrightdelff : STD_LOGIC;
  signal shiftbusnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aluleftnode, alurightnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal alunode, aluff : STD_LOGIC_VECTOR (64 DOWNTO 1);

  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  component hcc_rsftpipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb64
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   );
  end component;
 
  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
     
BEGIN
     
  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 77 LOOP 
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 64 LOOP
        manleftff(k) <= '0';
        manrightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 13 LOOP
        FOR j IN 1 TO 3+shiftspeed+doublespeed LOOP
          expbaseff(j)(k) <= '0';
        END LOOP;
        expshiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3+shiftspeed LOOP
        addsubff(k) <= addsub_resetval;
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      FOR k IN 1 TO 3+shiftspeed+doublespeed LOOP
        ccsatff(k) <= '0';
        cczipff(k) <= '0';
        ccnanff(k) <= '0';
      END LOOP; 
      invertleftff <= '0';
      invertrightff <= '0';
        
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        --*** LEVEL 1 ***
        aaff <= aa;
        bbff <= bb;
        aasatff <= aasat;
        bbsatff <= bbsat;
        aazipff <= aazip;
        bbzipff <= bbzip;
        aananff <= aanan;
        bbnanff <= bbnan;
        addsubff(1) <= addsub;
        FOR k IN 2 TO 3+shiftspeed LOOP
          addsubff(k) <= addsubff(k-1);
        END LOOP;
        
        --*** LEVEL 2 ***
        FOR k IN 1 TO 64 LOOP
          manleftff(k) <= (aaff(k+13) AND NOT(switch)) OR (bbff(k+13) AND switch);
          manrightff(k) <= (bbff(k+13) AND NOT(switch)) OR (aaff(k+13) AND switch);
        END LOOP;
          
        FOR k IN 1 TO 13 LOOP
          expbaseff(1)(k) <= (aaff(k) AND NOT(switch)) OR (bbff(k) AND switch); 
        END LOOP;
        FOR k IN 2 TO (3+shiftspeed+doublespeed) LOOP
          expbaseff(k)(13 DOWNTO 1) <= expbaseff(k-1)(13 DOWNTO 1);  -- level 3 to 4/5/6
        END LOOP;
        
        FOR k IN 1 TO 13 LOOP
          expshiftff(k) <= (subexpone(k) AND NOT(switch)) OR (subexptwo(k) AND switch);
        END LOOP;
        
        invertleftff <= addsubff(1) AND switch;  
        invertrightff <= addsubff(1) AND NOT(switch); 
    
        ccsatff(1) <= aasatff OR bbsatff;
        -- once through add/sub, output can only be ieee754"0" if both inputs are ieee754"0"
        cczipff(1) <= aazipff AND bbzipff;
        -- add/sub infinity is invalid OP, NAN out
        ccnanff(1) <= aananff OR bbnanff OR aasatff OR bbsatff;
        FOR k IN 2 TO (3+shiftspeed+doublespeed) LOOP
          ccsatff(k) <= ccsatff(k-1);  -- level 3 to 4/5/6
          cczipff(k) <= cczipff(k-1);  -- level 3 to 4/5/6
          ccnanff(k) <= ccnanff(k-1);  -- level 3 to 4/5/6
        END LOOP;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  subexpone <= aaff(13 DOWNTO 1) - bbff(13 DOWNTO 1);
  subexptwo <= bbff(13 DOWNTO 1) - aaff(13 DOWNTO 1);
  
  switch <= subexpone(13);
  
  expzerochk <= expshiftff - "0000001000000"; -- 63 ok, 64 not

  gsa: IF (shiftspeed = 0) GENERATE

    sftslow: hcc_rsftcomb64
    PORT MAP (inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
              outbus=>shiftbusnode);

    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          manleftdelff(k) <= '0';
          manalignff(k) <= '0';  
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          --*** LEVEL 3 ***
          FOR k IN 1 TO 64 LOOP
            manleftdelff(k) <= manleftff(k) XOR invertleftff;
            manalignff(k) <= (shiftbusnode(k) XOR invertrightff) AND expzerochk(13);
          END LOOP;

        END IF;

      END IF;

    END PROCESS;

    aluleftnode <= manleftdelff;
    alurightnode <= manalignff;

  END GENERATE;

  gsb: IF (shiftspeed = 1) GENERATE

    sftfast: hcc_rsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
              outbus=>shiftbusnode);

    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          manleftdelff(k) <= '0';
          manleftdeldelff(k) <= '0';
          manalignff(k) <= '0';  
        END LOOP;
        invertleftdelff <= '0';
        invertrightdelff <= '0';
        expzerochkff <= '0';

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          --*** LEVEL 3 ***
          manleftdelff <= manleftff;
          invertleftdelff <= invertleftff;
          invertrightdelff <= invertrightff;
          expzerochkff <= expzerochk(13);

		  --*** LEVEL 4 ***
          FOR k IN 1 TO 64 LOOP
            manleftdeldelff(k) <= manleftdelff(k) XOR invertleftdelff;
            manalignff(k) <= (shiftbusnode(k) XOR invertrightdelff) AND expzerochkff;
          END LOOP;

        END IF;

      END IF;

    END PROCESS;

    aluleftnode <= manleftdeldelff;
    alurightnode <= manalignff;

  END GENERATE;

  gaa: IF (doublespeed = 0) GENERATE

    paa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          aluff(k) <= '0';  
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          aluff <= aluleftnode + alurightnode + addsubff(3+shiftspeed);

        END IF;

      END IF;

    END PROCESS;

    alunode <= aluff;

    --*** OUTPUTS ***
    cc <= alunode & expbaseff(3+shiftspeed)(13 DOWNTO 1);
    ccsat <= ccsatff(3+shiftspeed);
    cczip <= cczipff(3+shiftspeed);
    ccnan <= ccnanff(3+shiftspeed);

  END GENERATE;
  
  gab: IF (doublespeed = 1) GENERATE
  
    gac: IF (synthesize = 0) GENERATE
      addone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aluleftnode,bb=>alurightnode,carryin=>addsubff(3+shiftspeed),
                cc=>alunode);
    END GENERATE;

    gad: IF (synthesize = 1) GENERATE
      addtwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aluleftnode,bb=>alurightnode,carryin=>addsubff(3+shiftspeed),
                cc=>alunode);            
    END GENERATE;

    cc <= alunode & expbaseff(4+shiftspeed)(13 DOWNTO 1);
    ccsat <= ccsatff(4+shiftspeed);
    cczip <= cczipff(4+shiftspeed);
    ccnan <= ccnanff(4+shiftspeed);
  	
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(13 DOWNTO 1);
  bbexp <= bb(13 DOWNTO 1);
  ccexp <= expbaseff(3+shiftspeed+doublespeed)(13 DOWNTO 1);
  aaman <= aa(77 DOWNTO 14);
  bbman <= bb(77 DOWNTO 14);
  ccman <= alunode;

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALULONG.VHD                           ***
--***                                             ***
--***   Function: fixed point adder (long)        ***
--***                                             ***
--***   14/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_alulong IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_alulong;

ARCHITECTURE rtl OF hcc_alulong IS

  signal zerovec : STD_LOGIC_VECTOR (31 DOWNTO 1);
  signal bbvec : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  
BEGIN

  gza: FOR k IN 1 TO 31 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  gaa: FOR k IN 1 TO 32 GENERATE
    bbvec(k) <= bb(k) XOR addsub;
  END GENERATE;
  
  paa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 32 LOOP
        aluff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        aluff <= aa + bbvec + (zerovec & addsub);
      END IF;
      
    END IF;    
      
  END PROCESS;
  
  cc <= aluff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOF.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double Format to   ***
--***   IEEE Single Format                        ***
--***                                             ***
--***   11/11/09 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency: 2                                  ***
--***************************************************

ENTITY hcc_castdtof IS  
GENERIC (
         roundconvert : integer := 1 -- global switch - round all ieee<=>y conversion when '1'
        );        
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castdtof;

ARCHITECTURE rtl OF hcc_castdtof IS

  signal aaff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal signnode : STD_LOGIC;
  signal exponentnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentbiasnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal mantissaprenode, mantissanode : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal upperrangecheck, lowerrangecheck : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal overrangenode, underrangenode : STD_LOGIC;
  signal exponentmaxnode, zipnode, mantissanonzeronode : STD_LOGIC;
  signal saturatenode, nannode, zeronode : STD_LOGIC;

BEGIN

  pca: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 64 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 32 LOOP
        ccff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        aaff <= aa;
        ccff <= signnode & exponentnode & mantissanode;
        
      END IF;
  
    END IF;
 
  END PROCESS;
  
  signnode <= aaff(64);
  gmana: FOR k IN 1 TO 23 GENERATE
    mantissanode(k) <= (mantissaprenode(k) OR nannode) AND NOT(zeronode) AND NOT(overrangenode);
  END GENERATE;
  gexpa: FOR k IN 1 TO 8 GENERATE
    exponentnode(k) <= (exponentbiasnode(k) OR overrangenode OR nannode) AND NOT(zeronode);
  END GENERATE;
  
  -- if exponent = 2047 => saturate, if 0 => 0
  exponentmaxnode <= aaff(63) AND aaff(62) AND aaff(61) AND aaff(60) AND 
                     aaff(59) AND aaff(58) AND aaff(57) AND aaff(56) AND
                     aaff(55) AND aaff(54) AND aaff(53);
  zipnode <= NOT(aaff(63) OR aaff(62) OR aaff(61) OR aaff(60) OR 
                 aaff(59) OR aaff(58) OR aaff(57) OR aaff(56) OR
                 aaff(55) OR aaff(54) OR aaff(53));
  mantissanonzeronode <= aaff(52) OR aaff(51) OR aaff(50) OR aaff(49) OR 
                         aaff(48) OR aaff(47) OR aaff(46) OR aaff(45) OR
                         aaff(44) OR aaff(43) OR aaff(42) OR aaff(41) OR
                         aaff(40) OR aaff(39) OR aaff(38) OR aaff(37) OR 
                         aaff(36) OR aaff(35) OR aaff(34) OR aaff(33) OR
                         aaff(32) OR aaff(31) OR aaff(30) OR aaff(29) OR
                         aaff(28) OR aaff(27) OR aaff(26) OR aaff(25) OR
                         aaff(24) OR aaff(23) OR aaff(22) OR aaff(21) OR
                         aaff(20) OR aaff(19) OR aaff(18) OR aaff(17) OR 
                         aaff(16) OR aaff(15) OR aaff(14) OR aaff(13) OR
                         aaff(12) OR aaff(11) OR aaff(10) OR aaff(9) OR
                         aaff(8) OR aaff(7) OR aaff(6) OR aaff(5) OR
                         aaff(4) OR aaff(3) OR aaff(2) OR aaff(1);
                         
  upperrangecheck <= aaff(63 DOWNTO 53) - 1151; -- 1150 = 254, 1151 = 255
  lowerrangecheck <= aaff(63 DOWNTO 53) - 897; -- 897 = 1, 896 = 0
  
  overrangenode <= NOT(upperrangecheck(11)) AND NOT(lowerrangecheck(11)) AND NOT(nannode);
  underrangenode <= lowerrangecheck(11);

  saturatenode <= overrangenode AND NOT(mantissanonzeronode);
  nannode <= exponentmaxnode AND mantissanonzeronode;
  zeronode <= zipnode OR underrangenode;
      
  exponentbiasnode <= aaff(63 DOWNTO 53) - 896;
  
  gra: IF (roundconvert = 0) GENERATE
    mantissaprenode <= aaff(52 DOWNTO 30);
  END GENERATE;
  grb: IF (roundconvert = 1) GENERATE
    mantissaprenode <= aaff(52 DOWNTO 30) + aaff(29);
  END GENERATE;

  -- OUTPUTS
  
  cc <= ccff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOL.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double Format to   ***
--***   Long                                      ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** if (swRoundConvert == 0 &&                  ***
--***     swOutputPipe == 0) :                    ***
--***     1 + swNormSpeed + 1                     ***
--*** else                                        ***
--***     2 + swDoubleSpeed*swRoundConvert +      ***
--***     swNormSpeed + 1                         ***
--***************************************************

ENTITY hcc_castdtol IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1;
         normspeed : positive := 2
         ); -- 1,2 pipes for conversion
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castdtol;

ARCHITECTURE rtl OF hcc_castdtol IS

  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal yvectorsat, yvectorzip : STD_LOGIC;
  
  component hcc_castdtoy
  GENERIC (
           target : integer := 0; -- 1(internal), 0 (multiplier, divider)
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

	     cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	     ccsat, cczip : OUT STD_LOGIC 
	    );
  end component;
  
  component hcc_castytol  
  GENERIC (normspeed : positive := 2); -- 1,2 pipes for conversion
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aazip, aasat : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );   
  end component;
  
BEGIN
 
  corein: hcc_castdtoy
  GENERIC MAP (target=>1,roundconvert=>roundconvert,outputpipe=>1,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,
            cc=>yvector,ccsat=>yvectorsat,cczip=>yvectorzip);

  coreout: hcc_castytol
  GENERIC MAP (normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>yvectorsat,aazip=>yvectorzip,
            cc=>cc);    
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOX.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double to Internal ***
--***             Single                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castdtox IS 
GENERIC (
         target : integer := 0; -- 0 (internal), 1 (multiplier), 2 (divider)
         mantissa : positive := 32;
         roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
         doublespeed : integer := 0 -- '0' for unpiped adder, '1' for piped adder
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC 
		);
END hcc_castdtox;

ARCHITECTURE rtl OF hcc_castdtox IS
    
  signal ccprenode : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal ccnode : STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
  signal satnode, zipnode, nannode : STD_LOGIC;
  
  component hcc_castdtoy
  GENERIC (
           target : integer := 0; -- 1(internal), 0 (multiplier, divider)
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	 	  ccsat, cczip, ccnan : OUT STD_LOGIC 
		 );
  end component;

  component hcc_castytox IS 
  GENERIC (
           target : integer := 0; -- 1 (signed 64 bit), 0 (unsigned "S1"+52bit)
           roundconvert : integer := 1; -- global switch - round all conversions when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC 
		  );
    end component;		
    
BEGIN
  
-- if x target is internal (0), output of dtoy is internal (1)
-- if x target is multiplier(1), output of dtoy is internal (1)
-- if x target is divider(2), output of dtoy is divider (0)

  -- if x target is internal (0), output of dtoy is internal (1)
  gda: IF (target = 0) GENERATE
    castinone: hcc_castdtoy
    GENERIC MAP (target=>1,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccnode,ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
  END GENERATE;

  -- if x target is multiplier(1), output of dtoy is internal (1)
  -- leftshift y (SSSSS1XXX) to signed multiplier format (S1XXX)
  gdb: IF (target = 1) GENERATE
    castintwo: hcc_castdtoy
    GENERIC MAP (target=>1,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccprenode,ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
              
    ccnode <= ccprenode(73 DOWNTO 5) & "0000";
  END GENERATE;
  
  gdc: IF (target = 2) GENERATE
    castintwo: hcc_castdtoy
    GENERIC MAP (target=>0,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccnode,ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
  END GENERATE;
  
  castout: hcc_castytox
  GENERIC MAP (target=>target,roundconvert=>roundconvert,mantissa=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>ccnode,aasat=>satnode,aazip=>zipnode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip,ccnan=>ccnan);
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOY.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double to Internal ***
--***             Double                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** if (swRoundConvert == 0 &&                  ***
--***     swOutputPipe == 0) : 1                  ***
--*** else                                        ***
--***     2 + swDoubleSpeed*swRoundConvert        ***
--***************************************************
		  
ENTITY hcc_castdtoy IS 
GENERIC (
         target : integer := 0; -- 1(internal), 0 (multiplier, divider)
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

	  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	  ccsat, cczip, ccnan : OUT STD_LOGIC 
	  );
END hcc_castdtoy;

ARCHITECTURE rtl OF hcc_castdtoy IS
    
  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (53+11*target DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal expmaxnode, zipnode, mannonzeronode : STD_LOGIC;
  signal satnode, nannode : STD_LOGIC;
  signal satff, zipff, nanff : STD_LOGIC;
  signal expnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal fracnode : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
  signal mantissanode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentff : exponentfftype;
  signal satdelff, zipdelff, nandelff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  
  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
  
BEGIN
  
  -- ieee754: sign (64), 8 exponent (63:53), 52 mantissa (52:1)
  
  -- x format: (signx5,!sign,mantissa XOR sign, sign(xx.xx)), exponent(13:1)
  -- multiplier, divider : (SIGN)('1')(52:1), exponent(13:1)
  -- (multiplier & divider use unsigned numbers, sign packed with input)
  
  gza: IF (roundconvert = 1) GENERATE
    gzb: FOR k IN 1 TO 53+11*target GENERATE
      zerovec(k) <= '0';
    END GENERATE;
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        aaff(k) <= '0';
      END LOOP;
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        aaff <= aa;
      END IF;      
            
    END IF;
      
  END PROCESS;

  -- if exponent = 1023 => saturate, if 0 => 0
  expmaxnode <= aaff(63) AND aaff(62) AND aaff(61) AND aaff(60) AND 
                aaff(59) AND aaff(58) AND aaff(57) AND aaff(56) AND
                aaff(55) AND aaff(54) AND aaff(53);
  zipnode <= NOT(aaff(63) OR aaff(62) OR aaff(61) OR aaff(60) OR 
                 aaff(59) OR aaff(58) OR aaff(57) OR aaff(56) OR
                 aaff(55) OR aaff(54) OR aaff(53));
  mannonzeronode <= aaff(52) OR aaff(51) OR aaff(50) OR aaff(49) OR 
                    aaff(48) OR aaff(47) OR aaff(46) OR aaff(45) OR
                    aaff(44) OR aaff(43) OR aaff(42) OR aaff(41) OR
                    aaff(40) OR aaff(39) OR aaff(38) OR aaff(37) OR 
                    aaff(36) OR aaff(35) OR aaff(34) OR aaff(33) OR
                    aaff(32) OR aaff(31) OR aaff(30) OR aaff(29) OR
                    aaff(28) OR aaff(27) OR aaff(26) OR aaff(25) OR
                    aaff(24) OR aaff(23) OR aaff(22) OR aaff(21) OR
                    aaff(20) OR aaff(19) OR aaff(18) OR aaff(17) OR 
                    aaff(16) OR aaff(15) OR aaff(14) OR aaff(13) OR
                    aaff(12) OR aaff(11) OR aaff(10) OR aaff(9) OR
                    aaff(8) OR aaff(7) OR aaff(6) OR aaff(5) OR
                    aaff(4) OR aaff(3) OR aaff(2) OR aaff(1);
                
  satnode <= expmaxnode AND NOT(mannonzeronode);
  nannode <= expmaxnode AND mannonzeronode;
         
  gexpa: FOR k IN 1 TO 11 GENERATE
    expnode(k) <= (aaff(k+52) OR expmaxnode) AND NOT(zipnode);
  END GENERATE;
  expnode(12) <= '0';
  expnode(13) <= '0';

  --**************************************
  --*** direct to multipier or divider ***
  --**************************************
  gmda: IF (target = 0) GENERATE
  -- already in "01"&mantissa format used by multiplier and divider

    fracnode <= aaff(64) & '1' & aaff(52 DOWNTO 1);
    
    gmdb: IF (outputpipe = 0) GENERATE
      cc <= fracnode & expnode;
      ccsat <= satnode;
      cczip <= zipnode;
      ccnan <= nannode;
    END GENERATE; 

    gmdc: IF (outputpipe = 1) GENERATE

      pmda: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
        
          FOR k IN 1 TO 67 LOOP
            ccff(k) <= '0';
          END LOOP;
          satff <= '0';
          zipff <= '0';
          nanff <= '0';

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            ccff <= fracnode & expnode;
            satff <= satnode;
            zipff <= zipnode;
            nanff <= nannode;

          END IF;      
            
        END IF;
     
      END PROCESS; 

      cc <= ccff;
      ccsat <= satff;
      cczip <= zipff;
      ccnan <= nanff;

    END GENERATE; 

  END GENERATE;

  --***********************
  --*** internal format ***
  --***********************
  gxa: IF (target = 1) GENERATE
  
    fracnode(64) <= aaff(64);
    fracnode(63) <= aaff(64);
    fracnode(62) <= aaff(64);
    fracnode(61) <= aaff(64);
    fracnode(60) <= aaff(64);
    fracnode(59) <= NOT(aaff(64));  -- '1' XOR sign
    gfa: FOR k IN 1 TO 52 GENERATE
      fracnode(k+6)<= (aaff(k) XOR aaff(64));
    END GENERATE;
    gfb: FOR k IN 1 TO 6 GENERATE
      fracnode(k)<= aaff(64);  -- '0' XOR sign
    END GENERATE;
    
    --*** OUTPUT STAGE(S) ***
    gsa: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
      cc <= fracnode & expnode;
      ccsat <= satnode;
      cczip <= zipnode;
      ccnan <= nannode;
    END GENERATE;

    gsb: IF (outputpipe = 1 AND
             ((roundconvert = 0) OR
              (roundconvert = 1 AND doublespeed = 0))) GENERATE
    
      gsc: IF (roundconvert = 0) GENERATE  
        mantissanode <= fracnode;
      END GENERATE;

      gsd: IF (roundconvert = 1) GENERATE  
        mantissanode <= fracnode + (zerovec(63 DOWNTO 1) & aaff(64));
      END GENERATE;

      prca: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
        
          FOR k IN 1 TO 77 LOOP
            ccff(k) <= '0';
          END LOOP;
          satff <= '0';
          zipff <= '0';
          nanff <= '0';

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            ccff <= mantissanode & expnode;
            satff <= satnode;
            zipff <= zipnode;
            nanff <= nannode;

          END IF;      
            
        END IF;
     
      END PROCESS;    
      
      cc <= ccff;
      ccsat <= satff;
      cczip <= zipff;
      ccnan <= nanff;

    END GENERATE;

    gse: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
      gsf: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>fracnode,bb=>zerovec(64 DOWNTO 1),carryin=>aaff(64),
                  cc=>mantissanode);
      END GENERATE;
      grb: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>fracnode,bb=>zerovec(64 DOWNTO 1),carryin=>aaff(64),
                  cc=>mantissanode);
      END GENERATE;

      prcb: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
         
          FOR k IN 1 TO 13 LOOP
            exponentff(1)(k) <= '0';
            exponentff(2)(k) <= '0';
          END LOOP;
          satdelff <= "00";
          zipdelff <= "00";
          nandelff <= "00";

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            exponentff(1)(13 DOWNTO 1) <= expnode;
            exponentff(2)(13 DOWNTO 1) <= exponentff(1)(13 DOWNTO 1);
            satdelff(1) <= satnode;
            satdelff(2) <= satdelff(1);
            zipdelff(1) <= zipnode;
            zipdelff(2) <= zipdelff(1);
            nandelff(1) <= nannode;
            nandelff(2) <= nandelff(1);

          END IF;      
            
        END IF;
      
      END PROCESS;    
      
      cc <= mantissanode & exponentff(2)(13 DOWNTO 1);
      ccsat <= satdelff(2);
      cczip <= zipdelff(2);
      ccnan <= nandelff(2);

    END GENERATE;

  END GENERATE;

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOD.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single Format to   ***
--***   IEEE Double Format                        ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency: 2                                  ***
--***************************************************

ENTITY hcc_castftod IS          
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_castftod;

ARCHITECTURE rtl OF hcc_castftod IS

  signal aaff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal signnode : STD_LOGIC;
  signal exponentnode, exponentbiasnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal mantissanode : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal tailnode : STD_LOGIC_VECTOR (29 DOWNTO 1);
  signal exponentmaxnode, zipnode, mantissanonzeronode : STD_LOGIC;
  signal saturatenode, nannode : STD_LOGIC;
    
BEGIN

  pca: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
    
      -- FOR k IN 1 TO 32 LOOP
        -- aaff(k) <= '0';
      -- END LOOP;
      FOR k IN 1 TO 64 LOOP
        ccff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        ccff <= signnode & exponentnode & mantissanode;
        
      END IF;
  
    END IF;
 
  END PROCESS;

  aaff <= aa;
  signnode <= aaff(32);
  mantissanode <= aaff(23 DOWNTO 1) & "00000000000000000000000000000";
  
  gexpa: FOR k IN 1 TO 11 GENERATE
    exponentnode(k) <= (exponentbiasnode(k) OR exponentmaxnode) AND NOT(zipnode);
  END GENERATE;
  
  -- if exponent = 255 => saturate, if 0 => 0
  exponentmaxnode <= aaff(31) AND aaff(30) AND aaff(29) AND aaff(28) AND 
                     aaff(27) AND aaff(26) AND aaff(25) AND aaff(24);
  zipnode <= NOT(aaff(31) OR aaff(30) OR aaff(29) OR aaff(28) OR 
                 aaff(27) OR aaff(26) OR aaff(25) OR aaff(24));

  -- mantissanonzeronode <= aaff(23) OR aaff(22) OR aaff(21) OR
                         -- aaff(20) OR aaff(19) OR aaff(18) OR aaff(17) OR 
                         -- aaff(16) OR aaff(15) OR aaff(14) OR aaff(13) OR
                         -- aaff(12) OR aaff(11) OR aaff(10) OR aaff(9) OR
                         -- aaff(8) OR aaff(7) OR aaff(6) OR aaff(5) OR
                         -- aaff(4) OR aaff(3) OR aaff(2) OR aaff(1);
  
  saturatenode <= exponentmaxnode AND NOT(mantissanonzeronode);
  nannode <= exponentmaxnode AND mantissanonzeronode;
   
  -- gta: FOR k IN 1 TO 29 GENERATE
    -- tailnode(k) <= nannode;
  -- END GENERATE;     
  
  exponentbiasnode <= ("000" & aaff(31 DOWNTO 24)) + 896;
  
  -- OUTPUTS
  
  cc <= ccff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOL.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single Format to   ***
--***   Long                                      ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** 3 + swSingleNormSpeed                       ***
--***************************************************

ENTITY hcc_castftol IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         normspeed : positive := 2; -- 1,2 pipes for conversion
         mantissa : integer := 36
        );           
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castftol;

ARCHITECTURE rtl OF hcc_castftol IS

  signal xvector : STD_LOGIC_VECTOR (42 DOWNTO 1);
  signal xvectorsat, xvectorzip : STD_LOGIC;

  component hcc_castftox 
  GENERIC (
           target : integer := 1; -- 0 (internal), 1 (multiplier), 2 (divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           mantissa : positive := 32;
           outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
  end component;
  
  component hcc_castxtol 
  GENERIC (
           normspeed : positive := 2; -- 1,2 pipes for conversion
           mantissa : integer := 36
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aazip, aasat : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
    
BEGIN

  corein: hcc_castftox
  GENERIC MAP (target=>0,roundconvert=>roundconvert,mantissa=>32,outputpipe=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,
            cc=>xvector,ccsat=>xvectorsat,cczip=>xvectorzip);
            
  coreout: hcc_castxtol
  GENERIC MAP (normspeed=>normspeed,mantissa=>32)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>xvector,aasat=>xvectorsat,aazip=>xvectorzip,
            cc=>cc);
 
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOX.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single to Internal ***
--***             Single                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   06/02/08 - divider mantissa aa to aaff    ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** 1 + swOutputPipe (target = 0,1)             ***
--*** 1                (target = 2)               ***
--***************************************************

ENTITY hcc_castftox IS 
GENERIC (
         target : integer := 1; -- 0 (internal), 1 (multiplier), 2 (divider)
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         mantissa : positive := 32;
         outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC 
		);
END hcc_castftox;

ARCHITECTURE rtl OF hcc_castftox IS
    
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal fracnode, fractional : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal expnode, exponent : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expmaxnode, mannonzeronode : STD_LOGIC;
  signal satnode, zipnode, nannode : STD_LOGIC;
  signal satff, zipff, nanff : STD_LOGIC;
    
BEGIN

  -- ieee754: sign (32), 8 exponent (31:24), 23 mantissa (23:1)
  
  -- x format: (signx5,!sign,mantissa XOR sign, sign(xx.xx)), exponent(10:1)
  -- multiplier : (SIGN)('1')(23:1)sign(xx.xx), exponent(10:1)
  -- divider : "01"(23:1) (00..00),exponent(10:1) (lower mantissa bits ignored by fpdiv1x)
  
  gza: IF (roundconvert = 1) GENERATE
    gza: FOR k IN 1 TO mantissa-1 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 32 LOOP
        aaff(k) <= '0';
      END LOOP;
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        aaff <= aa;
      
      END IF;      
            
    END IF;
      
  END PROCESS;
  
  gro: IF ((target = 0 AND outputpipe = 1) OR
           (target = 1 AND outputpipe = 1)) GENERATE
    pca: PROCESS (sysclk,reset)
    BEGIN
      
      IF (reset = '1') THEN

        FOR k IN 1 TO mantissa+10 LOOP
          ccff(k) <= '0';
        END LOOP;
        satff <= '0';
        zipff <= '0';
        nanff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN

          ccff <= fractional & exponent;
          satff <= satnode;
          zipff <= zipnode;
          nanff <= nannode;
      
        END IF;      
            
      END IF;
      
    END PROCESS;  
  END GENERATE;
  
  -- if exponent = 255 => saturate, if 0 => 0
  expmaxnode <= aaff(31) AND aaff(30) AND aaff(29) AND aaff(28) AND 
             aaff(27) AND aaff(26) AND aaff(25) AND aaff(24);
  zipnode <= NOT(aaff(31) OR aaff(30) OR aaff(29) OR aaff(28) OR 
                 aaff(27) OR aaff(26) OR aaff(25) OR aaff(24));
  mannonzeronode <= aaff(23) OR aaff(22) OR aaff(21) OR
                    aaff(20) OR aaff(19) OR aaff(18) OR aaff(17) OR 
                    aaff(16) OR aaff(15) OR aaff(14) OR aaff(13) OR
                    aaff(12) OR aaff(11) OR aaff(10) OR aaff(9) OR
                    aaff(8) OR aaff(7) OR aaff(6) OR aaff(5) OR
                    aaff(4) OR aaff(3) OR aaff(2) OR aaff(1);
  
  satnode <= expmaxnode AND NOT(mannonzeronode);
  nannode <= expmaxnode AND mannonzeronode;
         
  gexpa: FOR k IN 1 TO 8 GENERATE
    expnode(k) <= (aaff(k+23) OR expmaxnode) AND NOT(zipnode);
  END GENERATE;
  expnode(9) <= '0';
  expnode(10) <= '0';

  --*** internal format ***
  gxa: IF (target = 0) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    fracnode(mantissa-1) <= aaff(32);
    fracnode(mantissa-2) <= aaff(32);
    fracnode(mantissa-3) <= aaff(32);
    fracnode(mantissa-4) <= aaff(32);
    fracnode(mantissa-5) <= NOT(aaff(32));  -- '1' XOR sign
    gxb: FOR k IN 1 TO 23 GENERATE
      fracnode(mantissa-29+k)<= (aaff(k) XOR aaff(32));
    END GENERATE;
    gxc: FOR k IN 1 TO mantissa-29 GENERATE
      fracnode(k)<= aaff(32);  -- '0' XOR sign
    END GENERATE;
    
    gxd: IF (roundconvert = 0) GENERATE
      fractional <= fracnode;
    END GENERATE;
    gxe: IF (roundconvert = 1) GENERATE
      fractional <= fracnode + (zerovec(mantissa-1) & aaff(32));
    END GENERATE;
    
    exponent <= expnode;
    
  END GENERATE;
  
  --*** direct to multiplier ***
  gma: IF (target = 1) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    fracnode(mantissa-1) <= NOT(aaff(32));  -- '1' XOR sign
    gmb: FOR k IN 1 TO 23 GENERATE
      fracnode(mantissa-25+k)<= (aaff(k) XOR aaff(32));
    END GENERATE;
    gmc: FOR k IN 1 TO mantissa-25 GENERATE
      fracnode(k)<= aaff(32);  -- '0' XOR sign
    END GENERATE;
    
    gmd: IF (roundconvert = 0) GENERATE
      fractional <= fracnode;
    END GENERATE;
    gme: IF (roundconvert = 1) GENERATE
      fractional <= fracnode + (zerovec(mantissa-1) & aaff(32));
    END GENERATE;
    
    --***??? adjust ???
    exponent <= expnode;
    
  END GENERATE;

  -- never register output
  --*** direct to divider ***
  gda: IF (target = 2) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    fracnode(mantissa-1) <= '1'; 
    fracnode(mantissa-2 DOWNTO mantissa-24)<= aaff(23 DOWNTO 1);
    gfb: FOR k IN 1 TO mantissa-25 GENERATE
      fracnode(k)<= '0';  
    END GENERATE;
    
    fractional <= fracnode;
    
    --***??? adjust ???
    exponent <= expnode;
    
  END GENERATE;
  
  --*** OUTPUTS ***
  goa: IF ((target = 0 AND outputpipe = 1) OR
           (target = 1 AND outputpipe = 1)) GENERATE      
    cc <= ccff;    
    ccsat <= satff;
    cczip <= zipff;  
    ccnan <= nanff;  
  END GENERATE;
  gob: IF ((target = 0 AND outputpipe = 0) OR
         (target = 1 AND outputpipe = 0) OR
         (target = 2)) GENERATE      
    cc <= fractional & exponent;    
    ccsat <= satnode;
    cczip <= zipnode;  
    ccnan <= nannode;  
  END GENERATE;
    
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOY.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single to Internal ***
--***             Double                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

-- castftoy : float <=> internal double 
ENTITY hcc_castftoy IS 
GENERIC (
         target : integer := 0; -- 1 (internal), 0 (multiplier,divider)
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         mantissa : positive := 32;
         outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC 
		);
END hcc_castftoy;

ARCHITECTURE rtl OF hcc_castftoy IS
    
  signal floatnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal satnode, zipnode, nannode : STD_LOGIC;
   
  component hcc_castftox 
  GENERIC (
           target : integer := 1; -- 0 (internal), 1 (multiplier), 2 (divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           mantissa : positive := 32;
           outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC 
		  );
  end component;
	
  component hcc_castxtoy 
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           mantissa : positive := 32
          );
  PORT (
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC 
		  );
  end component;
  
BEGIN
    
  -- if ftoy target divider or multiplier, need unsigned output
  -- if ftoy target = 1 (internal), ftox target = 0, xtoy target = 1
  -- if ftoy target = 0 (multiplier, divider), ftox target = 2 (divider), xtoy target = 0 (mult&div)

  gaa: IF (target = 1) GENERATE
    one: hcc_castftox
    GENERIC MAP(target=>0,roundconvert=>roundconvert,
                mantissa=>mantissa,outputpipe=>outputpipe)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>floatnode,ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
            
    two: hcc_castxtoy
    GENERIC MAP(target=>1,mantissa=>mantissa)
    PORT MAP (aa=>floatnode,aasat=>satnode,aazip=>zipnode,aanan=>nannode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip,ccnan=>ccnan);
  END GENERATE;

  gab: IF (target = 0) GENERATE
    one: hcc_castftox
    GENERIC MAP(target=>2,roundconvert=>roundconvert,
                mantissa=>mantissa,outputpipe=>outputpipe)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>floatnode,ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
            
    two: hcc_castxtoy
    GENERIC MAP(target=>0,mantissa=>mantissa)
    PORT MAP (aa=>floatnode,aasat=>satnode,aazip=>zipnode,aanan=>nannode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip,ccnan=>ccnan);
  END GENERATE;

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOD.VHD                          ***
--***                                             ***
--***   Function: Cast Long to IEEE754 Double     ***
--***   Format                                    ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** 4 + swNormSpeed + swDoubleSpeed +           ***
--*** swRoundConvert*(1 + swDoubleSpeed);         ***
--***************************************************

ENTITY hcc_castltod IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1;
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_castltod;

ARCHITECTURE rtl OF hcc_castltod IS

  signal fit : STD_LOGIC;
  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_castytod  
  GENERIC (
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  
BEGIN
        
  gxa: IF (unsigned = 0) GENERATE
    yvector(77 DOWNTO 73) <= aa(32) & aa(32) & aa(32) & aa(32) & aa(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    yvector(77 DOWNTO 73) <= "00000";
  END GENERATE;
  
  yvector(72 DOWNTO 41) <= aa;
  
  gza: FOR k IN 14 TO 40 GENERATE
    yvector(k) <= '0';
  END GENERATE;

  yvector(13 DOWNTO 1) <= conv_std_logic_vector (1054,13); -- account for 31bit right shift

  core: hcc_castytod
  GENERIC MAP (roundconvert=>roundconvert,normspeed=>normspeed,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>'0',aazip=>'0',
            cc=>cc);

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOF.VHD                          ***
--***                                             ***
--***   Function: Cast Long to IEEE754 Single     ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency: 5 + 2*(swSingleNormSpeed-1)        ***
--***************************************************

ENTITY hcc_castltof IS 
GENERIC (
         mantissa : integer := 36;
         normspeed: positive := 1;
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castltof;

ARCHITECTURE rtl OF hcc_castltof IS

  signal fit : STD_LOGIC;
  signal xvector : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_castxtof
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           normspeed : positive := 2 -- 1 or 2 
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
	end component;
	
BEGIN
        
  gxa: IF (unsigned = 0) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= aa(32) & aa(32) & aa(32) & aa(32) & aa(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= "00000";
  END GENERATE;
  
  gmaa: IF (mantissa = 32) GENERATE
    
    -- 27 significant bits can be fit directly
    gmab: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aa(32) OR aa(31) OR aa(30) OR aa(29) OR aa(28)) OR
                (aa(32) AND aa(31) AND aa(30) AND aa(29) AND aa(28));
    END GENERATE;
    gmac: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aa(32) OR aa(31) OR aa(30) OR aa(29) OR aa(28));
    END GENERATE; 
    
    gmad: FOR k IN 1 TO 27 GENERATE
      xvector(k+10) <= (aa(k) AND fit) OR (aa(k+5) AND NOT(fit));
    END GENERATE;

    exponentfit <= "0010011010";    -- exponent = 154 due right shift by 27
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmae: FOR k IN 1 TO 10 GENERATE
      xvector(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;

  gmba: IF (mantissa = 36) GENERATE
    
    -- 31 significant bits can be fit directly
    gmbb: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aa(32) OR aa(31)) OR
                (aa(32) AND aa(31));
    END GENERATE;
    gmbc: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aa(32));
    END GENERATE; 
    
    gmbd: FOR k IN 1 TO 31 GENERATE
      xvector(k+10) <= (aa(k) AND fit) OR (aa(k+1) AND NOT(fit));
    END GENERATE;
  
    exponentfit <= "0010011110";    -- exponent = 158 due right shift by 31
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmbe: FOR k IN 1 TO 10 GENERATE
      xvector(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;
  
  core: hcc_castxtof
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>xvector,aasat=>'0',aazip=>'0',
            cc=>cc);
            
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOX.VHD                          ***
--***                                             ***
--***   Function: Cast Long to Internal Single    ***
--***   Format                                    ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN port                   ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castltox IS 
GENERIC (
         mantissa : integer := 36;
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
	  );
END hcc_castltox;

ARCHITECTURE rtl OF hcc_castltox IS

  signal aaff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal fit : STD_LOGIC;
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
BEGIN
        
  paa: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
      FOR k IN 1 TO 32 LOOP
        aaff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        aaff <= aa;
      END IF;
    END IF;
  END PROCESS;
  
  gxa: IF (unsigned = 0) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= aaff(32) & aaff(32) & aaff(32) & aaff(32) & aaff(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= "00000";
  END GENERATE;
  
  gmaa: IF (mantissa = 32) GENERATE
    
    -- 27 significant bits can be fit directly
    gmab: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aaff(32) OR aaff(31) OR aaff(30) OR aaff(29) OR aaff(28)) OR
                (aaff(32) AND aaff(31) AND aaff(30) AND aaff(29) AND aaff(28));
    END GENERATE;
    gmac: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aaff(32) OR aaff(31) OR aaff(30) OR aaff(29) OR aaff(28));
    END GENERATE; 
    
    gmad: FOR k IN 1 TO 27 GENERATE
      cc(k+10) <= (aaff(k) AND fit) OR (aaff(k+5) AND NOT(fit));
    END GENERATE;

    exponentfit <= "0010011010";    -- exponent = 154 due right shift by 27
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmae: FOR k IN 1 TO 10 GENERATE
      cc(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;

  gmba: IF (mantissa = 36) GENERATE
    
    -- 31 significant bits can be fit directly
    gmbb: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aaff(32) OR aaff(31)) OR
                (aaff(32) AND aaff(31));
    END GENERATE;
    gmbc: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aaff(32));
    END GENERATE; 
    
    gmbd: FOR k IN 1 TO 31 GENERATE
      cc(k+10) <= (aaff(k) AND fit) OR (aaff(k+1) AND NOT(fit));
    END GENERATE;
  
    exponentfit <= "0010011110";    -- exponent = 158 due right shift by 31
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmbe: FOR k IN 1 TO 10 GENERATE
      cc(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;

  ccsat <= '0';
  cczip <= '0';
  ccnan <= '0';

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOY.VHD                          ***
--***                                             ***
--***   Function: Cast Long to Internal Double    ***
--***   Format                                    ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN port                   ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castltoy IS 
GENERIC (
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
	  );
END hcc_castltoy;

ARCHITECTURE rtl OF hcc_castltoy IS

  signal aaff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal fit : STD_LOGIC;
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
BEGIN
      
  paa: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
      FOR k IN 1 TO 32 LOOP
        aaff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        aaff <= aa;
      END IF;
    END IF;
  END PROCESS;
    
  gxa: IF (unsigned = 0) GENERATE
    cc(77 DOWNTO 73) <= aaff(32) & aaff(32) & aaff(32) & aaff(32) & aaff(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    cc(77 DOWNTO 73) <= "00000";
  END GENERATE;
  
  cc(72 DOWNTO 41) <= aaff;
  
  gza: FOR k IN 14 TO 40 GENERATE
    cc(k) <= '0';
  END GENERATE;

  cc(13 DOWNTO 1) <= conv_std_logic_vector (1054,13); -- account for 31bit right shift

  ccsat <= '0';
  cczip <= '0';

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOD.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single to IEEE754 ***
--***             Double                          ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castxtod IS 
GENERIC (
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         mantissa : positive := 32;
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		);
END hcc_castxtod;

ARCHITECTURE rtl OF hcc_castxtod IS
    
  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal yvectorsat, yvectorzip, yvectornan : STD_LOGIC;
   
  component hcc_castxtoy IS 
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           mantissa : positive := 32
          );
  PORT (
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC 
		 );
  end component;
	
  component hcc_castytod 
  GENERIC (
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
         );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  	 
BEGIN

  corein: hcc_castxtoy
  GENERIC MAP (target=>1,mantissa=>mantissa)
  PORT MAP (aa=>aa,aasat=>aasat,aazip=>aazip,aanan=>aanan,
            cc=>yvector,ccsat=>yvectorsat,cczip=>yvectorzip,ccnan=>yvectornan);
            
  coreout: hcc_castytod
  GENERIC MAP (roundconvert=>roundconvert,normspeed=>normspeed,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>yvectorsat,aazip=>yvectorzip,aanan=>yvectornan,
            cc=>cc);
   
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--******************************************************************************
--***                                                                        ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER                              ***
--***                                                                        ***
--***   HCC_CASTXTOF.VHD                                                     ***
--***                                                                        ***
--***   Function: Cast Internal Single to IEEE754                            ***
--***             Single                                                     ***
--***                                                                        ***
--***   14/07/07 ML                                                          ***
--***                                                                        ***
--***   (c) 2007 Altera Corporation                                          ***
--***                                                                        ***
--***   Change History                                                       ***
--***                                                                        ***
--***   17/04/09 - add NAN support, also fixed zero/infinity/nan mantissa    ***
--***   29/04/09 - zero output if mantissa in zero                           ***
--***                                                                        ***
--******************************************************************************

--******************************************************************************
--*** Latency: 5 + 2*(swSingleNormSpeed-1)                                   ***
--******************************************************************************

ENTITY hcc_castxtof IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         normspeed : positive := 2 -- 1 or 2 
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC;

	   cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castxtof;

ARCHITECTURE rtl OF hcc_castxtof IS
  
  -- latency = 5 if normspeed = 1
  -- latency = 7 if normspeed = 2 (extra pipe in normusgn3236 and output stage)
  
  type exptopfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  type expbotfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal count : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal absnode, absroundnode, absff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal fracout, fracoutff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal exptopff : exptopfftype;
  signal expbotff : expbotfftype;
  signal roundoverflow : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal roundoverflowff : STD_LOGIC;
  signal satff, zipff, nanff : STD_LOGIC_VECTOR (3+normspeed DOWNTO 1); 
  signal signff : STD_LOGIC_VECTOR (2+2*normspeed DOWNTO 1); 
  signal zeronumber : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal zeronumberff : STD_LOGIC_VECTOR (1+normspeed DOWNTO 1); 
  signal preexpnode, expnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissanode : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal roundbit : STD_LOGIC;
  signal mantissaroundff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal zeroexpnode, maxexpnode : STD_LOGIC;
  signal zeromantissanode, maxmantissanode : STD_LOGIC;
  signal zeroexponentnode, maxexponentnode : STD_LOGIC;
  signal zeromantissaff, maxmantissaff : STD_LOGIC;
  signal zeroexponentff, maxexponentff : STD_LOGIC;
  
  signal ccsgn : STD_LOGIC;
  signal aaexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (23 DOWNTO 1);

  component hcc_normusgn3236 IS 
  GENERIC (
           mantissa : positive := 32;
           normspeed : positive := 1 -- 1 or 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

	     countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1); -- 1 clock earlier than fracout
	     fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	    );
  end component;
    
BEGIN
  
  gza: FOR k IN 1 TO mantissa-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
         
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO mantissa+10 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa LOOP
        absff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa LOOP
        fracoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 10 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      roundoverflowff <= '0';
      FOR k IN 1 TO 3+normspeed LOOP
        satff(k) <= '0';
        zipff(k) <= '0';
        nanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2+2*normspeed LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 1+normspeed LOOP
        zeronumberff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        aaff <= aa;

        absff <= absnode + absroundnode;
    
        fracoutff <= fracout;
        
        exptopff(1)(10 DOWNTO 1) <= aaff(10 DOWNTO 1);
        -- add 4 because of maximum 4 bits wordgrowth in X mantissa
        exptopff(2)(10 DOWNTO 1) <= exptopff(1)(10 DOWNTO 1) + "0000000100";
        exptopff(3)(10 DOWNTO 1) <= exptopff(2)(10 DOWNTO 1) - ("0000" & count);

        roundoverflowff <= roundoverflow(24);
        
        satff(1) <= aasat;
        FOR k IN 2 TO 3+normspeed LOOP
          satff(k) <= satff(k-1);
        END LOOP;
        zipff(1) <= aazip;
        FOR k IN 2 TO 3+normspeed LOOP
          zipff(k) <= zipff(k-1);
        END LOOP;
        nanff(1) <= aanan;
        FOR k IN 2 TO 3+normspeed LOOP
          nanff(k) <= nanff(k-1);
        END LOOP;
        
        signff(1) <= aaff(mantissa+10);
        FOR k IN 2 TO 2+2*normspeed LOOP
          signff(k) <= signff(k-1);
        END LOOP;

        zeronumberff(1) <= NOT(zeronumber(mantissa));
        FOR k IN 2 TO 1+normspeed LOOP
          zeronumberff(k) <= zeronumberff(k-1);
        END LOOP;
                  
      END IF;
            
    END IF;
  
  END PROCESS;
  
  -- if normspeed = 1, latency = 5. if normspeed > 1, latency = 7
  gsa: IF (normspeed = 1) GENERATE
  
    pna: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        exponentff <= "00000000";
        FOR k IN 1 TO 23 LOOP
          mantissaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          FOR k IN 1 TO 8 LOOP
            exponentff(k) <= (expnode(k) AND NOT(zeroexponentnode)) OR maxexponentnode; 
          END LOOP;
          FOR k IN 1 TO 23 LOOP
            mantissaff(k) <= (mantissanode(k) AND NOT(zeromantissanode)) OR maxmantissanode;
          END LOOP;
        END IF;
      END IF;
    END PROCESS;
  
    preexpnode <= exptopff(3)(10 DOWNTO 1);
  
  END GENERATE;
         
  -- if normspeed = 1, latency = 5. if normspeed > 1, latency = 7
  gsb: IF (normspeed = 2) GENERATE
  
    pnb: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        expbotff(1)(10 DOWNTO 1) <= "0000000000";
        expbotff(2)(10 DOWNTO 1) <= "0000000000";
        exponentff <= "00000000";
        FOR k IN 1 TO 23 LOOP
          mantissaroundff(k) <= '0';
          mantissaff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        maxmantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
          
      ELSIF (rising_edge(sysclk)) THEN
          
        IF (enable = '1') THEN
            
          expbotff(1)(10 DOWNTO 1) <= exptopff(3)(10 DOWNTO 1);
          expbotff(2)(10 DOWNTO 1) <= expnode;
          FOR k IN 1 TO 8 LOOP
            exponentff(k) <= (expbotff(2)(k) AND NOT(zeroexponentff)) OR maxexponentff; 
          END LOOP;
          
          mantissaroundff <= mantissanode;
          FOR k IN 1 TO 23 LOOP
            mantissaff(k) <= (mantissaroundff(k) AND NOT(zeromantissaff)) OR maxmantissaff;
          END LOOP;
          
          zeromantissaff <= zeromantissanode;
          maxmantissaff <= maxmantissanode;
          zeroexponentff <= zeroexponentnode;
          maxexponentff <= maxexponentnode;
          
        END IF;
        
      END IF;
      
    END PROCESS;
  
    preexpnode <= expbotff(1)(10 DOWNTO 1);

  END GENERATE;        
     
  -- round absolute value any way - need register on input of cntusgn
  gaa: FOR k IN 1 TO mantissa GENERATE
    absnode(k) <= aaff(k+10) XOR aaff(mantissa+10);
  END GENERATE;
  absroundnode <= zerovec(mantissa-1 DOWNTO 1) & aaff(mantissa+10);
   
  zeronumber(1) <= absff(1);
  gzma: FOR k IN 2 TO mantissa GENERATE
    zeronumber(k) <= zeronumber(k-1) OR absff(k);
  END GENERATE;
  
  core: hcc_normusgn3236 
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>absff(mantissa DOWNTO 1),countout=>count,
            fracout=>fracout);
                
  roundoverflow(1) <= fracout(7);
  gna: FOR k IN 2 TO 24 GENERATE
    roundoverflow(k) <= roundoverflow(k-1) AND fracout(k+6);
  END GENERATE;
   
  expnode <= preexpnode(10 DOWNTO 1) + ("000000000" & roundoverflowff);
  
  -- always round single output (round to nearest even)
  roundbit <= (fracoutff(mantissa-24) AND fracoutff(mantissa-25)) OR
               (NOT(fracoutff(mantissa-24)) AND fracoutff(mantissa-25) AND 
               (fracoutff(mantissa-26) OR fracoutff(mantissa-27) OR fracoutff(mantissa-28))); 
                
  mantissanode <= fracoutff(mantissa-2 DOWNTO mantissa-24) + 
                 (zerovec(22 DOWNTO 1) & roundbit);
  
  --ML March 8, 2011 consider expnode(10 DOWNTO 9) for zeroexpnode and maxexpnode calculation
  zeroexpnode <= NOT(expnode(10) OR 
                     expnode(9) OR expnode(8) OR expnode(7) OR 
                     expnode(6) OR expnode(5) OR expnode(4) OR 
                     expnode(3) OR expnode(2) OR expnode(1));
                     
  maxexpnode <= NOT(expnode(10)) AND NOT(expnode(9)) AND 
                expnode(8) AND expnode(7) AND expnode(6) AND expnode(5) AND
                expnode(4) AND expnode(3) AND expnode(2) AND expnode(1);
  
  -- all following '1' when true
  -- 24/03/09 - zeroexpnode, maxexpnode also zeros mantissa (SRC bug)
  zeromantissanode <= roundoverflowff OR zeroexpnode OR maxexpnode OR 
                      expnode(9) OR expnode(10) OR 
                      zipff(3+normspeed) OR satff(3+normspeed) OR
                      zeronumberff(1+normspeed);
  maxmantissanode <= nanff(3+normspeed);
  zeroexponentnode <= zeroexpnode OR expnode(10) OR 
                      zipff(3+normspeed) OR zeronumberff(1+normspeed);
  maxexponentnode <= maxexpnode OR (expnode(9) AND NOT(expnode(10))) OR 
                     satff(3+normspeed) OR nanff(3+normspeed);
   
  --*** OUTPUTS ***
  cc(32) <= signff(2+2*normspeed);
  cc(31 DOWNTO 24) <= exponentff;
  cc(23 DOWNTO 1) <= mantissaff(23 DOWNTO 1);
  
  --*** DEBUG ***
  aaexp <= aa(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  ccsgn <= signff(2+2*normspeed);
  ccexp <= exponentff;
  ccman <= mantissaff(23 DOWNTO 1);
     
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOL.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single Format to  ***
--***   Long                                      ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   17/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency:                                    ***
--*** 1 + swSingleNormSpeed                       ***
--***************************************************

ENTITY hcc_castxtol IS 
GENERIC (
         normspeed : positive := 2; -- 1,2 pipes for conversion
         mantissa : integer := 36
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aazip, aasat, aanan : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castxtol;

ARCHITECTURE rtl OF hcc_castxtol IS

  signal leftshiftnum, rightshiftnum : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal leftshiftmax, rightshiftmin : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal leftshiftbus, rightshiftbus : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal selectleftbit, selectleftbitdel : STD_LOGIC;
  signal satshiftbit, satshiftout : STD_LOGIC;
  signal zipshiftbit, zipshiftout : STD_LOGIC;
  signal satout, zipout, nanout : STD_LOGIC;
  signal leftshiftbusff, rightshiftbusff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftmuxff : STD_LOGIC_VECTOR (32 DOWNTO 1);
   
  component hcc_delaybit IS 
  GENERIC (delay : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC;

	     cc : OUT STD_LOGIC
	    );
  end component;
	  
  component hcc_rsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;

  component hcc_lsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_lsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
    
BEGIN

  leftshiftnum <= aa(10 DOWNTO 1) - "0010011010"; -- 154 is 1.0 point
  rightshiftnum <= "0010011010" - aa(10 DOWNTO 1); 
    
  leftshiftmax <= aa(10 DOWNTO 1) - "0010111010"; -- 186 is the max - if +ve, saturate
  rightshiftmin <= aa(10 DOWNTO 1) - "0001111010"; -- 122 is the min - if -ve, zero
    
  selectleftbit <= rightshiftnum(10);
    
  satshiftbit <= selectleftbit AND NOT(leftshiftmax(10));
  zipshiftbit <= NOT(selectleftbit) AND rightshiftmin(10);
    
  gmab: IF (normspeed = 1) GENERATE
    
    sftlc: hcc_lsftcomb32
    PORT MAP (inbus=>aa(42 DOWNTO 11),shift=>leftshiftnum(5 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrc: hcc_rsftcomb32
    PORT MAP (inbus=>aa(42 DOWNTO 11),shift=>rightshiftnum(5 DOWNTO 1),
              outbus=>rightshiftbus);
                
    END GENERATE;

    gmac: IF (normspeed = 2) GENERATE
    
      sftlp: hcc_lsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>aa(42 DOWNTO 11),shift=>leftshiftnum(5 DOWNTO 1),
                outbus=>leftshiftbus);
                
      sftrp: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>aa(42 DOWNTO 11),shift=>rightshiftnum(5 DOWNTO 1),
                outbus=>rightshiftbus); 
                
    END GENERATE;
  
  --*** DELAY CONTROL AND CONDITION SIGNALS ***

  dbmux: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>selectleftbit,cc=>selectleftbitdel); 
                
  dbsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aasat,cc=>satout); 
                
  dbzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aazip,cc=>zipout); 
            
  dbnan: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aanan,cc=>nanout); 

  dbsftsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>satshiftbit,cc=>satshiftout); 
                
  dbsftzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>zipshiftbit,cc=>zipshiftout); 
            
  --*** OUTPUT MUX ***
  
  pao: PROCESS (sysclk,reset)
  BEGIN
       
    IF (reset = '1') THEN
            
      FOR k IN 1 TO 32 LOOP
        leftshiftbusff(k) <= '0';
        rightshiftbusff(k) <= '0';
        shiftmuxff(k) <= '0';
      END LOOP;
          
    ELSIF (rising_edge(sysclk)) THEN
              
      IF (enable = '1') THEN
          
        leftshiftbusff <= leftshiftbus;
        rightshiftbusff <= rightshiftbus;
        FOR k IN 1 TO 32 LOOP
          shiftmuxff(k) <= (((leftshiftbusff(k) AND selectleftbitdel) OR
                             (rightshiftbusff(k) AND NOT(selectleftbitdel))) OR 
                            (satout OR satshiftout OR nanout)) AND 
                            NOT(zipout OR zipshiftout);
        END LOOP;
        
      END IF;
              
    END IF;
             
  END PROCESS;

  --**************
  --*** OUTPUT ***
  --**************
  
  cc <= shiftmuxff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOY.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single to         ***
--***             Internal Double                 ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   17/04/09 - add NAN port                   ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castxtoy IS 
GENERIC (
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         mantissa : positive := 32
        );
PORT (
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC 
		);
END hcc_castxtoy;

ARCHITECTURE rtl OF hcc_castxtoy IS
    
  signal exponentadjust : STD_LOGIC_VECTOR (13 DOWNTO 1);
    
BEGIN

  -- x : 32/36 signed mantissa, 10 bit exponent
  -- y : (internal) 64 signed mantissa, 13 bit exponent 

  exponentadjust <= conv_std_logic_vector (896,13);
  
  cc(67+10*target DOWNTO 68+10*target-mantissa) <= aa(mantissa+10 DOWNTO 11);
  gxa: FOR k IN 14 TO 67+10*target-mantissa GENERATE
    cc(k) <= aa(11);
  END GENERATE;
  
  cc(13 DOWNTO 1) <= ("000" & aa(10 DOWNTO 1)) + exponentadjust;
          
  ccsat <= aasat;
  cczip <= aazip;   
  ccnan <= aanan; 

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--******************************************************************************
--***                                                                        ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER                              ***
--***                                                                        ***
--***   HCC_CASTYTOD.VHD                                                     ***
--***                                                                        ***
--***   Function: Cast Internal Double to IEEE754                            ***
--***             Double                                                     ***
--***                                                                        ***
--***   14/07/07 ML                                                          ***
--***                                                                        ***
--***   (c) 2007 Altera Corporation                                          ***
--***                                                                        ***
--***   Change History                                                       ***
--***                                                                        ***
--***   17/04/09 - add NAN support, also fixed zero/infinity/nan mantissa    ***
--***   29/04/09 - zero output if mantissa in zero                           ***
--***                                                                        ***
--***                                                                        ***
--******************************************************************************

--******************************************************************************
--*** Latency:                                                               ***
--*** 4 + swNormSpeed + swRoundConvert*swDoubleSpeed +                       ***
--*** swRoundConvert*(1 + swDoubleSpeed);                                    ***
--******************************************************************************

ENTITY hcc_castytod IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC;

	   cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_castytod;

ARCHITECTURE rtl OF hcc_castytod IS
  
  constant signdepth : positive := 3 + (roundconvert*doublespeed) + normspeed + roundconvert*(1 + doublespeed);
  constant exptopffdepth : positive := 2 + (roundconvert*doublespeed);
  constant expbotffdepth : positive := normspeed;
  constant satffdepth : positive := 3 + (roundconvert*doublespeed) + normspeed;
  
  type absfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  type exptopfftype IS ARRAY (exptopffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type expbotdelfftype IS ARRAY (expbotffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal absinvnode, absnode, absff, absolute : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal countnorm : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracout, fracoutff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exptopff : exptopfftype;
  signal expbotff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expbotdelff : expbotdelfftype;
  signal exponent : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal satff, zipff, nanff : STD_LOGIC_VECTOR (satffdepth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (signdepth DOWNTO 1);
  signal zeronumber : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal zeronumberff : STD_LOGIC_VECTOR (1+normspeed DOWNTO 1);
  signal roundoverflow : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal roundoverflowff : STD_LOGIC;
  signal expnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal zeroexpnode, maxexpnode : STD_LOGIC;
  signal zeromantissanode, maxmantissanode : STD_LOGIC;
  signal zeroexponentnode, maxexponentnode : STD_LOGIC;
  signal roundbit : STD_LOGIC;
  -- common to all output flows
  signal mantissaoutff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentoutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  -- common to all rounded output flows
  signal mantissaroundff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeromantissaff, maxmantissaff : STD_LOGIC;
  signal zeroexponentff, maxexponentff : STD_LOGIC;
  -- only for doublespeed rounded output
  signal mantissaroundnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeromantissadelff, maxmantissadelff : STD_LOGIC;
  signal zeroexponentdelff, maxexponentdelff : STD_LOGIC;
  -- debug
  signal aaexp : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal aaman : STD_LOGIC_VECTOR(64 DOWNTO 1);
  signal ccsgn : STD_LOGIC;
  signal ccexp : STD_LOGIC_VECTOR(11 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR(52 DOWNTO 1);

  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
     
  component hcc_normus64 IS 
  GENERIC (pipes : positive := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	    fracout : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
    
BEGIN
  
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
         
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 64 LOOP
        fracoutff(k) <= '0';
      END LOOP;  
      FOR k IN 1 TO exptopffdepth LOOP
        FOR j IN 1 TO 13 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO satffdepth LOOP
        satff(k) <= '0';
        zipff(k) <= '0';
        nanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO signdepth LOOP
        signff(k) <= '0';
      END LOOP;    
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        aaff <= aa;
                        
        fracoutff <= fracout;
        
        exptopff(1)(13 DOWNTO 1) <= aaff(13 DOWNTO 1) + "0000000000100";
        FOR k IN 2 TO exptopffdepth LOOP
          exptopff(k)(13 DOWNTO 1) <= exptopff(k-1)(13 DOWNTO 1);
        END LOOP;
        
        satff(1) <= aasat;
        FOR k IN 2 TO satffdepth LOOP
          satff(k) <= satff(k-1);
        END LOOP;
        zipff(1) <= aazip;
        FOR k IN 2 TO satffdepth LOOP
          zipff(k) <= zipff(k-1);
        END LOOP;
        nanff(1) <= aanan;
        FOR k IN 2 TO satffdepth LOOP
          nanff(k) <= nanff(k-1);
        END LOOP;
        signff(1) <= aaff(77);
        FOR k IN 2 TO signdepth LOOP
          signff(k) <= signff(k-1);
        END LOOP;
               
      END IF;
            
    END IF;
  
  END PROCESS;

  gna: FOR k IN 1 TO 64 GENERATE
    absinvnode(k) <= aaff(k+13) XOR aaff(77);
  END GENERATE;
  
  --*** APPLY ROUNDING TO ABS VALUE (IF REQUIRED) ***
  gnb: IF ((roundconvert = 0) OR
           (roundconvert = 1 AND doublespeed = 0)) GENERATE
  
    gnc: IF (roundconvert = 0) GENERATE
      absnode <= absinvnode;
    END GENERATE;
    gnd: IF (roundconvert = 1) GENERATE
      absnode <= absinvnode + (zerovec(63 DOWNTO 1) & aaff(77));
    END GENERATE;

    pnb: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN    
        FOR k IN 1 TO 64 LOOP
          absff(k) <= '0';
        END LOOP;   
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          absff <= absnode;  
        END IF;          
      END IF;
    END PROCESS;

    absolute <= absff;

  END GENERATE;
    
  gnd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE   
    gsa: IF (synthesize = 0) GENERATE
      absone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>absinvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>absolute);
    END GENERATE;
    gsb: IF (synthesize = 1) GENERATE
      abstwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>absinvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>absolute);
    END GENERATE;
  END GENERATE;

  zeronumber(1) <= absolute(1);
  gzma: FOR k IN 2 TO 64 GENERATE
    zeronumber(k) <= zeronumber(k-1) OR absolute(k);
  END GENERATE;
  
  pzm: PROCESS (sysclk, reset)
  BEGIN
    IF (reset = '1') THEN    
      FOR k IN 1 TO normspeed+1 LOOP
        zeronumberff(k) <= '0';
      END LOOP;   
    ELSIF (rising_edge(sysclk)) THEN   
      IF (enable = '1') THEN
        zeronumberff(1) <= NOT(zeronumber(64));
        FOR k IN 2 TO 1+normspeed LOOP
          zeronumberff(k) <= zeronumberff(k-1);
        END LOOP;
      END IF;          
    END IF;
  END PROCESS;
    
  --******************************************************************
  --*** NORMALIZE HERE - 1-3 pipes (countnorm output after 1 pipe) ***
  --******************************************************************

  normcore: hcc_normus64
  GENERIC MAP (pipes=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>absolute,
            countout=>countnorm,fracout=>fracout);

  --****************************
  --*** exponent bottom half ***
  --****************************

  gxa: IF (expbotffdepth = 1) GENERATE

    pxa: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO 13 LOOP
          expbotff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotff(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotff;

  END GENERATE;

  gxb: IF (expbotffdepth > 1) GENERATE

    pxb: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO expbotffdepth LOOP
          FOR j IN 1 TO 13 LOOP
            expbotdelff(k)(j) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotdelff(1)(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
          FOR k IN 2 TO expbotffdepth LOOP
            expbotdelff(k)(13 DOWNTO 1) <= expbotdelff(k-1)(13 DOWNTO 1);
          END LOOP;
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotdelff(expbotffdepth)(13 DOWNTO 1);

  END GENERATE;

  --**************************************
  --*** CALCULATE OVERFLOW & UNDERFLOW ***
  --**************************************

  groa: IF (roundconvert = 1) GENERATE

    roundoverflow(1) <= fracout(10);
    grob: FOR k IN 2 TO 53 GENERATE
      roundoverflow(k) <= roundoverflow(k-1) AND fracout(k+9);
    END GENERATE;

    prca: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        roundoverflowff <= '0';
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          roundoverflowff <= roundoverflow(53);
        END IF;
      END IF;
    END PROCESS;

  END GENERATE;

  -- fracff, expnode, roundoverflowff (if used) aligned here, depth of satffdepth
  zeroexpnode <= NOT(expnode(11) OR expnode(10) OR expnode(9) OR 
                     expnode(8) OR expnode(7) OR expnode(6) OR expnode(5) OR 
                     expnode(4) OR expnode(3) OR expnode(2) OR expnode(1));
                     
  maxexpnode <= expnode(11) AND expnode(10) AND expnode(9) AND
                expnode(8) AND expnode(7) AND expnode(6) AND expnode(5) AND
                expnode(4) AND expnode(3) AND expnode(2) AND expnode(1);
                
  -- '1' when true
  -- zero mantissa if when 0 or infinity result
  groc: IF (roundconvert = 0) GENERATE
    zeromantissanode <= expnode(12) OR expnode(13) OR 
                        zeroexpnode OR maxexpnode OR 
                        zipff(satffdepth) OR satff(satffdepth);
  END GENERATE;
  grod: IF (roundconvert = 1) GENERATE
    zeromantissanode <= roundoverflowff OR expnode(12) OR expnode(13) OR 
                        zeroexpnode OR maxexpnode OR
                        zipff(satffdepth) OR satff(satffdepth) OR
                        zeronumberff(1+normspeed);
  END GENERATE;
  maxmantissanode <= nanff(satffdepth);
  zeroexponentnode <= zeroexpnode OR expnode(13) OR 
                      zipff(satffdepth) OR zeronumberff(1+normspeed);
  -- 12/05/09 - make sure than exp = -1 doesn't trigger max node
  maxexponentnode <= (maxexpnode AND NOT(expnode(12)) AND NOT(expnode(13))) OR 
                     (expnode(12) AND NOT(expnode(13))) OR 
                     satff(satffdepth) OR nanff(satffdepth);

  --**********************
  --*** OUTPUT SECTION ***
  --**********************

  goa: IF (roundconvert = 0) GENERATE
     
    expnode <= exponent;
    
    roundbit <= '0';
   
    poa: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= '0';
        END LOOP;
        
      ELSIF (rising_edge(sysclk)) THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= (fracoutff(k+10) AND NOT(zeromantissanode)) OR maxmantissanode;
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (expnode(k) AND NOT(zeroexponentnode)) OR maxexponentnode;
        END LOOP;
        
      END IF;    
          
    END PROCESS;
    
  END GENERATE;  

  gob: IF (roundconvert = 1 AND doublespeed = 0) GENERATE
  
    expnode <= exponent + (zerovec(12 DOWNTO 1) & roundoverflowff);
    
    -- round to nearest even
    roundbit <= (fracoutff(11) AND fracoutff(10)) OR
                 (NOT(fracoutff(11)) AND fracoutff(10) AND 
                 (fracoutff(9) OR fracoutff(8) OR fracoutff(7))); 
                   
    pob: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaroundff(k) <= '0';
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoneff(k) <= '0';
          exponentoutff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        maxmantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        mantissaroundff <= fracoutff(62 DOWNTO 11) + (zerovec(51 DOWNTO 1) & roundbit);

        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= (mantissaroundff(k) OR maxmantissaff) AND NOT(zeromantissaff);
        END LOOP;
        
        exponentoneff <= expnode(11 DOWNTO 1);
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (exponentoneff(k) OR maxexponentff) AND NOT(zeroexponentff);
        END LOOP;
        
        -- '1' when true
        zeromantissaff <= zeromantissanode;
        maxmantissaff <= maxmantissanode;
        zeroexponentff <= zeroexponentnode;
        maxexponentff <= maxexponentnode;
        
      END IF;    
          
    END PROCESS;
    
  END GENERATE; 
  
  goc: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
    expnode <= exponent + (zerovec(12 DOWNTO 1) & roundoverflowff);
    
    -- round to nearest even
    roundbit <= (fracoutff(11) AND fracoutff(10)) OR
                 (NOT(fracoutff(11)) AND fracoutff(10) AND 
                 (fracoutff(9) OR fracoutff(8) OR fracoutff(7))); 
                 
    poc: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoneff(k) <= '0';
          exponenttwoff(k) <= '0';
          exponentoutff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        maxmantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
        zeromantissadelff <= '0';
        maxmantissadelff <= '0';
        zeroexponentdelff <= '0';
        maxexponentdelff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= (mantissaroundnode(k) AND NOT(zeromantissadelff)) OR maxmantissadelff;
        END LOOP;
        
        exponentoneff <= expnode(11 DOWNTO 1);
        exponenttwoff <= exponentoneff;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (exponenttwoff(k) AND NOT(zeroexponentdelff)) OR maxexponentdelff;
        END LOOP;
        
        -- '1' when true
        zeromantissaff <= zeromantissanode;
        maxmantissaff <= maxmantissanode;
        zeroexponentff <= zeroexponentnode;
        maxexponentff <= maxexponentnode;
        zeromantissadelff <= zeromantissaff;
        maxmantissadelff <= maxmantissaff;
        zeroexponentdelff <= zeroexponentff;
        maxexponentdelff <= maxexponentff;
        
      END IF;    
          
    END PROCESS;
               
    aroa: IF (synthesize = 0) GENERATE
      roone: hcc_addpipeb
      GENERIC MAP (width=>54,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>fracoutff(64 DOWNTO 11),bb=>zerovec(54 DOWNTO 1),carryin=>roundbit,
                cc=>mantissaroundnode);
    END GENERATE;
    arob: IF (synthesize = 1) GENERATE
      rotwo: hcc_addpipes
      GENERIC MAP (width=>54,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>fracoutff(64 DOWNTO 11),bb=>zerovec(54 DOWNTO 1),carryin=>roundbit,
                cc=>mantissaroundnode);
    END GENERATE;

  END GENERATE; 
    
  --*** OUTPUTS ***
  cc(64) <= signff(signdepth);
  cc(63 DOWNTO 53) <= exponentoutff;
  cc(52 DOWNTO 1) <= mantissaoutff;

  --*** DEBUG ***
  aaexp <= aa(13 DOWNTO 1);
  aaman <= aa(77 DOWNTO 14);
  ccsgn <= signff(signdepth);
  ccexp <= exponentoutff;
  ccman <= mantissaoutff;
   
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOF.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double to         ***
--***             External Single                 ***
--***                                             ***
--***   06/03/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castytof IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all conversions when '1'
         mantissa : positive := 32;
         normspeed : positive := 2 -- 1 or 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_castytof;

ARCHITECTURE rtl OF hcc_castytof IS
   
  signal midnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal satnode, zipnode, nannode : STD_LOGIC; 
		  
  component hcc_castytox
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all conversions when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC 
		  );
  end component;
  
  component hcc_castxtof 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           normspeed : positive := 2 -- 1 or 2 
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
BEGIN
 
  one: hcc_castytox
  GENERIC MAP (roundconvert=>roundconvert,mantissa=>mantissa)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,aasat=>aasat,aazip=>aazip,aanan=>aanan,
            cc=>midnode,
            ccsat=>satnode,cczip=>zipnode,ccnan=>nannode);
            
  two: hcc_castxtof 
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>midnode,aasat=>satnode,aazip=>zipnode,aanan=>nannode,
            cc=>cc);
            
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOL.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double Format to  ***
--***   Long                                      ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Latency: normspeed+1                        ***
--***************************************************

ENTITY hcc_castytol IS 
GENERIC (normspeed : positive := 2); -- 1,2 pipes for conversion
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aazip, aasat, aanan : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castytol;

ARCHITECTURE rtl OF hcc_castytol IS

  signal leftshiftnum, rightshiftnum : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal midpoint, maxpoint, minpoint : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal leftshiftmax, rightshiftmin : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal leftshiftbus, rightshiftbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal selectleftbit, selectleftbitdel : STD_LOGIC;
  signal satshiftbit, satshiftout : STD_LOGIC;
  signal zipshiftbit, zipshiftout : STD_LOGIC;
  signal satout, zipout, nanout : STD_LOGIC;
  signal leftshiftbusff, rightshiftbusff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftmuxff : STD_LOGIC_VECTOR (32 DOWNTO 1);
   
  component hcc_delaybit IS 
  GENERIC (delay : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC;

	     cc : OUT STD_LOGIC
	    );
  end component;

  component hcc_lsftcomb64
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;

  component hcc_lsftpipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
    
  component hcc_rsftpipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftcomb64
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
    
BEGIN
 
  midpoint <= conv_std_logic_vector (1054,13);
  maxpoint <= conv_std_logic_vector (1118,13);
  minpoint <= conv_std_logic_vector (1022,13);
  
  leftshiftnum <= aa(13 DOWNTO 1) - midpoint; -- 1054 is 1.0 point
  rightshiftnum <= midpoint - aa(13 DOWNTO 1); 
     
  -- because of 64 bit Y mantissa > 32 bit long, left shift range > right shift rangre
  leftshiftmax <= aa(13 DOWNTO 1) - maxpoint; -- 1118 is the max - if +ve, saturate
  rightshiftmin <= aa(13 DOWNTO 1) - minpoint; -- 1022 is the min - if -ve, zero
    
  selectleftbit <= rightshiftnum(13);
    
  satshiftbit <= selectleftbit AND NOT(leftshiftmax(13));
  zipshiftbit <= NOT(selectleftbit) AND rightshiftmin(13);
    
  gsa: IF (normspeed = 1) GENERATE
    
    sftlc: hcc_lsftcomb64
    PORT MAP (inbus=>aa(77 DOWNTO 14),shift=>leftshiftnum(6 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrc: hcc_rsftcomb64
    PORT MAP (inbus=>aa(77 DOWNTO 14),shift=>rightshiftnum(6 DOWNTO 1),
              outbus=>rightshiftbus);
                
  END GENERATE;

  gsb: IF (normspeed > 1) GENERATE
    
    sftlp: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>aa(77 DOWNTO 14),shift=>leftshiftnum(6 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrp: hcc_rsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>aa(77 DOWNTO 14),shift=>rightshiftnum(6 DOWNTO 1),
              outbus=>rightshiftbus);
                
  END GENERATE;
 
  --*** DELAY CONTROL AND CONDITION SIGNALS ***

  dbmux: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>selectleftbit,cc=>selectleftbitdel); 
                
  dbsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aasat,cc=>satout); 
                
  dbzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aazip,cc=>zipout);
            
  dbnan: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aanan,cc=>nanout); 

  dbsftsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>satshiftbit,cc=>satshiftout); 
                
  dbsftzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>zipshiftbit,cc=>zipshiftout); 
            
  --*** OUTPUT MUX ***
  
  pao: PROCESS (sysclk,reset)
  BEGIN
       
    IF (reset = '1') THEN
            
      FOR k IN 1 TO 64 LOOP
        leftshiftbusff(k) <= '0';
        rightshiftbusff(k) <= '0';
        shiftmuxff(k) <= '0';
      END LOOP;
          
    ELSIF (rising_edge(sysclk)) THEN
              
      IF (enable = '1') THEN
          
        leftshiftbusff <= leftshiftbus(64 DOWNTO 33);
        rightshiftbusff <= rightshiftbus(64 DOWNTO 33);
        FOR k IN 1 TO 32 LOOP
          shiftmuxff(k) <= (((leftshiftbusff(k) AND selectleftbitdel) OR
                             (rightshiftbusff(k) AND NOT(selectleftbitdel))) OR 
                            (satout OR satshiftout OR nanout)) AND 
                            NOT(zipout OR zipshiftout);
        END LOOP;
        
      END IF;
              
    END IF;
             
  END PROCESS;

  --**************
  --*** OUTPUT ***
  --**************
  
  cc <= shiftmuxff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOX.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double to         ***
--***             Internal Single                 ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   20/04/09 - add NAN support, add overflow  ***
--***   support                                   ***
--***   24/08/10 - fixed multiple bugs            ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** NOTES : OPERATIONS                          ***
--***************************************************
-- input always signed y format (mult, divide, have output option

ENTITY hcc_castytox IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all conversions when '1'
         mantissa : positive := 32
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC;

          cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
          ccsat, cczip, ccnan : OUT STD_LOGIC 
        );
END hcc_castytox;

ARCHITECTURE rtl OF hcc_castytox IS
    
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal fracnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal fractional : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal overflowcheck : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal roundbit : STD_LOGIC;
  signal exponentmaximum, exponentminimum : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal exponentadjust : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal chkexpsat, chkexpzip : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expsatbit, expzipbit : STD_LOGIC;
  signal exponentnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal exponent : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal satinff, zipinff, naninff : STD_LOGIC;
  signal satoutff, zipoutff, nanoutff : STD_LOGIC;

BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  exponentmaximum <= conv_std_logic_vector (1151,13); -- 1151 = 1023+128 = 255
  exponentminimum <= conv_std_logic_vector (897,13); -- 897 = 1023-126 = 1
  exponentadjust <= conv_std_logic_vector (896,13); -- 896 = 1023-127
  
  gza: FOR k IN 1 TO mantissa-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa+10 LOOP
        ccff(k) <= '0';
      END LOOP;
      satinff <= '0';
      zipinff <= '0';
      naninff <= '0';
      satoutff <= '0';
      zipoutff <= '0';
      nanoutff <= '0';
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        aaff <= aa;
        
        ccff <= fractional & exponent;
        satinff <= aasat;
        zipinff <= aazip;
        naninff <= aanan;
        
        satoutff <= satinff OR expsatbit;
        zipoutff <= zipinff OR expzipbit;
        nanoutff <= naninff;
      
      END IF;      
            
    END IF;
      
  END PROCESS;

  chkexpsat <= aaff(13 DOWNTO 1) - exponentmaximum; -- ok when -ve
  chkexpzip <= aaff(13 DOWNTO 1) - exponentminimum; -- ok when +ve
  
  expsatbit <= NOT(chkexpsat(13)) OR (NOT(aaff(13)) AND aaff(12));
  expzipbit <= chkexpzip(13) OR aaff(13);
  
  exponentnode <= aaff(13 DOWNTO 1) - exponentadjust;
  gxa: FOR k IN 1 TO 8 GENERATE
    exponent(k) <= (exponentnode(k) OR expsatbit) AND NOT(expzipbit);
  END GENERATE;
  exponent(10 DOWNTO 9) <= "00";

  fracnode <= aaff(77 DOWNTO 78-mantissa);
  
  gma: IF (roundconvert = 0) GENERATE
    fractional <= fracnode;
  END GENERATE;

  gmb: IF (roundconvert = 1) GENERATE
    
    -- issue is when max positive turned into negative number (01111XXX to 10000XXX)
    -- min negative (11111) to min positive (00000) no issue 
    -- but this code zeros round bit if fracnode is "X1111...111"

    overflowcheck(1) <= aaff(78-mantissa);
    gmc: FOR k IN 2 TO mantissa-1 GENERATE
      overflowcheck(k) <= overflowcheck(k-1) AND aaff(77-mantissa+k);
    END GENERATE;  
    roundbit <= NOT(overflowcheck(mantissa-1)) AND aaff(77-mantissa); 

    fractional <= fracnode + (zerovec(mantissa-1 DOWNTO 1) & roundbit);

  END GENERATE;
  
  cc <= ccff;    
  ccsat <= satoutff;
  cczip <= zipoutff; 
  ccnan <= nanoutff;   

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTSGN32.VHD                          ***
--***                                             ***
--***   Function: Count leading bits in a signed  ***
--***             32 bit number                   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntsgn32 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntsgn32;

ARCHITECTURE rtl OF hcc_cntsgn32 IS
    
  type positiontype IS ARRAY (8 DOWNTO 1) OF STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  signal possec, negsec, sec, sel : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_sgnpstn 
  GENERIC (offset : integer := 0;
         width : positive := 5);
  PORT (
        signbit : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (4 DOWNTO 1);

		  position : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		  );
  end component;
  
BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  -- find first leading '1' in inexact portion for 32 bit positive number
  possec(1) <= frac(31) OR frac(30) OR frac(29) OR frac(28);
  possec(2) <= frac(27) OR frac(26) OR frac(25) OR frac(24);
  possec(3) <= frac(23) OR frac(22) OR frac(21) OR frac(20);
  possec(4) <= frac(19) OR frac(18) OR frac(17) OR frac(16);
  possec(5) <= frac(15) OR frac(14) OR frac(13) OR frac(12);
  possec(6) <= frac(11) OR frac(10) OR frac(9) OR frac(8);
  possec(7) <= frac(7) OR frac(6) OR frac(5) OR frac(4);
  possec(8) <= frac(3) OR frac(2) OR frac(1);

  -- find first leading '0' in inexact portion for 32 bit negative number
  negsec(1) <= frac(31) AND frac(30) AND frac(29) AND frac(28);
  negsec(2) <= frac(27) AND frac(26) AND frac(25) AND frac(24);
  negsec(3) <= frac(23) AND frac(22) AND frac(21) AND frac(20);
  negsec(4) <= frac(19) AND frac(18) AND frac(17) AND frac(16);
  negsec(5) <= frac(15) AND frac(14) AND frac(13) AND frac(12);
  negsec(6) <= frac(11) AND frac(10) AND frac(9) AND frac(8);
  negsec(7) <= frac(7) AND frac(6) AND frac(5) AND frac(4);
  negsec(8) <= frac(3) AND frac(2) AND frac(1);
  
  gaa: FOR k IN 1 TO 8 GENERATE
    sec(k) <= (possec(k) AND NOT(frac(32))) OR (NOT(negsec(k)) AND frac(32));
  END GENERATE;
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(7) <= sec(7) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
  sel(8) <= sec(8) AND NOT(sec(7)) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
            
  pone: hcc_sgnpstn 
  GENERIC MAP (offset=>0,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(31 DOWNTO 28),
            position=>position(1)(5 DOWNTO 1));
  ptwo: hcc_sgnpstn 
  GENERIC MAP (offset=>4,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(27 DOWNTO 24),
            position=>position(2)(5 DOWNTO 1));
  pthr: hcc_sgnpstn 
  GENERIC MAP (offset=>8,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(23 DOWNTO 20),
            position=>position(3)(5 DOWNTO 1));   
  pfor: hcc_sgnpstn 
  GENERIC MAP (offset=>12,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(19 DOWNTO 16),
            position=>position(4)(5 DOWNTO 1));
  pfiv: hcc_sgnpstn 
  GENERIC MAP (offset=>16,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(15 DOWNTO 12),
            position=>position(5)(5 DOWNTO 1));
  psix: hcc_sgnpstn 
  GENERIC MAP (offset=>20,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(11 DOWNTO 8),
            position=>position(6)(5 DOWNTO 1));
  psev: hcc_sgnpstn 
  GENERIC MAP (offset=>24,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(7 DOWNTO 4),
            position=>position(7)(5 DOWNTO 1));
  pegt: hcc_sgnpstn 
  GENERIC MAP (offset=>28,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>lastfrac,
            position=>position(8)(5 DOWNTO 1));  
            
  lastfrac <= frac(3 DOWNTO 1) & frac(32);          
 
  gmc: FOR k IN 1 TO 5 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6)) OR 
                (position(7)(k) AND sel(7)) OR
                (position(8)(k) AND sel(8));
  END GENERATE;
  count(6) <= '0';
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTSGN36.VHD                          ***
--***                                             ***
--***   Function: Count leading bits in a signed  ***
--***             36 bit number                   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntsgn36 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntsgn36;

ARCHITECTURE rtl OF hcc_cntsgn36 IS
    
  type positiontype IS ARRAY (9 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal possec, negsec, sec, sel : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_sgnpstn 
  GENERIC (offset : integer := 0;
         width : positive := 5);
  PORT (
        signbit : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (4 DOWNTO 1);

		  position : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		  );
  end component;
  
BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  -- find first leading '1' in inexact portion for 32 bit positive number
  possec(1) <= frac(35) OR frac(34) OR frac(33) OR frac(32);
  possec(2) <= frac(31) OR frac(30) OR frac(29) OR frac(28);
  possec(3) <= frac(27) OR frac(26) OR frac(25) OR frac(24);
  possec(4) <= frac(23) OR frac(22) OR frac(21) OR frac(20);
  possec(5) <= frac(19) OR frac(18) OR frac(17) OR frac(16);
  possec(6) <= frac(15) OR frac(14) OR frac(13) OR frac(12);
  possec(7) <= frac(11) OR frac(10) OR frac(9) OR frac(8);
  possec(8) <= frac(7) OR frac(6) OR frac(5) OR frac(4);
  possec(9) <= frac(3) OR frac(2) OR frac(1);

  -- find first leading '0' in inexact portion for 32 bit negative number
  negsec(1) <= frac(35) AND frac(34) AND frac(33) AND frac(32);
  negsec(2) <= frac(31) AND frac(30) AND frac(29) AND frac(28);
  negsec(3) <= frac(27) AND frac(26) AND frac(25) AND frac(24);
  negsec(4) <= frac(23) AND frac(22) AND frac(21) AND frac(20);
  negsec(5) <= frac(19) AND frac(18) AND frac(17) AND frac(16);
  negsec(6) <= frac(15) AND frac(14) AND frac(13) AND frac(12);
  negsec(7) <= frac(11) AND frac(10) AND frac(9) AND frac(8);
  negsec(8) <= frac(7) AND frac(6) AND frac(5) AND frac(4);
  negsec(9) <= frac(3) AND frac(2) AND frac(1);
  
  gaa: FOR k IN 1 TO 9 GENERATE
    sec(k) <= (possec(k) AND NOT(frac(36))) OR (NOT(negsec(k)) AND frac(36));
  END GENERATE;
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(7) <= sec(7) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
  sel(8) <= sec(8) AND NOT(sec(7)) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
  sel(9) <= sec(9) AND NOT(sec(8)) AND NOT(sec(7)) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND 
            NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
                      
  pone: hcc_sgnpstn 
  GENERIC MAP (offset=>0,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(35 DOWNTO 32),
            position=>position(1)(6 DOWNTO 1));
  ptwo: hcc_sgnpstn 
  GENERIC MAP (offset=>4,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(31 DOWNTO 28),
            position=>position(2)(6 DOWNTO 1));
  pthr: hcc_sgnpstn 
  GENERIC MAP (offset=>8,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(27 DOWNTO 24),
            position=>position(3)(6 DOWNTO 1));   
  pfor: hcc_sgnpstn 
  GENERIC MAP (offset=>12,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(23 DOWNTO 20),
            position=>position(4)(6 DOWNTO 1));
  pfiv: hcc_sgnpstn 
  GENERIC MAP (offset=>16,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(19 DOWNTO 16),
            position=>position(5)(6 DOWNTO 1));
  psix: hcc_sgnpstn 
  GENERIC MAP (offset=>20,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(15 DOWNTO 12),
            position=>position(6)(6 DOWNTO 1));
  psev: hcc_sgnpstn 
  GENERIC MAP (offset=>24,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(11 DOWNTO 8),
            position=>position(7)(6 DOWNTO 1));
  pegt: hcc_sgnpstn 
  GENERIC MAP (offset=>28,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>frac(7 DOWNTO 4),
            position=>position(8)(6 DOWNTO 1)); 
  pnin: hcc_sgnpstn 
  GENERIC MAP (offset=>28,width=>6)
  PORT MAP (signbit=>frac(36),inbus=>lastfrac,
            position=>position(9)(6 DOWNTO 1));  
            
  lastfrac <= frac(3 DOWNTO 1) & frac(36);          
 
  gmc: FOR k IN 1 TO 6 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6)) OR 
                (position(7)(k) AND sel(7)) OR
                (position(8)(k) AND sel(8)) OR
                (position(9)(k) AND sel(9));
  END GENERATE;
  
END rtl;


LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSCOMB64.VHD                       ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 64 bit number          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntuscomb64 IS
PORT (
      frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
END hcc_cntuscomb64;

ARCHITECTURE rtl of hcc_cntuscomb64 IS

  type positiontype IS ARRAY (11 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal position, positionmux : positiontype;
  signal zerogroup, firstzero : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component hcc_usgnpos
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
BEGIN

  zerogroup(1) <= frac(63) OR frac(62) OR frac(61) OR frac(60) OR frac(59) OR frac(58);
  zerogroup(2) <= frac(57) OR frac(56) OR frac(55) OR frac(54) OR frac(53) OR frac(52);
  zerogroup(3) <= frac(51) OR frac(50) OR frac(49) OR frac(48) OR frac(47) OR frac(46);
  zerogroup(4) <= frac(45) OR frac(44) OR frac(43) OR frac(42) OR frac(41) OR frac(40);
  zerogroup(5) <= frac(39) OR frac(38) OR frac(37) OR frac(36) OR frac(35) OR frac(34);
  zerogroup(6) <= frac(33) OR frac(32) OR frac(31) OR frac(30) OR frac(29) OR frac(28);
  zerogroup(7) <= frac(27) OR frac(26) OR frac(25) OR frac(24) OR frac(23) OR frac(22);
  zerogroup(8) <= frac(21) OR frac(20) OR frac(19) OR frac(18) OR frac(17) OR frac(16);
  zerogroup(9) <= frac(15) OR frac(14) OR frac(13) OR frac(12) OR frac(11) OR frac(10);
  zerogroup(10) <= frac(9) OR frac(8) OR frac(7) OR frac(6) OR frac(5) OR frac(4);
  zerogroup(11) <= frac(3) OR frac(2) OR frac(1);

  firstzero(1) <= zerogroup(1);
  firstzero(2) <= NOT(zerogroup(1)) AND zerogroup(2);
  firstzero(3) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND zerogroup(3);
  firstzero(4) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND zerogroup(4);
  firstzero(5) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND zerogroup(5);
  firstzero(6) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND NOT(zerogroup(5)) AND zerogroup(6);                
  firstzero(7) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND zerogroup(7); 
  firstzero(8) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND zerogroup(8); 
  firstzero(9) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                  AND zerogroup(9); 
  firstzero(10) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                   AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                   AND NOT(zerogroup(9)) AND zerogroup(10);
  firstzero(11) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                   AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                   AND NOT(zerogroup(9)) AND NOT(zerogroup(10)) AND zerogroup(11);

  pone: hcc_usgnpos 
  GENERIC MAP (start=>0) 
  PORT MAP (ingroup=>frac(63 DOWNTO 58),position=>position(1)(6 DOWNTO 1));
  ptwo: hcc_usgnpos 
  GENERIC MAP (start=>6) 
  PORT MAP (ingroup=>frac(57 DOWNTO 52),position=>position(2)(6 DOWNTO 1));
  pthr: hcc_usgnpos 
  GENERIC MAP (start=>12) 
  PORT MAP (ingroup=>frac(51 DOWNTO 46),position=>position(3)(6 DOWNTO 1));
  pfor: hcc_usgnpos 
  GENERIC MAP (start=>18) 
  PORT MAP (ingroup=>frac(45 DOWNTO 40),position=>position(4)(6 DOWNTO 1));
  pfiv: hcc_usgnpos 
  GENERIC MAP (start=>24) 
  PORT MAP (ingroup=>frac(39 DOWNTO 34),position=>position(5)(6 DOWNTO 1));
  psix: hcc_usgnpos 
  GENERIC MAP (start=>30) 
  PORT MAP (ingroup=>frac(33 DOWNTO 28),position=>position(6)(6 DOWNTO 1));
  psev: hcc_usgnpos 
  GENERIC MAP (start=>36) 
  PORT MAP (ingroup=>frac(27 DOWNTO 22),position=>position(7)(6 DOWNTO 1));
  pegt: hcc_usgnpos 
  GENERIC MAP (start=>42) 
  PORT MAP (ingroup=>frac(21 DOWNTO 16),position=>position(8)(6 DOWNTO 1));
  pnin: hcc_usgnpos 
  GENERIC MAP (start=>48) 
  PORT MAP (ingroup=>frac(15 DOWNTO 10),position=>position(9)(6 DOWNTO 1));
  pten: hcc_usgnpos 
  GENERIC MAP (start=>54) 
  PORT MAP (ingroup=>frac(9 DOWNTO 4),position=>position(10)(6 DOWNTO 1));
  pelv: hcc_usgnpos 
  GENERIC MAP (start=>60) 
  PORT MAP (ingroup=>lastfrac,position=>position(11)(6 DOWNTO 1));
    
  lastfrac <= frac(3 DOWNTO 1) & "000";
                                
  gma: FOR k IN 1 TO 6 GENERATE
    positionmux(1)(k) <= position(1)(k) AND firstzero(1);
    gmb: FOR j IN 2 TO 11 GENERATE
      positionmux(j)(k) <= positionmux(j-1)(k) OR (position(j)(k) AND firstzero(j));
    END GENERATE;
  END GENERATE;
  
  count <= positionmux(11)(6 DOWNTO 1);
                                               
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSGN32.VHD                         ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 32 bit number          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntusgn32 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntusgn32;

ARCHITECTURE rtl OF hcc_cntusgn32 IS
    
  type positiontype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal sec, sel : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_usgnpos IS
  GENERIC (start : integer := 10);
  PORT (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
       );
  end component;
  
BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  -- find first leading '1' in inexact portion for 32 bit positive number
  sec(1) <= frac(31) OR frac(30) OR frac(29) OR frac(28) OR frac(27) OR frac(26);
  sec(2) <= frac(25) OR frac(24) OR frac(23) OR frac(22) OR frac(21) OR frac(20);
  sec(3) <= frac(19) OR frac(18) OR frac(17) OR frac(16) OR frac(15) OR frac(14);
  sec(4) <= frac(13) OR frac(12) OR frac(11) OR frac(10) OR frac(9) OR frac(8);
  sec(5) <= frac(7) OR frac(6) OR frac(5) OR frac(4) OR frac(3) OR frac(2);
  sec(6) <= frac(1);
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
            
  pone: hcc_usgnpos 
  GENERIC MAP (start=>0)
  PORT MAP (ingroup=>frac(31 DOWNTO 26),
            position=>position(1)(6 DOWNTO 1));
  ptwo: hcc_usgnpos 
  GENERIC MAP (start=>6)
  PORT MAP (ingroup=>frac(25 DOWNTO 20),
            position=>position(2)(6 DOWNTO 1));
  pthr: hcc_usgnpos 
  GENERIC MAP (start=>12)
  PORT MAP (ingroup=>frac(19 DOWNTO 14),
            position=>position(3)(6 DOWNTO 1));          
  pfor: hcc_usgnpos 
  GENERIC MAP (start=>18)
  PORT MAP (ingroup=>frac(13 DOWNTO 8),
            position=>position(4)(6 DOWNTO 1));
  pfiv: hcc_usgnpos 
  GENERIC MAP (start=>24)
  PORT MAP (ingroup=>frac(7 DOWNTO 2),
            position=>position(5)(6 DOWNTO 1));
  psix: hcc_usgnpos 
  GENERIC MAP (start=>30)
  PORT MAP (ingroup=>lastfrac,
            position=>position(6)(6 DOWNTO 1));          
             
  lastfrac <= frac(1) & "00000";          
 
  gmc: FOR k IN 1 TO 6 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6));
  END GENERATE;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSGN36.VHD                         ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 36 bit number          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntusgn36 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntusgn36;

ARCHITECTURE rtl OF hcc_cntusgn36 IS
    
  type positiontype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal sec, sel : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_usgnpos IS
  GENERIC (start : integer := 10);
  PORT (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
       );
  end component;
  
BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  -- find first leading '1' in inexact portion for 32 bit positive number
  sec(1) <= frac(35) OR frac(34) OR frac(33) OR frac(32) OR frac(31) OR frac(30);
  sec(2) <= frac(29) OR frac(28) OR frac(27) OR frac(26) OR frac(25) OR frac(24);
  sec(3) <= frac(23) OR frac(22) OR frac(21) OR frac(20) OR frac(19) OR frac(18);
  sec(4) <= frac(17) OR frac(16) OR frac(15) OR frac(14) OR frac(13) OR frac(12);
  sec(5) <= frac(11) OR frac(10) OR frac(9) OR frac(8) OR frac(7) OR frac(6);
  sec(6) <= frac(5) OR frac(4) OR frac(3) OR frac(2) OR frac(1);
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
            
  pone: hcc_usgnpos 
  GENERIC MAP (start=>0)
  PORT MAP (ingroup=>frac(35 DOWNTO 30),
            position=>position(1)(6 DOWNTO 1));
  ptwo: hcc_usgnpos 
  GENERIC MAP (start=>6)
  PORT MAP (ingroup=>frac(29 DOWNTO 24),
            position=>position(2)(6 DOWNTO 1));
  pthr: hcc_usgnpos 
  GENERIC MAP (start=>12)
  PORT MAP (ingroup=>frac(23 DOWNTO 18),
            position=>position(3)(6 DOWNTO 1));          
  pfor: hcc_usgnpos 
  GENERIC MAP (start=>18)
  PORT MAP (ingroup=>frac(17 DOWNTO 12),
            position=>position(4)(6 DOWNTO 1));
  pfiv: hcc_usgnpos 
  GENERIC MAP (start=>24)
  PORT MAP (ingroup=>frac(11 DOWNTO 6),
            position=>position(5)(6 DOWNTO 1));
  psix: hcc_usgnpos 
  GENERIC MAP (start=>30)
  PORT MAP (ingroup=>lastfrac,
            position=>position(6)(6 DOWNTO 1));          
             
  lastfrac <= frac(5 DOWNTO 1) & '0';          
 
  gmc: FOR k IN 1 TO 6 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6));
  END GENERATE;
  
END rtl;


LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSPIPE64.VHD                       ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 64 bit number          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_cntuspipe64 IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
END hcc_cntuspipe64;

ARCHITECTURE rtl of hcc_cntuspipe64 IS

  type positiontype IS ARRAY (11 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal position, positionff, positionmux : positiontype;
  signal zerogroup, firstzeroff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component hcc_usgnpos
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
BEGIN

pp: PROCESS (sysclk,reset)
BEGIN
    
  IF (reset = '1') THEN
      
    FOR k IN 1 TO 11 LOOP
      FOR j IN 1 TO 6 LOOP
        positionff(k)(j) <= '0';
      END LOOP;
    END LOOP;
  
  ELSIF (rising_edge(sysclk)) THEN
     
    IF (enable = '1') THEN

      firstzeroff(1) <= zerogroup(1);
      firstzeroff(2) <= NOT(zerogroup(1)) AND zerogroup(2);
      firstzeroff(3) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND zerogroup(3);
      firstzeroff(4) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND zerogroup(4);
      firstzeroff(5) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND zerogroup(5);
      firstzeroff(6) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND zerogroup(6);                
      firstzeroff(7) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND zerogroup(7); 
      firstzeroff(8) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND zerogroup(8); 
      firstzeroff(9) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                      AND zerogroup(9); 
      firstzeroff(10) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                       AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                       AND NOT(zerogroup(9)) AND zerogroup(10);
      firstzeroff(11) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                       AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                       AND NOT(zerogroup(9)) AND NOT(zerogroup(10)) AND zerogroup(11);

      FOR k IN 1 TO 11 LOOP
        positionff(k)(6 DOWNTO 1) <= position(k)(6 DOWNTO 1);
      END LOOP;
     
    END IF;
    
  END IF;
  
END PROCESS;

  zerogroup(1) <= frac(63) OR frac(62) OR frac(61) OR frac(60) OR frac(59) OR frac(58);
  zerogroup(2) <= frac(57) OR frac(56) OR frac(55) OR frac(54) OR frac(53) OR frac(52);
  zerogroup(3) <= frac(51) OR frac(50) OR frac(49) OR frac(48) OR frac(47) OR frac(46);
  zerogroup(4) <= frac(45) OR frac(44) OR frac(43) OR frac(42) OR frac(41) OR frac(40);
  zerogroup(5) <= frac(39) OR frac(38) OR frac(37) OR frac(36) OR frac(35) OR frac(34);
  zerogroup(6) <= frac(33) OR frac(32) OR frac(31) OR frac(30) OR frac(29) OR frac(28);
  zerogroup(7) <= frac(27) OR frac(26) OR frac(25) OR frac(24) OR frac(23) OR frac(22);
  zerogroup(8) <= frac(21) OR frac(20) OR frac(19) OR frac(18) OR frac(17) OR frac(16);
  zerogroup(9) <= frac(15) OR frac(14) OR frac(13) OR frac(12) OR frac(11) OR frac(10);
  zerogroup(10) <= frac(9) OR frac(8) OR frac(7) OR frac(6) OR frac(5) OR frac(4);
  zerogroup(11) <= frac(3) OR frac(2) OR frac(1);

pone: hcc_usgnpos 
GENERIC MAP (start=>0) 
PORT MAP (ingroup=>frac(63 DOWNTO 58),position=>position(1)(6 DOWNTO 1));
ptwo: hcc_usgnpos 
GENERIC MAP (start=>6) 
PORT MAP (ingroup=>frac(57 DOWNTO 52),position=>position(2)(6 DOWNTO 1));
pthr: hcc_usgnpos 
GENERIC MAP (start=>12) 
PORT MAP (ingroup=>frac(51 DOWNTO 46),position=>position(3)(6 DOWNTO 1));
pfor: hcc_usgnpos 
GENERIC MAP (start=>18) 
PORT MAP (ingroup=>frac(45 DOWNTO 40),position=>position(4)(6 DOWNTO 1));
pfiv: hcc_usgnpos 
GENERIC MAP (start=>24) 
PORT MAP (ingroup=>frac(39 DOWNTO 34),position=>position(5)(6 DOWNTO 1));
psix: hcc_usgnpos 
GENERIC MAP (start=>30) 
PORT MAP (ingroup=>frac(33 DOWNTO 28),position=>position(6)(6 DOWNTO 1));
psev: hcc_usgnpos 
GENERIC MAP (start=>36) 
PORT MAP (ingroup=>frac(27 DOWNTO 22),position=>position(7)(6 DOWNTO 1));
pegt: hcc_usgnpos 
GENERIC MAP (start=>42) 
PORT MAP (ingroup=>frac(21 DOWNTO 16),position=>position(8)(6 DOWNTO 1));
pnin: hcc_usgnpos 
GENERIC MAP (start=>48) 
PORT MAP (ingroup=>frac(15 DOWNTO 10),position=>position(9)(6 DOWNTO 1));
pten: hcc_usgnpos 
GENERIC MAP (start=>54) 
PORT MAP (ingroup=>frac(9 DOWNTO 4),position=>position(10)(6 DOWNTO 1));
pelv: hcc_usgnpos 
GENERIC MAP (start=>60) 
PORT MAP (ingroup=>lastfrac,position=>position(11)(6 DOWNTO 1));
    
lastfrac <= frac(3 DOWNTO 1) & "000";
                                
gma: FOR k IN 1 TO 6 GENERATE
  positionmux(1)(k) <= positionff(1)(k) AND firstzeroff(1);
  gmb: FOR j IN 2 TO 11 GENERATE
    positionmux(j)(k) <= positionmux(j-1)(k) OR (positionff(j)(k) AND firstzeroff(j));
  END GENERATE;
END GENERATE;
  
count <= positionmux(11)(6 DOWNTO 1);
                                               
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELAY.VHD                             ***
--***                                             ***
--***   Function: Delay an arbitrary width an     ***
--***             arbitrary number of stages      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_delay IS 
GENERIC (
         width : positive := 32;
         delay : positive := 10;
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);

	   cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	  );
END hcc_delay;

ARCHITECTURE rtl OF hcc_delay IS
  
  type delmemfftype IS ARRAY (delay DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  
  signal delmemff : delmemfftype;
  signal delinff, deloutff : STD_LOGIC_VECTOR (width DOWNTO 1);
  
  component hcc_delmem
  GENERIC (
           width : positive := 64;
           delay : positive := 18
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
    
BEGIN
   
  gda: IF (delay = 1) GENERATE
  
    pone: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO width LOOP
          delinff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delinff <= aa;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delinff;
    
  END GENERATE;
  
  gdb: IF ( ((delay > 1) AND (delay < 5) AND synthesize = 1) OR ((delay > 1) AND synthesize = 0)) GENERATE
  
    ptwo: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR j IN 1 TO delay LOOP
          FOR k IN 1 TO width LOOP
            delmemff(j)(k) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delmemff(1)(width DOWNTO 1) <= aa;
          FOR k IN 2 TO delay LOOP
            delmemff(k)(width DOWNTO 1) <= delmemff(k-1)(width DOWNTO 1);
          END LOOP;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delmemff(delay)(width DOWNTO 1);
    
  END GENERATE;     

  gdc: IF (delay > 4 AND synthesize = 1) GENERATE
    
    core: hcc_delmem
    GENERIC MAP (width=>width,delay=>delay)
    PORT MAP (sysclk=>sysclk,enable=>enable,
              aa=>aa,cc=>cc);

  END GENERATE;   
    
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELAYBIT.VHD                          ***
--***                                             ***
--***   Function: Delay a single bit an           ***
--***             arbitrary number of stages      ***
--***                                             ***
--***   13/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_delaybit IS 
GENERIC (delay : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC;

	   cc : OUT STD_LOGIC
	  );
END hcc_delaybit;

ARCHITECTURE rtl OF hcc_delaybit IS

  signal delff : STD_LOGIC_VECTOR (delay DOWNTO 1);
    
BEGIN
   
  gda: IF (delay = 1) GENERATE
  
    pone: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        delff(1) <= '0';
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delff(1) <= aa;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delff(1);
    
  END GENERATE;
  
  gdb: IF (delay > 1) GENERATE
  
    ptwo: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO delay LOOP
            delff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delff(1) <= aa;
          FOR k IN 2 TO delay LOOP
            delff(k) <= delff(k-1);
          END LOOP;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delff(delay);
    
  END GENERATE;     

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELMEM.VHD                            ***
--***                                             ***
--***   Function: Delay an arbitrary width an     ***
--***             arbitrary number of stages      ***
--***                                             ***
--***   Note: this code megawizard generated      ***
--***                                             ***
--***   12/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_delmem IS
GENERIC (
         width : positive := 79;
         delay : positive := 7
        );
PORT (
      sysclk : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);

	  cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	 );
END hcc_delmem;

ARCHITECTURE SYN OF hcc_delmem IS

  signal dummy : STD_LOGIC_VECTOR (width DOWNTO 1);
   
  COMPONENT altshift_taps
  GENERIC (
		     lpm_hint		: STRING;
		     lpm_type		: STRING;
		     number_of_taps		: NATURAL;
		     tap_distance		: NATURAL;
		     width		: NATURAL
	       );
  PORT (
		  taps	: OUT STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		  clken	: IN STD_LOGIC ;
		  clock	: IN STD_LOGIC ;
		  shiftout	: OUT STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		  shiftin	: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0)
	    );
  END COMPONENT;
	
BEGIN

	delcore: altshift_taps
	GENERIC MAP (
		          lpm_hint => "RAM_BLOCK_TYPE=M512",
		          lpm_type => "altshift_taps",
		          number_of_taps => 1,
		          tap_distance => delay,
		          width => width
	            )
	PORT MAP (
		       clock => sysclk,
		       clken => enable,
		       shiftin => aa,
		       taps => dummy,
		       shiftout => cc
	         );

END SYN;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTCOMB32.VHD                        ***
--***                                             ***
--***   Function: Combinatorial left shift, 32    ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftcomb32 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_lsftcomb32;

ARCHITECTURE rtl OF hcc_lsftcomb32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 32 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5))) OR
                 (levtwo(k-16) AND     shift(5));
  END GENERATE;

  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTCOMB36.VHD                        ***
--***                                             ***
--***   Function: Combinatorial left shift, 36    ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftcomb36 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_lsftcomb36;

ARCHITECTURE rtl OF hcc_lsftcomb36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 36 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 36 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k-16) AND NOT(shift(6)) AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 36 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k-16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k-32) AND     shift(6)  AND NOT(shift(5)));
  END GENERATE;
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTCOMB64.VHD                        ***
--***                                             ***
--***   Function: Combinatorial left shift, 64    ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftcomb64 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_lsftcomb64;

ARCHITECTURE rtl OF hcc_lsftcomb64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 64 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 64 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k-16) AND NOT(shift(6)) AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k-16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k-32) AND     shift(6)  AND NOT(shift(5)));
  END GENERATE;
  gcd: FOR k IN 49 TO 64 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k-16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k-32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(k-48) AND     shift(6)  AND     shift(5)); 
  END GENERATE;
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTPIPE32.VHD                        ***
--***                                             ***
--***   Function: 1 pipeline stage left shift, 32 ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftpipe32 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_lsftpipe32;

ARCHITECTURE rtl OF hcc_lsftpipe32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftff : STD_LOGIC;
  signal levtwoff : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 32 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;

  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= '0';
      FOR k IN 1 TO 32 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff)) OR
                 (levtwoff(k-16) AND     shiftff);
  END GENERATE;

  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTPIPE36.VHD                        ***
--***                                             ***
--***   Function: 1 pipeline stage left shift, 36 ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftpipe36 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_lsftpipe36;

ARCHITECTURE rtl OF hcc_lsftpipe36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (6 DOWNTO 5);
  signal levtwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 36 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 36 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;

  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 36 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 36 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5)));
  END GENERATE;
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTPIPE64.VHD                        ***
--***                                             ***
--***   Function: 1 pipeline stage left shift, 64 ***
--***             bit number                      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_lsftpipe64 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_lsftpipe64;

ARCHITECTURE rtl OF hcc_lsftpipe64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (6 DOWNTO 5);
  signal levtwoff : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 64 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 64 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 64 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5)));
  END GENERATE;
  gcd: FOR k IN 49 TO 64 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5))) OR
                 (levtwoff(k-48) AND     shiftff(6)  AND     shiftff(5)); 
  END GENERATE;
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL18USUS.VHD                         ***
--***                                             ***
--***   Function: 2 pipeline stage unsigned 18    ***
--***             bit multiplier                  ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul18usus IS
	PORT
	(
		aclr3		: IN STD_LOGIC  := '0';
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		ena0		: IN STD_LOGIC  := '1';
		result		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
END hcc_mul18usus;


ARCHITECTURE SYN OF hcc_mul18usus IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (35 DOWNTO 0);



	COMPONENT altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(35 DOWNTO 0);

	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_register => "UNREGISTERED",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 18,
		width_b => 18,
		width_result => 36
	)
	PORT MAP (
		dataa => dataa_0,
		datab => datab_0,
		clock0 => clock0,
		aclr3 => aclr3,
		ena0 => ena0,
		result => sub_wire0
	);



END SYN;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL2727S.VHD                          ***
--***                                             ***
--***   Function: 2 pipeline stage signed 27 bit  ***
--***             SV(behavioral/synthesizable)    ***
--***                                             ***
--***   30/10/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul2727s IS 
GENERIC (width : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		);
END hcc_mul2727s;

ARCHITECTURE rtl OF hcc_mul2727s IS

  signal aaff, bbff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal multiplyff : STD_LOGIC_VECTOR (2*width DOWNTO 1);

BEGIN
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO width LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2*width LOOP
        multiplyff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        multiplyff <= aaff * bbff;
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= multiplyff; 
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL3236B.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage unsigned 32 or ***
--***             36 bit multiplier (behavioral)  ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul3236b IS 
GENERIC (width : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		);
END hcc_mul3236b;

ARCHITECTURE rtl OF hcc_mul3236b IS

  signal aaff, bbff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal mulff, muloutff : STD_LOGIC_VECTOR (2*width DOWNTO 1);

BEGIN
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO width LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2*width LOOP
        mulff(k) <= '0';
        muloutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        mulff <= aaff * bbff;
        muloutff <= mulff;
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= muloutff; 
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL3236S.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage unsigned 32 or ***
--***             36 bit multiplier (synth'able)  ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul3236s IS
   GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
END hcc_mul3236s;

ARCHITECTURE syn OF hcc_mul3236s IS

	COMPONENT altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_aclr		: STRING;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (2*width-1 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "SIGNED",
		representation_b => "SIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => width,
		width_b => width,
		width_result => 2*width
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulcc
	);

END syn;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL3236T.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage signed 32 or   ***
--***             36 bit truncated multiplier     ***
--***             with faithful rounding, for use ***
--***             with Arria V.                   ***
--***                                             ***
--***   2012-04-17 SPF                            ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul3236t IS
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
BEGIN
   assert (width <= 36);
END hcc_mul3236t;

ARCHITECTURE syn OF hcc_mul3236t IS
    signal mulaah, mulbbh : STD_LOGIC_VECTOR(36 downto 19);
    signal mulaal, mulbbl : STD_LOGIC_VECTOR(18 downto 1);

    signal multone : STD_LOGIC_VECTOR(72 DOWNTO 37); -- 36 bits
    signal multtwo : STD_LOGIC_VECTOR(55 DOWNTO 19); -- 37 bits

    signal mulaaff, mulbbff, prodff : STD_LOGIC;
    signal addmult : STD_LOGIC_VECTOR(72 DOWNTO 34);
    signal addmultff : STD_LOGIC_VECTOR(72 DOWNTO (73 - width));
    
    component hcc_mul2727s IS
        GENERIC (width : positive);
        PORT (
            sysclk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            enable : IN STD_LOGIC;
            aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
            cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
        );
    end component;
  
    component hcc_MA2_27Ux27S_L2 is
        GENERIC (
            widthaa : positive;
            widthbb : positive;
            widthcc : positive
        );
        PORT (
            aclr    : IN STD_LOGIC;
            clk     : IN STD_LOGIC;
            a0      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
            a1      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
            b0      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);
            b1      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);
            en      : IN STD_LOGIC;
            result  : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
        );
    end component;

BEGIN
    mulaah <= mulaa(width DOWNTO (width - 17));
    mulaal <= mulaa((width - 18) DOWNTO 1) & ((36 - width) DOWNTO 1 => '0');

    mulbbh <= mulbb(width DOWNTO (width - 17));
    mulbbl <= mulbb((width - 18) DOWNTO 1) & ((36 - width) DOWNTO 1 => '0');
    
    mone: hcc_mul2727s
    GENERIC MAP (width=>18)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>mulaah,bb=>mulbbh,
                cc=>multone);

    mtwo: hcc_MA2_27Ux27S_L2
    GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>37)
    PORT MAP (aclr=>reset,clk=>sysclk,
                a0=>mulaal,
                a1=>mulbbl,
                b0=>mulbbh,
                b1=>mulaah,
                en=>enable,
                result=>multtwo);

    addmult <= (multone(72 DOWNTO 37) & '1' & prodff & '1') +
               ((72 DOWNTO 56 => multtwo(55)) & multtwo(55 DOWNTO 35) & '1');

    paa: PROCESS (sysclk,reset)
    BEGIN
        IF (reset = '1') THEN
            mulaaff <= '0';
            mulbbff <= '0';
            prodff  <= '0';
            addmultff <= (others => '0');
        ELSIF (rising_edge(sysclk)) THEN
            IF (enable = '1') THEN
                mulaaff <= mulaal(18);
                mulbbff <= mulbbl(18);
                prodff  <= mulaaff AND mulbbff;
                addmultff <= addmult(72 DOWNTO (73 - width));
            END IF;
        END IF;
    END PROCESS;
    
    mulcc <= addmultff;  
END syn;

LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
LIBRARY altera_mf;
USE altera_mf.all;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54US_28S.VHD                       ***
--***                                             ***
--***   Function: 6 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   28S: Stratix 2, 8 18x18, synthesizeable   ***
--***                                             ***
--***   21/04/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul54us_28s IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)  
     );
END hcc_mul54us_28s;

ARCHITECTURE syn of hcc_mul54us_28s IS

  signal muloneaa, mulonebb : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multwoaa, multwobb, multhraa, multhrbb : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal mulforaa, mulforbb, mulfivaa, mulfivbb : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal muloneout : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal multwoout, multhrout, mulforout, mulfivout : STD_LOGIC_VECTOR (36 DOWNTO 1);

  signal vecone, vectwo, vecthr, vecfor, vecfiv : STD_LOGIC_VECTOR (58 DOWNTO 1);
  signal vecsix, vecsev : STD_LOGIC_VECTOR (58 DOWNTO 1);
  signal vecegt, vecnin, vecten : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumvecone, carvecone : STD_LOGIC_VECTOR (58 DOWNTO 1);
  signal sumvectwo, carvectwo : STD_LOGIC_VECTOR (58 DOWNTO 1);
  signal sumvecthr, carvecthr : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumoneff, caroneff : STD_LOGIC_VECTOR (58 DOWNTO 1);
  signal sumtwoff, cartwoff : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal resultnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);

  component altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_aclr		: STRING;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (width_b-1 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (width_result-1 DOWNTO 0)
	);
	end component;
	
	-- identical component to that above, but fixed at 18x18, latency 2
	-- mul18usus generated by Quartus 
	component hcc_mul18usus
	PORT
	(
		aclr3		: IN STD_LOGIC  := '0';
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		ena0		: IN STD_LOGIC  := '1';
		result		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
	end component;

	COMPONENT lpm_add_sub
	GENERIC (
		lpm_direction		: STRING;
		lpm_hint		: STRING;
		lpm_pipeline		: NATURAL;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
	);
	END COMPONENT;
		 
BEGIN

  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  muloneaa <= mulaa(54 DOWNTO 19);
  mulonebb <= mulbb(54 DOWNTO 19);
  
  multwoaa <= mulaa(18 DOWNTO 1);
  multwobb <= mulbb(36 DOWNTO 19);
  multhraa <= mulaa(18 DOWNTO 1);
  multhrbb <= mulbb(54 DOWNTO 37);
  
  mulforaa <= mulbb(18 DOWNTO 1);
  mulforbb <= mulaa(36 DOWNTO 19);
  mulfivaa <= mulbb(18 DOWNTO 1);
  mulfivbb <= mulaa(54 DOWNTO 37);
  
  -- {A,C) * {B,D}
  -- AAC
  -- BBD
  
  -- AA*BB 36x36=72, latency 3
  mulone : altmult_add
  GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 36,
		width_b => 36,
		width_result => 72
	)
	PORT MAP (
		dataa => muloneaa,
		datab => mulonebb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => muloneout
	);

  --	Blo*C 18*18 = 36, latency = 2
	multwo: hcc_mul18usus
	PORT MAP (
		dataa_0 => multwoaa,
		datab_0 => multwobb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => multwoout
	);
		
  --	Bhi*C 18*18 = 36, latency = 2
  multhr: hcc_mul18usus
	PORT MAP (
		dataa_0 => multhraa,
		datab_0 => multhrbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => multhrout
	);
	
  --	Alo*D 18*18 = 36, latency = 2
  mulfor: hcc_mul18usus
	PORT MAP (
		dataa_0 => mulforaa,
		datab_0 => mulforbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulforout
	);	

  --	Ahi*D 18*18 = 36, latency = 2
  mulfiv: hcc_mul18usus
	PORT MAP (
		dataa_0 => mulfivaa,
		datab_0 => mulfivbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulfivout
	);

  vecone <= zerovec(22 DOWNTO 1) & multwoout;
  vectwo <= zerovec(4 DOWNTO 1) & multhrout & zerovec(18 DOWNTO 1);
  vecthr <= zerovec(22 DOWNTO 1) & mulforout;
  vecfor <= zerovec(4 DOWNTO 1) & mulfivout & zerovec(18 DOWNTO 1);

  gva: FOR k IN 1 TO 58 GENERATE
    sumvecone(k) <= vecone(k) XOR vectwo(k) XOR vecthr(k);
    carvecone(k) <= (vecone(k) AND vectwo(k)) OR 
                    (vectwo(k) AND vecthr(k)) OR 
                    (vecone(k) AND vecthr(k));
  END GENERATE;
 
  vecfiv <= vecfor;
  vecsix <= sumvecone;
  vecsev <= carvecone(57 DOWNTO 1) & '0';

  gvb: FOR k IN 1 TO 58 GENERATE
    sumvectwo(k) <= vecfiv(k) XOR vecsix(k) XOR vecsev(k);
    carvectwo(k) <= (vecfiv(k) AND vecsix(k)) OR 
                    (vecsix(k) AND vecsev(k)) OR 
                    (vecfiv(k) AND vecsev(k));
  END GENERATE;

  paa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN

      FOR k IN 1 TO 58 LOOP
        sumoneff(k) <= '0';
        caroneff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 72 LOOP
        sumtwoff(k) <= '0';
        cartwoff(k) <= '0';
      END LOOP;
      

    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN

        sumoneff <= sumvectwo;
        caroneff <= carvectwo(57 DOWNTO 1) & '0';
        sumtwoff <= sumvecthr;
        cartwoff <= carvecthr(71 DOWNTO 1) & '0';

      END IF;

    END IF;

  END PROCESS;

  vecegt <= zerovec(32 DOWNTO 1) & sumoneff(58 DOWNTO 19);
  vecnin <= zerovec(32 DOWNTO 1) & caroneff(58 DOWNTO 19);
  vecten <= muloneout(72 DOWNTO 1);

  gvc: FOR k IN 1 TO 72 GENERATE
    sumvecthr(k) <= vecegt(k) XOR vecnin(k) XOR vecten(k);
    carvecthr(k) <= (vecegt(k) AND vecnin(k)) OR 
                    (vecnin(k) AND vecten(k)) OR 
                    (vecegt(k) AND vecten(k));
  END GENERATE;

	adder : lpm_add_sub
	GENERIC MAP (
		lpm_direction => "ADD",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		lpm_pipeline => 2,
		lpm_type => "LPM_ADD_SUB",
		lpm_width => 64
	)
	PORT MAP (
		dataa => sumtwoff(72 DOWNTO 9),
		datab => cartwoff(72 DOWNTO 9),
		clken => enable,
		aclr => reset,
		clock => sysclk,
		result => resultnode
	);
	
  mulcc <= resultnode;
                                  
END syn;


LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
LIBRARY altera_mf;
USE altera_mf.all;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54US_29S.VHD                       ***
--***                                             ***
--***   Function: 6 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   29S: Stratix 2, 9 18x18, synthesizeable   ***
--***                                             ***
--***   21/04/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   21/04/09 Created from HCC_MUL54USS        ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul54us_29s IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)  
     );
END hcc_mul54us_29s;

ARCHITECTURE syn of hcc_mul54us_29s IS

  signal muloneaa, mulonebb : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multwoaa, multwobb, multhraa, multhrbb : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal mulforaa, mulforbb, mulfivaa, mulfivbb : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal mulsixaa, mulsixbb : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal muloneout : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal multwoout, multhrout, mulforout, mulfivout, mulsixout : STD_LOGIC_VECTOR (36 DOWNTO 1);

  signal vecone, vectwo, vecthr, vecfor, vecfiv : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal vecsix, vecsev, vecegt, vecnin, vecten : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumvecone, carvecone : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumvectwo, carvectwo : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumvecthr, carvecthr : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumoneff, caroneff : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal sumtwoff, cartwoff : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal resultnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);

  component altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_aclr		: STRING;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (width_b-1 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (width_result-1 DOWNTO 0)
	);
	end component;
	
	-- identical component to that above, but fixed at 18x18, latency 2
	-- mul18usus generated by Quartus 
	component hcc_mul18usus
	PORT
	(
		aclr3		: IN STD_LOGIC  := '0';
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		ena0		: IN STD_LOGIC  := '1';
		result		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
	end component;

	COMPONENT lpm_add_sub
	GENERIC (
		lpm_direction		: STRING;
		lpm_hint		: STRING;
		lpm_pipeline		: NATURAL;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
	);
	END COMPONENT;
		 
BEGIN

  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  muloneaa <= mulaa(36 DOWNTO 1);
  mulonebb <= mulbb(36 DOWNTO 1);
  
  multwoaa <= mulaa(54 DOWNTO 37);
  multwobb <= mulbb(18 DOWNTO 1);
  multhraa <= mulaa(54 DOWNTO 37);
  multhrbb <= mulbb(36 DOWNTO 19);
  
  mulforaa <= mulbb(54 DOWNTO 37);
  mulforbb <= mulaa(18 DOWNTO 1);
  mulfivaa <= mulbb(54 DOWNTO 37);
  mulfivbb <= mulaa(36 DOWNTO 19);
  
  mulsixaa <= mulbb(54 DOWNTO 37);
  mulsixbb <= mulaa(54 DOWNTO 37);
  
  -- {C,A) * {D,B}
  -- CAA
  -- DBB
  
  -- AA*BB 36x36=72, latency 3
  mulone : altmult_add
  GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 36,
		width_b => 36,
		width_result => 72
	)
	PORT MAP (
		dataa => muloneaa,
		datab => mulonebb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => muloneout
	);

  --	Blo*C 18*18 = 36, latency = 2
	multwo: hcc_mul18usus
	PORT MAP (
		dataa_0 => multwoaa,
		datab_0 => multwobb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => multwoout
	);
		
  --	Bhi*C 18*18 = 36, latency = 2
  multhr: hcc_mul18usus
	PORT MAP (
		dataa_0 => multhraa,
		datab_0 => multhrbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => multhrout
	);
	
  --	Alo*D 18*18 = 36, latency = 2
  mulfor: hcc_mul18usus
	PORT MAP (
		dataa_0 => mulforaa,
		datab_0 => mulforbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulforout
	);	

  --	Ahi*D 18*18 = 36, latency = 2
  mulfiv: hcc_mul18usus
	PORT MAP (
		dataa_0 => mulfivaa,
		datab_0 => mulfivbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulfivout
	);

  --	C*D 18*18 = 36, latency = 3
  mulsix : altmult_add
  GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 18,
		width_b => 18,
		width_result => 36
	)
	PORT MAP (
		dataa => mulsixaa,
		datab => mulsixbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulsixout
	);
	
  vecone <= zerovec(36 DOWNTO 1) & multwoout;
  vectwo <= zerovec(18 DOWNTO 1) & multhrout & zerovec(18 DOWNTO 1);
  vecthr <= zerovec(36 DOWNTO 1) & mulforout;
  vecfor <= zerovec(18 DOWNTO 1) & mulfivout & zerovec(18 DOWNTO 1);

  gva: FOR k IN 1 TO 72 GENERATE
    sumvecone(k) <= vecone(k) XOR vectwo(k) XOR vecthr(k);
    carvecone(k) <= (vecone(k) AND vectwo(k)) OR 
                    (vectwo(k) AND vecthr(k)) OR 
                    (vecone(k) AND vecthr(k));
  END GENERATE;
 
  vecfiv <= vecfor;
  vecsix <= sumvecone;
  vecsev <= carvecone(71 DOWNTO 1) & '0';

  gvb: FOR k IN 1 TO 72 GENERATE
    sumvectwo(k) <= vecfiv(k) XOR vecsix(k) XOR vecsev(k);
    carvectwo(k) <= (vecfiv(k) AND vecsix(k)) OR 
                    (vecsix(k) AND vecsev(k)) OR 
                    (vecfiv(k) AND vecsev(k));
  END GENERATE;

  paa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN

      FOR k IN 1 TO 72 LOOP
        sumoneff(k) <= '0';
        caroneff(k) <= '0';
        sumtwoff(k) <= '0';
        cartwoff(k) <= '0';
      END LOOP;

    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN

        sumoneff <= sumvectwo;
        caroneff <= carvectwo(71 DOWNTO 1) & '0';
        sumtwoff <= sumvecthr;
        cartwoff <= carvecthr(71 DOWNTO 1) & '0';

      END IF;

    END IF;

  END PROCESS;

  vecegt <= sumoneff;
  vecnin <= caroneff;
  vecten <= mulsixout & muloneout(72 DOWNTO 37);

  gvc: FOR k IN 1 TO 72 GENERATE
    sumvecthr(k) <= vecegt(k) XOR vecnin(k) XOR vecten(k);
    carvecthr(k) <= (vecegt(k) AND vecnin(k)) OR 
                    (vecnin(k) AND vecten(k)) OR 
                    (vecegt(k) AND vecten(k));
  END GENERATE;

  -- according to marcel, 2 pipes = 1 pipe in middle, on on output
	adder : lpm_add_sub
	GENERIC MAP (
		lpm_direction => "ADD",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		lpm_pipeline => 2,
		lpm_type => "LPM_ADD_SUB",
		lpm_width => 64
	)
	PORT MAP (
		dataa => sumtwoff(72 DOWNTO 9),
		datab => cartwoff(72 DOWNTO 9),
		clken => enable,
		aclr => reset,
		clock => sysclk,
		result => resultnode
	);
	
  mulcc <= resultnode;
                                  
END syn;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54US_38S.VHD                       ***
--***                                             ***
--***   Function: 4 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   38S: Stratix 3, 8 18x18, synthesizeable   ***
--***                                             ***
--***   20/08/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Build explicitlyout of two SIII/SIV         ***
--*** DSP Blocks                                  ***
--***************************************************

ENTITY hcc_mul54us_38s IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		  mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		);
END hcc_mul54us_38s;

ARCHITECTURE rtl OF hcc_mul54us_38s IS

  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multone : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal multtwo : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal addmultff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  component fp_mul3s
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1);

	      result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
	     );
  end component;

  component fp_sum36x18
	PORT (
		    aclr3		: IN STD_LOGIC  := '0';
		    clock0		: IN STD_LOGIC  := '1';
		    dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		    dataa_1		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		    datab_0		: IN STD_LOGIC_VECTOR (35 DOWNTO 0) :=  (OTHERS => '0');
		    datab_1		: IN STD_LOGIC_VECTOR (35 DOWNTO 0) :=  (OTHERS => '0');
		    ena0		: IN STD_LOGIC  := '1';
		    result		: OUT STD_LOGIC_VECTOR (54 DOWNTO 0)
	    );
	end component;
	
BEGIN
  
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  mone: fp_mul3s
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mulaa(54 DOWNTO 19),databb=>mulbb(54 DOWNTO 19),
            result=>multone);
      
  mtwo: fp_sum36x18
  PORT MAP (aclr3=>reset,clock0=>sysclk,
            dataa_0=>mulaa(18 DOWNTO 1),
            dataa_1=>mulbb(18 DOWNTO 1),
            datab_0=>mulbb(54 DOWNTO 19),
            datab_1=>mulaa(54 DOWNTO 19),
            ena0=>enable,
            result=>multtwo);
            
  paa: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      FOR k IN 1 TO 64 LOOP
        addmultff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        addmultff <= multone(72 DOWNTO 9) + 
                     (zerovec(35 DOWNTO 1) & multtwo(55 DOWNTO 27));
      END IF;
    END IF;
    
  END PROCESS;
        
  mulcc <= addmultff;
         
END rtl;


	
LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
LIBRARY altera_mf;
USE altera_mf.all;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54US_3XS.VHD                       ***
--***                                             ***
--***   Function: 4 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   3XS: Stratix 3, 10 18x18, synthesizeable  ***
--***                                             ***
--***   21/04/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** For QII8.0 LPM_MULT always creates a 10     ***
--*** 18x18 multiplier 54x54 core                 ***
--***                                             ***
--***************************************************

ENTITY hcc_mul54us_3xs IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)  
     );
END hcc_mul54us_3xs;

ARCHITECTURE syn of hcc_mul54us_3xs IS

  component lpm_mult
  GENERIC (
		     lpm_hint		: STRING;
		     lpm_pipeline		: NATURAL;
		     lpm_representation		: STRING;
		     lpm_type		: STRING;
		     lpm_widtha		: NATURAL;
		     lpm_widthb		: NATURAL;
		     lpm_widthp		: NATURAL
	      );
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (53 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (53 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
	);
	end component;
 
BEGIN

 	lpm_mult_component : lpm_mult
	GENERIC MAP (
		lpm_hint => "MAXIMIZE_SPEED=5",
		lpm_pipeline => 4,
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_MULT",
		lpm_widtha => 54,
		lpm_widthb => 54,
		lpm_widthp => 64
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clken => enable,
		aclr => reset,
		clock => sysclk,
		result => mulcc
	);
                                  
END syn;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54US_57S.VHD                       ***
--***                                             ***
--***   Function: 4 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   57S: Stratix V/Arria V; 3 27x27, 1 18x18  ***
--***                                             ***
--***   2012-04-13 SPF                            ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul54us_57s IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa : IN STD_LOGIC_VECTOR(54 DOWNTO 1);
      mulbb : IN STD_LOGIC_VECTOR(54 DOWNTO 1);
      mulcc : OUT STD_LOGIC_VECTOR(64 DOWNTO 1)
     );
END hcc_mul54us_57s;

ARCHITECTURE rtl OF hcc_mul54us_57s IS
    -- width of first adder including carry (register/FMax trade-off)
    constant ADD1WIDTH : positive := 35;
    
    signal multone : STD_LOGIC_VECTOR(108 DOWNTO 55);  -- 54 bits
    signal multtwo : STD_LOGIC_VECTOR(82 DOWNTO 28);   -- 55 bits (sum-of-2)
    signal multthree : STD_LOGIC_VECTOR(54 DOWNTO 23); -- 32 bits

    constant HI : positive := 2*54;
    constant LO : positive := (HI - 64) + 1;

    constant H2 : positive := HI;
    constant L2 : positive := LO + ADD1WIDTH - 1;
    constant H1 : positive := LO + ADD1WIDTH - 2;
    constant L1 : positive := LO;
    constant LX : positive := LO - 1;
    
    signal argone : STD_LOGIC_VECTOR(H2 DOWNTO LX);
    signal argtwo : STD_LOGIC_VECTOR(H2 DOWNTO LX);
    
    signal argoneff : STD_LOGIC_VECTOR(H2 DOWNTO L2);
    signal argtwoff : STD_LOGIC_VECTOR(H2 DOWNTO L2);
    
    signal stageone : STD_LOGIC_VECTOR(L2 DOWNTO LX);
    signal stagetwo : STD_LOGIC_VECTOR(H2 DOWNTO H1);
    
    signal stageoneff : STD_LOGIC_VECTOR(L2 DOWNTO L1);
    signal addmultff : STD_LOGIC_VECTOR(H2 DOWNTO L1);
  
  component fp_mul2s
    GENERIC (
        widthaa : positive;
        widthbb : positive;
        widthcc : positive
    );
    PORT (
        sysclk : IN STD_LOGIC;
        reset  : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);
        result : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
    );
  end component;
  
  component hcc_MA2_27Ux27U_L2 is
    GENERIC (
        widthaa : positive;
        widthbb : positive;
        widthcc : positive
    );
    PORT (
        aclr    : IN STD_LOGIC;
        clk     : IN STD_LOGIC;
        a0      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
        a1      : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
        b0      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);
        b1      : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);
        en      : IN STD_LOGIC;
        result  : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
    );
  end component;

BEGIN
    mone: fp_mul2s
    GENERIC MAP (widthaa=>27,widthbb=>27,widthcc=>54)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                dataaa=>mulaa(54 DOWNTO 28),databb=>mulbb(54 DOWNTO 28),
                result=>multone);
    
    mtwo: hcc_MA2_27Ux27U_L2
    GENERIC MAP (widthaa=>27,widthbb=>27,widthcc=>55)
    PORT MAP (aclr=>reset,clk=>sysclk,
                a0=>mulaa(27 DOWNTO 1),
                a1=>mulbb(27 DOWNTO 1),
                b0=>mulbb(54 DOWNTO 28),
                b1=>mulaa(54 DOWNTO 28),
                en=>enable,
                result=>multtwo);
    
    mthree: fp_mul2s
    GENERIC MAP (widthaa=>16,widthbb=>16,widthcc=>32)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                dataaa=>mulaa(27 DOWNTO 12),databb=>mulbb(27 DOWNTO 12),
                result=>multthree);

    argone <= multone(108 DOWNTO 55) & multthree(54 DOWNTO LX);
    argtwo <= (108 DOWNTO 83 => '0') & multtwo(82 DOWNTO LX);
    
    stageone <= ('0' & argone(H1 DOWNTO LX)) +
                ('0' & argtwo(H1 DOWNTO LX));

    stagetwo <= (argoneff(H2 DOWNTO L2) & stageoneff(L2)) +
                (argtwoff(H2 DOWNTO L2) & '1');

    paa: PROCESS (sysclk,reset)
    BEGIN
        IF (reset = '1') THEN
            argoneff <= (others => '0');
            argtwoff <= (others => '0');
            stageoneff <= (others => '0');
            addmultff <= (others => '0');
        ELSIF (rising_edge(sysclk)) THEN
            IF (enable = '1') THEN
                argoneff <= argone(H2 DOWNTO L2);
                argtwoff <= argtwo(H2 DOWNTO L2);
                stageoneff <= stageone(L2 DOWNTO L1);
                addmultff(H2 DOWNTO L2) <= stagetwo(H2 DOWNTO L2);
                addmultff(H1 DOWNTO L1) <= stageoneff(H1 DOWNTO L1);
            END IF;
        END IF;
    END PROCESS;
    
    mulcc <= addmultff;
END rtl;


	
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54USB.VHD                          ***
--***                                             ***
--***   Function: 6 pipeline stage unsigned 54    ***
--***             bit multiplier (behavioral)     ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   31/01/08 ML see below                     ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

-- 31/01/08 - output right shifted so same as synthesable core
-- (now "001X" >= 2, "0001X" < 2

ENTITY hcc_mul54usb IS 
GENERIC (
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0 -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		);
END hcc_mul54usb;

ARCHITECTURE rtl OF hcc_mul54usb IS
 
  constant delaydepth : integer := 4 - 2*device;
  
  type muldelfftype IS ARRAY (delaydepth DOWNTO 1) OF STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal mulff : STD_LOGIC_VECTOR (108 DOWNTO 1);
  signal muldelff : muldelfftype;
  
  signal mulnode : STD_LOGIC_VECTOR (108 DOWNTO 1);
  signal mulonenode, multwonode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal multhrnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
    
BEGIN
    
  gza: FOR k IN 1 TO 72 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 54 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 108 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO delaydepth LOOP
        FOR j IN 1 TO 72 LOOP
          muldelff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        mulff <= mulnode;
        muldelff(1)(72 DOWNTO 1) <= mulff(108 DOWNTO 37);
        FOR k IN 2 TO delaydepth LOOP
          muldelff(k)(72 DOWNTO 1) <= muldelff(k-1)(72 DOWNTO 1);
        END LOOP;
         
      END IF;
    
    END IF;
  
  END PROCESS;
  
  -- full multiplier
  gpa: IF (doubleaccuracy = 1) GENERATE
    mulonenode <= zerovec(54 DOWNTO 1);
    multwonode <= zerovec(54 DOWNTO 1);
    multhrnode <= zerovec(72 DOWNTO 1);
    mulnode <= aaff * bbff;
  END GENERATE;
    
  -- pruned multiplier (18x18 LSB contribution missing)
  gpb: IF (doubleaccuracy = 0) GENERATE
    mulonenode <= aaff(18 DOWNTO 1) * bbff(54 DOWNTO 19);
    multwonode <= bbff(18 DOWNTO 1) * aaff(54 DOWNTO 19);
    multhrnode <= aaff(54 DOWNTO 19) * bbff(54 DOWNTO 19);
    mulnode <= (multhrnode & zerovec(36 DOWNTO 1)) +  
               (zerovec(36 DOWNTO 1) & mulonenode & zerovec(18 DOWNTO 1)) + 
               (zerovec(36 DOWNTO 1) & multwonode & zerovec(18 DOWNTO 1));
  END GENERATE; 
                               
  cc <= muldelff(delaydepth)(72 DOWNTO 9); 
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP1_DOT.VHD                        ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***   (for first level of vector multiplier)    ***
--***                                             ***
--***   27/09/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--***                                             ***
--***  Optimizations:                             ***
--***  1: Signed Output                           ***
--***  2: Unsigned Output, Normalized             ***
--***  3: Unsigned Output, Scaled                 ***
--***                                             ***
--***   Optimization = 1,2                        ***
--***   Stratix II/III/IV: Latency 4              ***
--***   Stratix V: Latency 3                      ***
--***   Optimization = 3                          ***
--***   Stratix II/III/IV: Latency 3              ***
--***   Stratix V: Latency 2                      ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfp1_dot IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
			   device : integer := 2; -- 0,1 = "Stratix II/III/IV", 2 = "Stratix V"
			   optimization : positive := 1; -- 1,2,3
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
	 );
END hcc_mulfp1_dot;

ARCHITECTURE rtl OF hcc_mulfp1_dot IS
  
  type exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal biasvalue : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaexponentff, bbexponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentff : exponentfftype;
  signal aasignff, bbsignff : STD_LOGIC;
  signal signff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aamantissa, bbmantissa : STD_LOGIC_VECTOR (27 DOWNTO 1);
  signal multiply : STD_LOGIC_VECTOR (54 DOWNTO 1);   
  signal normalize : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal premantissa : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal twos_complement_carry : STD_LOGIC;
  signal normalize_bit_older, normalize_bit_newer : STD_LOGIC;
  signal scale_bit : STD_LOGIC;

  signal aaexponentzero, bbexponentzero : STD_LOGIC;
  signal aaexponentmax, bbexponentmax : STD_LOGIC;

  signal aamantissabitff, bbmantissabitff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3 DOWNTO 1);

  signal aazero, aainfinity, aanan : STD_LOGIC;
  signal bbzero, bbinfinity, bbnan : STD_LOGIC;

  signal aaexp, bbexp : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaman, bbman : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  -- SII/III/IV behavioral component
  component hcc_mul3236b 
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
  -- SII/III/IV synthesizable component
  component hcc_mul3236s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 

  -- SV behavioral component = SV synthesizable component
  component hcc_mul2727s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
BEGIN
         
  gen_bias_norm: IF (optimization = 1 OR optimization = 2) GENERATE
    biasvalue <= conv_std_logic_vector (127,10);
  END GENERATE;
  gen_bias_scale: IF (optimization = 3) GENERATE
    biasvalue <= conv_std_logic_vector (126,10);  -- bias is subtract 127, add 1 for scale right shift
  END GENERATE; 
  
  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************

  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 8 LOOP
        aaexponentff(k) <= '0';
        bbexponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 10 LOOP
          exponentff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      aasignff <= '0';
      bbsignff <= '0';
      signff <= "000";
      FOR k IN 1 TO mantissa LOOP
        mantissaff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        aaexponentff <= aa(31 DOWNTO 24);
        bbexponentff <= bb(31 DOWNTO 24);    
        exponentff(1)(10 DOWNTO 1) <= ("00" & aaexponentff) + ("00" & bbexponentff) - biasvalue;
        exponentff(2)(10 DOWNTO 1) <= exponentff(1)(10 DOWNTO 1) + normalize_bit_newer;
        exponentff(3)(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1) + normalize_bit_older;
        
        aasignff <= aa(32);
        bbsignff <= bb(32);
        signff(1) <= aasignff XOR bbsignff;
        signff(2) <= signff(1);
        signff(3) <= signff(2);
        
        mantissaff <= premantissa + twos_complement_carry; 
    
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gen_twos_one: IF (device < 2 AND optimization = 1) GENERATE
    twos_complement_carry <= signff(2);
	  normalize_bit_newer <= '0';
	  normalize_bit_older <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;
  
  gen_twos_two: IF (device = 2 AND optimization = 1) GENERATE
    twos_complement_carry <= signff(1);
	  normalize_bit_older <= '0';
	  normalize_bit_newer <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;

  gen_twos_thr: IF (device < 2 AND optimization = 2) GENERATE
    twos_complement_carry <= '0';
	  normalize_bit_newer <= '0';
	  normalize_bit_older <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;

  gen_twos_for: IF (device = 2 AND optimization = 2) GENERATE
    twos_complement_carry <= '0';
	  normalize_bit_older <= '0';
	  normalize_bit_newer <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;
      
  gen_twos_other: IF (optimization = 3) GENERATE
    twos_complement_carry <= '0';
    normalize_bit_older <= '0';
	  normalize_bit_newer <= '0';
	  scale_bit <= '1';
  END GENERATE;

  --**************************
  --*** Multiplier Section *** 
  --**************************
  
  -- multiplier input in this form
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  aamantissa <= "01" & aa(23 DOWNTO 1) & "00";
  bbmantissa <= "01" & bb(23 DOWNTO 1) & "00";

  gen_mul_one: IF (device < 2 AND synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  gen_mul_two: IF (device < 2 AND synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aamantissa,mulbb=>bbmantissa,
              mulcc=>multiply);
  END GENERATE;
 
  gen_mul_thr: IF (device = 2) GENERATE
    bmult5: hcc_mul2727s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  -- output will either be "0001XXXX" or "001XXXX", normalize multiplier
  normalize(mantissa DOWNTO mantissa-2) <= "000";
  gnma: FOR k IN 1 TO mantissa-3 GENERATE
    normalize(k) <= (multiply(57-mantissa+k) AND multiply(52)) OR
                    (multiply(56-mantissa+k) AND NOT(multiply(52)));
  END GENERATE; 
  
  gpma: FOR k IN 1 TO mantissa GENERATE
    premantissa(k) <= normalize(k) XOR twos_complement_carry;
  END GENERATE;
  
  --*** EXCEPTIONS ***
  -- condition = 1 when true
  aaexponentzero <= NOT(aaexponentff(8) OR aaexponentff(7) OR aaexponentff(6) OR aaexponentff(5) OR 
                        aaexponentff(4) OR aaexponentff(3) OR aaexponentff(2) OR aaexponentff(1));
  bbexponentzero <= NOT(bbexponentff(8) OR bbexponentff(7) OR bbexponentff(6) OR bbexponentff(5) OR 
                        bbexponentff(4) OR bbexponentff(3) OR bbexponentff(2) OR bbexponentff(1));
  aaexponentmax <= aaexponentff(8) AND aaexponentff(7) AND aaexponentff(6) AND aaexponentff(5) AND 
                   aaexponentff(4) AND aaexponentff(3) AND aaexponentff(2) AND aaexponentff(1);
  bbexponentmax <= bbexponentff(8) AND bbexponentff(7) AND bbexponentff(6) AND bbexponentff(5) AND 
                   bbexponentff(4) AND bbexponentff(3) AND bbexponentff(2) AND bbexponentff(1);
    
  -- exceptions
  -- a x 0 = 0 : if (expaa = 0 OR expbb = 0) AND multiply = 0
  -- a x inf = inf : if (expaa = inf OR expbb = inf) AND multiply = 0
  -- 0 x inf = nan : if (expaa = inf AND expbb = 0) OR (expaa = 0 AND expbb = inf) AND multiply = 0
  -- a x nan = nan : if (expaa = inf OR expbb = inf) AND multiply = !0
 
  pxa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

	    aamantissabitff <= '0';
		  bbmantissabitff <= '0';
      cczipff <= "000";
      ccsatff <= "000";
		  ccnanff <= "000";
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
		    aamantissabitff <= aa(23);
		    bbmantissabitff <= bb(23);
		  
		    -- a x 0 = 0
        cczipff(1) <= (aazero AND NOT(bbexponentmax)) OR (bbexponentzero AND NOT(aaexponentmax));
		    cczipff(2) <= cczipff(1);
		    cczipff(3) <= cczipff(2);
		  
		    -- a x inf = inf
        ccsatff(1) <= (NOT(aazero) AND NOT(aaexponentmax) AND bbinfinity) OR
		                  (NOT(bbzero) AND NOT(bbexponentmax) AND aainfinity);
		    ccsatff(2) <= ccsatff(1);
		    ccsatff(3) <= ccsatff(2);					 
        
		    -- 0 x inf = nan
		    -- a x nan = nan
		    ccnanff(1) <= (aazero AND bbinfinity) OR (bbzero AND aainfinity) OR aanan OR bbnan;
		    ccnanff(2) <= ccnanff(1);
		    ccnanff(3) <= ccnanff(2);
        
      END IF;
        
    END IF;
      
  END PROCESS; 
   
  aazero <= aaexponentzero;
  aainfinity <= aaexponentmax AND NOT(aamantissabitff);
  aanan <= aaexponentmax AND aamantissabitff;
  bbzero <= bbexponentzero;
  bbinfinity <= bbexponentmax AND NOT(bbmantissabitff);
  bbnan <= bbexponentmax AND bbmantissabitff;
  
  --***************
  --*** OUTPUTS ***
  --***************

  -- if device = 0,1 (SII,III,IV) and optimization = 1 (signed output)
  -- latency = 4
  gen_out_older_one: IF (device < 2 AND optimization = 1) GENERATE
    cc(mantissa+10 DOWNTO 11) <= mantissaff;
    cc(10 DOWNTO 1) <= exponentff(3)(10 DOWNTO 1);
	ccsat <= ccsatff(3);
    cczip <= cczipff(3);
    ccnan <= ccnanff(3);
  END GENERATE;
  -- if device = 0,1 (SII,III,IV) and optimization = 2 (unsigned output, normalized)
  -- latency = 4
  gen_out_older_two: IF (device < 2 AND optimization = 2) GENERATE
    cc(mantissa+10) <= signff(3); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= mantissaff(mantissa-1 DOWNTO 1); 
    cc(10 DOWNTO 1) <= exponentff(3)(10 DOWNTO 1);
	ccsat <= ccsatff(3);
    cczip <= cczipff(3);
    ccnan <= ccnanff(3);
  END GENERATE;
  -- if device = 0,1 (SII,III,IV) and optimization = 3 (unsigned output, scaled)
  -- latency = 3
  gen_out_older_thr: IF (device < 2 AND optimization = 3) GENERATE
    cc(mantissa+10) <= signff(2); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= "00" & multiply(54 DOWNTO 58-mantissa); -- right shifted
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;
  
  
  gen_out_newer_one: IF (device = 2 AND optimization = 1) GENERATE
    cc(mantissa+10 DOWNTO 11) <= mantissaff;
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;

  gen_out_newer_two: IF (device = 2 AND optimization = 2) GENERATE
    cc(mantissa+10) <= signff(2); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= mantissaff(mantissa-1 DOWNTO 1); 
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;

  gen_out_newer_thr: IF (device = 2 AND optimization = 3) GENERATE
    cc(mantissa+10) <= signff(1); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= "00" & multiply(54 DOWNTO 58-mantissa); -- right shifted
    cc(10 DOWNTO 1) <= exponentff(1)(10 DOWNTO 1);
	ccsat <= ccsatff(1);
    cczip <= cczipff(1);
    ccnan <= ccnanff(1);
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(31 DOWNTO 24);
  bbexp <= bb(31 DOWNTO 24);
  gen_debug_older: IF (device < 2) GENERATE
    ccexp <= exponentff(3)(10 DOWNTO 1);
  END GENERATE;
  gen_debug_newer: IF (device = 2) GENERATE
    ccexp <= exponentff(2)(10 DOWNTO 1);
  END GENERATE;
  aaman <= aa(23 DOWNTO 1);
  bbman <= bb(23 DOWNTO 1);
  ccman <= mantissaff;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP1VEC.VHD                         ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***   (for first level of vector multiplier)    ***
--***                                             ***
--***   29/04/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfp1vec IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         device : integer := 1; -- 0,1 = "Stratix II/III/IV", 2 = "Stratix V"
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
      cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      ccsat, cczip, ccnan : OUT STD_LOGIC
     );
END hcc_mulfp1vec;

ARCHITECTURE rtl OF hcc_mulfp1vec IS
  
  type exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaexponentff, bbexponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentff : exponentfftype;
  signal aasignff, bbsignff : STD_LOGIC;
  signal signff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aamantissa, bbmantissa : STD_LOGIC_VECTOR (27 DOWNTO 1);
  signal multiply : STD_LOGIC_VECTOR (54 DOWNTO 1);   
  signal normalize : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal premantissa : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal twos_complement_carry : STD_LOGIC;
  signal normalize_bit_older, normalize_bit_newer : STD_LOGIC;

  signal aaexponentzero, bbexponentzero : STD_LOGIC;
  signal aaexponentmax, bbexponentmax : STD_LOGIC;

  signal aamantissabitff, bbmantissabitff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3 DOWNTO 1);

  signal aazero, aainfinity, aanan : STD_LOGIC;
  signal bbzero, bbinfinity, bbnan : STD_LOGIC;

  signal aaexp, bbexp : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaman, bbman : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  -- SII/III/IV behavioral component
  component hcc_mul3236b 
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
          cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
          );
  end component;
  
  -- SII/III/IV synthesizable component
  component hcc_mul3236s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 

  -- SV behavioral component = SV synthesizable component
  component hcc_mul2727s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
          cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
          );
  end component;
  
BEGIN
         
  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************

  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 8 LOOP
        aaexponentff(k) <= '0';
        bbexponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 10 LOOP
          exponentff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      aasignff <= '0';
      bbsignff <= '0';
      signff <= "00";
      FOR k IN 1 TO mantissa LOOP
        mantissaff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        aaexponentff <= aa(31 DOWNTO 24);
        bbexponentff <= bb(31 DOWNTO 24);    
        exponentff(1)(10 DOWNTO 1) <= ("00" & aaexponentff) + ("00" & bbexponentff) - "0001111111";
        exponentff(2)(10 DOWNTO 1) <= exponentff(1)(10 DOWNTO 1) + normalize_bit_newer;
        exponentff(3)(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1) + normalize_bit_older;
        
        aasignff <= aa(32);
        bbsignff <= bb(32);
        signff(1) <= aasignff XOR bbsignff;
        signff(2) <= signff(1);
        
        mantissaff <= premantissa + twos_complement_carry; 
    
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gen_twos_older: IF (device < 2) GENERATE
    twos_complement_carry <= signff(2);
     normalize_bit_newer <= '0';
     normalize_bit_older <= multiply(52);
  END GENERATE;
  gen_twos_newer: IF (device = 2) GENERATE
    twos_complement_carry <= signff(1);
     normalize_bit_older <= '0';
     normalize_bit_newer <= multiply(52);
  END GENERATE;

  --**************************
  --*** Multiplier Section *** 
  --**************************
  
  -- multiplier input in this form
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  aamantissa <= "01" & aa(23 DOWNTO 1) & "00";
  bbmantissa <= "01" & bb(23 DOWNTO 1) & "00";

  gen_mul_one: IF (device < 2 AND synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  gen_mul_two: IF (device < 2 AND synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aamantissa,mulbb=>bbmantissa,
              mulcc=>multiply);
  END GENERATE;
 
  gen_mul_thr: IF (device = 2) GENERATE
    bmult5: hcc_mul2727s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  -- output will either be "0001XXXX" or "001XXXX", normalize multiplier
  normalize(mantissa DOWNTO mantissa-2) <= "000";
  gnma: FOR k IN 1 TO mantissa-3 GENERATE
    normalize(k) <= (multiply(57-mantissa+k) AND multiply(52)) OR
                    (multiply(56-mantissa+k) AND NOT(multiply(52)));
  END GENERATE; 
  
  gpma: FOR k IN 1 TO mantissa GENERATE
    premantissa(k) <= normalize(k) XOR twos_complement_carry;
  END GENERATE;
  
  --*** EXCEPTIONS ***
  -- condition = 1 when true
  aaexponentzero <= NOT(aaexponentff(8) OR aaexponentff(7) OR aaexponentff(6) OR aaexponentff(5) OR 
                        aaexponentff(4) OR aaexponentff(3) OR aaexponentff(2) OR aaexponentff(1));
  bbexponentzero <= NOT(bbexponentff(8) OR bbexponentff(7) OR bbexponentff(6) OR bbexponentff(5) OR 
                        bbexponentff(4) OR bbexponentff(3) OR bbexponentff(2) OR bbexponentff(1));
  aaexponentmax <= aaexponentff(8) AND aaexponentff(7) AND aaexponentff(6) AND aaexponentff(5) AND 
                   aaexponentff(4) AND aaexponentff(3) AND aaexponentff(2) AND aaexponentff(1);
  bbexponentmax <= bbexponentff(8) AND bbexponentff(7) AND bbexponentff(6) AND bbexponentff(5) AND 
                   bbexponentff(4) AND bbexponentff(3) AND bbexponentff(2) AND bbexponentff(1);
    
  -- exceptions
  -- a x 0 = 0 : if (expaa = 0 OR expbb = 0) AND multiply = 0
  -- a x inf = inf : if (expaa = inf OR expbb = inf) AND multiply = 0
  -- 0 x inf = nan : if (expaa = inf AND expbb = 0) OR (expaa = 0 AND expbb = inf) AND multiply = 0
  -- a x nan = nan : if (expaa = inf OR expbb = inf) AND multiply = !0
 
  pxa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

       aamantissabitff <= '0';
        bbmantissabitff <= '0';
      cczipff <= "000";
      ccsatff <= "000";
        ccnanff <= "000";
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
          aamantissabitff <= aa(23);
          bbmantissabitff <= bb(23);
          
          -- a x 0 = 0
        cczipff(1) <= (aazero AND NOT(bbexponentmax)) OR (bbexponentzero AND NOT(aaexponentmax));
          cczipff(2) <= cczipff(1);
          cczipff(3) <= cczipff(2);
          
          -- a x inf = inf
        ccsatff(1) <= (NOT(aazero) AND NOT(aaexponentmax) AND bbinfinity) OR
                        (NOT(bbzero) AND NOT(bbexponentmax) AND aainfinity);
          ccsatff(2) <= ccsatff(1);
          ccsatff(3) <= ccsatff(2);                  
        
          -- 0 x inf = nan
          -- a x nan = nan
          ccnanff(1) <= (aazero AND bbinfinity) OR (bbzero AND aainfinity) OR aanan OR bbnan;
          ccnanff(2) <= ccnanff(1);
          ccnanff(3) <= ccnanff(2);
        
      END IF;
        
    END IF;
      
  END PROCESS; 
   
  aazero <= aaexponentzero;
  aainfinity <= aaexponentmax AND NOT(aamantissabitff);
  aanan <= aaexponentmax AND aamantissabitff;
  bbzero <= bbexponentzero;
  bbinfinity <= bbexponentmax AND NOT(bbmantissabitff);
  bbnan <= bbexponentmax AND bbmantissabitff;
  
  --*** OUTPUTS ***
  cc(mantissa+10 DOWNTO 11) <= mantissaff;
  gen_out_older: IF (device < 2) GENERATE
    cc(10 DOWNTO 1) <= exponentff(3)(10 DOWNTO 1);
     ccsat <= ccsatff(3);
    cczip <= cczipff(3);
    ccnan <= ccnanff(3);
  END GENERATE;
  gen_out_newer: IF (device = 2) GENERATE
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
     ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(31 DOWNTO 24);
  bbexp <= bb(31 DOWNTO 24);
  gen_debug_older: IF (device < 2) GENERATE
    ccexp <= exponentff(3)(10 DOWNTO 1);
  END GENERATE;
  gen_debug_newer: IF (device = 2) GENERATE
    ccexp <= exponentff(2)(10 DOWNTO 1);
  END GENERATE;
  aaman <= aa(23 DOWNTO 1);
  bbman <= bb(23 DOWNTO 1);
  ccman <= mantissaff;

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP1X.VHD                           ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   21/04/09 - add NAN support                ***
--***   11/08/09 - add divider interface output   ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfp1x IS 
GENERIC (
         ieeeoutput : integer := 0; -- 1 = ieee754 (1/8/u23)
         xoutput : integer := 1; -- 1 = single x format (s32/36/10)
         multoutput : integer := 0; -- 1 = to another single muliplier (s/1/34/10) - signed
         divoutput : integer := 0; -- 1 = to a single divider (s/1/34/10) - signed magnitude
         mantissa : positive := 32; -- 32 or 36
         outputscale : integer := 1; -- 0 = none, 1 = scale 
         device : integer := 0;
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+multoutput+divoutput) DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_mulfp1x;

ARCHITECTURE rtl OF hcc_mulfp1x IS
  
  signal mulinaa, mulinbb : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal mulinaasat, mulinaazip, mulinaanan : STD_LOGIC;
  signal mulinbbsat, mulinbbzip, mulinbbnan : STD_LOGIC;
  signal ccnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal ccsatnode, cczipnode, ccnannode : STD_LOGIC;
 
  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal mantissanode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal divmantissa, divposmantissa : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal normmantissa : STD_LOGIC_VECTOR (mantissa-3 DOWNTO 1);
  signal normshiftbit : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC;

  signal manmultff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal expmultff : STD_LOGIC_VECTOR (10 DOWNTO 1);

  -- ieee output
  signal absnode : STD_LOGIC_VECTOR (mantissa-3 DOWNTO 1);
  signal absolute : STD_LOGIC_VECTOR (mantissa-3 DOWNTO 1);
  signal absoluteff : STD_LOGIC_VECTOR (mantissa-3 DOWNTO 1);
  signal manoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal expshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal signoutff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal roundbit : STD_LOGIC;
  signal manroundnode : STD_LOGIC_VECTOR (26 DOWNTO 1);
  signal overflownode : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal expplusnode : STD_LOGIC_VECTOR (10 DOWNTO 1);  
  signal expmax, expzero : STD_LOGIC;
  signal manoutzero, manoutmax : STD_LOGIC;
  signal expoutzero, expoutmax : STD_LOGIC;
  
  component hcc_mulfp3236 IS 
  GENERIC (
           mantissa : positive; -- 32 or 36
           device : integer;
           synthesize : integer
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		  );
  end component;

  component hcc_mulfppn3236 IS 
  GENERIC (
           mantissa : positive; -- 32 or 36
           device : integer;
           synthesize : integer
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		  );
  end component;
  		   
BEGIN
         
  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************

  mulinaa <= aa;
  mulinbb <= bb;
  mulinaasat <= aasat;
  mulinaazip <= aazip;
  mulinaanan <= aanan;
  mulinbbsat <= bbsat; 
  mulinbbzip <= bbzip;
  mulinbbnan <= bbnan;

  --**************************
  --*** Multiplier Section *** 
  --**************************
  
  -- multiplier input in this form
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]

  gma: IF (outputscale = 0) GENERATE
    
    mulone: hcc_mulfp3236
    GENERIC MAP (mantissa=>mantissa,device=>device,synthesize=>synthesize)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mulinaa,
              aasat=>mulinaasat,aazip=>mulinaazip,aanan=>mulinaanan,
              bb=>mulinbb,
              bbsat=>mulinbbsat,bbzip=>mulinbbzip,bbnan=>mulinbbnan,
              cc=>ccnode,ccsat=>ccsatnode,cczip=>cczipnode,ccnan=>ccnannode);
  
  END GENERATE;

  gmb: IF (outputscale = 1) GENERATE
    
    multwo: hcc_mulfppn3236 
    GENERIC MAP (mantissa=>mantissa,device=>device,synthesize=>synthesize)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mulinaa,
              aasat=>mulinaasat,aazip=>mulinaazip,aanan=>mulinaanan,
              bb=>mulinbb,
              bbsat=>mulinbbsat,bbzip=>mulinbbzip,bbnan=>mulinbbnan,
              cc=>ccnode,ccsat=>ccsatnode,cczip=>cczipnode,ccnan=>ccnannode);
  
  END GENERATE;
  
  --*** OUTPUTS ***
  
  --***********************
  --*** INTERNAL FORMAT ***
  --***********************
  gxo: IF (xoutput = 1) GENERATE
    cc <= ccnode;
    ccsat <= ccsatnode;
    cczip <= cczipnode;
    ccnan <= ccnannode;
  END GENERATE;
  
  --*******************************************
  --*** ANOTHER SINGLE PRECISION MULTIPLIER ***
  --*******************************************
  gmo: IF (multoutput = 1) GENERATE
    -- lose 4 bits of precision for now, update hcc_mulfp3236 later
    
    mantissanode <= ccnode(mantissa+10 DOWNTO 11);
    -- normmantissa will be "001XXX" or 2's complement
    gna: FOR k IN 1 TO mantissa-3 GENERATE
      normmantissa(k) <= ( ((mantissanode(k) AND NOT(mantissanode(mantissa-4))) OR 
                            (mantissanode(k+1) AND mantissanode(mantissa-4))) 
                          AND NOT(mantissanode(mantissa)) ) OR
                         (((mantissanode(k) AND mantissanode(mantissa-4)) OR 
                           (mantissanode(k+1) AND NOT(mantissanode(mantissa-4)))) 
                          AND mantissanode(mantissa));
      
    END GENERATE;
    normshiftbit <= (mantissanode(mantissa-4) AND NOT(mantissanode(mantissa))) OR 
                    (NOT(mantissanode(mantissa-4)) AND mantissanode(mantissa));
                    
    pmo: PROCESS (sysclk,reset)
    BEGIN
     
       IF (reset = '1') THEN
           
         FOR k IN 1 TO mantissa LOOP
           manmultff(k) <= '0';
         END LOOP;
         FOR k IN 1 TO 10 LOOP
           expmultff(k) <= '0';
         END LOOP;
         ccsatff <= '0';
         cczipff <= '0';
         ccnanff <= '0';
        
       ELSIF (rising_edge(sysclk)) THEN
           
         IF (enable = '1') THEN
             
           manmultff <= normmantissa(mantissa-4 DOWNTO 1) & "0000";
           expmultff <= ccnode(10 DOWNTO 1) + normshiftbit;
           ccsatff <= ccsatnode;
           cczipff <= cczipnode;
           ccnanff <= ccnannode;
           
         END IF;
             
       END IF;   
        
    END PROCESS;
  
    cc(mantissa+10 DOWNTO 11) <= manmultff;
    cc(10 DOWNTO 1) <= expmultff;
    ccsat <= ccsatff;
    cczip <= cczipff;
    ccnan <= ccnanff;
    
  END GENERATE;

  --**********************************
  --*** A SINGLE PRECISION DIVIDER ***
  --**********************************
  gdo: IF (divoutput = 1) GENERATE
    -- lose 4 bits of precision for now, update hcc_mulfp3236 later
    
    mantissanode <= ccnode(mantissa+10 DOWNTO 11);
    -- normmantissa will be "001XXX" or 2's complement
    gda: FOR k IN 1 TO mantissa-3 GENERATE
      normmantissa(k) <= ( ((mantissanode(k) AND NOT(mantissanode(mantissa-4))) OR 
                            (mantissanode(k+1) AND mantissanode(mantissa-4))) 
                          AND NOT(mantissanode(mantissa)) ) OR
                         (((mantissanode(k) AND mantissanode(mantissa-4)) OR 
                           (mantissanode(k+1) AND NOT(mantissanode(mantissa-4)))) 
                          AND mantissanode(mantissa));
      
    END GENERATE;

    -- do not need to trap overflow, as maximum -ve number cannot happen, as inputs 
    -- will be 0111...*10000
    divmantissa <= normmantissa(mantissa-4 DOWNTO 1) & "0000";    
    gdb: FOR k IN 1 TO mantissa-1 GENERATE
      divposmantissa(k) <= divmantissa(k) XOR mantissanode(mantissa);
    END GENERATE;
    -- divider output is signed magnitude
    divposmantissa(mantissa) <= mantissanode(mantissa);

    normshiftbit <= (mantissanode(mantissa-4) AND NOT(mantissanode(mantissa))) OR 
                    (NOT(mantissanode(mantissa-4)) AND mantissanode(mantissa));
                    
    pmo: PROCESS (sysclk,reset)
    BEGIN
     
       IF (reset = '1') THEN
           
         FOR k IN 1 TO mantissa LOOP
           manmultff(k) <= '0';
         END LOOP;
         FOR k IN 1 TO 10 LOOP
           expmultff(k) <= '0';
         END LOOP;
         ccsatff <= '0';
         cczipff <= '0';
         ccnanff <= '0';
        
       ELSIF (rising_edge(sysclk)) THEN
           
         IF (enable = '1') THEN
             
           manmultff <= divposmantissa + mantissanode(mantissa);
           expmultff <= ccnode(10 DOWNTO 1) + normshiftbit;
           ccsatff <= ccsatnode;
           cczipff <= cczipnode;
           ccnanff <= ccnannode;
           
         END IF;
             
       END IF;   
        
    END PROCESS;
  
    cc(mantissa+10 DOWNTO 11) <= manmultff;
    cc(10 DOWNTO 1) <= expmultff;
    ccsat <= ccsatff;
    cczip <= cczipff;
    ccnan <= ccnanff;
    
  END GENERATE;  
  
  --**********************
  --*** IEEE754 Output ***
  --**********************
  
  gio: IF (ieeeoutput = 1) GENERATE
  
    -- +ve result: 000001XXXXX or 00001XXXXX
    -- -ve result: 111110XXXXX or 11110XXXXX
    mantissanode <= ccnode(mantissa+10 DOWNTO 11);
    -- normmantissa will be "001XXX" or 1's complement
    gna: FOR k IN 1 TO mantissa-3 GENERATE
      normmantissa(k) <= ( ((mantissanode(k) AND NOT(mantissanode(mantissa-4))) OR 
                            (mantissanode(k+1) AND mantissanode(mantissa-4))) 
                          AND NOT(mantissanode(mantissa)) ) OR
                         (((mantissanode(k) AND mantissanode(mantissa-4)) OR 
                           (mantissanode(k+1) AND NOT(mantissanode(mantissa-4)))) 
                          AND mantissanode(mantissa));
      
    END GENERATE;
    normshiftbit <= (mantissanode(mantissa-4) AND NOT(mantissanode(mantissa))) OR 
                    (NOT(mantissanode(mantissa-4)) AND mantissanode(mantissa));

    gaa: FOR k IN 1 TO mantissa-3 GENERATE
      absnode(k) <= normmantissa(k) XOR normmantissa(mantissa-3);
    END GENERATE;
    absolute <= absnode(mantissa-3 DOWNTO 1) + normmantissa(mantissa-3);
    
    pia: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
        
        FOR k IN 1 TO mantissa-3 LOOP
          absoluteff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 23 LOOP
          manoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          expshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          expoutff(k) <= '0';
        END LOOP;
        signoutff <= "00";
        ccsatff <= '0';
        cczipff <= '0';
        ccnanff <= '0';
           
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
            
          absoluteff <= absolute;
          
          expshiftff <= ccnode(10 DOWNTO 1) + normshiftbit;
          
          ccsatff <= ccsatnode;
          cczipff <= cczipnode;
          ccnanff <= ccnannode;
          
          FOR k IN 1 TO 23 LOOP
            manoutff(k) <= (manroundnode(k) AND NOT(manoutzero)) OR manoutmax;
          END LOOP;
          
          FOR k IN 1 TO 8 LOOP
            expoutff(k) <= (expplusnode(k) AND NOT(expoutzero)) OR expoutmax;
          END LOOP;
          
          signoutff(1) <= normmantissa(mantissa-4);
          signoutff(2) <= signoutff(1);
          
        END IF;
              
      END IF;
    
    END PROCESS;

    roundbit <= absoluteff(mantissa-29);
        
    manroundnode <= absoluteff(mantissa-3 DOWNTO mantissa-28)+ roundbit;

    overflownode(1) <= roundbit;
    gova: FOR k IN 2 TO 24 GENERATE
      overflownode(k) <= overflownode(k-1) AND absoluteff(mantissa-30+k);
    END GENERATE; 
    
    expplusnode <= expshiftff + ("000000000" & overflownode(24));
      
    -- both '1' when true
    expmax <= expplusnode(8) AND expplusnode(7) AND expplusnode(6) AND expplusnode(5) AND
              expplusnode(4) AND expplusnode(3) AND expplusnode(2) AND expplusnode(1);
    expzero <= NOT(expplusnode(8) OR expplusnode(7) OR expplusnode(6) OR expplusnode(5) OR 
                   expplusnode(4) OR expplusnode(3) OR expplusnode(2) OR expplusnode(1));
            
    manoutzero <= ccsatff OR cczipff OR expmax OR expzero OR 
                  expshiftff(10) OR expshiftff(9);
    manoutmax <= ccnanff;
    expoutzero <= cczipff OR expzero OR expshiftff(10);
    expoutmax <= expmax OR expshiftff(9) OR ccnanff; 

    cc(32) <= signoutff(2);
    cc(31 DOWNTO 24) <= expoutff;
    cc(23 DOWNTO 1) <= manoutff;
    -- dummy
    ccsat <= '0';
    cczip <= '0';
    ccnan <= '0';
    
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  ccexp <= ccnode(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  ccman <= ccnode(mantissa+10 DOWNTO 11);
  
END rtl;


LIBRARY ieee;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP2X.VHD                           ***
--***                                             ***
--***   Function: Double precision multiplier     ***
--***             (unsigned mantissa)             ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   28/01/08 - see notes below                ***
--***   21/04/09 - add NAN support, also fix zero ***  
--***   infinity and nan mantissa for ieee output ***       
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** 28/01/08 - correct manoverflow for ieee     ***
--*** output, effects of mantissa shift for both  ***
--*** ieee and mult output, test output widths,   ***
--*** also reversed exp and man order in ieee     ***
--*** output                                      ***
--*** 31/08/08 - behavioral and synth mults both  ***
--*** now return "001X" (> 2) OR "0001X" (<2)     ***
--*** change xoutput to 1 bit less right shift    ***
--***(behavioral mult changed)                    ***
--***************************************************
ENTITY hcc_mulfp2x IS 
GENERIC (
         ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
         xoutput : integer := 1; -- 1 = double x format (s64/13)
         multoutput : integer := 0; -- 1 = to another double muliplier or divider (s/1u52/13)
         roundconvert : integer := 0; -- global switch - round all ieee<=>x conversion when '1'
         roundnormalize : integer := 0; -- global switch - round all normalizations when '1'
         doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
         outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4), 2 = "Stratix V"
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*multoutput DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_mulfp2x;

ARCHITECTURE rtl OF hcc_mulfp2x IS
  -- 5 if stratix 2, 3 if stratix 3/4, 3 also for SV/AV.
  function pipeline_latency(device : integer) return positive is
  begin
    case device is
      when      0 => return 5;
      when others => return 3;
    end case;
  end function pipeline_latency;

  constant signdepth : positive := pipeline_latency(device);
  
  type ccxexpdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type cceexpdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
        
  -- multiplier core interface
  signal mulinaaman, mulinbbman : STD_LOGIC_VECTOR(54 DOWNTO 1);
  signal mulinaaexp, mulinbbexp : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal mulinaasat, mulinaazip, mulinaanan : STD_LOGIC;
  signal mulinbbsat, mulinbbzip, mulinbbnan : STD_LOGIC;
  signal mulinaasign, mulinbbsign : STD_LOGIC;
  signal mulinaasignff, mulinbbsignff : STD_LOGIC;
  signal mulsignff : STD_LOGIC_VECTOR (signdepth DOWNTO 1);
  signal ccmannode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccexpnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccsatnode, cczipnode, ccnannode : STD_LOGIC;
  
  -- output section (x out)
  signal ccmanshiftnode, signedccxmannode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxroundnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxroundff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccxsatff, ccxzipff, ccxnanff : STD_LOGIC;
  signal ccxexpdelff : ccxexpdelfftype;
  signal ccxsatdelff, ccxzipdelff, ccxnandelff : STD_LOGIC_VECTOR (2 DOWNTO 1);

  -- output section (ieeeout)  
  signal shiftroundbit : STD_LOGIC;
  signal cceroundnode : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal cceround : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal cceroundcarry : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccemannode : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal ccemanoutff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal cceexpoutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal ccesignbitff : STD_LOGIC;
  signal cceroundff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal cceexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccesatff, ccezipff, ccenanff : STD_LOGIC;
  signal ccesignff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal cceexpdelff : cceexpdelfftype;
  signal ccesatdelff, ccezipdelff, ccenandelff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal ccesigndelff : STD_LOGIC_VECTOR (3 DOWNTO 1); 
  signal cceexpbase, cceexpplus : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccesatbase, ccezipbase, ccenanbase : STD_LOGIC;
  signal cceexpmax, cceexpzero : STD_LOGIC;
  signal manoutzero, manoutmax, expoutzero, expoutmax : STD_LOGIC;
  signal manoverflow : STD_LOGIC;
     
  -- output section (multout)
  signal shiftmanbit : STD_LOGIC;
  signal manshiftnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal manshiftff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccexpdelff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccsatdelff, cczipdelff, ccnandelff : STD_LOGIC;
  signal muloutsignff : STD_LOGIC;
  
  -- debug
  signal aaexp, bbexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (11 + 2*multoutput + 2*xoutput DOWNTO 1);
  signal aaman, bbman : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (54+10*xoutput DOWNTO 1);

  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
               
  component hcc_mulufp54 
  GENERIC (
           doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
        aaexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC; 
        bbman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
        bbexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        bbsat, bbzip, bbnan : IN STD_LOGIC;
      
	  	  ccman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
        ccexp : OUT STD_LOGIC_VECTOR (13 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		  );
  end component;
		   
BEGIN
 
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  --**************************************************
  --***                                            ***
  --*** Input Section - Normalization, if required *** 
  --***                                            ***
  --**************************************************

  --********************************************************
  --*** NOTE THAT IN ALL CASES SIGN BIT IS PACKED IN MSB ***
  --*** OF UNSIGNED MULTIPLIER                           ***
  --********************************************************
  --*** ieee754 input when multiplier input is from cast ***
  --*** cast now creates different                       ***
  --*** formats for multiplier, divider, and alu         ***
  --*** multiplier format [S][1][mantissa....]           ***
  --********************************************************    
  --********************************************************
  --*** if input from another double multiplier (special ***
  --*** output mode normalizes to 54 bit mantissa and    ***
  --*** 13 bit exponent                                  ***
  --*** multiplier format [S][1][mantissa....]           ***
  --********************************************************
  --********************************************************
  --*** if input from internal format, must be normed    ***
  --*** by normfp2x first, creates [S][1][mantissa...]   ***
  --********************************************************

  mulinaaman <= '0' & aa(66 DOWNTO 14);
  mulinaaexp <= aa(13 DOWNTO 1);
  mulinbbman <= '0' & bb(66 DOWNTO 14);
  mulinbbexp <= bb(13 DOWNTO 1);
  mulinaasat <= aasat;
  mulinaazip <= aazip;
  mulinaanan <= aanan;
  mulinbbsat <= bbsat;
  mulinbbzip <= bbzip;
  mulinbbnan <= bbnan;
  -- signbits packed in MSB of mantissas
  mulinaasign <= aa(67);
  mulinbbsign <= bb(67);
   
  --**************************************************
  --***                                            ***
  --*** Multiplier Section                         *** 
  --***                                            ***
  --**************************************************
  
  mult: hcc_mulufp54
  GENERIC MAP (doubleaccuracy=>doubleaccuracy,device=>device,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mulinaaman,aaexp=>mulinaaexp,
            aasat=>mulinaasat,aazip=>mulinaazip,aanan=>mulinaanan,
            bbman=>mulinbbman,bbexp=>mulinbbexp,
            bbsat=>mulinbbsat,bbzip=>mulinbbzip,bbnan=>mulinbbnan,
            ccman=>ccmannode,ccexp=>ccexpnode,
            ccsat=>ccsatnode,cczip=>cczipnode,ccnan=>ccnannode);
   
  psd: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      mulinaasignff <= '0';
      mulinbbsignff <= '0';
      FOR k IN 1 TO signdepth LOOP
        mulsignff(k) <= '0';
      END LOOP;
       
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        mulinaasignff <= mulinaasign;
        mulinbbsignff <= mulinbbsign;
        
        mulsignff(1) <= mulinaasignff XOR mulinbbsignff;
        FOR k IN 2 TO signdepth LOOP
          mulsignff(k) <= mulsignff(k-1);
        END LOOP;
        
      END IF;
         
    END IF;
        
  END PROCESS;
       
  --**************************************************
  --***                                            ***
  --*** Output Section                             *** 
  --***                                            ***
  --**************************************************

  --********************************************************
  --*** internal format output, convert back to signed   ***
  --*** no need for fine normalization                   ***
  --********************************************************     
  goxa: IF (xoutput = 1) GENERATE 
  
    -- result will be "001X" (>2) or "0001X" (<2)
    -- Y is SSSSS1 (<2) - therefore right shift 2 bits
    -- 31/08/08 - behavioral mult changed to be same as synth one
    ccmanshiftnode <= "00" & ccmannode(64 DOWNTO 3);
    goxb: FOR k IN 1 TO 64 GENERATE
      signedccxmannode(k) <= ccmanshiftnode(k) XOR mulsignff(signdepth);
    END GENERATE;
    
    goxc: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
      --*** OUTPUTS ***
      cc(77 DOWNTO 14) <= signedccxmannode;
      cc(13 DOWNTO 1) <= ccexpnode;
      ccsat <= ccsatnode;
      cczip <= cczipnode;
      ccnan <= ccnannode;
    END GENERATE;

    goxd: IF ((roundconvert = 0 AND outputpipe = 1) OR
              (roundconvert = 1 AND doublespeed = 0)) GENERATE
    
      goxe: IF (roundconvert = 0) GENERATE
        ccxroundnode <= signedccxmannode;
      END GENERATE;
    
      goxf: IF (roundconvert = 1) GENERATE
        ccxroundnode <= signedccxmannode + (zerovec(63 DOWNTO 1) & mulsignff(signdepth));
      END GENERATE;
  
      poxa: PROCESS (sysclk,reset)
      BEGIN
        IF (reset = '1') THEN
            
          FOR k IN 1 TO 64 LOOP
            ccxroundff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 13 LOOP
            ccxexpff(k) <= '0';
          END LOOP;
          ccxsatff <= '0';
          ccxzipff <= '0';
          ccxnanff <= '0';
          
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            ccxroundff <= ccxroundnode;
            ccxexpff <= ccexpnode;
            ccxsatff <= ccsatnode;
            ccxzipff <= cczipnode;
            ccxnanff <= ccnannode;
          END IF;
          
        END IF;
      END PROCESS;
      
      --*** OUTPUTS ***
      cc(77 DOWNTO 14) <= ccxroundff;
      cc(13 DOWNTO 1) <= ccxexpff(13 DOWNTO 1);
      ccsat <= ccxsatff;
      cczip <= ccxzipff;
      ccnan <= ccxnanff;
    
    END GENERATE;

    goxg: IF (roundconvert = 1 AND doublespeed = 1) GENERATE

      poxb: PROCESS (sysclk,reset)
      BEGIN
        IF (reset = '1') THEN
            
          FOR k IN 1 TO 13 LOOP
            ccxexpdelff(1)(k) <= '0';
            ccxexpdelff(2)(k) <= '0';
          END LOOP;
          ccxsatdelff <= "00";
          ccxzipdelff <= "00";
          ccxnandelff <= "00";
          
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            ccxexpdelff(1)(13 DOWNTO 1) <= ccexpnode;
            ccxexpdelff(2)(13 DOWNTO 1) <= ccxexpdelff(1)(13 DOWNTO 1);
            ccxsatdelff(1) <= ccsatnode;
            ccxsatdelff(2) <= ccxsatdelff(1);
            ccxzipdelff(1) <= cczipnode;
            ccxzipdelff(2) <= ccxzipdelff(1);
            ccxnandelff(1) <= ccnannode;
            ccxnandelff(2) <= ccxnandelff(1);
          END IF;
          
        END IF;
      END PROCESS;
      
      goxh: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signedccxmannode,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(signdepth),
                  cc=>ccxroundnode);
      END GENERATE;

      goxi: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signedccxmannode,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(signdepth),
                  cc=>ccxroundnode);
      END GENERATE;
    
      --*** OUTPUTS ***   
      cc(77 DOWNTO 14) <= ccxroundnode;
      cc(13 DOWNTO 1) <= ccxexpdelff(2)(13 DOWNTO 1);
      ccsat <= ccxsatdelff(2);
      cczip <= ccxzipdelff(2);
      ccnan <= ccxnandelff(2);

    END GENERATE;

  END GENERATE;
  
  --********************************************************
  --*** if output directly out of datapath, convert here ***
  --*** input to multiplier always "01XXX" format, so    ***
  --*** just 1 bit normalization required                ***
  --********************************************************
  goea: IF (ieeeoutput = 1) GENERATE -- ieee754 out of datapath, do conversion
  
    -- output either "0001XXXX.." (<2) or "001XXXX.." (>=2), need to make output
    -- 01XXXX
    shiftroundbit <= NOT(ccmannode(62));
    goeb: FOR k IN 1 TO 55 GENERATE -- format "01"[52..1]R
      cceroundnode(k) <= (ccmannode(k+7) AND shiftroundbit) OR 
                         (ccmannode(k+8) AND NOT(shiftroundbit)); 
    END GENERATE;
     
    goec: IF (roundconvert = 0) GENERATE
    
      ccemannode <= cceroundnode(53 DOWNTO 2);
      
      poia: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
         
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesignbitff <= '0';
         
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            
            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= (ccemannode(k) AND NOT(manoutzero)) OR manoutmax; 
            END LOOP;
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) AND NOT(expoutzero)) OR manoutmax;
            END LOOP;
            ccesignbitff <= mulsignff(signdepth);
        
          END IF;  
          
        END IF;
        
      END PROCESS;
      
      cceexpplus <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit)); -- change 28/01/08
      ccesatbase <= ccsatnode;
      ccezipbase <= cczipnode;
      ccenanbase <= ccnannode;
      manoverflow <= '0';  -- change 28/01/08
      
      --*** OUTPUTS ***
      cc(64) <= ccesignbitff;
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
     
    END GENERATE;
  
    goed: IF (roundconvert = 1 AND doublespeed = 0) GENERATE

      cceroundcarry <= zerovec(53 DOWNTO 1) & cceroundnode(1);
              
      poeb: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 54 LOOP
            cceroundff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 13 LOOP
            cceexpff(k) <= '0';
          END LOOP;
          ccesatff <= '0';
          ccezipff <= '0';
          ccenanff <= '0';
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesignff <= "00";
        
        ELSIF (rising_edge(sysclk)) THEN
        
          IF (enable = '1') THEN   
          
            cceroundff <= cceroundnode(55 DOWNTO 2) + cceroundcarry;
             -- change 28/01/08
            cceexpff(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit));
          
            ccesatff <= ccsatnode;
            ccezipff <= cczipnode;
            ccenanff <= ccnannode;

            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= (cceroundff(k) AND NOT(manoutzero)) OR manoutmax; 
            END LOOP;
          
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) AND NOT(expoutzero)) OR expoutmax;
            END LOOP;
          
            ccesignff(1) <= mulsignff(signdepth);
            ccesignff(2) <= ccesignff(1);
      
          END IF;
          
        END IF;
        
      END PROCESS;
      
      manoverflow <= cceroundff(54);
      
      cceexpbase <= cceexpff(13 DOWNTO 1);
      ccesatbase <= ccesatff;
      ccezipbase <= ccezipff;  
      ccenanbase <= ccenanff;       
      cceexpplus <= cceexpbase + ("000000000000" & cceroundff(54)); 
        
      --*** OUTPUTS ***
      cc(64) <= ccesignff(2);
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
        
    END GENERATE;
  
    goef: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
      
      cceroundcarry <= zerovec(53 DOWNTO 1) & cceroundnode(1);
      
      goeg: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>54,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>cceroundnode(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),
                  carryin=>cceroundnode(1),
                  cc=>cceround);
      END GENERATE;

      goeh: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>54,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>cceroundnode(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),
                  carryin=>cceroundnode(1),
                  cc=>cceround);
      END GENERATE;
           
      poea: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 13 LOOP
            cceexpdelff(1)(k) <= '0';
            cceexpdelff(2)(k) <= '0';
          END LOOP;
          ccesatdelff <= "00";
          ccezipdelff <= "00";
          ccenandelff <= "00";
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesigndelff <= "000";
        
        ELSIF (rising_edge(sysclk)) THEN
        
          IF (enable = '1') THEN   
             -- change 28/01/08
            cceexpdelff(1)(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit));
            cceexpdelff(2)(13 DOWNTO 1) <= cceexpdelff(1)(13 DOWNTO 1);
          
            ccesatdelff(1) <= ccsatnode;
            ccesatdelff(2) <= ccesatdelff(1);
            ccezipdelff(1) <= cczipnode;
            ccezipdelff(2) <= ccezipdelff(1);
            ccenandelff(1) <= ccnannode;
            ccenandelff(2) <= ccenandelff(1);

            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= (cceround(k) AND NOT(manoutzero)) OR manoutmax; 
            END LOOP;
          
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) AND NOT(expoutzero)) OR expoutmax;
            END LOOP;
          
            ccesigndelff(1) <= mulsignff(signdepth);
            ccesigndelff(2) <= ccesigndelff(1);
            ccesigndelff(3) <= ccesigndelff(2);
      
          END IF;
          
        END IF;
        
      END PROCESS;
    
      manoverflow <= cceround(54);
       
      cceexpbase <= cceexpdelff(2)(13 DOWNTO 1);
      ccesatbase <= ccesatdelff(2);
      ccezipbase <= ccezipdelff(2);   
      ccenanbase <= ccenandelff(2);   
      cceexpplus <= cceexpbase + ("000000000000" & cceround(54)); 
    
      --*** OUTPUTS ***
      cc(64) <= ccesigndelff(3);
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
        
    END GENERATE;

    cceexpmax <= cceexpplus(11) AND cceexpplus(10) AND cceexpplus(9) AND cceexpplus(8) AND 
                 cceexpplus(7)  AND cceexpplus(6)  AND cceexpplus(5) AND cceexpplus(4) AND 
                 cceexpplus(3)  AND cceexpplus(2)  AND cceexpplus(1);      
    cceexpzero <= NOT(cceexpplus(11) OR cceexpplus(10) OR cceexpplus(9) OR cceexpplus(8) OR 
                      cceexpplus(7)  OR cceexpplus(6)  OR cceexpplus(5) OR cceexpplus(4) OR 
                      cceexpplus(3)  OR cceexpplus(2)  OR cceexpplus(1));
                     
    -- zip or exp condition turns mantissa zero
    manoutzero <= ccesatbase OR ccezipbase OR 
                  cceexpmax OR cceexpzero OR 
                  cceexpplus(13) OR cceexpplus(12) OR
                  manoverflow;
    manoutmax <= ccenanbase;
    expoutzero <= ccezipbase OR cceexpzero OR cceexpplus(13);
    expoutmax <= cceexpmax OR cceexpplus(12) OR ccenanbase;
    
    -- dummy only
    ccsat <= '0';
    cczip <= '0';   
    ccnan <= '0';
  
  END GENERATE;
  
  --********************************************************
  --*** if output directly into DP mult, convert here    ***
  --*** input to multiplier always "01XXX" format, so    ***
  --*** just 1 bit normalization required, no round      ***
  --********************************************************
  goma: IF (multoutput = 1) GENERATE -- to another multiplier

    -- output either "0001XXXX.." (<2) or "001XXXX.." (>=2), need to make output
    -- 01XXXX
    shiftmanbit <= NOT(ccmannode(62));
    gomb: FOR k IN 1 TO 54 GENERATE -- format "01"[52..1]
      manshiftnode(k) <= (ccmannode(k+8) AND shiftmanbit) OR 
                         (ccmannode(k+9) AND NOT(shiftmanbit)); 
    END GENERATE;
      
    poma: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 54 LOOP
          manshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 13 LOOP
          ccexpdelff(k) <= '0';
        END LOOP;
        ccsatdelff <= '0';
        cczipdelff <= '0';
        ccnandelff <= '0';
        muloutsignff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN   
           
          manshiftff <= manshiftnode;
           -- change 28/01/08
          ccexpdelff(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftmanbit));
          
          ccsatdelff <= ccsatnode;
          cczipdelff <= cczipnode;
          ccnandelff <= ccnannode;
          
          muloutsignff <= mulsignff(signdepth);
      
        END IF;
          
      END IF;
        
    END PROCESS;
                     
    cc(67) <= muloutsignff;
    cc(66 DOWNTO 14) <= manshiftff(53 DOWNTO 1);
    cc(13 DOWNTO 1) <= ccexpdelff(13 DOWNTO 1);
    ccsat <= ccsatdelff;
    cczip <= cczipdelff;
    ccnan <= ccnandelff;

  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(13 DOWNTO 1);
  bbexp <= bb(13 DOWNTO 1);
  aaman <= aa(67 DOWNTO 14);
  bbman <= bb(67 DOWNTO 14);
  
  gdba: IF (xoutput = 1) GENERATE
     gdbb: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
       ccman <= signedccxmannode;
       ccexp <= ccexpnode;
     END GENERATE; 
     gdbc: IF ((roundconvert = 0 AND outputpipe = 1) OR
              (roundconvert = 1 AND doublespeed = 0)) GENERATE
       ccman <= ccxroundff;
       ccexp <= ccxexpff(13 DOWNTO 1);
     END GENERATE;
     gdbd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
       ccman <= ccxroundnode;
       ccexp <= ccxexpdelff(2)(13 DOWNTO 1);
     END GENERATE;
  END GENERATE;
  
   -- change 28/01/08
  gdbe: IF (ieeeoutput = 1) GENERATE
    ccexp <= cceexpoutff;
    ccman <= "01" & ccemanoutff;
  END GENERATE;
   -- change 28/01/08
  gdbf: IF (multoutput = 1) GENERATE
    ccexp <= ccexpdelff(13 DOWNTO 1);
    ccman <= '0' & manshiftff(53 DOWNTO 1);
  END GENERATE;
       
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP3236.VHD                         ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***             core function                   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   21/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfp3236 IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         device : integer := 0;
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_mulfp3236;

ARCHITECTURE rtl OF hcc_mulfp3236 IS
  
  constant normtype : integer := 0;
  
  type expfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaman, bbman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexp, bbexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal mulout : STD_LOGIC_VECTOR (2*mantissa DOWNTO 1);

  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, aananff, bbsatff, bbzipff, bbnanff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (2 DOWNTO 1);

  component hcc_mul3236b 
  GENERIC (width : positive);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
        cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
       );
  end component;
  
  component hcc_mul3236s
  GENERIC (width : positive);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 
      
  component hcc_mul3236t
  GENERIC (width : positive);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component; 
BEGIN

  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- normalization or scale turns it into
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][U*U]
  -- [64..62][61][60..15][14....1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][U*U.....]
  -- [64..63][62][61..16][15.....1]
  
  -- output (if destination not a multiplier)
  -- right shift 2
  -- [S ][S ][SSS1..XX]
  -- [64][64][64....35]
  -- result "SSSSS1XXX" if result <2, "SSSS1XXXX" if result >= 2
  
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      aaexpff <= "0000000000";
      bbexpff <= "0000000000";
      FOR k IN 1 TO 2 LOOP
        expff(k)(10 DOWNTO 1) <= "0000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      ccsatff <= "00";
      cczipff <= "00";
      ccnanff <= "00";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        
        aasatff <= aasat;
        aazipff <= aazip;
        aananff <= aanan;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        bbnanff <= bbnan;
        ccsatff(1) <= aasatff OR bbsatff;
        ccsatff(2) <= ccsatff(1);
        cczipff(1) <= aazipff OR bbzipff;
        cczipff(2) <= cczipff(1);
        -- multiply 0 X infinity is invalid OP, NAN out
        ccnanff(1) <= aananff OR bbnanff OR (aazipff AND bbsatff) OR (bbzipff AND aasatff);
        ccnanff(2) <= ccnanff(1);
        
        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(10 DOWNTO 1) <= aaexpff + bbexpff - "0001111111";
        FOR k IN 1 TO 10 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP;    
        
      END IF;
    
    END IF;
  
  END PROCESS;
  
  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;
  
  gsb: IF (synthesize = 1 AND device /= 3) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout);
  END GENERATE;
  
  gsc: IF (synthesize = 1 AND device = 3) GENERATE
    tmult: hcc_mul3236t
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout(2*mantissa DOWNTO mantissa+1));
    mulout(mantissa DOWNTO 1) <= (others => '0');
  END GENERATE;
  
  --***************
  --*** OUTPUTS ***          
  --***************         
    cc <= mulout(2*mantissa) & mulout(2*mantissa) & mulout(2*mantissa DOWNTO mantissa+3) & expff(2)(10 DOWNTO 1);
    ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFPPN3236.VHD                       ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***             core function, with post-norm   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   21/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfppn3236 IS
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         device : integer := 0;
         synthesize : integer := 0
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_mulfppn3236;

ARCHITECTURE rtl OF hcc_mulfppn3236 IS
  
  constant normtype : integer := 0;
  
  type expfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaman, bbman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexp, bbexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal mulout : STD_LOGIC_VECTOR (2*mantissa DOWNTO 1);
  
  signal aamanff, bbmanff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal manoutff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, aananff : STD_LOGIC;
  signal bbsatff, bbzipff, bbnanff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  
  signal aapos, aaneg, bbpos, bbneg : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal aanumff, bbnumff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal selnode : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal sel, selff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal expadjff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal expadjnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_mul3236b 
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
  component hcc_mul3236s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 
    
BEGIN

  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- normalization or scale turns it into
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][U*U]
  -- [64..62][61][60..15][14....1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][U*U.....]
  -- [64..63][62][61..16][15.....1]
  
  -- assume that result > 2
  -- if output likely in [62..59] shift 0, if in [58..55] shift 4, 
  -- if in [54..51] shift 8, else shift 12 (adjust exponent accordingly)
         
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
       
      FOR k IN 1 TO mantissa LOOP
        aamanff(k) <= '0';
        bbmanff(k) <= '0';
      END LOOP; 
      aaexpff <= "0000000000";
      bbexpff <= "0000000000";
      FOR k IN 1 TO 3 LOOP
        expff(k)(10 DOWNTO 1) <= "0000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      ccsatff <= "000";
      cczipff <= "000";
      ccnanff <= "000";
      aanumff <= "0000";
      bbnumff <= "0000";
      selff <= "0000";
      expadjff <= "0000";
      FOR k IN 1 TO mantissa LOOP
        manoutff(k) <= '0';
      END LOOP;  
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aamanff <= aaman; 
        bbmanff <= bbman;
        
        aasatff <= aasat;
        aazipff <= aazip;
        aananff <= aanan;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        bbnanff <= bbnan;
        ccsatff(1) <= aasatff OR bbsatff;
        ccsatff(2) <= ccsatff(1);
        ccsatff(3) <= ccsatff(2);
        cczipff(1) <= aazipff OR bbzipff;
        cczipff(2) <= cczipff(1);
        cczipff(3) <= cczipff(2);
        -- multiply 0 X infinity is invalid OP, NAN out
        ccnanff(1) <= aananff OR bbnanff OR (aazipff AND bbsatff) OR (bbzipff AND aasatff);
        ccnanff(2) <= ccnanff(1);
        ccnanff(3) <= ccnanff(2);
        
        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(10 DOWNTO 1) <= aaexpff + bbexpff - "0001111111";
        FOR k IN 1 TO 10 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP;    
        expff(3)(10 DOWNTO 1) <= expff(2)(10 DOWNTO 1) + expadjnode;
        
        FOR k IN 1 TO 4 LOOP
          aanumff(k) <= (aapos(k) AND NOT(aa(32))) OR (aaneg(k) AND aa(32));
          bbnumff(k) <= (bbpos(k) AND NOT(bb(32))) OR (bbneg(k) AND bb(32));
        END LOOP;
        
        selff <= sel;
        
        -- "0" when sel(1), "4" when sel(2), "8" when sel(3), "12" when sel(4)
        -- don't adjust during a saturate or zero condition
        expadjff(2 DOWNTO 1) <= "00";
        expadjff(3) <= (sel(2) OR sel(4)) AND NOT(ccsatff(1) OR cczipff(1)); 
        expadjff(4) <= (sel(3) OR sel(4)) AND NOT(ccsatff(1) OR cczipff(1)); 
        
        -- output left shift 
        -- mulpipe is [64..1], 44 bit output is in [62..19] for 32 bit
        -- mulpipe is [72..1], 44 bit output is in [70..27] for 36 bits
        FOR k IN mantissa DOWNTO 1 LOOP
          manoutff(k) <= (mulout(k+mantissa-2) AND selff(1)) OR
                         (mulout(k+mantissa-6) AND selff(2)) OR
                         (mulout(k+mantissa-10) AND selff(3)) OR
                         (mulout(k+mantissa-14) AND selff(4));
          
        END LOOP;
        
      END IF;
    
    END IF;
  
  END PROCESS;

  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;
  
  gsb: IF (synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout);
  END GENERATE;
   
  aapos(1) <= aamanff(mantissa-1) OR aamanff(mantissa-2) OR aamanff(mantissa-3) OR aamanff(mantissa-4);
  aapos(2) <= aamanff(mantissa-5) OR aamanff(mantissa-6) OR aamanff(mantissa-7) OR aamanff(mantissa-8);
  aapos(3) <= aamanff(mantissa-9) OR aamanff(mantissa-10) OR aamanff(mantissa-11) OR aamanff(mantissa-12);
  aapos(4) <= aamanff(mantissa-13) OR aamanff(mantissa-14) OR aamanff(mantissa-15) OR aamanff(mantissa-16);
  
  bbpos(1) <= bbmanff(mantissa-1) OR bbmanff(mantissa-2) OR bbmanff(mantissa-3) OR bbmanff(mantissa-4);
  bbpos(2) <= bbmanff(mantissa-5) OR bbmanff(mantissa-6) OR bbmanff(mantissa-7) OR bbmanff(mantissa-8);
  bbpos(3) <= bbmanff(mantissa-9) OR bbmanff(mantissa-10) OR bbmanff(mantissa-11) OR bbmanff(mantissa-12);
  bbpos(4) <= bbmanff(mantissa-13) OR bbmanff(mantissa-14) OR bbmanff(mantissa-15) OR bbmanff(mantissa-16);

  aaneg(1) <= aamanff(mantissa-1) AND aamanff(mantissa-2) AND aamanff(mantissa-3) AND aamanff(mantissa-4);
  aaneg(2) <= aamanff(mantissa-5) AND aamanff(mantissa-6) AND aamanff(mantissa-7) AND aamanff(mantissa-8);
  aaneg(3) <= aamanff(mantissa-9) AND aamanff(mantissa-10) AND aamanff(mantissa-11) AND aamanff(mantissa-12);
  aaneg(4) <= aamanff(mantissa-13) AND aamanff(mantissa-14) AND aamanff(mantissa-15) AND aamanff(mantissa-16);
  
  bbneg(1) <= bbmanff(mantissa-1) AND bbmanff(mantissa-2) AND bbmanff(mantissa-3) AND bbmanff(mantissa-4);
  bbneg(2) <= bbmanff(mantissa-5) AND bbmanff(mantissa-6) AND bbmanff(mantissa-7) AND bbmanff(mantissa-8);
  bbneg(3) <= bbmanff(mantissa-9) AND bbmanff(mantissa-10) AND bbmanff(mantissa-11) AND bbmanff(mantissa-12);
  bbneg(4) <= bbmanff(mantissa-13) AND bbmanff(mantissa-14) AND bbmanff(mantissa-15) AND bbmanff(mantissa-16);  
   
  selnode(1) <= aanumff(1) AND bbnumff(1);
  selnode(2) <= (aanumff(1) AND bbnumff(2)) OR 
                (aanumff(2) AND bbnumff(1));
  selnode(3) <= (aanumff(2) AND bbnumff(2)) OR 
                (aanumff(1) AND bbnumff(3)) OR 
                (aanumff(3) AND bbnumff(1));
        
  sel(1) <= selnode(1); -- shift 0
  sel(2) <= NOT(selnode(1)) AND selnode(2); -- shift 4
  sel(3) <= NOT(selnode(1)) AND NOT(selnode(2)) AND selnode(3); -- shift 8
  sel(4) <= NOT(selnode(1)) AND NOT(selnode(2)) AND NOT(selnode(3)); -- shift 12
            
  expadjnode <= "000000" & expadjff;  
  
  --***************
  --*** OUTPUTS ***          
  --***************          
                         
  cc <= manoutff(mantissa) & manoutff(mantissa) & manoutff(mantissa DOWNTO 3) & expff(3)(10 DOWNTO 1);
  ccsat <= ccsatff(3);
  cczip <= cczipff(3);
  ccnan <= ccnanff(3);
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONG.VHD                           ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
--***                                             ***
--***   14/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mullong IS 
GENERIC (
         unsigned : integer := 0; -- 0 = signed, 1 = unsigned
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_mullong;

ARCHITECTURE rtl OF hcc_mullong IS

  component hcc_mullongb
  GENERIC (unsigned : integer := 0); -- 0 = signed, 1 = unsigned
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		  );
  end component;
  
  component hcc_mullongs
  GENERIC (unsigned : integer := 0); -- 0 = signed, 1 = unsigned
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		  );
  end component;

BEGIN

  gba: IF (synthesize = 0) GENERATE
    
    mulb: hcc_mullongb
    GENERIC MAP (unsigned=>unsigned)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,
              cc=>cc);
              
  END GENERATE;
  
  gsa: IF (synthesize = 1) GENERATE
    
    muls: hcc_mullongs
    GENERIC MAP (unsigned=>unsigned)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,
              cc=>cc);
              
  END GENERATE;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONGB.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
--***             behavioral                      ***
--***                                             ***
--***   14/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mullongb IS 
GENERIC (unsigned : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_mullongb;

ARCHITECTURE rtl OF hcc_mullongb IS

  signal aabit, bbbit : STD_LOGIC;
  signal aaff, bbff : STD_LOGIC_VECTOR (33 DOWNTO 1);
  signal mulff : STD_LOGIC_VECTOR (66 DOWNTO 1);
  signal muloutff : STD_LOGIC_VECTOR (32 DOWNTO 1);

BEGIN
  
  gxa: IF (unsigned = 0) GENERATE
    aabit <= aa(32);
    bbbit <= bb(32);
  END GENERATE;
  
  gxb: IF (unsigned = 1) GENERATE
    aabit <= '0';
    bbbit <= '0';
  END GENERATE;
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 33 LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 66 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 32 LOOP
        muloutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aabit & aa; 
        bbff <= bbbit & bb;
        mulff <= aaff * bbff;
        muloutff <= mulff(32 DOWNTO 1);
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= muloutff; 
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONGS.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
--***             synthesizable                   ***
--***                                             ***
--***   14/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mullongs IS
GENERIC (unsigned : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)  
      );
END hcc_mullongs;

ARCHITECTURE syn OF hcc_mullongs IS

   signal mulnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
   
	COMPONENT altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_aclr		: STRING;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

  gsa: IF (unsigned = 0) GENERATE
  
	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "SIGNED",
		representation_b => "SIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 32,
		width_b => 32,
		width_result => 64
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulnode
	);

  END GENERATE;
  
  gua: IF (unsigned = 1) GENERATE
  
	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 32,
		width_b => 32,
		width_result => 64
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulnode
	);

  END GENERATE;
  
  mulcc <= mulnode(32 DOWNTO 1);
  
END syn;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULUFP54.VHD                          ***
--***                                             ***
--***   Function: Double precision multiplier     ***
--***             core (unsigned mantissa)        ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   21/04/09 - add NAN support                ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mulufp54 IS 
GENERIC (
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bbman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      bbexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;

      ccman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
      ccexp : OUT STD_LOGIC_VECTOR (13 DOWNTO 1);
      ccsat, cczip, ccnan : OUT STD_LOGIC
     );
END hcc_mulufp54;

ARCHITECTURE rtl OF hcc_mulufp54 IS
  -- 5 if stratix 2, 3 if stratix 3/4, 3 also for SV/AV.
  function pipeline_latency(device : integer) return positive is
  begin
    case device is
      when      0 => return 5;
      when others => return 3;
    end case;
  end function pipeline_latency;

  constant normtype : integer := 0;
  constant pipedepth : positive := pipeline_latency(device);

  type expfftype IS ARRAY (pipedepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal mulout : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, aananff : STD_LOGIC; 
  signal bbsatff, bbzipff, bbnanff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (pipedepth DOWNTO 1);

  component hcc_mul54usb
  GENERIC (
           doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0 -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
       );
  end component;

  component hcc_mul54us_3xs
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
       );
  end component;

  component hcc_mul54us_28s
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
       );
  end component;

  component hcc_mul54us_29s
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
       );
  end component;

  component hcc_mul54us_38s
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
       );
  end component;

  component hcc_mul54us_57s
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)  
       );
  end component;
BEGIN
  -- 54 bit mantissa, signed normalized input
  -- [S ][1 ][M...M]
  -- [54][53][52..1]

  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][X...X]
  -- [72..70][69][68..17][16..1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][X...X]
  -- [72..71][70][69..18][17..1]

  -- assume that result > 2
  -- output [71..8] for 64 bit mantissa out

  pma: PROCESS (sysclk, reset)
  BEGIN

    IF (reset = '1') THEN

      aaexpff <= "0000000000000";
      bbexpff <= "0000000000000";
      FOR k IN 1 TO pipedepth LOOP
        expff(k)(13 DOWNTO 1) <= "0000000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      FOR k IN 1 TO pipedepth LOOP
        ccsatff(k) <= '0';
        cczipff(k) <= '0';
        ccnanff(k) <= '0';
      END LOOP;

    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN

        aasatff <= aasat;
        aazipff <= aazip;
        aananff <= aanan;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        bbnanff <= bbnan;
        ccsatff(1) <= aasatff OR bbsatff;
        FOR k IN 2 TO pipedepth LOOP
          ccsatff(k) <= ccsatff(k-1);
        END LOOP;
        cczipff(1) <= aazipff OR bbzipff;
        FOR k IN 2 TO pipedepth LOOP
          cczipff(k) <= cczipff(k-1);
        END LOOP;
        -- multiply 0 X infinity is invalid OP, NAN out
        ccnanff(1) <= aananff OR bbnanff OR (aazipff AND bbsatff) OR (bbzipff AND aasatff);
        FOR k IN 2 TO pipedepth LOOP
          ccnanff(k) <= ccnanff(k-1);
        END LOOP;

        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(13 DOWNTO 1) <= aaexpff + bbexpff - "0001111111111";
        FOR k IN 1 TO 13 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP; 
        FOR k IN 3 TO pipedepth LOOP
          expff(k)(13 DOWNTO 1) <= expff(k-1)(13 DOWNTO 1);
        END LOOP;   

      END IF;

    END IF;

  END PROCESS;

  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul54usb
    GENERIC MAP (doubleaccuracy=>doubleaccuracy,device=>device)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;

  gsb: IF (synthesize = 1) GENERATE

    gma: IF (device = 0 AND doubleaccuracy = 0) GENERATE
      smone: hcc_mul54us_28s
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                mulaa=>aaman,mulbb=>bbman,
                mulcc=>mulout);
    END GENERATE;

    gmb: IF (device = 0 AND doubleaccuracy = 1) GENERATE
      smtwo: hcc_mul54us_29s
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                mulaa=>aaman,mulbb=>bbman,
                mulcc=>mulout);
    END GENERATE;

    gmc: IF (device = 1 AND doubleaccuracy = 0) GENERATE
      smthr: hcc_mul54us_38s
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                mulaa=>aaman,mulbb=>bbman,
                mulcc=>mulout);
    END GENERATE;

    gmd: IF ((device = 1 OR device = 2) AND doubleaccuracy = 1) GENERATE
      smfor: hcc_mul54us_3xs
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                mulaa=>aaman,mulbb=>bbman,
                mulcc=>mulout);
    END GENERATE;

    gme: IF (device = 2 AND doubleaccuracy = 0) GENERATE
      smfiv: hcc_mul54us_57s
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                mulaa=>aaman,mulbb=>bbman,
                mulcc=>mulout);
    END GENERATE;

  END GENERATE;

  --***************
  --*** OUTPUTS ***
  --***************

  ccman <= mulout; 
  ccexp <= expff(pipedepth)(13 DOWNTO 1);
  ccsat <= ccsatff(pipedepth);
  cczip <= cczipff(pipedepth);
  ccnan <= ccnanff(pipedepth);

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP1X.VHD                          ***
--***                                             ***
--***   Function: Normalize single precision      ***
--***             number                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   28/12/07 - divider target uses all of     ***
--***   mantissa width                            ***
--***   06/02/08 - fix divider norm               ***
--***   21/03/08 - fix add tree output norm       ***
--***   16/04/09 - add NAN support                ***
--***   08/11/10 - +0,-0 mantissa case            ***
--***                                             ***
--***************************************************

--***************************************************
--*** LATENCY :                                   ***
--***************************************************

--***************************************************
--*** NOTES:                                      ***
--*** normalize signed numbers (x input format)   ***
--*** for 1x multipliers                          ***
--*** format signed32/36 bit mantissa and 10 bit  ***
--*** exponent                                    ***
--*** unsigned numbers for divider (S,1,23 bit    ***
--*** mantissa for divider) divider packed into   ***
--*** 32/36bit mantissa + exponent                ***
--***************************************************

ENTITY hcc_normfp1x IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         inputnormalize : integer := 1; -- 0 = scale, 1 = normalize
         roundnormalize : integer := 1;
         normspeed : positive := 2; -- 1 or 2
         target : integer := 0 -- 0 = mult target (signed), 1 = divider target (unsigned), 2 adder tree
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_normfp1x;

ARCHITECTURE rtl OF hcc_normfp1x IS
  
  type expfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal ccnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  
  -- scale
  signal aasatff, aazipff, aananff : STD_LOGIC;
  signal countaa : STD_LOGIC_VECTOR (3 DOWNTO 1);
  
  --  normalize
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal normfracnode, normnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal normfracff, normff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal countadjust : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exptopff, expbotff : expfftype;
  signal maximumnumberff : STD_LOGIC;
  signal zeroexponent, zeroexponentff : STD_LOGIC;
  signal exponentmiddle : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aasatdelff, aazipdelff, aanandelff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal countsign : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal normsignnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aaexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  
  component hcc_normsgn3236  
  GENERIC (
           mantissa : positive := 32;
           normspeed : positive := 1 -- 1 or 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);
      
        countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	     fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	    );
  end component;
  	  
  component hcc_scmul3236 
  GENERIC (mantissa : positive := 32);
  PORT (
        frac : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

		  scaled : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1);
		  count : OUT STD_LOGIC_VECTOR (3 DOWNTO 1)
	    );
  end component;

  BEGIN
           
  --********************************************************
  --*** scale multiplier                                 ***
  --*** multiplier format [S][1][mantissa....]           ***
  --*** one clock latency                                ***
  --********************************************************
  
  -- make sure right format & adjust exponent
  gsa: IF (inputnormalize = 0) GENERATE 
  
    psa: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        
        FOR k IN 1 TO mantissa+10 LOOP
          aaff(k) <= '0';
        END LOOP;
        aasatff <= '0';
        aazipff <= '0';
        aananff <= '0';
      
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
   
          aaff <= aa;
          aasatff <= aasat;
          aazipff <= aazip;
          aananff <= aanan;
          
        END IF;
    
      END IF;
  
    END PROCESS;
    
    -- no rounding when scaling
    sma: hcc_scmul3236
    GENERIC MAP (mantissa=>mantissa)
    PORT MAP (frac=>aaff(mantissa+10 DOWNTO 11),
              scaled=>ccnode(mantissa+10 DOWNTO 11),count=>countaa);
        
    ccnode(10 DOWNTO 1) <= aaff(10 DOWNTO 1) + ("0000000" & countaa);
    
    cc <= ccnode;
    
    ccsat <= aasatff;
    cczip <= aazipff;
    ccnan <= aananff;
        
  END GENERATE;
 
  --********************************************************
  --*** full normalization of input - 4 stages           ***
  --*** unlike double, no round required on output, as   ***
  --*** no information lost                              ***
  --********************************************************  
  gna: IF (inputnormalize = 1) GENERATE -- normalize
  
    gza: FOR k IN 1 TO mantissa-1 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
    
    -- if multiplier, "1" which is nominally in position 27, is shifted to position 31
    -- add 4 to exponent when multiplier, 0 for adder
    gxa: IF (target < 2) GENERATE
      countadjust <= conv_std_logic_vector (4,10);
    END GENERATE;
    
    gxb: IF (target = 2) GENERATE
      countadjust <= conv_std_logic_vector (4,10);
    END GENERATE;
    
    pna: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        
        FOR k IN 1 TO mantissa+10 LOOP
          aaff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO mantissa LOOP
          normfracff(k) <= '0';
          normff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          exptopff(1)(k) <= '0';
          exptopff(2)(k) <= '0';
          expbotff(1)(k) <= '0';
          expbotff(2)(k) <= '0';
        END LOOP;
        maximumnumberff <= '0';
        zeroexponentff <= '0';
        FOR k IN 1 TO 5 LOOP
          aasatdelff(k) <= '0';
          aazipdelff(k) <= '0';
          aanandelff(k) <= '0';
        END LOOP;
      
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
   
          aaff <= aa;
          
          normfracff <= normfracnode;
          
          --might not get used
          normff <= normnode;
          
          exptopff(1)(10 DOWNTO 1) <= aaff(10 DOWNTO 1) + countadjust;
          exptopff(2)(10 DOWNTO 1) <= exptopff(1)(10 DOWNTO 1) - ("0000" & countsign);
          
          --might not get used
          expbotff(1)(10 DOWNTO 1) <= exponentmiddle;
          expbotff(2)(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
          
          -- 08/11/09 
          maximumnumberff <= aaff(mantissa+10) XOR aaff(mantissa+9);
          zeroexponentff <= zeroexponent;
      
          aasatdelff(1) <= aasat;
          aazipdelff(1) <= aazip;
          aanandelff(1) <= aanan;
          FOR k IN 2 TO 5 LOOP -- 4&5 might not get used
            aasatdelff(k) <= aasatdelff(k-1);
            aazipdelff(k) <= aazipdelff(k-1);
            aanandelff(k) <= aanandelff(k-1);
          END LOOP;
          
        END IF;
    
      END IF;
  
    END PROCESS;
    
    nrmc: hcc_normsgn3236 
    GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              fracin=>aaff(mantissa+10 DOWNTO 11),
              countout=>countsign, -- stage 1 or 2
              fracout=>normfracnode); -- stage 2 or 3
             
    -- 08/11/10 - also where exponentmiddle is used
    -- '1' if true : if countsign 0, then "111...111" (-0) or "000...000" (+0) case, zero exponent output 
    zeroexponent <= NOT(countsign(6) OR countsign(5) OR countsign(4) OR 
                        countsign(3) OR countsign(2) OR countsign(1) OR maximumnumberff);
                        
    gen_exp_mid: FOR k IN 1 TO 10 GENERATE
      exponentmiddle(k) <= exptopff(2)(k) AND NOT(zeroexponentff);
    END GENERATE;
            
    gnb: IF (target = 1) GENERATE
    
      gnc: FOR k IN 1 TO mantissa GENERATE
        normsignnode(k) <= normfracff(k) XOR normfracff(mantissa);
      END GENERATE;
      normnode(mantissa-1 DOWNTO 1) <= normsignnode(mantissa-1 DOWNTO 1) + 
                                      (zerovec(mantissa-2 DOWNTO 1) & normfracff(mantissa));
      -- 06/02/08 make sure signbit is packed with the mantissa
      normnode(mantissa) <= normfracff(mantissa);
      
      --*** OUTPUTS ***
      ccnode(mantissa+10 DOWNTO 11) <= normff;
      ccnode(10 DOWNTO 1) <= expbotff(normspeed)(10 DOWNTO 1);
      ccsat <= aasatdelff(3+normspeed);
      cczip <= aazipdelff(3+normspeed);
      ccnan <= aanandelff(3+normspeed);
      
    END GENERATE;
    
    gnc: IF (target = 0) GENERATE
    
      --*** OUTPUTS ***
      ccnode(mantissa+10 DOWNTO 11) <= normfracff;
      gma: IF (normspeed = 1) GENERATE
        ccnode(10 DOWNTO 1) <= exponentmiddle;
      END GENERATE;
      gmb: IF (normspeed > 1) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
      END GENERATE;
      ccsat <= aasatdelff(2+normspeed);
      cczip <= aazipdelff(2+normspeed);
      ccnan <= aanandelff(2+normspeed);
        
    END GENERATE;

    gnd: IF (target = 2) GENERATE
    
      gaa: IF (roundnormalize = 1) GENERATE
        normnode <= (normfracff(mantissa) & normfracff(mantissa) & 
                     normfracff(mantissa) & normfracff(mantissa) & 
                     normfracff(mantissa DOWNTO 5)) +
                    (zerovec(mantissa-1 DOWNTO 1) & normfracff(4));
      END GENERATE;
                   
      --*** OUTPUTS ***
      gab: IF (roundnormalize = 0) GENERATE -- 21/03/08 fixed this to SSSSS1XXXXX
        ccnode(mantissa+10 DOWNTO 11) <= normfracff(mantissa) & normfracff(mantissa) & 
                                         normfracff(mantissa) & normfracff(mantissa) & 
                                         normfracff(mantissa DOWNTO 5);
      END GENERATE;
      gac: IF (roundnormalize = 1) GENERATE
        ccnode(mantissa+10 DOWNTO 11) <= normff;
      END GENERATE;
      gad: IF (normspeed = 1 AND roundnormalize = 0) GENERATE
        ccnode(10 DOWNTO 1) <= exponentmiddle;
      END GENERATE;
      gae: IF ((normspeed = 2 AND roundnormalize = 0) OR
               (normspeed = 1 AND roundnormalize = 1)) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
      END GENERATE;
      gaf: IF (normspeed = 2 AND roundnormalize = 1) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(2)(10 DOWNTO 1);
      END GENERATE;
      ccsat <= aasatdelff(2+normspeed+roundnormalize);
      cczip <= aazipdelff(2+normspeed+roundnormalize);
      ccnan <= aanandelff(2+normspeed+roundnormalize);
      
    END GENERATE;
      
    cc <= ccnode;
  
  END GENERATE;  
  
  --*** DEBUG ***
  aaexp <= aa(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  ccexp <= ccnode(10 DOWNTO 1);
  ccman <= ccnode(mantissa+10 DOWNTO 11);

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize double precision      ***
--***             number                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   05/03/08 - correct expbotffdepth constant ***
--***   20/04/09 - add NAN support, add overflow  ***
--***   check in target=0 code                    ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_normfp2x IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         roundnormalize : integer := 1; -- global switch - round all normalizations when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 

      cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_normfp2x;

ARCHITECTURE rtl OF hcc_normfp2x IS

  constant latency : positive := 3 + normspeed + 
                                (roundconvert*doublespeed) +
                                (roundnormalize + roundnormalize*doublespeed);
  constant exptopffdepth : positive := 2 + roundconvert*doublespeed;
  constant expbotffdepth : positive := normspeed + roundnormalize*(1+doublespeed); -- 05/03/08
  -- if internal format, need to turn back to signed at this point
  constant invertpoint : positive := 1 + normspeed + (roundconvert*doublespeed);
  
  type exptopfftype IS ARRAY (exptopffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type expbotfftype IS ARRAY (expbotffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);   
  signal exptopff : exptopfftype;
  signal expbotff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expbotdelff : expbotfftype;
  signal exponent : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal adjustexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal aasatff, aazipff, aananff : STD_LOGIC_VECTOR (latency DOWNTO 1); 
  signal mulsignff : STD_LOGIC_VECTOR (latency-1 DOWNTO 1);                              
  signal aainvnode, aaabsnode, aaabsff, aaabs : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal normalaa : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal countnorm : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal normalaaff : STD_LOGIC_VECTOR (55+9*target DOWNTO 1);
  signal overflowbitnode : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal overflowcondition : STD_LOGIC;
  signal overflowconditionff : STD_LOGIC;
  signal mantissa : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal aamannode : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal aamanff : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal sign : STD_LOGIC;

  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
     
  component hcc_normus64 IS 
  GENERIC (pipes : positive := 1); -- currently 1 or 3
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	    fracout : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
                                   
BEGIN
    
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
    
  --*** INPUT REGISTER ***
  pna: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
          
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO exptopffdepth LOOP
        FOR j IN 1 TO 13 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO latency LOOP
        aasatff(k) <= '0';
        aazipff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO latency-1 LOOP
        mulsignff(k) <= '0';
      END LOOP;
       
    ELSIF (rising_edge(sysclk)) THEN
         
      IF (enable = '1') THEN
        
        aaff <= aa;
            
        exptopff(1)(13 DOWNTO 1) <= aaff(13 DOWNTO 1) + adjustexp;
        FOR k IN 2 TO exptopffdepth LOOP
          exptopff(k)(13 DOWNTO 1) <= exptopff(k-1)(13 DOWNTO 1);
        END LOOP;

        aasatff(1) <= aasat;
        aazipff(1) <= aazip;
        aananff(1) <= aanan;
        FOR k IN 2 TO latency LOOP
          aasatff(k) <= aasatff(k-1);
          aazipff(k) <= aazipff(k-1);
          aananff(k) <= aananff(k-1);
        END LOOP;
          
        mulsignff(1) <= aaff(77);
        FOR k IN 2 TO latency-1 LOOP
          mulsignff(k) <= mulsignff(k-1);
        END LOOP;
          
      END IF;
             
    END IF;
      
  END PROCESS;

  -- exponent bottom half
  gxa: IF (expbotffdepth = 1) GENERATE

    pxa: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO 13 LOOP
          expbotff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotff(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotff;

  END GENERATE;

  gxb: IF (expbotffdepth = 2) GENERATE

    pxb: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO 2 LOOP
          FOR j IN 1 TO 13 LOOP
            expbotdelff(k)(j) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotdelff(1)(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
          expbotdelff(2)(13 DOWNTO 1) <= expbotdelff(1)(13 DOWNTO 1) + ("000000000000" & overflowcondition);
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotdelff(2)(13 DOWNTO 1);

  END GENERATE;
  
  gxc: IF (expbotffdepth > 2) GENERATE

    pxb: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO expbotffdepth LOOP
          FOR j IN 1 TO 13 LOOP
            expbotdelff(k)(j) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotdelff(1)(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
          FOR k IN 2 TO expbotffdepth-1 LOOP
            expbotdelff(k)(13 DOWNTO 1) <= expbotdelff(k-1)(13 DOWNTO 1);
          END LOOP;
          expbotdelff(expbotffdepth)(13 DOWNTO 1) <= expbotdelff(expbotffdepth-1)(13 DOWNTO 1) + 
                                                     ("000000000000" & overflowcondition);
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotdelff(expbotffdepth)(13 DOWNTO 1);

  END GENERATE;

  -- add 4, because Y format is SSSSS1XXXX, seem to need this for both targets
  adjustexp <= "0000000000100";
  
  gna: FOR k IN 1 TO 64 GENERATE
    aainvnode(k) <= aaff(k+13) XOR aaff(77);
  END GENERATE;
  
  --*** APPLY ROUNDING TO ABS VALUE (IF REQUIRED) ***
  gnb: IF ((roundconvert = 0) OR
           (roundconvert = 1 AND doublespeed = 0)) GENERATE
  
    gnc: IF (roundconvert = 0) GENERATE
      aaabsnode <= aainvnode;
    END GENERATE;
    gnd: IF (roundconvert = 1) GENERATE
      aaabsnode <= aainvnode + (zerovec(63 DOWNTO 1) & aaff(77));
    END GENERATE;

    pnb: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN    
        FOR k IN 1 TO 64 LOOP
          aaabsff(k) <= '0';
        END LOOP;   
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          aaabsff <= aaabsnode;  
        END IF;          
      END IF;
    END PROCESS;

    aaabs <= aaabsff;

  END GENERATE;
    
  gnd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE   
    gsa: IF (synthesize = 0) GENERATE
      absone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aainvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>aaabs);
    END GENERATE;
    gsb: IF (synthesize = 1) GENERATE
      abstwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aainvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>aaabs);
    END GENERATE;
  END GENERATE;
      
  --*** NORMALIZE HERE - 1-3 pipes (countnorm output after 1 pipe)
  normcore: hcc_normus64
  GENERIC MAP (pipes=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>aaabs,
            countout=>countnorm,fracout=>normalaa);

  gta: IF (target = 0) GENERATE
   
    pnc: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN 
        FOR k IN 1 TO 54 LOOP
          normalaaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          normalaaff <= normalaa(64 DOWNTO 10);
        END IF;
      END IF;
    END PROCESS; 
               
     --*** ROUND NORMALIZED VALUE (IF REQUIRED)***
     --*** note: normal output is 64 bits
    
     gne: IF (roundnormalize = 0) GENERATE
       mantissa <= normalaaff(55 DOWNTO 2);
       overflowcondition <= '0'; -- 20/05/09 used in exponent calculation
     END GENERATE;
    
     gnf: IF (roundnormalize = 1) GENERATE

       overflowbitnode(1) <= normalaaff(1);
       gova: FOR k IN 2 TO 55 GENERATE
         overflowbitnode(k) <= overflowbitnode(k-1) AND normalaaff(k);
       END GENERATE;
         
       gng: IF (doublespeed = 0) GENERATE  
  
         overflowcondition <= overflowbitnode(55);
  
         aamannode <= normalaaff(55 DOWNTO 2) + (zerovec(53 DOWNTO 1) & normalaaff(1));

         pnd: PROCESS (sysclk, reset)
         BEGIN
           IF (reset = '1') THEN
             FOR k IN 1 TO 54 LOOP
               aamanff(k) <= '0';
             END LOOP;
           ELSIF (rising_edge(sysclk)) THEN
             IF (enable = '1') THEN              
               aamanff <= aamannode; 
             END IF;
           END IF;
         END PROCESS;
      
         mantissa <= aamanff;

       END GENERATE;
  
       gnh: IF (doublespeed = 1) GENERATE

         pne: PROCESS (sysclk, reset)
         BEGIN
           IF (reset = '1') THEN
             overflowconditionff <= '0';
           ELSIF (rising_edge(sysclk)) THEN
             IF (enable = '1') THEN              
               overflowconditionff <= overflowbitnode(55);
             END IF;
           END IF;
         END PROCESS;
         
         overflowcondition <= overflowconditionff;
         
         gra: IF (synthesize = 0) GENERATE
           rndone: hcc_addpipeb
           GENERIC MAP (width=>54,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),carryin=>normalaaff(1),
                     cc=>mantissa);
         END GENERATE;
         grb: IF (synthesize = 1) GENERATE
           rndtwo: hcc_addpipes
           GENERIC MAP (width=>54,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),carryin=>normalaaff(1),
                     cc=>mantissa);
         END GENERATE;

       END GENERATE;
   
     END GENERATE;

    sign <= mulsignff(latency-1); 
    cc <= sign & (mantissa(54) OR mantissa(53)) & mantissa(52 DOWNTO 1) & exponent;
    ccsat <= aasatff(latency);
    cczip <= aazipff(latency);
    ccnan <= aananff(latency);
     
  END GENERATE;

  gtb: IF (target = 1) GENERATE
  
    -- overflow cannot happen here, dont insert
    overflowcondition <= '0'; -- 20/05/09 used for exponent
    
    pnf: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN 
        FOR k IN 1 TO 64 LOOP
          normalaaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          FOR k IN 1 TO 59 LOOP
            normalaaff(k) <= normalaa(k+4) XOR mulsignff(invertpoint);
          END LOOP;
          normalaaff(60) <= mulsignff(invertpoint);
          normalaaff(61) <= mulsignff(invertpoint);
          normalaaff(62) <= mulsignff(invertpoint);
          normalaaff(63) <= mulsignff(invertpoint);
          normalaaff(64) <= mulsignff(invertpoint);
        END IF;
      END IF;
    END PROCESS; 
    
    gni: IF (roundnormalize = 0) GENERATE
      mantissa <= normalaaff; -- 1's complement
    END GENERATE;
 
     gnj: IF (roundnormalize = 1) GENERATE

       gnk: IF (doublespeed = 0) GENERATE  
              
         aamannode <= normalaaff + (zerovec(63 DOWNTO 1) & mulsignff(invertpoint+1));

         png: PROCESS (sysclk, reset)
         BEGIN
           IF (reset = '1') THEN
             FOR k IN 1 TO 64 LOOP
               aamanff(k) <= '0';
             END LOOP;
           ELSIF (rising_edge(sysclk)) THEN
             IF (enable = '1') THEN              
               aamanff <= aamannode;
             END IF;
           END IF;
         END PROCESS;
      
         mantissa <= aamanff;

       END GENERATE;
  
       gnl: IF (doublespeed = 1) GENERATE
         
         grc: IF (synthesize = 0) GENERATE
           rndone: hcc_addpipeb
           GENERIC MAP (width=>64,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(invertpoint+1),
                     cc=>mantissa);
         END GENERATE;
         grd: IF (synthesize = 1) GENERATE
           rndtwo: hcc_addpipes
           GENERIC MAP (width=>64,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(invertpoint+1),
                     cc=>mantissa);
         END GENERATE;
       END GENERATE;
   
     END GENERATE;

    cc <= mantissa(64 DOWNTO 1) & exponent;
    ccsat <= aasatff(latency);
    cczip <= aazipff(latency);
    ccnan <= aananff(latency);
        
  END GENERATE;
     
end rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize 32 or 36 bit signed   ***
--***             mantissa                        ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_normsgn3236 IS 
GENERIC (
         mantissa : positive := 32;
         normspeed : positive := 1 -- 1 or 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

	   countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1); -- 1 clock earlier than fracout
	   fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	  );
END hcc_normsgn3236;

ARCHITECTURE rtl OF hcc_normsgn3236 IS
  
  signal count, countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  component hcc_cntsgn32 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
  
  component hcc_cntsgn36 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
 
  component hcc_lsftpipe32 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb32 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;
    
  component hcc_lsftpipe36 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb36 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;
    
BEGIN
          
  pfrc: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
        
      countff <= "000000";
      FOR k IN 1 TO mantissa LOOP
        fracff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        countff <= count;
        fracff <= fracin;
      END IF;
      
    END IF;
  END PROCESS;
        
  gna: IF (mantissa = 32) GENERATE
  
    countone: hcc_cntsgn32
    PORT MAP (frac=>fracin,count=>count);
      
    gnb: IF (normspeed = 1) GENERATE
      shiftone: hcc_lsftcomb32
      PORT MAP (inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;

    gnc: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftone: hcc_lsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
         
  END GENERATE;
  
  gnd: IF (mantissa = 36) GENERATE
  
    counttwo: hcc_cntsgn36
    PORT MAP (frac=>fracin,count=>count);
      
    gne: IF (normspeed = 1) GENERATE
      shiftthr: hcc_lsftcomb36
      PORT MAP (inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;

    --pcc: PROCESS (sysclk,reset)
    --BEGIN
    --  IF (reset = '1') THEN  
    --    countff <= "000000";
    --  ELSIF (rising_edge(sysclk)) THEN      
    --    IF (enable = '1') THEN
    --      countff <= count;
    --    END IF;
    --  END IF;
    --END PROCESS;
  
    gnf: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftfor: hcc_lsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
                      
  END GENERATE;
    
  countout <= countff; -- same time as fracout for normspeed = 1, 1 clock earlier otherwise
   
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize 64 bit unsigned       ***
--***             mantissa                        ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_normus64 IS 
GENERIC (pipes : positive := 1); -- currently 1,2,3
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fracin : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	  fracout : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_normus64;

ARCHITECTURE rtl OF hcc_normus64 IS
  
  type delfracfftype IS ARRAY(2 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal count, countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal delfracff : delfracfftype;

  component hcc_cntuspipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;

  component hcc_cntuscomb64
  PORT (
        frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
 		
  component hcc_lsftpipe64 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   ); 
  end component;

  component hcc_lsftcomb64 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   ); 
  end component;
  
BEGIN
          
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      countff <= "000000";
      FOR k IN 1 TO 64 LOOP
        fracff(k) <= '0';
        delfracff(1)(k) <= '0';
        delfracff(2)(k) <= '0';
      END LOOP;
  
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        countff <= count;
        fracff <= fracin;
        delfracff(1)(64 DOWNTO 1) <= fracin;
        delfracff(2)(64 DOWNTO 1) <= delfracff(1)(64 DOWNTO 1);
               
      END IF;
            
    END IF;
  
  END PROCESS;
    
  gpa: IF (pipes = 1) GENERATE
    ccone: hcc_cntuscomb64
    PORT MAP (frac=>fracin,
              count=>count);

    countout <= countff; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftcomb64
    PORT MAP (inbus=>fracff,shift=>countff,
              outbus=>fracout);

  END GENERATE;

  gpb: IF (pipes = 2) GENERATE
    cctwo: hcc_cntuscomb64
    PORT MAP (frac=>fracin,
              count=>count);

    countout <= countff; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>fracff,shift=>countff,
              outbus=>fracout);

  END GENERATE;

  gpc: IF (pipes = 3) GENERATE
    cctwo: hcc_cntuspipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              frac=>fracin,
              count=>count);

    countout <= count; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>delfracff(2)(64 DOWNTO 1),shift=>countff,
              outbus=>fracout);

  END GENERATE;
              
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize 32 or 36 bit unsigned ***
--***             mantissa                        ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_normusgn3236 IS 
GENERIC (
         mantissa : positive := 32;
         normspeed : positive := 1 -- 1 or 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

	   countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1); -- 1 clock earlier than fracout
	   fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	  );
END hcc_normusgn3236;

ARCHITECTURE rtl OF hcc_normusgn3236 IS
  
  signal count, countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  component hcc_cntusgn32 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
  
  component hcc_cntusgn36 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
 
  component hcc_lsftpipe32 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb32 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;
    
  component hcc_lsftpipe36 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb36 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;
    
BEGIN
          
  pfrc: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
        
      countff <= "000000";
      FOR k IN 1 TO mantissa LOOP
        fracff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        countff <= count;
        fracff <= fracin;
      END IF;
      
    END IF;
  END PROCESS;
        
  gna: IF (mantissa = 32) GENERATE
  
    countone: hcc_cntusgn32
    PORT MAP (frac=>fracin,count=>count);
      
    gnb: IF (normspeed = 1) GENERATE
      shiftone: hcc_lsftcomb32
      PORT MAP (inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;

    gnc: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftone: hcc_lsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
         
  END GENERATE;
  
  gnd: IF (mantissa = 36) GENERATE
  
    counttwo: hcc_cntusgn36
    PORT MAP (frac=>fracin,count=>count);
      
    gne: IF (normspeed = 1) GENERATE
      shiftthr: hcc_lsftcomb36
      PORT MAP (inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
  
    gnf: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftfor: hcc_lsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
                      
  END GENERATE;
    
  countout <= countff; -- same time as fracout for normspeed = 1, 1 clock earlier otherwise
   
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTCOMB32.VHD                        ***
--***                                             ***
--***   Function: Combinatorial arithmetic right  ***
--***             shift for a 32 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftcomb32 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_rsftcomb32;

ARCHITECTURE rtl OF hcc_rsftcomb32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 29 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(30) <=  (levzip(30) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(31) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(32) AND     shift(2));
  levone(31) <=  (levzip(31) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(32) AND   ((shift(2)) OR     shift(1)));
  levone(32) <= levzip(32);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 20 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 21 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(32)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(32)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 29 TO 31 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(32)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(32) <= levone(32);

  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5))) OR
                 (levtwo(k+16) AND     shift(5));
  END GENERATE;
  gcb: FOR k IN 17 TO 31 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5))) OR
                 (levtwo(32)   AND     shift(5));
  END GENERATE;
  levthr(32) <= levtwo(32);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTCOMB36.VHD                        ***
--***                                             ***
--***   Function: Combinatorial arithmetic right  ***
--***             shift for a 36 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftcomb36 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_rsftcomb36;

ARCHITECTURE rtl OF hcc_rsftcomb36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 33 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(34) <=  (levzip(34) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(35) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(36) AND     shift(2));
  levone(35) <=  (levzip(35) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(36) AND   ((shift(2)) OR     shift(1)));
  levone(36) <= levzip(36);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(36)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 29 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(36)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 33 TO 35 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(36)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(36) <= levone(36);
  
  gca: FOR k IN 1 TO 4 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6));
  END GENERATE;
  gcb: FOR k IN 5 TO 20 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(36)   AND     shift(6));
  END GENERATE;
  gcc: FOR k IN 21 TO 35 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(36)   AND    (shift(6)  OR      shift(5)));
  END GENERATE;
  levthr(36) <= levtwo(36);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTCOMB64.VHD                        ***
--***                                             ***
--***   Function: Combinatorial arithmetic right  ***
--***             shift for a 64 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftcomb64 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_rsftcomb64;

ARCHITECTURE rtl OF hcc_rsftcomb64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 61 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(62) <=  (levzip(62) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(63) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(64) AND     shift(2));
  levone(63) <=  (levzip(63) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(64) AND   ((shift(2)) OR     shift(1)));
  levone(64) <= levzip(64);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 52 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 53 TO 56 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(64)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 57 TO 60 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(64)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 61 TO 63 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(64)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(64) <= levone(64);
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(k+48) AND     shift(6)  AND     shift(5));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(64) AND       shift(6)  AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(64)   AND     shift(6) );
  END GENERATE;
  gcd: FOR k IN 49 TO 63 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(64)   AND    (shift(6)  OR      shift(5)));
  END GENERATE;
  levthr(64) <= levtwo(64);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE32.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
--***             shift for a 32 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftpipe32 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_rsftpipe32;

ARCHITECTURE rtl OF hcc_rsftpipe32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftff : STD_LOGIC;
  signal levtwoff : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 29 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(30) <=  (levzip(30) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(31) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(32) AND     shift(2));
  levone(31) <=  (levzip(31) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(32) AND   ((shift(2)) OR     shift(1)));
  levone(32) <= levzip(32);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 20 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 21 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(32)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(32)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 29 TO 31 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(32)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(32) <= levone(32);
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= '0';
      FOR k IN 1 TO 32 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff)) OR
                 (levtwoff(k+16) AND     shiftff);
  END GENERATE;
  gcb: FOR k IN 17 TO 31 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff)) OR
                 (levtwoff(32)   AND     shiftff);
  END GENERATE;
  levthr(32) <= levtwoff(32);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

 --***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE36.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
--***             shift for a 36 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftpipe36 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_rsftpipe36;

ARCHITECTURE rtl OF hcc_rsftpipe36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal levtwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 33 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(34) <=  (levzip(34) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(35) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(36) AND     shift(2));
  levone(35) <=  (levzip(35) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(36) AND   ((shift(2)) OR     shift(1)));
  levone(36) <= levzip(36);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(36)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 29 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(36)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 33 TO 35 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(36)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(36) <= levone(36);
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 36 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 4 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2));
  END GENERATE;
  gcb: FOR k IN 5 TO 20 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(36)   AND     shiftff(2));
  END GENERATE;
  gcc: FOR k IN 21 TO 35 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(36)   AND    (shiftff(2)  OR      shiftff(1)));
  END GENERATE;
  levthr(36) <= levtwoff(36);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE64.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
--***             shift for a 64 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftpipe64 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_rsftpipe64;

ARCHITECTURE rtl OF hcc_rsftpipe64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal levtwoff : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 61 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(62) <=  (levzip(62) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(63) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(64) AND     shift(2));
  levone(63) <=  (levzip(63) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(64) AND   ((shift(2)) OR     shift(1)));
  levone(64) <= levzip(64);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 52 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 53 TO 56 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(64)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 57 TO 60 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(64)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 61 TO 63 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(64)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(64) <= levone(64);
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 64 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2)  AND NOT(shiftff(1))) OR
                 (levtwoff(k+48) AND     shiftff(2)  AND     shiftff(1));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2)  AND NOT(shiftff(1))) OR
                 (levtwoff(64) AND     shiftff(2)  AND     shiftff(1));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(64)   AND     shiftff(2) );
  END GENERATE;
  gcd: FOR k IN 49 TO 63 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(64)   AND    (shiftff(2)  OR      shiftff(1)));
  END GENERATE;
  levthr(64) <= levtwoff(64);
  
  outbus <= levthr;
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_SCMUL3236.VHD                        ***
--***                                             ***
--***   Function: Scale (normalized for overflow  ***
--***             only) a 32 or 36 bit mantissa   ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_scmul3236 IS 
GENERIC (mantissa : positive := 32);
PORT (
      frac : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

		scaled : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1);
		count : OUT STD_LOGIC_VECTOR (3 DOWNTO 1)
	   );
END hcc_scmul3236;

ARCHITECTURE rtl OF hcc_scmul3236 IS

  signal scale : STD_LOGIC_VECTOR (5 DOWNTO 1);
    
BEGIN
  
  -- for single 32 bit mantissa input
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- '1' may end up in overflow, i.e. [S1M..] or [SS1M..] or [SSS1M..].....
  
  -- output
  -- [S ][1 ][M...M]
  -- [32][31][30..1], count is shift 
  
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 

  
  -- shift 0 if "01XX" or "10XX"
  scale(5) <= (NOT(frac(mantissa)) AND frac(mantissa-1)) OR (frac(mantissa) AND NOT(frac(mantissa-1)));
  -- shift 1 if "001XX" or "110XX"
  scale(4) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND frac(mantissa-2)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND NOT(frac(mantissa-2)));
  -- shift 2 if "0001XX" or "1110XX"
  scale(3) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND frac(mantissa-3)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND NOT(frac(mantissa-3)));
  -- shift 3 if "00001XX" or "11110XX"
  scale(2) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND 
               NOT(frac(mantissa-3)) AND frac(mantissa-4)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND 
               frac(mantissa-3) AND NOT(frac(mantissa-4)));
  -- shift 4 if "00000XX" or "11111XX"
  scale(1) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND 
               NOT(frac(mantissa-3)) AND NOT(frac(mantissa-4))) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND 
               frac(mantissa-3) AND frac(mantissa-4));

  scaled(mantissa) <= frac(mantissa);
  gsa: FOR k IN 1 TO mantissa-5 GENERATE
    scaled(mantissa-k) <= (frac(mantissa-k-4) AND scale(1)) OR 
                       (frac(mantissa-k-3) AND scale(2)) OR 
                       (frac(mantissa-k-2) AND scale(3)) OR 
                       (frac(mantissa-k-1) AND scale(4)) OR
                       (frac(mantissa-k) AND scale(5));
  END GENERATE;
  scaled(4) <= (frac(1) AND scale(2)) OR 
               (frac(2) AND scale(3)) OR 
               (frac(3) AND scale(4)) OR
               (frac(4) AND scale(5));
  scaled(3) <= (frac(1) AND scale(3)) OR 
               (frac(2) AND scale(4)) OR
               (frac(3) AND scale(5));
  scaled(2) <= (frac(1) AND scale(4)) OR
               (frac(2) AND scale(5));
  scaled(1) <= (frac(1) AND scale(5));
  
  -- shifts everything to SSSSS1XXXXX
  -- if '1' is in a position greater than 27,add to exponent
  
  count(3) <= scale(5);
  count(2) <= scale(4) OR scale(3);
  count(1) <= scale(4) OR scale(2);
  
END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_SGNPSTN.VHD                           ***
--***                                             ***
--***   Function: Leading 0/1s for a small signed ***
--***             number                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_sgnpstn IS 
GENERIC (offset : integer := 0;
         width : positive := 5);
PORT (
      signbit : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (4 DOWNTO 1);

		position : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		);
END hcc_sgnpstn;

ARCHITECTURE rtl OF hcc_sgnpstn IS

  signal pluspos, minuspos : STD_LOGIC_VECTOR (width DOWNTO 1);

BEGIN
   
  paa: PROCESS (inbus)
  BEGIN
    
    CASE inbus IS
      WHEN "0000" => pluspos <= conv_std_logic_vector (0,width);
      WHEN "0001" => pluspos <= conv_std_logic_vector (offset+3,width);
      WHEN "0010" => pluspos <= conv_std_logic_vector (offset+2,width);
      WHEN "0011" => pluspos <= conv_std_logic_vector (offset+2,width);
      WHEN "0100" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0101" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0110" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0111" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1000" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1001" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1010" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1011" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1100" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1101" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1110" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1111" => pluspos <= conv_std_logic_vector (offset,width); 
      WHEN others => pluspos <= conv_std_logic_vector (0,width); 
    END CASE;
 
    CASE inbus IS
      WHEN "0000" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0001" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0010" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0011" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0100" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0101" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0110" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0111" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "1000" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1001" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1010" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1011" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1100" => minuspos <= conv_std_logic_vector (offset+2,width);
      WHEN "1101" => minuspos <= conv_std_logic_vector (offset+2,width);
      WHEN "1110" => minuspos <= conv_std_logic_vector (offset+3,width);
      WHEN "1111" => minuspos <= conv_std_logic_vector (0,width); 
      WHEN others => minuspos <= conv_std_logic_vector (0,width); 
    END CASE;
            
  END PROCESS;
  
  gaa: FOR k IN 1 TO width GENERATE
    position(k) <= (pluspos(k) AND NOT(signbit)) OR (minuspos(k) AND signbit);
  END GENERATE;
  
END rtl;


LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_USGNPOS.VHD                           ***
--***                                             ***
--***   Function: Leading 0/1s for a small        ***
--***             unsigned number                 ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_usgnpos IS
GENERIC (start : integer := 10);
PORT (
      ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
      position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
     );
END hcc_usgnpos;

ARCHITECTURE rtl of hcc_usgnpos IS
  
BEGIN

ptab: PROCESS (ingroup)
BEGIN

  CASE ingroup IS
      
      WHEN "000000" => position <= conv_std_logic_vector(0,6);
          
      WHEN "000001" => position <= conv_std_logic_vector(start+5,6);
          
      WHEN "000010" => position <= conv_std_logic_vector(start+4,6);
      WHEN "000011" => position <= conv_std_logic_vector(start+4,6); 
          
      WHEN "000100" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000101" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000110" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000111" => position <= conv_std_logic_vector(start+3,6);
       
      WHEN "001000" => position <= conv_std_logic_vector(start+2,6); 
      WHEN "001001" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001010" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001011" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001100" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001101" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001110" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001111" => position <= conv_std_logic_vector(start+2,6); 
              
      WHEN "010000" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010001" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010010" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010011" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010100" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010101" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010110" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010111" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011000" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011001" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011010" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011011" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011100" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011101" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011110" => position <= conv_std_logic_vector(start+1,6); 
      WHEN "011111" => position <= conv_std_logic_vector(start+1,6);  
 
      WHEN "100000" => position <= conv_std_logic_vector(start,6);
      WHEN "100001" => position <= conv_std_logic_vector(start,6);
      WHEN "100010" => position <= conv_std_logic_vector(start,6);
      WHEN "100011" => position <= conv_std_logic_vector(start,6);
      WHEN "100100" => position <= conv_std_logic_vector(start,6);
      WHEN "100101" => position <= conv_std_logic_vector(start,6);
      WHEN "100110" => position <= conv_std_logic_vector(start,6);
      WHEN "100111" => position <= conv_std_logic_vector(start,6);
      WHEN "101000" => position <= conv_std_logic_vector(start,6);
      WHEN "101001" => position <= conv_std_logic_vector(start,6);
      WHEN "101010" => position <= conv_std_logic_vector(start,6);
      WHEN "101011" => position <= conv_std_logic_vector(start,6);
      WHEN "101100" => position <= conv_std_logic_vector(start,6);
      WHEN "101101" => position <= conv_std_logic_vector(start,6);
      WHEN "101110" => position <= conv_std_logic_vector(start,6); 
      WHEN "101111" => position <= conv_std_logic_vector(start,6);      
      WHEN "110000" => position <= conv_std_logic_vector(start,6);
      WHEN "110001" => position <= conv_std_logic_vector(start,6);
      WHEN "110010" => position <= conv_std_logic_vector(start,6);
      WHEN "110011" => position <= conv_std_logic_vector(start,6);
      WHEN "110100" => position <= conv_std_logic_vector(start,6);
      WHEN "110101" => position <= conv_std_logic_vector(start,6);
      WHEN "110110" => position <= conv_std_logic_vector(start,6);
      WHEN "110111" => position <= conv_std_logic_vector(start,6);
      WHEN "111000" => position <= conv_std_logic_vector(start,6);
      WHEN "111001" => position <= conv_std_logic_vector(start,6);
      WHEN "111010" => position <= conv_std_logic_vector(start,6);
      WHEN "111011" => position <= conv_std_logic_vector(start,6);
      WHEN "111100" => position <= conv_std_logic_vector(start,6);
      WHEN "111101" => position <= conv_std_logic_vector(start,6);
      WHEN "111110" => position <= conv_std_logic_vector(start,6); 
      WHEN "111111" => position <= conv_std_logic_vector(start,6);
          
      WHEN others => position <= conv_std_logic_vector(0,6);
          
  END CASE;
               
END PROCESS;    
    
END rtl;

