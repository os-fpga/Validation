use work.mes_noc_pkg.all;

package mesh_2d_pkg is
	type direction is (this, north, south, west, east);
	type col_map is array (0 to mesh_cols_c-1) of integer;
	type network_map is array (0 to mesh_rows_c-1) of col_map;
	type dimension is (row, col);

	function get_clk_index (rows : integer; cols : integer; r : integer; c : integer; num_noc_clks : integer; dir : direction) return integer;
	-- Note: The number of partitions must be a power of 2
	function partition_map (partition : network_map; axis : dimension; row_begin : integer; row_end : integer; col_begin : integer; col_end : integer; num_partitions : integer; first_label : integer) return network_map;
end mesh_2d_pkg;

package body mesh_2d_pkg is

	-- The combination of using this and create_freq_array is not efficient (by a factor of 5 at least) but I don't care because it happens during synthesis not runtime
	-- This code should be made more generic to handle arbitrary numbers of clocks (or at least powers of 2)
	function get_clk_index (rows : integer; cols : integer; r : integer; c : integer; num_noc_clks : integer; dir : direction) return integer is
		type index_array is array (0 to 4) of integer;
		variable temp : index_array;
		variable partition : network_map;
	begin
		partition := partition_map(partition, row, 0, rows-1, 0, cols-1, num_noc_clks, 0);
		-- Assign to the directions
		-- The ifs are to handle the boundaries of the mesh
		temp(0) := partition(r)(c);
		if r = 0 then
			temp(1) := partition(r)(c);
		else
			temp(1) := partition(r-1)(c);
		end if;
		if r = rows-1 then
			temp(2) := partition(r)(c);
		else
			temp(2) := partition(r+1)(c);
		end if;
		if c = 0 then
			temp(3) := partition(r)(c);
		else
			temp(3) := partition(r)(c-1);
		end if;
		if c = cols-1 then
			temp(4) := partition(r)(c);
		else
			temp(4) := partition(r)(c+1);
		end if;
		
		if dir = this then
			return temp(0);
		elsif dir = north then
			return temp(1);
		elsif dir = south then
			return temp(2);
		elsif dir = west then
			return temp(3);
		else
			return temp(4);	
		end if;
	end function get_clk_index;
		
	function partition_map (partition : network_map; axis : dimension; row_begin : integer; row_end : integer; col_begin : integer; col_end : integer; num_partitions : integer; first_label : integer) return network_map is
		variable new_partitions : integer;
		variable partitioned_map : network_map;
		variable next_dim : dimension;
		variable next_row_end : integer;
		variable next_col_end : integer;
		variable next_row_begin : integer;
		variable next_col_begin : integer;
		variable cut_point : integer;
		variable second_label : integer;
	begin
		partitioned_map := partition;
		
		-- The base case
		if (num_partitions = 1) then
				for i in row_begin to row_end loop
					for j in col_begin to col_end loop
						partitioned_map(i)(j) := first_label;
					end loop;
				end loop;
		else
			-- Recurse (divide and conquer)
			
			-- Compute the next split and switch the axis of splitting
			if axis = row then
				-- If we are splitting up rows then cols remain identical
				next_col_end := col_end;
				next_col_begin := col_begin;
				
				cut_point := (row_end - row_begin)/2 + row_begin;
				next_row_end := cut_point;
				next_row_begin := cut_point + 1;
				next_dim := col;
			else
				-- If we are splitting up cols then rows remain identical
				next_row_end := row_end;
				next_row_begin := row_begin;
				
				cut_point := (col_end - col_begin)/2 + col_begin;
				next_col_end := cut_point;
				next_col_begin := cut_point + 1;
				next_dim := row;
			end if;
			
			
			new_partitions := num_partitions / 2;
			second_label := first_label + new_partitions;
			partitioned_map := partition_map(partitioned_map, next_dim, row_begin, 			next_row_end, 	col_begin, 			next_col_end, 	new_partitions, first_label);
			partitioned_map := partition_map(partitioned_map, next_dim, next_row_begin,	row_end,			next_col_begin, 	col_end, 		new_partitions, second_label);
		end if;
		return partitioned_map;
	end function partition_map;
end mesh_2d_pkg;