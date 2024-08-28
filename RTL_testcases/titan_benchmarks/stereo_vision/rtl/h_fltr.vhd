-- Discription: this block creates a long fifo
-- of  lengh of one line and then applies the
-- the first and last byte of the fifo into a 
-- that finally creates horizontal edge detection
-- filter. 
-- note: it uses fifo component to implement the fifo
-- date: Oct.7 ,2001
-- By:  Ahmad darabiha

library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity h_fltr is port(
        tm3_clk_v0 : in std_logic;
	vidin_new_data : in std_logic;
	vidin_in_f1 : in std_logic_vector(15 downto 0);
	vidin_in_f2 : in std_logic_vector(15 downto 0);
	vidin_in_f3 : in std_logic_vector(15 downto 0);
	vidin_in_h1 : in std_logic_vector(15 downto 0);
	vidin_in_h2 : in std_logic_vector(15 downto 0);
	vidin_in_h3 : in std_logic_vector(15 downto 0);
	vidin_in_h4 : in std_logic_vector(15 downto 0);
	real_z_reg: out std_logic_vector(15 downto 0);
	imag_z_reg: out std_logic_vector(15 downto 0);
	real_p_reg: out std_logic_vector(15 downto 0);
	imag_p_reg: out std_logic_vector(15 downto 0);
	real_n_reg: out std_logic_vector(15 downto 0);
	imag_n_reg: out std_logic_vector(15 downto 0));
end h_fltr;

architecture arch_h_fltr of h_fltr is
	
	signal vidin_out_temp_f1: std_logic_vector(27 downto 0);
	signal vidin_out_reg_f1: std_logic_vector(27 downto 0);
	signal my_fir_rdy_f1: std_logic;
	
	signal vidin_out_temp_f2: std_logic_vector(27 downto 0);
	signal vidin_out_reg_f2: std_logic_vector(27 downto 0);
	signal my_fir_rdy_f2: std_logic;
	
	signal vidin_out_temp_f3: std_logic_vector(27 downto 0);
	signal vidin_out_reg_f3: std_logic_vector(27 downto 0);
	signal my_fir_rdy_f3: std_logic;

	signal vidin_out_temp_h1: std_logic_vector(27 downto 0);
	signal vidin_out_reg_h1: std_logic_vector(27 downto 0);
	signal my_fir_rdy_h1: std_logic;
	
	signal vidin_out_temp_h2: std_logic_vector(27 downto 0);
	signal vidin_out_reg_h2: std_logic_vector(27 downto 0);
	signal my_fir_rdy_h2: std_logic;
	
	signal vidin_out_temp_h3: std_logic_vector(27 downto 0);
	signal vidin_out_reg_h3: std_logic_vector(27 downto 0);
	signal my_fir_rdy_h3: std_logic;

	signal vidin_out_temp_h4: std_logic_vector(27 downto 0);
	signal vidin_out_reg_h4: std_logic_vector(27 downto 0);
	signal my_fir_rdy_h4: std_logic;

	signal sum_tmp_1,sum_tmp_2,sum_tmp_3,sum_tmp_4: std_logic_vector(28 downto 0); 
	--signal sum_tmp_5,sum_tmp_6: std_logic_vector(29 downto 0);              -------- modified in patt_..._14
	signal sum_tmp_5: std_logic_vector(30 downto 0);
	--signal sum_tmp_7: std_logic_vector(30 downto 0); 

	signal real_p, imag_p,real_z,imag_z,real_n,imag_n :std_logic_vector(15 downto 0);	
	signal tmp : std_logic_vector(16 downto 0);	

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_f1
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_f2
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_f3
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

