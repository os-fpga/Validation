package mes_noc_pkg is
	-- Use to vary the granularity of clock domains
	-- For now this must be 1, 2 or 4
	-- Only mesh without monitor supports num_noc_clk_domains_c > 1 for now
	constant num_noc_clk_domains_c : integer := 8;
	
	type freq_array is array (0 to num_noc_clk_domains_c-1) of integer;
	
  -- mesh constants
  constant mesh_rows_c : integer := 8;
  constant mesh_cols_c : integer := 8;

end mes_noc_pkg;