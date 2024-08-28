library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity scaler is port(
	tm3_clk_v0: in std_logic;
	vidin_new_data: in std_logic;
	vidin_rgb_reg: in std_logic_vector(7 downto 0);
	vidin_addr_reg: in std_logic_vector(3 downto 0);
    vidin_new_data_scld_1: out std_logic;
	vidin_new_data_scld_2: out std_logic;
	vidin_new_data_scld_4: out std_logic;
	vidin_gray_scld_1:out std_logic_vector(7 downto 0);
	vidin_gray_scld_2:out std_logic_vector(7 downto 0);
	vidin_gray_scld_4:out std_logic_vector(7 downto 0));
end scaler;

architecture arch_scaler of scaler is
	
	signal v_fltr_sc_1,v_fltr_sc_2,v_fltr_sc_4:std_logic_vector(7 downto 0);
	signal h_fltr_sc_1,h_fltr_sc_2,h_fltr_sc_4:std_logic_vector(7 downto 0);
 

	component scl_v_fltr is port(
		clk: in std_logic;
		nd : in std_logic;
		d_in: in std_logic_vector(7 downto 0);
		d_out_1: out std_logic_vector(7 downto 0);
		d_out_2: out std_logic_vector(7 downto 0);
		d_out_4: out std_logic_vector(7 downto 0));
	end component;

	component scl_h_fltr is port(
		clk: in std_logic;
		nd : in std_logic;
		d_in_1: in std_logic_vector(7 downto 0);
		d_in_2: in std_logic_vector(7 downto 0);
		d_in_4: in std_logic_vector(7 downto 0);
		d_out_1: out std_logic_vector(7 downto 0);
		d_out_2: out std_logic_vector(7 downto 0);
		d_out_4: out std_logic_vector(7 downto 0));
	end component;
		
begin

	scl_v_fltr_inst: scl_v_fltr port map(
			tm3_clk_v0,
			vidin_new_data,
			vidin_rgb_reg,
			v_fltr_sc_1,
			v_fltr_sc_2,
			v_fltr_sc_4);

	scl_h_fltr_inst: scl_h_fltr port map(
			tm3_clk_v0,
			vidin_new_data,
			v_fltr_sc_1,
			v_fltr_sc_2,
			v_fltr_sc_4,
			h_fltr_sc_1,
			h_fltr_sc_2,
			h_fltr_sc_4); 
	
	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then
			vidin_new_data_scld_1 <= vidin_new_data;
			vidin_new_data_scld_2 <= '0';
			vidin_new_data_scld_4 <= '0';
			if (vidin_new_data = '1')   then  
				vidin_gray_scld_1 <= h_fltr_sc_1; --vidin_rgb_reg;
				if (vidin_addr_reg(0)='0' and vidin_addr_reg(2) = '0') then
					vidin_gray_scld_2 <= h_fltr_sc_2; --vidin_rgb_reg;
					vidin_new_data_scld_2 <= '1';
					if (vidin_addr_reg(1)='0' and vidin_addr_reg(3) = '0') then
						vidin_gray_scld_4 <= h_fltr_sc_4; --vidin_rgb_reg;
						vidin_new_data_scld_4 <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
end arch_scaler;	
			
			
			
			
			
			
			
			
