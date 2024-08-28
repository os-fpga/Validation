library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

 entity BUF is
 port (
   o : out std_logic;
   i : in std_logic
 );
end BUF ;
architecture altera of BUF is
begin
   process (i)
   begin
   o <= i;
   end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity BUFCF is
 port (
   O : out std_logic;
   I : in std_logic
 );
end BUFCF;
architecture altera of BUFCF is
begin
    process (I)
    begin
    O <= I;
    end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFE IS
    port(
        I: IN std_logic;
        E : IN std_logic;
        O: OUT std_logic
    );
END BUFE ;
ARCHITECTURE altera OF BUFE IS
BEGIN
    PROCESS (I, E)
    BEGIN
        IF E = '0' THEN
          O <= 'Z';
        ELSE
	  O <= I;
        END IF;
     END PROCESS;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity BUFG is
 port (
   O : out std_logic;
   I : in std_logic
 );
end BUFG;
architecture altera of BUFG is

begin
   process (i)
   begin
   o <= i;
   end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;


entity BUFGP is
 port (
   O : out std_logic;
   I : in std_logic
 );
end BUFGP ;
architecture altera of BUFGP is

begin
   process (i)
   begin
   o <= i;
   end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFT IS
    port(
        I: IN std_logic;
        T : IN std_logic;
        O: OUT std_logic
    );
END BUFT ;
ARCHITECTURE altera OF BUFT IS
BEGIN
    PROCESS (I, T)
    BEGIN
        IF T = '1' THEN
          O <= 'Z';
        ELSE
	  O <= I;
        END IF;
     END PROCESS;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FD IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        Q: OUT std_logic
    );
END FD ;
ARCHITECTURE altera OF FD IS
BEGIN
    PROCESS (C)
    BEGIN
	if (C'event and C = '1') then
        Q <= D;
	end if;
     END PROCESS;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDC IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        Q: OUT std_logic
    );
END FDC ;
ARCHITECTURE altera OF FDC IS
BEGIN
    PROCESS (C, CLR )
    BEGIN
	IF(CLR = '1') THEN
		Q <= '0';
	ELSIF(C'event and C = '1') THEN
		Q <= D;
	END IF;
     END PROCESS;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDCE ;
ARCHITECTURE altera OF FDCE IS
BEGIN
process (C, CLR) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (C' event and C = '1') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if;
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDCE_1 ;
ARCHITECTURE altera OF FDCE_1 IS
BEGIN
process (C, CLR) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (C' event and C = '0') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCP IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        PRE : IN std_logic;
        Q: OUT std_logic
    );
END FDCP ;
ARCHITECTURE altera OF FDCP IS
BEGIN
process (C, CLR, PRE) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '1') then 
Q <= D; 
end if; 
end process;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCPE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        PRE : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDCPE ;
ARCHITECTURE altera OF FDCPE IS
BEGIN
process (C, CLR, PRE) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '1') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCPE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        PRE : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDCPE_1 ;
ARCHITECTURE altera OF FDCPE_1 IS
BEGIN
process (C, CLR, PRE) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '0') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDCP_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        PRE : IN std_logic;
        Q: OUT std_logic
    );
END FDCP_1 ;
ARCHITECTURE altera OF FDCP_1 IS
BEGIN
process (C, CLR, PRE) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '0') then 
Q <= D; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDC_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CLR : IN std_logic;
        Q: OUT std_logic
    );
END FDC_1 ;
ARCHITECTURE altera OF FDC_1 IS
BEGIN
process (C, CLR) begin 
if (CLR = '1') then 
Q <= '0'; 
elsif (C' event and C = '0') then 
Q <= D; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDE ;
ARCHITECTURE altera OF FDE IS
BEGIN
process (C) 
begin 
if (C' event and C='1') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDE_1 ;
ARCHITECTURE altera OF FDE_1 IS
BEGIN
process (C) 
begin 
if (C' event and C='0') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDP IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        PRE : IN std_logic;
        Q: OUT std_logic
    );
END FDP ;
ARCHITECTURE altera OF FDP IS
BEGIN
process (C,PRE) begin 
if (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '1') then 
Q <= D; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDPE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        PRE : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDPE ;
ARCHITECTURE altera OF FDPE IS
BEGIN
process (C,PRE) begin 
if (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '1') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDPE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        PRE : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDPE_1 ;
ARCHITECTURE altera OF FDPE_1 IS
BEGIN
process (C,PRE) begin 
if (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '0') then 
if (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDP_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        PRE : IN std_logic;
        Q: OUT std_logic
    );
END FDP_1 ;
ARCHITECTURE altera OF FDP_1 IS
BEGIN
process (C,PRE) begin 
if (PRE = '1') then 
Q <= '1'; 
elsif (C' event and C = '1') then 
Q <= D; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDR IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        Q: OUT std_logic
    );
END FDR ;
ARCHITECTURE altera OF FDR IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (R = '1') then 
Q <= '0'; 
else 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDRE ;
ARCHITECTURE altera OF FDRE IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (R = '1') then 
Q <= '0'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDRE_1 ;
ARCHITECTURE altera OF FDRE_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (R = '1') then 
Q <= '0'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRS IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        S : IN std_logic;
        Q: OUT std_logic
    );
END FDRS ;
ARCHITECTURE altera OF FDRS IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (R = '1') then 
    Q <= '0'; 
elsif (S = '1') then 
Q <= '1'; 
else 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRSE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        S : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDRSE ;
ARCHITECTURE altera OF FDRSE IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (R = '1') then 
Q <= '0'; 
elsif (S = '1') then 
Q <= '1'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRSE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        S : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDRSE_1 ;
ARCHITECTURE altera OF FDRSE_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (R = '1') then 
Q <= '0'; 
elsif (S = '1') then 
Q <= '1'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDRS_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        S : IN std_logic;
        Q: OUT std_logic
    );
END FDRS_1 ;
ARCHITECTURE altera OF FDRS_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (R = '1') then 
Q <= '0'; 
elsif (S = '1') then 
Q <= '1'; 
else 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDR_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        R : IN std_logic;
        Q: OUT std_logic
    );
