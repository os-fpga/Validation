-- Discription: this block creates a long fifo
-- of  lengh of one line and then applies the
-- the first and last byte of the fifo into a 
-- that finally creates horizontal edge detection
-- filter. 
-- note: it uses fifo component to implement the fifo
-- date: Oct.22 ,2001
-- By:  Ahmad darabiha

library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity v_fltr_316 is generic(
		vert_length : integer);
	port(
    tm3_clk_v0 : in std_logic;
	vidin_new_data : in std_logic;
	vidin_in : in std_logic_vector(7 downto 0);
	vidin_out : out std_logic_vector(7 downto 0));
end v_fltr_316;

architecture arch_v_fltr_316 of v_fltr_316 is
--	type tap_array is array(vert_length-1 downto 0) of
--	std_logic_vector(vidin_in'length-1 downto 0);
	
	signal buff_out: tap_array;
	--component fifo
	--	generic(
	--		fifo_w :integer;
	--		fifo_l :integer);
	--	port(
 	 --	clk : in std_logic;
	--	wen : in std_logic;
	--	din : in std_logic_vector(fifo_w-1 downto 0);
	--	dout: out std_logic_vector(fifo_w-1 downto 0));
	--end component;
	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fifo_8b
	port (
	CLK: IN std_logic;
	D: IN std_logic_VECTOR(7 downto 0);
	Q: OUT std_logic_VECTOR(7 downto 0);
	CE: IN std_logic);
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

--	component fltr_compute port(
--			din : in tap_array;
--			dout : out std_logic_vector(7 downto 0)); 
--	end component;


begin
        buff_out(0) <= vidin_in;
--	gen : for i in 0 to vert_length-2 generate
--					ints_fifo_gen : fifo generic map (	vidin_in'length,
--														horiz_length)
--									port map(
--											tm3_clk_v0,
--											vidin_new_data,
--											buff_out(i),
--											buff_out(i+1));
--	end generate;

	gen : for i in 0 to vert_length-2 generate
					ints_fifo_gen : my_fifo_8b
									port map(
											tm3_clk_v0,
											buff_out(i),
											buff_out(i+1),
											vidin_new_data);
	end generate;

	more_inst: my_fifo_8b
				port map(
					tm3_clk_v0,
					buff_out(vert_length-1),
					vidin_out,
					vidin_new_data);

	--inst_fltr_compute : fltr_compute port map(buff_out, 
	--										vidin_out);			
	--vidin_out_or <= buff_out(vert_length-1);		  			
end arch_v_fltr_316;				    		
