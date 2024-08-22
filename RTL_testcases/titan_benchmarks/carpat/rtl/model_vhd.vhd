library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
library work;

entity model_vhd is
	generic(
		--12.8 signed or unsigned (based on need)
		VERTEX_FRAC_WIDTH : natural := 8;
		VERTEX_DATA_WIDTH : natural := 12;
		VERTEX_WORD_LENGTH : natural := VERTEX_FRAC_WIDTH + VERTEX_DATA_WIDTH;
		--2.7 signed or unsigned (based on need)
		BARYCENTRIC_FRAC_WIDTH : natural := VERTEX_FRAC_WIDTH;
		BARYCENTRIC_DATA_WIDTH : natural := 2;
		BARYCENTRIC_WORD_LENGTH : natural := BARYCENTRIC_FRAC_WIDTH + BARYCENTRIC_DATA_WIDTH;
        TRI_READER_COORD_WIDTH : natural := 12;
		COLOR_WIDTH : natural := 10;
        MIF_COLOR_WIDTH: natural := 4
		);
	port
	(
		current_x, current_y : in std_logic_vector(9 downto 0);
		vga_clk, sys_clk, sdram_refclk_50mhz, rst27, sdram_reset, nleft, nright, nup, ndown : in std_logic;
		model_r,model_g, model_b : out	std_logic_vector(COLOR_WIDTH-1 downto 0);
        -- sdram pins
        DRAM_DQ : inout std_logic_vector(15 downto 0);
        DRAM_ADDR : out std_logic_vector(11 downto 0);	
        DRAM_LDQM : out std_logic;		
        DRAM_UDQM : out std_logic;	
        DRAM_WE_N : out std_logic;			
        DRAM_CAS_N : out std_logic;				
        DRAM_RAS_N : out std_logic;			
        DRAM_CS_N : out std_logic;				
        DRAM_BA_0 : out std_logic;			
        DRAM_BA_1 : out std_logic;				
        DRAM_CLK : out std_logic;			
        DRAM_CKE : out std_logic;
		request : in std_logic;
        debug_frame_done : out std_logic;
		w1_full : out std_logic; 
		w2_full : out std_logic;
		r1_empty : out std_logic;
		r2_empty : out std_logic;
        count_diff : out std_logic_vector(9 downto 0);
		intersected_tri_out : out std_logic_vector(0 downto 0);
		rotx, roty, rotz : in std_logic;
		do_z_buffer : in std_logic;
        accumulate : in std_logic
	);

end entity;

