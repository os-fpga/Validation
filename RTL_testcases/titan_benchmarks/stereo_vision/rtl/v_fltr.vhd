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

entity v_fltr is generic(
		horiz_length : integer;
		vert_length : integer);
	port(
        tm3_clk_v0 : in std_logic;
	vidin_new_data : in std_logic;
	vidin_in : in std_logic_vector(7 downto 0);
	vidin_out_f1 : out std_logic_vector(15 downto 0);
	vidin_out_f2 : out std_logic_vector(15 downto 0);
	vidin_out_f3 : out std_logic_vector(15 downto 0);
	vidin_out_h1 : out std_logic_vector(15 downto 0);
	vidin_out_h2 : out std_logic_vector(15 downto 0);
	vidin_out_h3 : out std_logic_vector(15 downto 0);
	vidin_out_h4 : out std_logic_vector(15 downto 0);
	vidin_out_or : out std_logic_vector(7 downto 0));
end v_fltr;

architecture arch_v_fltr of v_fltr is
--	type tap_array is array(vert_length-1 downto 0) of
--				std_logic_vector(vidin_in'length-1 downto 0);
	
	signal buff_out: tap_array;
	component fifo
		generic(
			fifo_w :integer;
			fifo_l :integer);
		port(
 	 	clk : in std_logic;
		wen : in std_logic;
		din : in std_logic_vector(fifo_w-1 downto 0);
		dout: out std_logic_vector(fifo_w-1 downto 0));
	end component;
	component fltr_compute_f1 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;

	component fltr_compute_f2 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;

	component fltr_compute_f3 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;
	
	component fltr_compute_h1 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;

	component fltr_compute_h2 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;

	component fltr_compute_h3 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;
  	
	component fltr_compute_h4 port(
			clk:in std_logic;
			din : in std_logic_vector(55 downto 0);
			dout : out std_logic_vector(15 downto 0)); 
	end component;

begin

       -- buff_out(0) <= vidin_in;	--changed in buff_fir_10_bus_2		

	gen : for i in 0 to vert_length-1 generate
					ints_fifo_gen : fifo generic map (	vidin_in'length,
														horiz_length)
									port map(
											tm3_clk_v0,
											vidin_new_data,
											buff_out(i),
											buff_out(i+1));
	end generate;

	inst_fltr_compute_f1 : fltr_compute_f1 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_f1);	

	inst_fltr_compute_f2 : fltr_compute_f2 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_f2);		

	inst_fltr_compute_f3 : fltr_compute_f3 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_f3);	

	inst_fltr_compute_h1 : fltr_compute_h1 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_h1);	

	inst_fltr_compute_h2 : fltr_compute_h2 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_h2);		

	inst_fltr_compute_h3 : fltr_compute_h3 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_h3);	
	
	inst_fltr_compute_h4 : fltr_compute_h4 port map(tm3_clk_v0,
						buff_out(vert_length-6) &
						buff_out(vert_length-5) &
						buff_out(vert_length-4) &
						buff_out(vert_length-3) &
						buff_out(vert_length-2) &
						buff_out(vert_length-1) &
						buff_out(vert_length) , 
						vidin_out_h4);	

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 ='1') then 
			
				buff_out(0) <= vidin_in;
				vidin_out_or <= buff_out(vert_length-1);	
	
		end if;
	end process;	

	-- vidin_out_or <= buff_out(vert_length-1);  --changed in buff_fir_10_bus_2		  			

end arch_v_fltr;				    		