END FDR_1 ;
ARCHITECTURE altera OF FDR_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (R = '1') then 
Q <= '0'; 
else 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDS IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        S : IN std_logic;
        Q: OUT std_logic
    );
END FDS ;
ARCHITECTURE altera OF FDS IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (S = '1') then 
Q <= '1'; 
else 
Q <= D; 
end if; 
end if; 
end process;
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDSE IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        S : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDSE ;
ARCHITECTURE altera OF FDSE IS
BEGIN
process (C) begin 
if (C' event and C = '1') then 
if (S = '1') then 
Q <= '1'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDSE_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        S : IN std_logic;
        CE : IN std_logic;
        Q: OUT std_logic
    );
END FDSE_1 ;
ARCHITECTURE altera OF FDSE_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (S = '1') then 
Q <= '1'; 
elsif (CE = '1') then 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FDS_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        S : IN std_logic;
        Q: OUT std_logic
    );
END FDS_1 ;
ARCHITECTURE altera OF FDS_1 IS
BEGIN
process (C) begin 
if (C' event and C = '0') then 
if (S = '1') then 
Q <= '1'; 
else 
Q <= D; 
end if; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY FD_1 IS
    port(
        D: IN std_logic;
        C : IN std_logic;
        Q: OUT std_logic
    );
END FD_1 ;
ARCHITECTURE altera OF FD_1 IS
BEGIN
process (C) 
begin 
if C' event and C = '0' then 
Q <= D; 
end if; 
end process; 
END altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG;
architecture altera of IBUFG is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFGDS is
port (
	O : out std_logic;
	I, IB : in std_logic
 );
end IBUFGDS;
architecture altera of IBUFGDS is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_AGP is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_AGP;
architecture altera of IBUFG_AGP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_CTT is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_CTT;
architecture altera of IBUFG_CTT is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_GTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_GTL;
architecture altera of IBUFG_GTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_GTL_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_GTL_DCI;
architecture altera of IBUFG_GTL_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_GTLP is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_GTLP;
architecture altera of IBUFG_GTLP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_GTLP_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_GTLP_DCI;
architecture altera of IBUFG_GTLP_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_I;
architecture altera of IBUFG_HSTL_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_I_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_I_18;
architecture altera of IBUFG_HSTL_I_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_I_DCI;
architecture altera of IBUFG_HSTL_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_I_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_I_DCI_18;
architecture altera of IBUFG_HSTL_I_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity IBUFG_HSTL_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_II;
architecture altera of IBUFG_HSTL_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_II_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_II_18;
architecture altera of IBUFG_HSTL_II_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_II_DCI;
architecture altera of IBUFG_HSTL_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_II_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_II_DCI_18;
architecture altera of IBUFG_HSTL_II_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity IBUFG_HSTL_III is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_III;
architecture altera of IBUFG_HSTL_III is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_III_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_III_18;
architecture altera of IBUFG_HSTL_III_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_III_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_III_DCI;
architecture altera of IBUFG_HSTL_III_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_III_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_III_DCI_18;
architecture altera of IBUFG_HSTL_III_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_IV is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_IV;
architecture altera of IBUFG_HSTL_IV is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_IV_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_IV_18;
architecture altera of IBUFG_HSTL_IV_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_IV_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_IV_DCI;
architecture altera of IBUFG_HSTL_IV_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_HSTL_IV_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_HSTL_IV_DCI_18;
architecture altera of IBUFG_HSTL_IV_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVCMOS12 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVCMOS12;
architecture altera of IBUFG_LVCMOS12 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVCMOS15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVCMOS15;
architecture altera of IBUFG_LVCMOS15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVCMOS18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVCMOS18;
architecture altera of IBUFG_LVCMOS18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVCMOS25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVCMOS25;
architecture altera of IBUFG_LVCMOS25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVCMOS33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVCMOS33;
architecture altera of IBUFG_LVCMOS33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_15;
architecture altera of IBUFG_LVDCI_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_18;
architecture altera of IBUFG_LVDCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_25;
architecture altera of IBUFG_LVDCI_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_33;
architecture altera of IBUFG_LVDCI_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_DV2_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_DV2_15;
architecture altera of IBUFG_LVDCI_DV2_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_DV2_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_DV2_18;
architecture altera of IBUFG_LVDCI_DV2_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_DV2_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_DV2_25;
architecture altera of IBUFG_LVDCI_DV2_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVDCI_DV2_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVDCI_DV2_33;
architecture altera of IBUFG_LVDCI_DV2_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_LVTTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_LVTTL;
architecture altera of IBUFG_LVTTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_PCI33_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_PCI33_3;
architecture altera of IBUFG_PCI33_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_PCI33_5 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_PCI33_5;
architecture altera of IBUFG_PCI33_5 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_PCI66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_PCI66_3;
architecture altera of IBUFG_PCI66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_PCIX66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_PCIX66_3;
architecture altera of IBUFG_PCIX66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_PCIX is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_PCIX;
architecture altera of IBUFG_PCIX is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL18_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL18_I;
architecture altera of IBUFG_SSTL18_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL18_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL18_I_DCI;
architecture altera of IBUFG_SSTL18_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL18_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL18_II;
architecture altera of IBUFG_SSTL18_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL18_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL18_II_DCI;
architecture altera of IBUFG_SSTL18_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL2_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL2_I;
architecture altera of IBUFG_SSTL2_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL2_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL2_I_DCI;
architecture altera of IBUFG_SSTL2_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL2_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL2_II;
architecture altera of IBUFG_SSTL2_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL2_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL2_II_DCI;
architecture altera of IBUFG_SSTL2_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL3_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL3_I;
architecture altera of IBUFG_SSTL3_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL3_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL3_I_DCI;
architecture altera of IBUFG_SSTL3_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL3_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL3_II;
architecture altera of IBUFG_SSTL3_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFG_SSTL3_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUFG_SSTL3_II_DCI;
architecture altera of IBUFG_SSTL3_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF;
architecture altera of IBUF is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUFDS is
port (
	O : out std_logic;
	I, IB : in std_logic
 );
end IBUFDS;
architecture altera of IBUFDS is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_AGP is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_AGP;
architecture altera of IBUF_AGP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_CTT is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_CTT;
architecture altera of IBUF_CTT is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_GTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_GTL;
architecture altera of IBUF_GTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_GTL_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_GTL_DCI;
architecture altera of IBUF_GTL_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_GTLP is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_GTLP;
architecture altera of IBUF_GTLP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_GTLP_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_GTLP_DCI;
architecture altera of IBUF_GTLP_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_I;
architecture altera of IBUF_HSTL_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_I_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_I_18;
architecture altera of IBUF_HSTL_I_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_I_DCI;
architecture altera of IBUF_HSTL_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_I_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_I_DCI_18;
architecture altera of IBUF_HSTL_I_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity IBUF_HSTL_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_II;
architecture altera of IBUF_HSTL_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_II_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_II_18;
architecture altera of IBUF_HSTL_II_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_II_DCI;
architecture altera of IBUF_HSTL_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_II_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_II_DCI_18;
architecture altera of IBUF_HSTL_II_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity IBUF_HSTL_III is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_III;
architecture altera of IBUF_HSTL_III is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_III_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_III_18;
architecture altera of IBUF_HSTL_III_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_III_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_III_DCI;
architecture altera of IBUF_HSTL_III_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_III_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_III_DCI_18;
architecture altera of IBUF_HSTL_III_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_IV is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_IV;
architecture altera of IBUF_HSTL_IV is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_IV_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_IV_18;
architecture altera of IBUF_HSTL_IV_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_IV_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_IV_DCI;
architecture altera of IBUF_HSTL_IV_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_HSTL_IV_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_HSTL_IV_DCI_18;
architecture altera of IBUF_HSTL_IV_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVCMOS12 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVCMOS12;
architecture altera of IBUF_LVCMOS12 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVCMOS15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVCMOS15;
architecture altera of IBUF_LVCMOS15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVCMOS18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVCMOS18;
architecture altera of IBUF_LVCMOS18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVCMOS25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVCMOS25;
architecture altera of IBUF_LVCMOS25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVCMOS33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVCMOS33;
architecture altera of IBUF_LVCMOS33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_15;
architecture altera of IBUF_LVDCI_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_18;
architecture altera of IBUF_LVDCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_25;
architecture altera of IBUF_LVDCI_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_33;
architecture altera of IBUF_LVDCI_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_DV2_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_DV2_15;
architecture altera of IBUF_LVDCI_DV2_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_DV2_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_DV2_18;
architecture altera of IBUF_LVDCI_DV2_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_DV2_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_DV2_25;
architecture altera of IBUF_LVDCI_DV2_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDCI_DV2_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDCI_DV2_33;
architecture altera of IBUF_LVDCI_DV2_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVDS is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVDS;
architecture altera of IBUF_LVDS is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVPECL is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVPECL;
architecture altera of IBUF_LVPECL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_LVTTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_LVTTL;
architecture altera of IBUF_LVTTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_PCI33_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_PCI33_3;
architecture altera of IBUF_PCI33_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_PCI33_5 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_PCI33_5;
architecture altera of IBUF_PCI33_5 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_PCI66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_PCI66_3;
architecture altera of IBUF_PCI66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_PCIX66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_PCIX66_3;
architecture altera of IBUF_PCIX66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_PCIX is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_PCIX;
architecture altera of IBUF_PCIX is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL18_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL18_I;
architecture altera of IBUF_SSTL18_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL18_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL18_I_DCI;
architecture altera of IBUF_SSTL18_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL18_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL18_II;
architecture altera of IBUF_SSTL18_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL18_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL18_II_DCI;
architecture altera of IBUF_SSTL18_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL2_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL2_I;
architecture altera of IBUF_SSTL2_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL2_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL2_I_DCI;
architecture altera of IBUF_SSTL2_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL2_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL2_II;
architecture altera of IBUF_SSTL2_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL2_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL2_II_DCI;
architecture altera of IBUF_SSTL2_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL3_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL3_I;
architecture altera of IBUF_SSTL3_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL3_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL3_I_DCI;
architecture altera of IBUF_SSTL3_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL3_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL3_II;
architecture altera of IBUF_SSTL3_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IBUF_SSTL3_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end IBUF_SSTL3_II_DCI;
architecture altera of IBUF_SSTL3_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity INV is
port (
	O : out std_logic;
	I : in std_logic
 );
end INV ;
architecture altera of INV is

begin
	process (I)
	begin
		O <= not I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF;
architecture altera of IOBUF is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_12 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_12;
architecture altera of IOBUF_F_12 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_16 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_16;
architecture altera of IOBUF_F_16 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_2 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_2;
architecture altera of IOBUF_F_2 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_24 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_24;
architecture altera of IOBUF_F_24 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_4 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_4;
architecture altera of IOBUF_F_4 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_6 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_6;
architecture altera of IOBUF_F_6 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_F_8 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_F_8;
architecture altera of IOBUF_F_8 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_12 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_12;
architecture altera of IOBUF_S_12 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_16 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_16;
architecture altera of IOBUF_S_16 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_2 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_2;
architecture altera of IOBUF_S_2 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_24 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_24;
architecture altera of IOBUF_S_24 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_4 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_4;
architecture altera of IOBUF_S_4 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_6 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_6;
architecture altera of IOBUF_S_6 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity IOBUF_S_8 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
 );
