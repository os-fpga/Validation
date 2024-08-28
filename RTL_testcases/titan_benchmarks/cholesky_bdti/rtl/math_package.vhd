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
--***   HCC_LIBRARY_PACKAGE.VHD                   ***
--***                                             ***
--***   Function: Component Declarations of       ***
--***   compiler instantiated library functions   ***
--***                                             ***
--***   06/02/08 ML                               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

PACKAGE math_package IS

  --***********************************
  --*** SINGLE PRECISION COMPONENTS ***
  --***********************************
    
  component fp_inv  
  GENERIC (synthesize : integer := 1);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC;
        dividebyzeroout : OUT STD_LOGIC
      );
  end component;  
  
  component fp_invsqr  
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin: IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC
       );
  end component;
  
  component fp_sqr  
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC
      );
  end component;

  component fp_exp  
  GENERIC (synthesize : integer := 1);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        underflowout : OUT STD_LOGIC
      );
  end component;

  component fp_log 
  GENERIC (synthesize : integer := 1);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
      );
  end component; 

  component fp_ldexp  
  PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
      bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
      signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;

  component fp_fabs 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;

  component fp_neg  
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;
   
  component fp_sin 
  GENERIC (
          device : integer := 0;
          width : positive := 30;
          depth : positive := 18;
          indexpoint : positive := 2
        );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 

  component fp_cos 
  GENERIC (
          device : integer := 0;
          width : positive := 30;
          depth : positive := 18;
          indexpoint : positive := 2
        );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 

  component fp_tan 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 

  component fp_asin 
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 

  component fp_acos 
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 

  component fp_atan 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
      );
  end component; 






  --***********************************
  --*** DOUBLE PRECISION COMPONENTS ***
  --***********************************
    
  component dp_inv 
  GENERIC (
           roundconvert : integer := 0; -- 0 = no round, 1 = round
           doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           doublespeed : integer := 0;   -- 0/1
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1   -- 0/1    
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC;
        dividebyzeroout : OUT STD_LOGIC
      );
  end component;
 
  component dp_invsqr 
  GENERIC (
           doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
           doublespeed : integer := 0;  -- 0/1
           device : integer := 0;  -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1  -- 0/1    
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin: IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC
      );
  end component;
  
  component dp_sqr 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC
      );
  end component;

  component dp_exp 
  GENERIC (
           roundconvert : integer := 0; -- 0 = no round, 1 = round
           doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
           doublespeed : integer := 0;   -- 0/1
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1      -- 0/1    
          );          
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        underflowout : OUT STD_LOGIC
      );
  end component;

  component dp_log 
  GENERIC (
           roundconvert : integer := 0; -- 0 = no round, 1 = round
           doublespeed : integer := 0; -- 0/1
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1      -- 0/1    
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
      );
  end component;
  
  component dp_ldexp 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);
        bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;

  component dp_fabs  
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;
    
  component dp_neg 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        satout, zeroout, nanout : OUT STD_LOGIC
      );
  end component;    
  
  component dp_fixfloat IS
  GENERIC (
   unsigned : integer := 0; -- unsigned = 0, signed = 1
   decimal : integer := 18;
   fractional : integer := 14;
   precision : integer := 0; -- single = 0, double = 1
   speed : integer := 0 -- low speed = 0, high speed = 1 
  );
  PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fixed_number : IN STD_LOGIC_VECTOR (decimal+fractional DOWNTO 1);
      sign : OUT STD_LOGIC;
      exponent : OUT STD_LOGIC_VECTOR (8+3*precision DOWNTO 1);
      mantissa : OUT STD_LOGIC_VECTOR (23+29*precision DOWNTO 1)    
     );
  END component;
  
  component dp_floatfix IS
  GENERIC (
         unsigned : integer := 1;  -- unsigned = 0, signed = 1
         decimal : integer := 14;
         fractional : integer := 6;
         precision : integer := 0; -- single = 0, double = 1
         speed : integer := 0 -- low speed = 0, high speed = 1
        );
  PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      sign : IN STD_LOGIC;
      exponent : IN STD_LOGIC_VECTOR (8+3*precision DOWNTO 1);
      mantissa : IN STD_LOGIC_VECTOR (23+29*precision DOWNTO 1);
      
      fixed_number : OUT STD_LOGIC_VECTOR (decimal+fractional DOWNTO 1)
     );
  END component;

END math_package;

