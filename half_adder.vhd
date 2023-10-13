-- Library: --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity: --
entity half_adder is 
	port(
	
	    -- İnputs: --
		a : in std_logic;
		b : in std_logic;
		-- Outputs: --
		sum : out std_logic;
		carry : out std_logic
	
	);
	
end entity;

-- Architecture: --
architecture arch of half_adder is
begin
	-- Operators: --
	sum <= a xor b;
	carry <= a and b;

end architecture;

