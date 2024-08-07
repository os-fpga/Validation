-- A debugging circuit that allows a single cycle pulse to be 
-- generated by through the ports package

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity onlyonecycle is 
  generic(
    pulselength : natural := 1);
  port(
    trigger : in std_logic;
    output  : out std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of onlyonecycle is
  type state_type is (S_IDLE,S_TRIGGERED,S_WAIT);

  signal state : state_type;
  signal next_state : state_type;
  signal count : integer range 0 to pulselength-1;
begin
  Process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      count <= 0;
    elsif (rising_edge(clk)) then
      state <= next_state;
      case state is
        when S_IDLE =>
          count <= pulselength-1;
        when S_TRIGGERED =>
          count <= count;
        when others => 
      end case;
    end if;
  end process;

  process (state, trigger,count)
  Begin
    output <= '0';
    case state IS
      when S_IDLE =>
        if trigger = '1' then
          next_state <= S_TRIGGERED;
        else
          next_state <= S_IDLE;
        end if;
      when S_TRIGGERED =>
        output <= '1';
        if count = 0 then
          next_state <= S_WAIT;
        else
          next_state <= S_TRIGGERED;
        end if;
      when S_WAIT =>
        if trigger = '0' then
          next_state <= S_IDLE;
        else
          next_state <= S_WAIT;
        end if;
    end case;
  end process;

end rtl;
