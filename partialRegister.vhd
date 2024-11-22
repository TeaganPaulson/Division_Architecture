library ieee;
use ieee.std_logic_1164.all;

entity partialRegister is
	port(start,load,shift,clk,rst: in std_logic;
			numerator: in std_logic_vector(7 downto 0);
			num: in std_logic_vector(5 downto 0);
			output: out std_logic_vector(5 downto 0));
end partialRegister;
architecture partialRegister_arch of partialRegister is 
	signal reg: std_logic_vector(9 downto 0):="0000000000";
	signal msb: std_logic;
begin
	output<=reg(9 downto 4);
	
	process(clk,rst,start,shift,load)
	begin
		
		if clk'event and clk = '1' then
				if rst ='1' then 
					reg<="0000000000";
				elsif start = '1' then
					reg(7 downto 0)<= numerator(7 downto 0);
					reg(8)<='0';
					reg(9)<='0';
				elsif shift='1' then
				
					reg(9 downto 1)<=reg(8 downto 0);
					reg(0)<='0';
					
				elsif load='1' then
					reg(9 downto 4)<=num;
				end if;
				
		end if;
	end process;
end partialRegister_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp2 is
		component partialRegister is
				port(start,load,shift,clk,rst: in std_logic;
			numerator: in std_logic_vector(7 downto 0);
			num: in std_logic_vector(5 downto 0);
			output: out std_logic_vector(5 downto 0));
		end component;
		end package;