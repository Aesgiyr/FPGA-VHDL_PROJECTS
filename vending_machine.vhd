library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity vending_machine is
	port(
	
		clk            		: in std_logic;
		rst             	: in std_logic;
		money_giris 	    : in std_logic;
		money    			: in std_logic_vector(4 downto 0);
		
		product_ready     	: out std_logic;
		money_ustu		    : out std_logic
		
	);
end entity;

architecture arch of vending_machine is

type state_type is (IDLE, MONEY_IN, PRODUCT_SUBMIT, MONEY_CHANGE);
signal state : state_type;

signal total_money   : std_logic_vector(4 downto 0);
signal missing_money : std_logic;

signal price       : std_logic_vector(4 downto 0);

begin

	price <= "01010";

	process(clk,rst)
	begin
		if(rst='1') then
			state <= IDLE;
			total_money <= (others => '0');
			product_ready <= '0';
			money_ustu <= '0';
			missing_money <= '0';
		elsif(rising_edge(clk)) then
			case state is
				when IDLE =>
					total_money <= (others => '0');
					product_ready <= '0';
					money_ustu <= '0';
					missing_money <= '0';
					
					if(money_giris = '1') then
						state <= MONEY_IN;
						total_money <= total_money + money;
					else
						state <= IDLE;
					end if;
					
				when MONEY_IN =>
					if(money_giris = '1') then
						state <= MONEY_IN;
						total_money <= total_money + money;
					else
						if(total_money >= price) then
							state <= PRODUCT_SUBMIT;
						else
							state <= MONEY_CHANGE;
							missing_money <= '1';
						end if;
						
					end if;
				
				when PRODUCT_SUBMIT =>
					total_money <= total_money - price;
					product_ready <= '1';
					state <= MONEY_CHANGE;
				
				when MONEY_CHANGE =>
				    product_ready <= '0';
					missing_money <= '0';
					if(total_money /= "00000") then
						total_money <= total_money - "00001";
						money_ustu <= '1';
						state <= MONEY_CHANGE;
					else
						state<= IDLE;
						money_ustu <= '0'; 
					end if;
				
				when others =>
					state <= IDLE;
					total_money <= (others => '0');
					product_ready <= '0';
					money_ustu <= '0';
					missing_money <= '0';
					
			end case;
		
		end if;
	end process;

end architecture;