end IOBUF_S_8;
architecture altera of IOBUF_S_8 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_AGP is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_AGP;
architecture altera of IOBUF_AGP is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_CTT is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_CTT;
architecture altera of IOBUF_CTT is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_GTL is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_GTL;
architecture altera of IOBUF_GTL is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;


entity IOBUF_GTL_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_GTL_DCI;
architecture altera of IOBUF_GTL_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_GTLP is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_GTLP;
architecture altera of IOBUF_GTLP is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_GTLP_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_GTLP_DCI;
architecture altera of IOBUF_GTLP_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_I is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_I;
architecture altera of IOBUF_HSTL_I is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_I_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_I_18;
architecture altera of IOBUF_HSTL_I_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_I_DCI;
architecture altera of IOBUF_HSTL_I_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_I_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_I_DCI_18;
architecture altera of IOBUF_HSTL_I_DCI_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_II is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_II;
architecture altera of IOBUF_HSTL_II is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_II_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_II_18;
architecture altera of IOBUF_HSTL_II_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_II_DCI;
architecture altera of IOBUF_HSTL_II_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_II_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_II_DCI_18;
architecture altera of IOBUF_HSTL_II_DCI_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_III is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_III;
architecture altera of IOBUF_HSTL_III is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_III_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_III_18;
architecture altera of IOBUF_HSTL_III_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_III_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_III_DCI;
architecture altera of IOBUF_HSTL_III_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_III_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_III_DCI_18;
architecture altera of IOBUF_HSTL_III_DCI_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_IV is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_IV;
architecture altera of IOBUF_HSTL_IV is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_IV_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_IV_18;
architecture altera of IOBUF_HSTL_IV_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_IV_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_IV_DCI;
architecture altera of IOBUF_HSTL_IV_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_HSTL_IV_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_HSTL_IV_DCI_18;
architecture altera of IOBUF_HSTL_IV_DCI_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVCMOS12 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVCMOS12;
architecture altera of IOBUF_LVCMOS12 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVCMOS15 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVCMOS15;
architecture altera of IOBUF_LVCMOS15 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVCMOS18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVCMOS18;
architecture altera of IOBUF_LVCMOS18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVCMOS25 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVCMOS25;
architecture altera of IOBUF_LVCMOS25 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVCMOS33 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVCMOS33;
architecture altera of IOBUF_LVCMOS33 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_15 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_15;
architecture altera of IOBUF_LVDCI_15 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_18;
architecture altera of IOBUF_LVDCI_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_25 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_25;
architecture altera of IOBUF_LVDCI_25 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_33 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_33;
architecture altera of IOBUF_LVDCI_33 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_DV2_15 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_DV2_15;
architecture altera of IOBUF_LVDCI_DV2_15 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_DV2_18 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_DV2_18;
architecture altera of IOBUF_LVDCI_DV2_18 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_DV2_25 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_DV2_25;
architecture altera of IOBUF_LVDCI_DV2_25 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVDCI_DV2_33 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVDCI_DV2_33;
architecture altera of IOBUF_LVDCI_DV2_33 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_LVTTL is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_LVTTL;
architecture altera of IOBUF_LVTTL is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_PCI33_3 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_PCI33_3;
architecture altera of IOBUF_PCI33_3 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_PCI33_5 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_PCI33_5;
architecture altera of IOBUF_PCI33_5 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_PCI66_3 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_PCI66_3;
architecture altera of IOBUF_PCI66_3 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_PCIX66_3 is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_PCIX66_3;
architecture altera of IOBUF_PCIX66_3 is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_PCIX is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_PCIX;
architecture altera of IOBUF_PCIX is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL18_I is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL18_I;
architecture altera of IOBUF_SSTL18_I is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL18_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL18_I_DCI;
architecture altera of IOBUF_SSTL18_I_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL18_II is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL18_II;
architecture altera of IOBUF_SSTL18_II is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL18_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL18_II_DCI;
architecture altera of IOBUF_SSTL18_II_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL2_I is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL2_I;
architecture altera of IOBUF_SSTL2_I is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL2_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL2_I_DCI;
architecture altera of IOBUF_SSTL2_I_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL2_II is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL2_II;
architecture altera of IOBUF_SSTL2_II is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL2_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL2_II_DCI;
architecture altera of IOBUF_SSTL2_II_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL3_I is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL3_I;
architecture altera of IOBUF_SSTL3_I is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL3_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL3_I_DCI;
architecture altera of IOBUF_SSTL3_I_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL3_II is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL3_II;
architecture altera of IOBUF_SSTL3_II is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity IOBUF_SSTL3_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	IO : inout std_logic;
	T : in std_logic
);
end IOBUF_SSTL3_II_DCI;
architecture altera of IOBUF_SSTL3_II_DCI is

