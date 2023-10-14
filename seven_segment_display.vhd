-- Library: --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Entity: --
entity seven_segment_display is
	port(
		-- Inputs: --
		clk	          : in std_logic;
		rst			  : in std_logic;
		user_button	  : in std_logic;
		-- Outputs: --
		a, b, c, d, e, f, g : out std_logic

	);
end entity;

-- Architecture: --
architecture arch of seven_segment_display is 
type state_type is (IDLE, INCREASE_NUMBER);
signal state : state_type;
signal user : std_logic:='0';

signal number : std_logic_vector (3 downto 0):= "0000";

begin

	process(clk,rst)
	begin
		if(rst='1') then
			state <= IDLE;
			number <= (others => '0');
			user <= '0';
			a <= '1';
			b <= '1';
			c <= '1';
			d <= '1';
			e <= '1';
			f <= '1';
			g <= '0';
		elsif (rising_edge(clk)) then
			case state is
				when IDLE =>
				    user<='0';
					if(user_button='1') then
						state <= INCREASE_NUMBER;
						number <= number + "0001";
						user <= '1';
					else
						user<='0';
						state <= IDLE;
					end if;
				when INCREASE_NUMBER =>
					if(user_button='1') then
					   number <= number + "0001";
					   state <= INCREASE_NUMBER;
					   user <= '1';
					else
						if(number="0001") then -- 1
							a <= '0';
							b <= '1';
							c <= '1';
							d <= '0';
							e <= '0';
							f <= '0';
							g <= '0';
							state <= IDLE;
						elsif(number="0010") then -- 2
							a <= '1';
							b <= '1';
							c <= '0';
							d <= '1';
							e <= '1';
							f <= '0';
							g <= '1';
							state <= IDLE;
						elsif(number="0011") then -- 3 
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '1';
							e <= '0';
							f <= '0';
							g <= '1';
							state <= IDLE;
						elsif(number="0100") then -- 4
							a <= '0';
							b <= '1';
							c <= '1';
							d <= '0';
							e <= '0';
							f <= '1';
							g <= '1';
							state <= IDLE;
						elsif(number="0101") then -- 5
							a <= '1';
							b <= '0';
							c <= '1';
							d <= '1';
							e <= '0';
							f <= '1';
							g <= '1';
							state <= IDLE;
						elsif(number="0110") then -- 6
							a <= '1';
							b <= '0';
							c <= '1';
							d <= '1';
							e <= '1';
							f <= '1';
							g <= '1';
							state <= IDLE;
						elsif(number="0111") then -- 7
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '0';
							e <= '0';
							f <= '0';
							g <= '0';
							state <= IDLE;
						elsif(number="1000") then -- 8 
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '1';
							e <= '1';
							f <= '1';
							g <= '1';
							state <= IDLE;
						elsif(number="1001") then -- 9
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '1';
							e <= '0';
							f <= '1';
							g <= '1';
							state <= IDLE;
						elsif(number="1010") then -- 0
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '1';
							e <= '1';
							f <= '1';
							g <= '0';
							number <= (others=>'0');
							state <= IDLE;
						else                     -- 0
							a <= '1';
							b <= '1';
							c <= '1';
							d <= '1';
							e <= '1';
							f <= '1';
							g <= '0';
							number <= (others=>'0');
							state <= IDLE;
						end if;
					end if;
				when others =>
					number <= (others=>'0');
					state <= IDLE;
			end case;
		end if;
	end process;
end architecture;