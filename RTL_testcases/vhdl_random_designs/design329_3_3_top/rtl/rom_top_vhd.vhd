
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;		 
use ieee.std_logic_unsigned.all;

entity ROM is
generic(
 WIDTH : integer := 32);
port(	
    Clock   : in std_logic;
	Reset	: in std_logic;	
	Enable	: in std_logic;
	Read	: in std_logic;
	Address	: in std_logic_vector(WIDTH-1 downto 0);
	Data_out: out std_logic_vector(WIDTH-1 downto 0)
);
end ROM;

--------------------------------------------------------------

architecture Behav of ROM is

    type ROM_Array is array (0 to 130) 
	of std_logic_vector(WIDTH-1 downto 0);

    constant Content: ROM_Array := (
        00 => x"FFFFFFF1",		  
        01 => x"FFFFFFF2",		
        02 => x"FFFFFFF3",		 
        03 => x"FFFFFFF4",      
        04 => x"FFFFFFF5",		
        05 => x"FFFFFFF6",      
        06 => x"FFFFFFF7",		
        07 => x"FFFFFFF8",      
        08 => x"FFFFFFF9",      
        09 => x"FFFFFFFA",      
        10 => x"FFFFFFFB",		
	    11 => x"FFFFFFFC",      
        12 => x"FFFFFFFD",      
        13 => x"FFFFFFFE",		
	    14 => x"FFFFFF10",
	    15 => x"FFFFFF11",		 
        16 => x"FFFFFF12",        
        17 => x"FFFFFF13",        
        18 => x"FFFFFF14",        
        19 => x"FFFFFF15",        
        20 => x"FFFFFF16",        
        21 => x"FFFFFF17",        
        22 => x"FFFFFF18",        
        23 => x"FFFFFF19",        
        24 => x"FFFFFF1A",        
        25 => x"FFFFFF1B",        
        26 => x"FFFFFF1C",        
        27 => x"FFFFFF1D",        
        28 => x"FFFFFF1E",        
        29 => x"FFFFFF20",
        30 => x"FFFFFF21",
        31 => x"FFFFFF22",		
        32 => x"FFFFFF23",
        33 => x"FFFFFF24",		
        34 => x"FFFFFF25",         
        35 => x"FFFFFF26",      
        36 => x"FFFFFF27",        
        37 => x"FFFFFF28",        
        38 => x"FFFFFF29",        
        39 => x"FFFFFF2A",        
        40 => x"FFFFFF2B",        
        41 => x"FFFFFF2C",        
        42 => x"FFFFFF2D",            
        43 => x"FFFFFF2E",      
        44 => x"FFFFFF30",          
        45 => x"FFFFFF31",             
        46 => x"FFFFFF32",       
        47 => x"FFFFFF33",
        48 => x"FFFFFF34",       
        49 => x"FFFFFF35",        
        50 => x"FFFFFF36",       
        51 => x"FFFFFF37",        
        52 => x"FFFFFF38",        
        53 => x"FFFFFF39",        
        54 => x"FFFFFF3A",        
        55 => x"FFFFFF3B",        
        56 => x"FFFFFF3C",        
        57 => x"FFFFFF3D",        
        58 => x"FFFFFF3E",        
        59 => x"FFFFFF40",        
        60 => x"FFFFFF41",        
        61 => x"FFFFFF42",        
        62 => x"FFFFFF43",
        63 => x"FFFFFF44",
        64 => x"FFFFFF45",       
        65 => x"FFFFFF46",
        128 => x"FFFFFF47",              
	    OTHERS => x"FFFFFFFF"	  
	);       

begin
    process(Clock, Reset, Read, Address)
    begin
        if( Clock'event and Clock = '1' ) then
	    if Enable = '1' then
		if( Read = '1' ) then
		    Data_out <= Content(conv_integer(Address));
            	else
                    Data_out <= "00000000000000000000000000000000";
            	end if;
	    end if;
        end if;
    end process;
end Behav;

--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rom_top_vhd is
generic(
 WIDTH : integer := 32);
port(
    data_in: in std_logic_vector(WIDTH-1 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    data_out: out std_logic_vector(WIDTH-1 downto 0));
end rom_top_vhd;

architecture rtl of rom_top_vhd is
    signal data_out_tmp: std_logic_vector(WIDTH-1 downto 0);
    signal read: std_logic;
    signal enable: std_logic;
    
begin
    process(clk,rst)
    begin
        if rst = '0' then
            data_out<=(data_out_tmp'range=>'0');
            read <= '0';
            enable <= '0';
        elsif (clk'event and clk='1') then
            data_out<=data_out_tmp;
            read <= '1';
            enable <= '1';
        end if;   
    end process;
    
R : entity work.ROM(Behav)
    generic map (
    WIDTH => WIDTH)
    port map(
    Clock => clk,
    Reset => rst,
    Address => data_in(WIDTH-1 downto 0),
    Enable => enable,
    Read => read,
    Data_out  => data_out_tmp(WIDTH-1 downto 0)
);
    
end rtl;