library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity counter is
  port (
    -- Inputs
    clk : in std_logic;
    rst : in std_logic;
	-- Output
    count : out std_logic_vector(7 downto 0)
  ) ;
end entity;

architecture arch of counter is

signal counter_value : std_logic_vector (7 downto 0 ):="00000000";

begin
    process(clk,rst)
    begin
        if (rst='1') then
            counter_value <= (others => '0');
        elsif (rising_edge(clk)) then
            counter_value <= counter_value + 1;
        end if ;
    end process ; -- identifier
    count <= counter_value;
end architecture ; -- arch