begin
	O <= IO;
	process (I, T)
	begin
		IF (T = '1') THEN
			IO <= 'Z';
		ELSE
		IO <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT;
architecture altera of OBUFT is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_12 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_12;
architecture altera of OBUFT_F_12 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_16 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_16;
architecture altera of OBUFT_F_16 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_2 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_2;
architecture altera of OBUFT_F_2 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_24 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_24;
architecture altera of OBUFT_F_24 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_4 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_4;
architecture altera of OBUFT_F_4 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_6 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_6;
architecture altera of OBUFT_F_6 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_F_8 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_F_8;
architecture altera of OBUFT_F_8 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_12 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_12;
architecture altera of OBUFT_S_12 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_16 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_16;
architecture altera of OBUFT_S_16 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_2 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_2;
architecture altera of OBUFT_S_2 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_24 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_24;
architecture altera of OBUFT_S_24 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_4 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_4;
architecture altera of OBUFT_S_4 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_6 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_6;
architecture altera of OBUFT_S_6 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFT_S_8 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
 );
end OBUFT_S_8;
architecture altera of OBUFT_S_8 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_AGP is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_AGP;
architecture altera of OBUFT_AGP is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_CTT is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_CTT;
architecture altera of OBUFT_CTT is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_GTL is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_GTL;
architecture altera of OBUFT_GTL is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_GTL_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_GTL_DCI;
architecture altera of OBUFT_GTL_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_GTLP is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_GTLP;
architecture altera of OBUFT_GTLP is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_GTLP_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_GTLP_DCI;
architecture altera of OBUFT_GTLP_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_I is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_I;
architecture altera of OBUFT_HSTL_I is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_I_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_I_18;
architecture altera of OBUFT_HSTL_I_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;

