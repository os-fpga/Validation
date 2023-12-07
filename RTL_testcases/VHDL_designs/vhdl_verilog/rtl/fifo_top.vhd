library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity fifo_top is
    generic (
        WIDTH : integer := 8;
        L2DEPTH : integer := 4;
        REGFLAGS : integer := 8
        );
    port (
        ACLK :              in std_logic;
        ARESETN :           in std_logic;
        BIT_1 :             in std_logic;
        BIT_0 :             in std_logic;
        package_byte_en :   in std_logic;
        outp_fifo_wt_data_and_meta : in std_logic_vector (WIDTH-1 downto 0);
        outp_fifo_read :    in std_logic;
        outp_fifo_rd_data_and_meta : out std_logic_vector (WIDTH-1 downto 0);
        outp_fifo_empty :   out std_logic;
        outp_fifo_full :    out std_logic;
        open_s :              out std_logic_vector (L2DEPTH downto 0));
end fifo_top;

architecture rtl of fifo_top is

  component sync_fifo is
  generic(
     WIDTH    : integer := 8;
     L2DEPTH  : integer := 4;
     REGFLAGS : integer := 8
  );
  port (
       clk    : in STD_LOGIC;         -- system clock                 
       reset_n: in STD_LOGIC;         -- A-synchronous low reset/clear
       enable : in STD_LOGIC;         -- clock gating                 
       clear  : in STD_LOGIC;         -- Synchronous clear            

       write  : in  STD_LOGIC;        -- write FIFO                   
       wdata  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- write data                   
       read   : in  STD_LOGIC;        -- read FIFO                    
       rdata  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- read data                    

       empty  : out STD_LOGIC; -- FIFO is empty                
       full   : out STD_LOGIC; -- FIFO is full                 
       level   : out STD_LOGIC_VECTOR(L2DEPTH downto 0)  -- Fill level                   
    );
end component;

begin
    ctrl : sync_fifo 
    generic map (
        WIDTH => WIDTH,
        L2DEPTH => L2DEPTH,
        REGFLAGS => REGFLAGS
        )
    port map (
        clk => ACLK,
        reset_n => ARESETN,
        enable => BIT_1,
        clear => BIT_0,
        write => package_byte_en,
        wdata => outp_fifo_wt_data_and_meta,
        read => outp_fifo_read,
        rdata => outp_fifo_rd_data_and_meta,
        empty => outp_fifo_empty,
        full => outp_fifo_full,
        level => open_s);
        
end rtl;