architecture rtl of model_vhd is

	signal hitout : std_logic;
	
	component trinormal is
	generic (
		VERTEX_FRAC_WIDTH : natural;
		VERTEX_DATA_WIDTH : natural;
		VERTEX_WORD_LENGTH : natural;
		BARY_FRAC_WIDTH : natural;
		BARY_DATA_WIDTH : natural;
		BARY_WORD_LENGTH : natural
	);
	port(
		e1x,e1y,e1z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		e2x,e2y,e2z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		NNx,NNy,NNz : out std_logic_vector(BARY_WORD_LENGTH-1 downto 0);
		clk : in std_logic);
	end component ;
	

	component myray_test is
	generic(
		VERTEX_FRAC_WIDTH : natural;
		VERTEX_DATA_WIDTH : natural;
		VERTEX_WORD_LENGTH : natural;
		BARYCENTRIC_FRAC_WIDTH : natural;
		BARYCENTRIC_DATA_WIDTH : natural;
		BARYCENTRIC_WORD_LENGTH : natural;
		COLOR_WIDTH : natural
		);
	port(
		clk : in std_logic;
		
		v0x : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		v0y : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		v0z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	

		edge1x : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		edge1y : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		edge1z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	

		edge2x : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		edge2y : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		edge2z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	
		
		origx : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		origy : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		origz : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	

		eyex : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		eyey : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		eyez : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	
		
		lightx : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		lighty : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		lightz : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	

                red_in, green_in, blue_in : in std_logic_vector(COLOR_WIDTH - 1 downto 0);

		tri_normal_x,tri_normal_y,tri_normal_z : in std_logic_vector(BARYCENTRIC_WORD_LENGTH-1 downto 0);	
		intersected_tri : out std_logic_vector(0 downto 0);
        intersect_x : out std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        intersect_y : out std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        intersect_z : out std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		
		red_out, green_out, blue_out : out std_logic_vector(COLOR_WIDTH - 1 downto 0)

		);
	end component;

    ----------------	
	component new_multi_tri is
	port (
		vga_clk: in std_logic;
		sys_clk: in std_logic;
        sdram_refclk_50mhz : in std_logic;
		reset: in std_logic;
        sdram_reset : in std_logic;
		intersected_tri : in std_logic_vector(0 downto 0);
       	intersect_x : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        intersect_y : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        intersect_z : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        intersect_r, intersect_g, intersect_b : in std_logic_vector(COLOR_WIDTH-1 downto 0);
		tri_reader_vertex_x, tri_reader_vertex_y, tri_reader_vertex_z: out std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
		tri_reader_edge1_x, tri_reader_edge1_y, tri_reader_edge1_z: out std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
		tri_reader_edge2_x, tri_reader_edge2_y, tri_reader_edge2_z: out std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
		tri_reader_r, tri_reader_g, tri_reader_b: out std_logic_vector(MIF_COLOR_WIDTH-1 downto 0);
        final_r, final_g, final_b : out std_logic_vector(COLOR_WIDTH-1 downto 0);
         -- sdram pins
        DRAM_DQ : inout std_logic_vector(15 downto 0);
        DRAM_ADDR : out std_logic_vector(11 downto 0);	
        DRAM_LDQM : out std_logic;		
        DRAM_UDQM : out std_logic;	
        DRAM_WE_N : out std_logic;			
        DRAM_CAS_N : out std_logic;				
        DRAM_RAS_N : out std_logic;			
        DRAM_CS_N : out std_logic;				
        DRAM_BA_0 : out std_logic;			
        DRAM_BA_1 : out std_logic;				
        DRAM_CLK : out std_logic;			
        DRAM_CKE : out std_logic;
        -- other sdram signals
      
		debug_x : in std_logic_vector(9 downto 0);
		debug_y : in std_logic_vector(9 downto 0);
		request : in std_logic;
		debug_frame_done : out std_logic;
				  w1_full : out std_logic; 
				  w2_full : out std_logic;
			      r1_empty : out std_logic;
				  r2_empty : out std_logic;
        count_diff : out std_logic_vector(9 downto 0);
        write_x : out std_logic_vector(9 downto 0);
        write_y : out std_logic_vector(9 downto 0);
		next_pixel_out : out std_logic;
        accumulate : in std_logic;
        rot_eyex : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        rot_eyey : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        rot_eyez : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
        next_pixel_in : in std_logic
        );			
	end component;    

    signal request_triangle: std_logic := '1';
	signal x, origx : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal y, origy : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	
	---Triangle-------------------------------------------
	signal v0x : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal v0y : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal v0z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);

    signal tri_reader_vertex_x : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_vertex_y : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_vertex_z : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);   

	---Edge1----------------------------------------------

    signal edge1x : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal edge1y : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal edge1z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
    
    signal tri_reader_edge1_x : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_edge1_y : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_edge1_z : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
        
	-------------------------------------------------

	---Edge2----------------------------------------------
	signal edge2x : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal edge2y : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal edge2z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
    
    signal tri_reader_edge2_x : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_edge2_y : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
	signal tri_reader_edge2_z : std_logic_vector(TRI_READER_COORD_WIDTH-1 downto 0);
    
	-------------------------------------------------
    signal tri_reader_r, tri_reader_g, tri_reader_b: std_logic_vector(MIF_COLOR_WIDTH-1 downto 0);
    signal red_in, green_in, blue_in : std_logic_vector(COLOR_WIDTH-1 downto 0);

    ---Intersection results ----------------------------------------------
	signal intersect_x : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal intersect_y : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal intersect_z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
   
    signal sig_intersected_tri : std_logic_vector(0 downto 0);

    signal intersect_r : std_logic_vector(COLOR_WIDTH-1 downto 0);
    signal intersect_g : std_logic_vector(COLOR_WIDTH-1 downto 0);
    signal intersect_b : std_logic_vector(COLOR_WIDTH-1 downto 0);

    -- Current x,y being computed
    signal write_x : std_logic_vector(9 downto 0);
    signal write_y : std_logic_vector(9 downto 0);

	--/////////// Viewing information /////////////////////////////////////////////////
	--We will first move and then rotate

    -- signal clk : std_logic := sys_clk;
	signal next_pixel_in : std_logic_vector(0 downto 0);
	signal next_pixel_in_delay_60 : std_logic_vector(0 downto 0);	
	signal origz : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0) := conv_std_logic_vector(shl(conv_signed(0, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);

	signal eyex : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0) := conv_std_logic_vector(shl(conv_signed(0, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
	signal eyey : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0) := conv_std_logic_vector(shl(conv_signed(0, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
	signal eyez : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0) := conv_std_logic_vector(shl(conv_signed(0, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);

	signal rot_eyex, rot_eyey, rot_eyez : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal rot_origx, rot_origy, rot_origz : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal add_eyex, add_eyey, add_eyez : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal add_origx, add_origy, add_origz : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	
	-------------------------------------------------

	signal eye_adder : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	
	signal orig_adder : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);	
	
	constant all_zeros : std_logic_vector(9 downto 0) := (others => '0');	
	constant bits_for_1 : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0) := conv_std_logic_vector(shl(conv_signed(1, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
	
	constant x_max_1 : std_logic_vector(9 downto 0) := conv_std_logic_vector(conv_unsigned(639, 10), 10);
	constant y_max_1 : std_logic_vector(9 downto 0) := conv_std_logic_vector(conv_unsigned(479, 10), 10);

	signal NNx,NNy,NNz : std_logic_vector(BARYCENTRIC_WORD_LENGTH-1 downto 0);	
	
	--Angles from 0 to 359 degrees.
	constant ANGLE_WIDTH: natural := 9;
	signal xtheta : std_logic_vector(ANGLE_WIDTH -1 downto 0) := (others => '0');
	signal ytheta : std_logic_vector(ANGLE_WIDTH -1 downto 0) := (others => '0');
	signal ztheta : std_logic_vector(ANGLE_WIDTH -1 downto 0) := (others => '0');
	signal xtheta_adder, ytheta_adder, ztheta_adder : std_logic_vector(ANGLE_WIDTH -1 downto 0) := (others => '0');
	
	component rotate_pt_xyz is
	generic 
	(
		VERTEX_FRAC_WIDTH : natural;
		VERTEX_DATA_WIDTH : natural;
		VERTEX_WORD_LENGTH : natural;
		ANGLE_WIDTH : natural
	);
	port 
	(
		clk		: in std_logic;
		rst		: in std_logic;
		anglex, angley, anglez	: in std_logic_vector((ANGLE_WIDTH -1) downto 0);
		Ax,Ay,Az : in std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
		Px,Py,Pz : out std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0)
	);
	end component;
	
	--///////////////////////////////////////////////
	
	component delay is
	generic (
	width : natural;
	depth : natural);
	port(
	datain : in std_logic_vector(width-1 downto 0);
	dataout : out std_logic_vector(width-1 downto 0);
	clk : in std_logic);
	end component;
	
	component vectdelay is
	generic (
	width : natural;
	depth : natural);
	port(
	xin,yin,zin : in std_logic_vector(width-1 downto 0);
	xout,yout,zout : out std_logic_vector(width-1 downto 0);
	clk : in std_logic);
	end component;
	
	signal delay_10_red_in, delay_10_green_in, delay_10_blue_in : std_logic_vector(COLOR_WIDTH - 1 downto 0);
	signal delay_10_v0x, delay_10_v0y, delay_10_v0z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal delay_10_edge1x, delay_10_edge1y, delay_10_edge1z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	signal delay_10_edge2x, delay_10_edge2y, delay_10_edge2z : std_logic_vector(VERTEX_WORD_LENGTH-1 downto 0);
	
begin

	---Viewing transformations...
	---Cycle-1 all adder calculations

	eye_adder <= conv_std_logic_vector(shl(conv_signed(-600, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
	orig_adder <= conv_std_logic_vector(shl(conv_signed(-300, VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);

	--rotate about x
	process(sys_clk) is 
	begin 
		if(rising_edge(sys_clk)) then
			-- if((rotx = '1') and (write_x = x_max_1) and (write_y = y_max_1) and (next_pixel_in(0) = '1') ) then
            if((rotx = '1') and (write_x = 0) and (write_y = 0) and (next_pixel_in(0) = '1') ) then
				xtheta_adder <= xtheta_adder + 1;
				if (xtheta_adder = "101101000") then --360
					xtheta_adder <= (others => '0');
				end if;					
			else 
				if (rotx = '0') then
					xtheta_adder <= (others => '0');
				end if;					
			end if;
		end if;
	end process; 

	--rotate about y
	process(sys_clk) is 
	begin 
		if(rising_edge(sys_clk)) then
			-- if((roty = '1') and (write_x = x_max_1) and (write_y = y_max_1) and (next_pixel_in(0) = '1') ) then
            if((roty = '1') and (write_x = 0) and (write_y = 0) and (next_pixel_in(0) = '1') ) then
				ytheta_adder <= ytheta_adder + 10;
				if (ytheta_adder = "101101000") then --360
					ytheta_adder <= (others => '0');
				end if;					
			else 
				if (roty = '0') then
					ytheta_adder <= (others => '0');
				end if;					
			end if;
		end if;
	end process; 

	--rotate about Z
	ztheta_adder <= (others => '0');
		
	--cycle-2 
	process(sys_clk) is 
	begin 
		if(rising_edge(sys_clk)) then
			add_eyez <= eyez + eye_adder;
			add_origz <= origz + orig_adder;
			xtheta <= xtheta_adder;
			ytheta <= ytheta_adder;
			ztheta <= ztheta_adder;
		end if;
	end process; 
	
	add_eyex <= eyex;
	add_eyey <= eyey;
	add_origx <= origx;
	add_origy <= origy;

	x <= conv_std_logic_vector(signed(write_x) - conv_signed(320, write_x'length), VERTEX_WORD_LENGTH);
	y <= conv_std_logic_vector(conv_signed(240, write_y'length) - signed(write_y), VERTEX_WORD_LENGTH);

	origx <= conv_std_logic_vector(shl(signed(x), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
	origy <= conv_std_logic_vector(shl(signed(y), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);


-------------------------------------------------------------------------------
--Rotate Eye around xyz
	rotate_eye : rotate_pt_xyz 
	generic map
	(
		VERTEX_FRAC_WIDTH, VERTEX_DATA_WIDTH, VERTEX_WORD_LENGTH, ANGLE_WIDTH
	)
	port map 
	(
		sys_clk, 
		rst27,
		xtheta, ytheta, ztheta,
		add_eyex, add_eyey, add_eyez,
		rot_eyex, rot_eyey, rot_eyez
	);
	
--Rotate origin around xyz
	rotate_orig : rotate_pt_xyz 
	generic map
	(
		VERTEX_FRAC_WIDTH, VERTEX_DATA_WIDTH, VERTEX_WORD_LENGTH, ANGLE_WIDTH
	)
	port map 
	(
		sys_clk, 
		rst27,
		xtheta, ytheta, ztheta,
		add_origx, add_origy, add_origz,
		rot_origx, rot_origy, rot_origz
	);	
--------------------------------------------------------------------------------
	--tri-normal happens in parallel from cycle-1
	--Need to have a triangle here and pre-compute its normalized normal
	calc_triangle_normal : trinormal
	generic map(
		VERTEX_FRAC_WIDTH,
		VERTEX_DATA_WIDTH,
		VERTEX_WORD_LENGTH,
		BARYCENTRIC_FRAC_WIDTH,
		BARYCENTRIC_DATA_WIDTH,
		BARYCENTRIC_WORD_LENGTH
	)
	port map(
		edge1x,edge1y,edge1z,
		edge2x,edge2y,edge2z,
		NNx,NNy,NNz,
		sys_clk);
		
	--By now 10 cycles of the viewing transformations are done.
	--so 11th cycles will start the ray-test
	
	--so, we have to delay the v0, E1 and E2 10 cycles to match the availability of the rot_*
	--same way we have to delay and RGB
	v0delaya : vectdelay
	generic map(VERTEX_WORD_LENGTH,10)
	port map (v0x,v0y,v0z,delay_10_v0x, delay_10_v0y, delay_10_v0z,sys_clk);
	
	edge2delaya : vectdelay
	generic map(edge2x'length,10)
	port map (edge2x,edge2y,edge2z,delay_10_edge2x, delay_10_edge2y, delay_10_edge2z,sys_clk);

	edge1adelay : vectdelay
	generic map (edge1x'length,10)
	port map (edge1x,edge1y,edge1z,delay_10_edge1x, delay_10_edge1y, delay_10_edge1z,sys_clk);
	
	colordelay : vectdelay
	generic map(red_in'length,10)
	port map (red_in, green_in, blue_in,delay_10_red_in, delay_10_green_in, delay_10_blue_in, sys_clk);


	--cycle#11 to 60 (total 49 cycles)
	myray_test_inst : myray_test 
	generic map
	(
		VERTEX_FRAC_WIDTH,
		VERTEX_DATA_WIDTH,
		VERTEX_WORD_LENGTH,
		BARYCENTRIC_FRAC_WIDTH,
		BARYCENTRIC_DATA_WIDTH,
		BARYCENTRIC_WORD_LENGTH,
		COLOR_WIDTH
	)
	port map (
		sys_clk,
		delay_10_v0x, delay_10_v0y, delay_10_v0z,
		delay_10_edge1x, delay_10_edge1y, delay_10_edge1z,
		delay_10_edge2x, delay_10_edge2y, delay_10_edge2z,
		rot_origx, rot_origy, rot_origz,
		rot_eyex, rot_eyey, rot_eyez,
		rot_eyex, rot_eyey, rot_eyez,
        delay_10_red_in, delay_10_green_in, delay_10_blue_in,
		NNx,NNy,NNz,
        sig_intersected_tri,
        intersect_x, intersect_y,
        intersect_z,
		intersect_r, intersect_g, intersect_b
		);

	--delay pixelin 60 cycles to match model's results
	pixelindelay : delay generic map (next_pixel_in'length,60) port map(next_pixel_in,next_pixel_in_delay_60,sys_clk);
	

    -- move to another module
    my_multi_tri : new_multi_tri
    port map (
                  vga_clk => vga_clk, sys_clk => sys_clk,
                  sdram_refclk_50mhz => sdram_refclk_50mhz,
                  reset => rst27,
                  sdram_reset => sdram_reset,
				  intersected_tri => sig_intersected_tri,
       			  intersect_x => intersect_x,
        		  intersect_y => intersect_y,
        		  intersect_z => intersect_z,
                  intersect_r => intersect_r,
                  intersect_g => intersect_g,
                  intersect_b => intersect_b,
				  tri_reader_vertex_x => tri_reader_vertex_x, tri_reader_vertex_y => tri_reader_vertex_y, tri_reader_vertex_z => tri_reader_vertex_z,
				  tri_reader_edge1_x => tri_reader_edge1_x, tri_reader_edge1_y => tri_reader_edge1_y, tri_reader_edge1_z => tri_reader_edge1_z,
				  tri_reader_edge2_x => tri_reader_edge2_x, tri_reader_edge2_y => tri_reader_edge2_y, tri_reader_edge2_z => tri_reader_edge2_z,
				  tri_reader_r => tri_reader_r, tri_reader_g => tri_reader_g, tri_reader_b => tri_reader_b,
                  final_r => model_r, final_g => model_g, final_b => model_b,
                  DRAM_DQ => DRAM_DQ,
                  DRAM_ADDR => DRAM_ADDR,
                  DRAM_LDQM => DRAM_LDQM,	
                  DRAM_UDQM => DRAM_UDQM,
                  DRAM_WE_N => DRAM_WE_N, 		
                  DRAM_CAS_N => DRAM_CAS_N,				
                  DRAM_RAS_N => DRAM_RAS_N,  		
                  DRAM_CS_N => DRAM_CS_N,			
                  DRAM_BA_0 => DRAM_BA_0,		
                  DRAM_BA_1 => DRAM_BA_1, 		
                  DRAM_CLK => DRAM_CLK, 			
                  DRAM_CKE =>  DRAM_CKE,
				  debug_x => current_x,
				  debug_y => current_y,
				  request => request,
                  debug_frame_done => debug_frame_done,
				  w1_full => w1_full,
				  w2_full => w2_full,
			      r1_empty => r1_empty,
				  r2_empty => r2_empty,
                  count_diff => count_diff,                 
                  write_x => write_x,
                  write_y => write_y,
				  next_pixel_out => next_pixel_in(0),
                  accumulate => accumulate,
                  rot_eyex => rot_eyex,
                  rot_eyey => rot_eyey,
                  rot_eyez => rot_eyez,
                  next_pixel_in => next_pixel_in_delay_60(0)
                  );
	
    -- v0x, v0y and v0z
    v0x <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_vertex_x), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
    v0y <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_vertex_y), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);       
	v0z <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_vertex_z), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);   
 
    -- edge1x, edge1y and edge1z
    edge1x <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge1_x), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
    edge1y <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge1_y), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);      
	edge1z <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge1_z), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);

    -- edge2x, edge2y and edge2z
    edge2x <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge2_x), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);
    edge2y <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge2_y), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);      
	edge2z <= conv_std_logic_vector(shl(conv_signed(conv_integer(tri_reader_edge2_z), VERTEX_WORD_LENGTH), conv_unsigned(VERTEX_FRAC_WIDTH, 32)), VERTEX_WORD_LENGTH);

    -- colors from the MIF reader
    red_in(COLOR_WIDTH-1 downto COLOR_WIDTH-4) <= tri_reader_r;
    red_in(COLOR_WIDTH-5 downto COLOR_WIDTH-8) <= tri_reader_r;
    red_in(COLOR_WIDTH-9 downto 0) <= "00";

    green_in(COLOR_WIDTH-1 downto COLOR_WIDTH-4) <= tri_reader_g;
    green_in(COLOR_WIDTH-5 downto COLOR_WIDTH-8) <= tri_reader_g;
    green_in(COLOR_WIDTH-9 downto 0) <= "00";

    blue_in(COLOR_WIDTH-1 downto COLOR_WIDTH-4) <= tri_reader_b;
    blue_in(COLOR_WIDTH-5 downto COLOR_WIDTH-8) <= tri_reader_b;
    blue_in(COLOR_WIDTH-9 downto 0) <= "00";

	intersected_tri_out <= sig_intersected_tri;
    
end rtl;