library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_I_DCI;
architecture altera of OBUFT_HSTL_I_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_I_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_I_DCI_18;
architecture altera of OBUFT_HSTL_I_DCI_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_II is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_II;
architecture altera of OBUFT_HSTL_II is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_II_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_II_18;
architecture altera of OBUFT_HSTL_II_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_II_DCI;
architecture altera of OBUFT_HSTL_II_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_II_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_II_DCI_18;
architecture altera of OBUFT_HSTL_II_DCI_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_III is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_III;
architecture altera of OBUFT_HSTL_III is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_III_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_III_18;
architecture altera of OBUFT_HSTL_III_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_III_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_III_DCI;
architecture altera of OBUFT_HSTL_III_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_III_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_III_DCI_18;
architecture altera of OBUFT_HSTL_III_DCI_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_IV is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_IV;
architecture altera of OBUFT_HSTL_IV is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_IV_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_IV_18;
architecture altera of OBUFT_HSTL_IV_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_IV_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_IV_DCI;
architecture altera of OBUFT_HSTL_IV_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_HSTL_IV_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_HSTL_IV_DCI_18;
architecture altera of OBUFT_HSTL_IV_DCI_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVCMOS12 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVCMOS12;
architecture altera of OBUFT_LVCMOS12 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVCMOS15 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVCMOS15;
architecture altera of OBUFT_LVCMOS15 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVCMOS18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVCMOS18;
architecture altera of OBUFT_LVCMOS18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVCMOS25 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVCMOS25;
architecture altera of OBUFT_LVCMOS25 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVCMOS33 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVCMOS33;
architecture altera of OBUFT_LVCMOS33 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_15 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_15;
architecture altera of OBUFT_LVDCI_15 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_18;
architecture altera of OBUFT_LVDCI_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_25 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_25;
architecture altera of OBUFT_LVDCI_25 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_33 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_33;
architecture altera of OBUFT_LVDCI_33 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_DV2_15 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_DV2_15;
architecture altera of OBUFT_LVDCI_DV2_15 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_DV2_18 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_DV2_18;
architecture altera of OBUFT_LVDCI_DV2_18 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_DV2_25 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_DV2_25;
architecture altera of OBUFT_LVDCI_DV2_25 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVDCI_DV2_33 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVDCI_DV2_33;
architecture altera of OBUFT_LVDCI_DV2_33 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_LVTTL is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_LVTTL;
architecture altera of OBUFT_LVTTL is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_PCI33_3 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_PCI33_3;
architecture altera of OBUFT_PCI33_3 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_PCI33_5 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_PCI33_5;
architecture altera of OBUFT_PCI33_5 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_PCI66_3 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_PCI66_3;
architecture altera of OBUFT_PCI66_3 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_PCIX66_3 is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_PCIX66_3;
architecture altera of OBUFT_PCIX66_3 is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_PCIX is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_PCIX;
architecture altera of OBUFT_PCIX is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL18_I is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL18_I;
architecture altera of OBUFT_SSTL18_I is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL18_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL18_I_DCI;
architecture altera of OBUFT_SSTL18_I_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL18_II is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL18_II;
architecture altera of OBUFT_SSTL18_II is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL18_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL18_II_DCI;
architecture altera of OBUFT_SSTL18_II_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL2_I is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL2_I;
architecture altera of OBUFT_SSTL2_I is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL2_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL2_I_DCI;
architecture altera of OBUFT_SSTL2_I_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL2_II is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL2_II;
architecture altera of OBUFT_SSTL2_II is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL2_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL2_II_DCI;
architecture altera of OBUFT_SSTL2_II_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL3_I is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL3_I;
architecture altera of OBUFT_SSTL3_I is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL3_I_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL3_I_DCI;
architecture altera of OBUFT_SSTL3_I_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL3_II is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL3_II;
architecture altera of OBUFT_SSTL3_II is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL;
library altera;
use altera.maxplus2.all;

entity OBUFT_SSTL3_II_DCI is
port (
	O : out std_logic;
	I : in std_logic;
	T : in std_logic
);
end OBUFT_SSTL3_II_DCI;
architecture altera of OBUFT_SSTL3_II_DCI is

begin
	process (I, T)
	begin
		IF (T = '1') THEN
			O <= 'Z';
		ELSE
		O <= I;
		END IF;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_12 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_12;
architecture altera of OBUF_F_12 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_16 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_16;
architecture altera of OBUF_F_16 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_2 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_2;
architecture altera of OBUF_F_2 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_24 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_24;
architecture altera of OBUF_F_24 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_4 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_4;
architecture altera of OBUF_F_4 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_6 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_6;
architecture altera of OBUF_F_6 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_F_8 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_F_8;
architecture altera of OBUF_F_8 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_12 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_12;
architecture altera of OBUF_S_12 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_16 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_16;
architecture altera of OBUF_S_16 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_2 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_2;
architecture altera of OBUF_S_2 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_24 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_24;
architecture altera of OBUF_S_24 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_4 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_4;
architecture altera of OBUF_S_4 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_6 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_6;
architecture altera of OBUF_S_6 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_S_8 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_S_8;
architecture altera of OBUF_S_8 is

begin
	process (I)
	BEGIN
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF;
architecture altera of OBUF is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUFDS is
port (
	O : out std_logic;
	I, IB : in std_logic
 );