----------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_h1
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_h2
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_h3
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_fir_h4
	port (
	ND: IN std_logic;
	RDY: OUT std_logic;
	CLK: IN std_logic;
	RFD: OUT std_logic;
	DIN: IN std_logic_VECTOR(15 downto 0);
	DOUT: OUT std_logic_VECTOR(27 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------



component steer_fltr 
		 port(
		clk: in std_logic;
		new_data: in std_logic;
		f1: in std_logic_vector(27 downto 0);
		f2: in std_logic_vector(27 downto 0);
		f3: in std_logic_vector(27 downto 0);
		h1: in std_logic_vector(27 downto 0);
		h2: in std_logic_vector(27 downto 0);
		h3: in std_logic_vector(27 downto 0);
		h4: in std_logic_vector(27 downto 0);
		re_z : out std_logic_vector(15 downto 0);
		im_z : out std_logic_vector(15 downto 0);
		re_p : out std_logic_vector(15 downto 0);
		im_p : out std_logic_vector(15 downto 0);
		re_n : out std_logic_vector(15 downto 0);
		im_n : out std_logic_vector(15 downto 0));
end component;

begin
        
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_f1 : my_fir_f1
		port map (
			vidin_new_data,
			my_fir_rdy_f1,
			tm3_clk_v0,
			open,
			vidin_in_f2,
		vidin_out_temp_f1);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
   
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_f2 : my_fir_f2
		port map (
			vidin_new_data,
			my_fir_rdy_f2,
			tm3_clk_v0,
			open,
			vidin_in_f1,
		vidin_out_temp_f2);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
   
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_f3 : my_fir_f3
		port map (
			vidin_new_data,
			my_fir_rdy_f3,
			tm3_clk_v0,
			open,
			vidin_in_f3,
		vidin_out_temp_f3);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

       
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_h1 : my_fir_h1
		port map (
			vidin_new_data,
			my_fir_rdy_h1,
			tm3_clk_v0,
			open,
			vidin_in_h2,
		vidin_out_temp_h1);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
   
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_h2 : my_fir_h2
		port map (
			vidin_new_data,
			my_fir_rdy_h2,
			tm3_clk_v0,
			open,
			vidin_in_h1,
		vidin_out_temp_h2);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
   
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_h3 : my_fir_h3
		port map (
			vidin_new_data,
			my_fir_rdy_h3,
			tm3_clk_v0,
			open,
			vidin_in_h4,
		vidin_out_temp_h3);
-- INST_TAG_END ------ End INSTANTIATION Template ------------


------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_h4 : my_fir_h4
		port map (
			vidin_new_data,
			my_fir_rdy_h4,
			tm3_clk_v0,
			open,
			vidin_in_h3,
		vidin_out_temp_h4);
-- INST_TAG_END ------ End INSTANTIATION Template ------------



----------------- new added in ...._14 -----------------
		my_steer_fltr_inst:  steer_fltr
								port map(
										tm3_clk_v0,
										vidin_new_data,
										vidin_out_reg_f1,
										vidin_out_reg_f2,
										vidin_out_reg_f3,
										vidin_out_reg_h1,
										vidin_out_reg_h2,
										vidin_out_reg_h3,
										vidin_out_reg_h4,
										real_z,
										imag_z,
										real_p,
										imag_p,
										real_n,
										imag_n);
										
				

process(tm3_clk_v0) begin
	if(tm3_clk_v0'event and tm3_clk_v0 = '1') then
		if my_fir_rdy_f1 = '1' then
			vidin_out_reg_f1 <= vidin_out_temp_f1;
		end if;
		
		if my_fir_rdy_f2 = '1' then
			vidin_out_reg_f2 <= vidin_out_temp_f2;
		end if;
		
		if my_fir_rdy_f3 = '1' then
			vidin_out_reg_f3 <= vidin_out_temp_f3; 
		end if;
	
		if my_fir_rdy_h1 = '1' then
			vidin_out_reg_h1 <= vidin_out_temp_h1; 
		end if;
		
		if my_fir_rdy_h2 = '1' then
			vidin_out_reg_h2 <= vidin_out_temp_h2;
		end if;

		if my_fir_rdy_h3 = '1' then
			vidin_out_reg_h3 <= vidin_out_temp_h3;
		end if;
		
		if my_fir_rdy_h4 = '1' then
			vidin_out_reg_h4 <= vidin_out_temp_h4; 
		end if;
		
				--	sum_tmp <= (vidin_out_reg_f1(28) & vidin_out_reg_f1(28) & vidin_out_reg_f1(28) & vidin_out_reg_f1(28 downto 0))+
		--			 (vidin_out_reg_f2(28) & vidin_out_reg_f2(28) & vidin_out_reg_f2(28) & vidin_out_reg_f2(28 downto 0))+
		--			 (vidin_out_reg_f3(28) & vidin_out_reg_f3(28) & vidin_out_reg_f3(28) & vidin_out_reg_f3(28 downto 0))+
		--			 (vidin_out_reg_h1(28) & vidin_out_reg_h1(28) & vidin_out_reg_h1(28) & vidin_out_reg_h1(28 downto 0))+
		--			 (vidin_out_reg_h2(28) & vidin_out_reg_h2(28) & vidin_out_reg_h2(28) & vidin_out_reg_h2(28 downto 0))+
		--			 (vidin_out_reg_h3(28) & vidin_out_reg_h3(28) & vidin_out_reg_h3(28) & vidin_out_reg_h3(28 downto 0))+
		--	       	 (vidin_out_reg_h4(28) & vidin_out_reg_h4(28) & vidin_out_reg_h4(28) & vidin_out_reg_h4(28 downto 0));
		
		-----------------------------------------------------------------------------------------
		------------modified in patt_...._14-----------------------------------------------------
		-----------------------------------------------------------------------------------------
		--sum_tmp_1 <=  (vidin_out_reg_f1(27) & vidin_out_reg_f1(27 downto 0))+
		--			  (vidin_out_reg_f2(27) & vidin_out_reg_f2(27 downto 0));
		
		--sum_tmp_2 <= ( vidin_out_reg_f3(27) & vidin_out_reg_f3(27 downto 0))+
		--			 ( vidin_out_reg_h1(27) & vidin_out_reg_h1(27 downto 0));
		
		--sum_tmp_3 <= ( vidin_out_reg_h2(27) & vidin_out_reg_h2(27 downto 0))+
		--			 ( vidin_out_reg_h3(27) & vidin_out_reg_h3(27 downto 0));
		
		--sum_tmp_4 <= ( vidin_out_reg_h4(27) & vidin_out_reg_h4(27 downto 0));
		
		--sum_tmp_5 <= (sum_tmp_1(28) & sum_tmp_1)+
		--			(sum_tmp_2(28) & sum_tmp_2);
	 
		--sum_tmp_6 <= (sum_tmp_3(28) & sum_tmp_3)+
		--			(sum_tmp_4(28) & sum_tmp_4);
	 
		--sum_tmp_7 <= (sum_tmp_5(29) & sum_tmp_5)+
		--				(sum_tmp_6(29) & sum_tmp_6);

		---------------------------------------------------------------------------------------------
		--sum_tmp_1 <=  (vidin_out_reg_f1(27) & vidin_out_reg_f1(27 downto 0))+
		--			  (vidin_out_reg_f2(27) & vidin_out_reg_f2(27 downto 0));
		
		--sum_tmp_2 <= ( vidin_out_reg_f3(27) & vidin_out_reg_f3(27 downto 0)); ---+
								 --( vidin_out_reg_h1(27) & vidin_out_reg_h1(27 downto 0));
		
		--sum_tmp_3 <= ( vidin_out_reg_h2(27) & vidin_out_reg_h2(27 downto 0))+
		--			 ( vidin_out_reg_h3(27) & vidin_out_reg_h3(27 downto 0));
		
		--sum_tmp_4 <= ( vidin_out_reg_h4(27) & vidin_out_reg_h4(27 downto 0));
		
		--------   o1= 0.5(f1(.))-(f3(.))+0.5(f2(.))---------------------------------------  
		--sum_tmp_5 <= (sum_tmp_1(28) & sum_tmp_1(28) & sum_tmp_1) -                      -- +
		--			(sum_tmp_2(28) & sum_tmp_2 & '0');       --(sum_tmp_2(28) & sum_tmp_2);
		-----------------------------------------------------------------------------------	 

		--sum_tmp_6 <= (sum_tmp_3(28) & sum_tmp_3)+
		--			(sum_tmp_4(28) & sum_tmp_4);
	 
		--sum_tmp_7 <= (sum_tmp_5(29) & sum_tmp_5)+
		--				(sum_tmp_6(29) & sum_tmp_6);

		--vidin_out <= sum_tmp_7(30) & sum_tmp_7(25 downto 19);
		

								
								
		--vidin_out <= sum_tmp_5(30) & sum_tmp_5(25 downto 19);
		
		--tmp <= (real_p(15) & real_p) + (imag_p(15) & imag_p); 
		--vidin_out <= tmp(16 downto 9);
	end if;

end process;

process( tm3_clk_v0) begin
	if(tm3_clk_v0'event and tm3_clk_v0 = '1') then
		
		--tmp <= (real_p(15) & real_p) + (imag_p(15) & imag_p); 
		--vidin_out <= tmp(16 downto 9);
		
		real_z_reg <= real_z;
		imag_z_reg <= imag_z;
		
		real_p_reg <= real_p;
		imag_p_reg <= imag_p;
		
		real_n_reg <= real_n;
		imag_n_reg <= imag_n;

	end if;
end process;	

end arch_h_fltr;				    		
