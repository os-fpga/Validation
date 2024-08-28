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

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_PACKAGE.VHD                           ***
--***                                             ***
--***   Function: Component Declarations of       ***
--***             compiler instantiated functions ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   16/04/09 - add components w' NAN support  ***
--***                                             ***
--***                                             ***
--***************************************************

PACKAGE hcc_package IS

  --***********************************
  --*** SINGLE PRECISION COMPONENTS ***
  --***********************************
  
  component hcc_alufp1x
  --GENERIC (
  --         mantissa : positive := 36;
  --         shiftspeed : integer := 1
  --        );
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
  end component;

  component hcc_alufp1_dot IS 
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
  end component;
  
  component hcc_mulfp1x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/8/u23)
           xoutput : integer := 1; -- 1 = single x format (s32/36/10)
           multoutput : integer := 0; -- 1 = to another single muliplier (s/1/34/10) - signed
           divoutput : integer := 0; -- 1 = to a single divider (s/1/34/10) - signed magnitude
           mantissa : positive := 32; -- 32 or 36
           outputscale : integer := 1; -- 0 = none, 1 = scale 
           device : integer := 0; -- 0 to 3 supported
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
  end component;

  component hcc_mulfp1vec 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           device : integer := 0; -- 0 to 2 supported
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
  end component;

  component hcc_mulfp1_dot 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           device : integer := 0; -- 0 to 2 supported
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
  end component;

  component hcc_divfp1x 
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 1; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 0; -- 1 = single x format (s32/13)
           multoutput : integer := 0; -- 1 = to another single muliplier (s/1/34/10) - signed
           divoutput : integer := 0; -- 1 = to a single divider (s/1/34/10) - signed magnitude
           roundconvert : integer := 0;
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
      
        cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+multoutput+divoutput) DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
      );
  end component;
  
  component hcc_normfp1x 
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
  end component; 

  component hcc_ldexp1x 
  GENERIC (
           mantissa : positive := 32 -- 32/36
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
        cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
      );
  end component;
  
  --***********************************
  --*** DOUBLE PRECISION COMPONENTS ***
  --***********************************
  
  component hcc_alufp2x 
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
  end component;  
  
  component hcc_mulfp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           multoutput : integer := 0; -- 1 = to another double muliplier (s/1u52/13)
           roundconvert : integer := 0; -- global switch - round all ieee<=>x conversion when '1'
           roundnormalize : integer := 0; -- global switch - round all normalizations when '1'
           doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
           doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 to 2 supported
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
  end component;
  
  component hcc_divfp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           divoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
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
      
        cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*divoutput DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
      );
  end component;  
  
  component hcc_normfp2x  
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
  end component;
  
  component hcc_ldexp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1 -- function output (S'1'u54/13)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
        cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
      );
  end component;
  
  --***********************
  --*** CAST COMPONENTS ***
  --***********************
   
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

  component hcc_castxtof IS 
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
  
  component hcc_castftoy 
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
  end component; 
  
  
  component hcc_castdtoy 
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           outputpipe : integer := 1; -- if zero, dont put final pipe for some modes
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
  
  component hcc_castdtox  
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
  end component;
  
  component hcc_castxtod 
  GENERIC (
           mantissa : positive := 32;
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           doublespeed : integer := 0 -- '0' for unpiped adder, '1' for piped adder
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC;

        cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
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
  
  component hcc_castytod 
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
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
  
  component hcc_castytof 
  GENERIC (
           roundconvert : integer := 1 -- global switch - round all conversions when '1'
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip, aanan : IN STD_LOGIC;

        cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
     );
  end component;
  
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
   
  component hcc_castdtol
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
  end component;

  component hcc_castftol
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
        aazip, aasat, aanan : IN STD_LOGIC;

        cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
      );
  end component;   
    
  component hcc_castytol  
  GENERIC (normspeed : positive := 2); -- 1,2 pipes for conversion
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aazip, aasat, aanan : IN STD_LOGIC;

        cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
      ); 
  end component;  
  
  component hcc_castltod
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
  end component;  
    
  component hcc_castltof 
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
  end component;    
      
  component hcc_castltox  
  GENERIC (
           mantissa : integer := 36;
           unsigned : integer := 0 -- 0 = signed, 1 = unsigned
          ); 
  PORT (
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

        cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
     );
  end component;    
    
  component hcc_castltoy 
  GENERIC (
           unsigned : integer := 0 -- 0 = signed, 1 = unsigned
          ); 
  PORT (
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
  
        cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
        ccsat, cczip, ccnan : OUT STD_LOGIC
      );  
  end component;    

  component hcc_castdtof 
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
	 end component;

	component hcc_castftod           
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		    cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
 
  --************************
  --*** OTHER COMPONENTS ***
  --************************
  
  component hcc_delay 
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
  end component;

END hcc_package;