end OBUFDS;
architecture altera of OBUFDS is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_AGP is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_AGP;
architecture altera of OBUF_AGP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_CTT is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_CTT;
architecture altera of OBUF_CTT is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_GTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_GTL;
architecture altera of OBUF_GTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_GTL_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_GTL_DCI;
architecture altera of OBUF_GTL_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_GTLP is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_GTLP;
architecture altera of OBUF_GTLP is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_GTLP_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_GTLP_DCI;
architecture altera of OBUF_GTLP_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_I;
architecture altera of OBUF_HSTL_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_I_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_I_18;
architecture altera of OBUF_HSTL_I_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_I_DCI;
architecture altera of OBUF_HSTL_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_I_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_I_DCI_18;
architecture altera of OBUF_HSTL_I_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity OBUF_HSTL_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_II;
architecture altera of OBUF_HSTL_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_II_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_II_18;
architecture altera of OBUF_HSTL_II_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_II_DCI;
architecture altera of OBUF_HSTL_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_II_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_II_DCI_18;
architecture altera of OBUF_HSTL_II_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;
entity OBUF_HSTL_III is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_III;
architecture altera of OBUF_HSTL_III is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_III_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_III_18;
architecture altera of OBUF_HSTL_III_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_III_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_III_DCI;
architecture altera of OBUF_HSTL_III_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_III_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_III_DCI_18;
architecture altera of OBUF_HSTL_III_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_IV is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_IV;
architecture altera of OBUF_HSTL_IV is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_IV_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_IV_18;
architecture altera of OBUF_HSTL_IV_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_IV_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_IV_DCI;
architecture altera of OBUF_HSTL_IV_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_HSTL_IV_DCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_HSTL_IV_DCI_18;
architecture altera of OBUF_HSTL_IV_DCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVCMOS12 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVCMOS12;
architecture altera of OBUF_LVCMOS12 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVCMOS15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVCMOS15;
architecture altera of OBUF_LVCMOS15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVCMOS18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVCMOS18;
architecture altera of OBUF_LVCMOS18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVCMOS25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVCMOS25;
architecture altera of OBUF_LVCMOS25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVCMOS33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVCMOS33;
architecture altera of OBUF_LVCMOS33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_15;
architecture altera of OBUF_LVDCI_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_18;
architecture altera of OBUF_LVDCI_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_25;
architecture altera of OBUF_LVDCI_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_33;
architecture altera of OBUF_LVDCI_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_DV2_15 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_DV2_15;
architecture altera of OBUF_LVDCI_DV2_15 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_DV2_18 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_DV2_18;
architecture altera of OBUF_LVDCI_DV2_18 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_DV2_25 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_DV2_25;
architecture altera of OBUF_LVDCI_DV2_25 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDCI_DV2_33 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDCI_DV2_33;
architecture altera of OBUF_LVDCI_DV2_33 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVDS is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVDS;
architecture altera of OBUF_LVDS is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVPECL is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVPECL;
architecture altera of OBUF_LVPECL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_LVTTL is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_LVTTL;
architecture altera of OBUF_LVTTL is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_PCI33_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_PCI33_3;
architecture altera of OBUF_PCI33_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_PCI33_5 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_PCI33_5;
architecture altera of OBUF_PCI33_5 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_PCI66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_PCI66_3;
architecture altera of OBUF_PCI66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_PCIX66_3 is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_PCIX66_3;
architecture altera of OBUF_PCIX66_3 is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_PCIX is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_PCIX;
architecture altera of OBUF_PCIX is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL18_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL18_I;
architecture altera of OBUF_SSTL18_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL18_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL18_I_DCI;
architecture altera of OBUF_SSTL18_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL18_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL18_II;
architecture altera of OBUF_SSTL18_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL18_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL18_II_DCI;
architecture altera of OBUF_SSTL18_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL2_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL2_I;
architecture altera of OBUF_SSTL2_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL2_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL2_I_DCI;
architecture altera of OBUF_SSTL2_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL2_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL2_II;
architecture altera of OBUF_SSTL2_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL2_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL2_II_DCI;
architecture altera of OBUF_SSTL2_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL3_I is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL3_I;
architecture altera of OBUF_SSTL3_I is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL3_I_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL3_I_DCI;
architecture altera of OBUF_SSTL3_I_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL3_II is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL3_II;
architecture altera of OBUF_SSTL3_II is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

entity OBUF_SSTL3_II_DCI is
port (
	O : out std_logic;
	I : in std_logic
 );
end OBUF_SSTL3_II_DCI;
architecture altera of OBUF_SSTL3_II_DCI is

begin
	process (I)
	begin
		O <= I;
	end process;
end altera;
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRL16 IS

	PORT(
		D					: IN	STD_LOGIC;
		A0, A1, A2, A3		: IN	STD_LOGIC;
		CLK					: IN	STD_LOGIC;
		Q					: OUT	STD_LOGIC);
END SRL16;


ARCHITECTURE behave OF SRL16 IS

SIGNAL D_temp	: std_logic_vector(15 DOWNTO 0);
SIGNAL temp1	: std_logic_vector(1 DOWNTO 0);
SIGNAL temp2	: std_logic_vector(1 DOWNTO 0);

