library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FA is
	port(cin : in std_logic;
			num1,num2: in std_logic_vector(5 downto 0);
			cout: out std_logic_vector(5 downto 0) );
end FA;
architecture FA_arch of FA is

begin 
	cout <= num1 + num2 + cin;
end FA_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
package comp3 is
		component FA is
				port(cin : in std_logic;
					num1,num2: in std_logic_vector(5 downto 0);
					cout: out std_logic_vector(5 downto 0) );
		end component;
		end package;