library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity paddle is
   port( 
        clk, rst_n    : in  std_logic;
        p_x, p_y      : in  std_logic_vector(9 downto 0);
        p_r, p_g, p_b : in  std_logic_vector(9 downto 0);
		paddle_1      : buffer std_logic_vector(3 downto 0);
		paddle_2      : buffer std_logic_vector(3 downto 0);
		ball_x, ball_y: buffer std_logic_vector(9 downto 0);
		goal_1, goal_2: out std_logic;
		score_1, score_2: buffer std_logic_vector(2 downto 0)
   );
end paddle;

architecture rtl of paddle is
   type GRID_TYPE is array (0 to 1, 0 to 14) of 
      std_logic_vector(15 downto 0);
   signal grid : GRID_TYPE;

   signal grid_x : std_logic_vector(1 downto 0);
   signal grid_y : std_logic_vector(4 downto 0);

   signal new_frame : std_logic;

   signal best_l, best_r : std_logic_vector(15 downto 0);
   signal left, right : std_logic_vector(3 downto 0);

   signal cnt_time : std_logic_vector(19 downto 0);
   signal is_time : std_logic;

   signal rnd_cnt : std_logic_vector(8 downto 0);

   --signal ball_x, ball_y   : std_logic_vector(9 downto 0);
   signal ball_dx, ball_dy : std_logic_vector(9 downto 0);

   signal y_int_paddle_1,
          y_int_paddle_2   : std_logic;

   signal y_paddle_1, y_paddle_2 : std_logic_vector(9 downto 0);

   signal g1, g2, g3 : std_logic_vector(99 downto 0);

   signal lfsr : std_logic_vector(8 downto 0);