BEGIN
PROCESS(CLK)
	BEGIN
		IF (CLK'event AND CLK='1') THEN
			D_temp (15 DOWNTO 1) <= D_temp(14 DOWNTO 0);
			D_temp(0) <= D;
		END IF;

END PROCESS;


temp1 <= A3 & A2;
temp2 <= A1 & A0;

PROCESS(temp1,temp2, D_temp)
	BEGIN
	CASE (temp1 & temp2) IS
		WHEN "0001" =>
			Q <= D_temp(1);
		WHEN "0010" =>
			Q <= D_temp(2);
		WHEN "0011" =>
			Q <= D_temp(3);
		WHEN "0100" =>
			Q <= D_temp(4);		
		WHEN "0101" =>
			Q <= D_temp(5);	
		WHEN "0110" =>
			Q <= D_temp(6);	
		WHEN "0111" =>
			Q <= D_temp(7);					
		WHEN "1000" =>
			Q <= D_temp(8);	
		WHEN "1001" =>
			Q <= D_temp(9);	
		WHEN "1010" =>
			Q <= D_temp(10);	
		WHEN "1011" =>
			Q <= D_temp(11);	
		WHEN "1100" =>
			Q <= D_temp(12);									
		WHEN "1101" =>
			Q <= D_temp(13);	
		WHEN "1110" =>
			Q <= D_temp(14);					
		WHEN "1111" =>
			Q <= D_temp(15);	
		WHEN OTHERS =>
			Q <= D_temp(0);					
	END CASE;
END PROCESS;

END behave;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY DCM IS
	PORT (
	clkin   	: in  std_logic ;
	CLKFB   	: in  std_logic ;
	DSSEN 		: in  std_logic ;
	PSINCDEC	: in  std_logic ;
	PSEN 		: in  std_logic ;
	PSCLK 		: in  std_logic ;
	RST     	: in  std_logic ;
	CLK0    	: out std_logic ;
	CLK90   	: out std_logic ;
	clk180  	: out std_logic ;
	CLK270  	: out std_logic ;
	CLK2X   	: out std_logic ;
	CLK2X180	: out std_logic ;
	CLKDV   	: out std_logic ;
	CLKFX   	: out std_logic ;
	CLKFX180	: out std_logic ;
	LOCKED  	: out std_logic ;
	PSDONE  	: out std_logic ;
	STATUS  	: out std_logic_vector(7 downto 0)); 
END dcm;

ARCHITECTURE altera OF DCM IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY CLKDLL IS
	PORT (
	CLKIN   	: in  std_logic ;
	CLKFB   	: in  std_logic ;
	RST     	: in  std_logic ;
	CLK0    	: out std_logic ;
	CLK90   	: out std_logic ;
	CLK180  	: out std_logic ;
	CLK270  	: out std_logic ;
	CLK2X		: out std_logic ;
	CLKDV   	: out std_logic ;
	LOCKED  	: out std_logic) ;
END CLKDLL;

ARCHITECTURE altera OF CLKDLL IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY CLKDLLE IS
	PORT (
	CLKIN   	: in  std_logic ;
	CLKFB   	: in  std_logic ;
	RST     	: in  std_logic ;
	CLK0    	: out std_logic ;
	CLK90   	: out std_logic ;
	CLK180  	: out std_logic ;
	CLK270  	: out std_logic ;
	CLK2X		: out std_logic ;
	CLK2X180	: out std_logic ;
	CLKDV   	: out std_logic ;
	LOCKED  	: out std_logic) ;
END CLKDLLE;

ARCHITECTURE altera OF CLKDLLE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY CLKDLLHF IS
	PORT (
	CLKIN   	: in  std_logic ;
	CLKFB   	: in  std_logic ;
	RST     	: in  std_logic ;
	CLK0    	: out std_logic ;
	CLK180  	: out std_logic ;
	CLKDV   	: out std_logic ;
	LOCKED  	: out std_logic) ;
END CLKDLLHF;

ARCHITECTURE altera OF CLKDLLHF IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFGCE IS
	PORT (
	I   	: in  std_logic ;
	CE   	: in  std_logic ;
	O    	: out std_logic) ;
END BUFGCE;

ARCHITECTURE altera OF BUFGCE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFGCE_1 IS
	PORT (
	I   	: in  std_logic ;
	CE   	: in  std_logic ;
	O    	: out std_logic) ;
END BUFGCE_1;

ARCHITECTURE altera OF BUFGCE_1 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFGMUX IS
	PORT (
	I0   	: in  std_logic ;
	I1		: in  std_logic;
	S   	: in  std_logic ;
	O    	: out std_logic);
END BUFGMUX;

ARCHITECTURE altera OF BUFGMUX IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY BUFGMUX_1 IS
	PORT (
	I0   	: in  std_logic ;
	I1		: in  std_logic;
	S   	: in  std_logic ;
	O    	: out std_logic);
END BUFGMUX_1;

ARCHITECTURE altera OF BUFGMUX_1 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY IFDDRCPE IS
	PORT (
	PRE   	: in  std_logic ;
	D		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	CLR   	: in  std_logic ;
	Q1   	: out std_logic ;
	Q0    	: out std_logic);
END IFDDRCPE;

ARCHITECTURE altera OF IFDDRCPE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY IFDDRRSE IS
	PORT (
	S   	: in  std_logic ;
	D		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	R   	: in  std_logic ;
	Q1   	: out std_logic ;
	Q0    	: out std_logic);
END IFDDRRSE;

ARCHITECTURE altera OF IFDDRRSE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY OFDDRCPE IS
	PORT (
	PRE   	: in  std_logic ;
	D0		: in  std_logic;
	D1		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	CLR   	: in  std_logic ;
	Q    	: out std_logic);
END OFDDRCPE;

ARCHITECTURE altera OF OFDDRCPE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY OFDDRRSE IS
	PORT (
	S   	: in  std_logic ;
	D0		: in  std_logic;
	D1		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	R   	: in  std_logic ;
	Q    	: out std_logic);
END OFDDRRSE;

ARCHITECTURE altera OF OFDDRRSE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY OFDDRTCPE IS
	PORT (
	PRE   	: in  std_logic ;
	D0		: in  std_logic;
	D1		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	CLR   	: in  std_logic ;
	T   	: in  std_logic ;
	Q    	: out std_logic);
END OFDDRTCPE;

ARCHITECTURE altera OF OFDDRTCPE IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY OFDDRTRSE IS
	PORT (
	S   	: in  std_logic ;
	D0		: in  std_logic;
	D1		: in  std_logic;
	CE   	: in  std_logic ;
	C0   	: in  std_logic ;
	C1		: in  std_logic;
	R   	: in  std_logic ;
	T   	: in  std_logic ;
	Q    	: out std_logic);
END OFDDRTRSE;

ARCHITECTURE altera OF OFDDRTRSE IS
BEGIN
END altera;

---

library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXCY IS
	PORT (
	CI  : in std_logic;
	DI  : in std_logic;
	S   : in std_logic;
	O   : out std_logic);
END MUXCY;

ARCHITECTURE altera OF MUXCY IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXCY_D IS
	PORT (
	CI  : in std_logic;
	DI  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic;
	O   : out std_logic);
END MUXCY_D;

ARCHITECTURE altera OF MUXCY_D IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF5 IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	O   : out std_logic);
END MUXF5;

ARCHITECTURE altera OF MUXF5 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF5_D IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic;
	O   : out std_logic);
END MUXF5_D;

ARCHITECTURE altera OF MUXF5_D IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF5_L IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic);
END MUXF5_L;

ARCHITECTURE altera OF MUXF5_L IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF6 IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	O   : out std_logic);
END MUXF6;

ARCHITECTURE altera OF MUXF6 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF6_D IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic;
	O   : out std_logic);
