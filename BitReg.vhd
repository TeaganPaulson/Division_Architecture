library ieee;
use ieee.std_logic_1164.all;

entity BitReg is
	port(singleload,load,shift,clk,rst,shiftin: in std_logic;
			num: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(3 downto 0));
end BitReg;
architecture BitReg_arch of BitReg is 
	signal reg: std_logic_vector(3 downto 0):="0000";
	signal msb: std_logic;
begin
	output<=reg;
	
	process(clk,rst,shift,load,singleload)
	begin
		if clk'event and clk='1' then
			if rst ='1' then 
				reg<="0000";
			elsif load ='1' then
				reg<=num;
			elsif singleload = '1' then
				reg(0)<=shiftin;
			elsif shift = '1' then
				reg(3 downto 1)<=reg(2 downto 0);
				reg(0)<='0';	
			end if;
		end if;
	end process;
end BitReg_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp1 is
		component BitReg is
				port(singleload,load,shift,clk,rst,shiftin: in std_logic;
					num: in std_logic_vector(3 downto 0);
					output: out std_logic_vector(3 downto 0));
		end component;
		end package;