begin

   y_paddle_1(8 downto 5) <= paddle_1;
   y_paddle_1(4 downto 0) <= "00000";

   y_paddle_2(8 downto 5) <= paddle_2;
   y_paddle_2(4 downto 0) <= "00000";

   goal_1 <= g1(0);
   goal_2 <= g2(0);

   process(clk, rst_n)
   begin
	  if rst_n='0' then
	      ball_x <= CONV_STD_LOGIC_VECTOR(320,10);
	      ball_y <= CONV_STD_LOGIC_VECTOR(100,10);
	      ball_dx<= "0000000001";
	      ball_dy<= "0000000001";
          y_int_paddle_1 <= '0';
          y_int_paddle_2 <= '0';
		  g1 <= (others => '0');
		  g2 <= (others => '0');
		  g3 <= (others => '0');
		  score_1 <= (others => '0');
		  score_2 <= (others => '0');
		  lfsr <= (others => '0');
		  rnd_cnt <= (others => '0');
	  elsif clk'event and clk='1' then

          if (ball_y > y_paddle_1-5 and ball_y < y_paddle_1+32+5) OR
             (ball_y+32 > y_paddle_1-5 and ball_y < y_paddle_1+5) then
				y_int_paddle_1 <= '1';
          else
                y_int_paddle_1 <= '0';
          end if;

          if (ball_y > y_paddle_2-5 and ball_y < y_paddle_2+32+5) OR
             (ball_y+32 > y_paddle_2-5 and ball_y < y_paddle_2+5) then
				y_int_paddle_2 <= '1';
          else
                y_int_paddle_2 <= '0';
          end if;


          if is_time='1' then

			  rnd_cnt <= rnd_cnt+1;
			
			
			  if rnd_cnt=lfsr then
				 lfsr(8 downto 1) <= lfsr(7 downto 0);
			     lfsr(0) <= lfsr(8) XNOR lfsr(4);

			     rnd_cnt <= (others => '0');
			
			    --if ball_dy(0)='1' then
				--	ball_dy <= ball_dy(8 downto 0) & "0";
				--else
				--	ball_dy <= ball_dy(9) & ball_dy(9 downto 1);
				--end if;
				
				if ball_dy=1 then
					ball_dy <= (others => '1');
				else
					ball_dy <= "0000000001";
				end if;
			  end if;
			     
	          if ball_x < 8 then
					g1 <= (others => '1');
			  else
					g1 <= '0' & g1(99 downto 1);
			  end if;
		
			  if ball_x+32 > 632 then
			        g2 <= (others => '1');
			  else
					g2 <= '0' & g2(99 downto 1);
			  end if;
	
	          if g3(0)='0' then
	          if g1(1 downto 0)="01" then
				score_1 <= score_1 + 1;
			  end if;
			
			  if g2(1 downto 0)="01" then
			    score_2 <= score_2 + 1;
			  end if;
			  else
			     score_1 <= (others => '0');
			     score_2 <= (others => '0');
			  end if;
			
			  g3(98 downto 0) <= g3(99 downto 1);
			
			  if score_1="111" or score_2="111" then
			    g3(99) <= '1';
			  else
			    g3(99) <= '0';
			  end if;
			
			ball_x <= ball_x + ball_dx;
			ball_y <= ball_y + ball_dy;
			--if  (ball_x+ball_dx=1 OR (ball_y(8 downto 5)=paddle_1 and ball_x+ball_dx=33)) 
			--   OR (ball_x+ball_dx=606 OR (ball_y(8 downto 5)=paddle_2 and ball_x+ball_dx=606-32)) then
			
			if  (ball_x+ball_dx=1 OR (y_int_paddle_1='1' and ball_x+ball_dx=33)) 
			   OR (ball_x+ball_dx=606 OR (y_int_paddle_2='1' and ball_x+ball_dx=606-32)) OR
				((ball_x+ball_dx+32=258 or ball_x+ball_dx=258+126) AND (ball_y>=240-32 AND ball_y<=240+32)) 
				 then
				if ball_dx=1 then
					ball_dx <= (others => '1');
				else
					ball_dx <= "0000000001";
				end if;
			end if;
			
			if ball_y+ball_dy=1 OR ball_y+ball_dy=478-32 OR
			((ball_y+ball_dy+32=240-32 OR ball_y+ball_dy=240+32) AND (ball_x>=258 AND ball_x<=258+125)) then
				if ball_dy=1 then
					ball_dy <= (others => '1');
				else
					ball_dy <= "0000000001";
				end if;
			end if;
		  end if;
	  end if;
   end process;

   process(clk, rst_n)
   begin
      if rst_n='0' then
		cnt_time <= (others => '0');
		is_time <= '0';
      elsif clk'event and clk='1' then
		if cnt_time=4*50000 then
			cnt_time <= (others => '0');
			is_time <= '1';
		else
			cnt_time <= cnt_time+1;
			is_time <= '0';
		end if;
      end if;
   end process;

   grid_y <= "0" & p_y(8 downto 5);
   grid_x <= "00" when (p_x < 320) else "01";

   process(clk, rst_n)
	variable by : std_logic_vector(4 downto 0);
	variable best : std_logic_vector(15 downto 0);
   begin
     if rst_n='0' then
      	for i in 0 to 1 loop
			for j in 0 to 14 loop
				grid(i,j) <= (others => '0');
			end loop;
		end loop;
		new_frame <= '0';
		paddle_1 <= "1000";
		paddle_2 <= "1000";
		left <= "0000";
		right <= "0000";
		
		best_l <= (others => '0');
		best_r <= (others => '0');
      elsif clk'event and clk='1' then
		if NOT (p_x=0 and p_y=0) then
			new_frame <= '1';

			if p_r(9 downto 1) > p_g and p_r(9 downto 1) > p_b and (p_x <240 or p_x>400) then
				grid(CONV_INTEGER(grid_x), CONV_INTEGER(grid_y)) <= grid(CONV_INTEGER(grid_x), CONV_INTEGER(grid_y)) + 1;
				if grid_x="00" and grid(0, CONV_INTEGER(grid_y))+1 > best_l then
					best_l <= grid(0, CONV_INTEGER(grid_y))+1;
					left <= grid_y(3 downto 0);
				end if;
				
				if grid_x="01" and grid(1, CONV_INTEGER(grid_y))+1 > best_r then
					best_r <= grid(1, CONV_INTEGER(grid_y))+1;
					right <= grid_y(3 downto 0);
				end if;
				
			end if; 
			
--			paddle_1 <= "0101";
--			paddle_2 <= "1010";
		else
			best_l <= (others => '0');
			best_r <= (others => '0');

			if new_frame = '1' then			
			if best_l > 1500 then
				paddle_1 <= left;
			--else
			--	paddle_1 <= (others => '1');
			end if;
			
			if best_r > 1500 then
				paddle_2 <= right;
			--else
			--	paddle_2 <= (others => '1');
			end if;
			end if;
			
      		for i in 0 to 1 loop
				for j in 0 to 14 loop
					grid(i,j) <= (others => '0');
				end loop;
			end loop;
			new_frame <= '0';
		end if;
      end if;
   end process; 
end rtl;