END MUXF6_D;

ARCHITECTURE altera OF MUXF6_D IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF6_L IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic);
END MUXF6_L;

ARCHITECTURE altera OF MUXF6_L IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF7 IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	O   : out std_logic);
END MUXF7;

ARCHITECTURE altera OF MUXF7 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF7_D IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic;
	O   : out std_logic);
END MUXF7_D;

ARCHITECTURE altera OF MUXF7_D IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF7_L IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic);
END MUXF7_L;

ARCHITECTURE altera OF MUXF7_L IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF8 IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	O   : out std_logic);
END MUXF8;

ARCHITECTURE altera OF MUXF8 IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF8_D IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic;
	O   : out std_logic);
END MUXF8_D;

ARCHITECTURE altera OF MUXF8_D IS
BEGIN
END altera;

---
library ieee;
use ieee.std_logic_1164.all;
library LPM;
USE lpm.lpm_components.ALL; 
library altera;
use altera.maxplus2.all;

ENTITY MUXF8_L IS
	PORT (
	I0  : in std_logic;
	I1  : in std_logic;
	S   : in std_logic;
	LO  : out std_logic);
END MUXF8_L;

ARCHITECTURE altera OF MUXF8_L IS
BEGIN
END altera;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRL16_1 IS
	PORT(
		Q :  out STD_ULOGIC;
		A0 : in STD_ULOGIC;
		A1 : in STD_ULOGIC;
		A2 : in STD_ULOGIC;
		A3 : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D : in STD_ULOGIC);
END SRL16_1 ;

ARCHITECTURE behave OF SRL16_1 IS
BEGIN
END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRL16E IS

	PORT(
		D					: IN	STD_LOGIC;
		A0, A1, A2, A3		: IN	STD_LOGIC;
		CLK					: IN	STD_LOGIC;
		CE					: IN	STD_LOGIC;
		Q					: OUT	STD_LOGIC);
END SRL16E;


ARCHITECTURE behave OF SRL16E IS

SIGNAL D_temp	: std_logic_vector(15 DOWNTO 0);
SIGNAL temp1	: std_logic_vector(1 DOWNTO 0);
SIGNAL temp2	: std_logic_vector(1 DOWNTO 0);

BEGIN
PROCESS(CLK)
	BEGIN
		IF (CLK'event AND CLK='1') THEN
			IF (CE='1') THEN
				D_temp (15 DOWNTO 1) <= D_temp(14 DOWNTO 0);
				D_temp(0) <= D;
			END IF;	
		END IF;

END PROCESS;


temp1 <= A3 & A2;
temp2 <= A1 & A0;

PROCESS(temp1,temp2, D_temp)
	BEGIN
	CASE (temp1 & temp2) IS
		WHEN "0001" =>
			Q <= D_temp(1);
		WHEN "0010" =>
			Q <= D_temp(2);
		WHEN "0011" =>
			Q <= D_temp(3);
		WHEN "0100" =>
			Q <= D_temp(4);		
		WHEN "0101" =>
			Q <= D_temp(5);	
		WHEN "0110" =>
			Q <= D_temp(6);	
		WHEN "0111" =>
			Q <= D_temp(7);					
		WHEN "1000" =>
			Q <= D_temp(8);	
		WHEN "1001" =>
			Q <= D_temp(9);	
		WHEN "1010" =>
			Q <= D_temp(10);	
		WHEN "1011" =>
			Q <= D_temp(11);	
		WHEN "1100" =>
			Q <= D_temp(12);									
		WHEN "1101" =>
			Q <= D_temp(13);	
		WHEN "1110" =>
			Q <= D_temp(14);					
		WHEN "1111" =>
			Q <= D_temp(15);	
		WHEN OTHERS =>
			Q <= D_temp(0);					
	END CASE;
END PROCESS;

END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRL16E_1 IS
	PORT(
		Q   : out STD_ULOGIC;
		A0  : in STD_ULOGIC;
		A1  : in STD_ULOGIC;
		A2  : in STD_ULOGIC;
		A3  : in STD_ULOGIC;
		CE  : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D   : in STD_ULOGIC);
END SRL16E_1 ;

ARCHITECTURE behave OF SRL16E_1 IS
BEGIN
END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRLC16 IS
	PORT(
		Q   : out STD_ULOGIC;
		Q15 : out STD_ULOGIC;
		A0  : in STD_ULOGIC;
		A1  : in STD_ULOGIC;
		A2  : in STD_ULOGIC;
		A3  : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D   : in STD_ULOGIC);
END SRLC16 ;

ARCHITECTURE behave OF SRLC16 IS
BEGIN
END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRLC16_1 IS
	PORT(
		Q   : out STD_ULOGIC;
		Q15 : out STD_ULOGIC;
		A0  : in STD_ULOGIC;
		A1  : in STD_ULOGIC;
		A2  : in STD_ULOGIC;
		A3  : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D   : in STD_ULOGIC);
END SRLC16_1 ;

ARCHITECTURE behave OF SRLC16_1 IS
BEGIN
END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRLC16E IS
	PORT(
		Q   : out STD_ULOGIC;
		Q15 : out STD_ULOGIC;
		A0  : in STD_ULOGIC;
		A1  : in STD_ULOGIC;
		A2  : in STD_ULOGIC;
		A3  : in STD_ULOGIC;
		CE  : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D   : in STD_ULOGIC);
END SRLC16E ;

ARCHITECTURE behave OF SRLC16E IS
BEGIN
END behave;

---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SRLC16E_1 IS
	PORT(
		Q   : out STD_ULOGIC;
		Q15 : out STD_ULOGIC;
		A0  : in STD_ULOGIC;
		A1  : in STD_ULOGIC;
		A2  : in STD_ULOGIC;
		A3  : in STD_ULOGIC;
		CE  : in STD_ULOGIC;
		CLK : in STD_ULOGIC;
		D   : in STD_ULOGIC);
END SRLC16E_1 ;

ARCHITECTURE behave OF SRLC16E_1 IS
BEGIN
END behave;

---
