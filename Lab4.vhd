library ieee;
use ieee.std_logic_1164.all;
library work;
use work.comp1.all;
use work.comp2.all;
use work.comp3.all;
use work.comp4.all;

entity Lab4 is
	port(start,clk,rst: in std_logic;
			numerator: 	in std_logic_vector(7 downto 0);
			denom:		in std_logic_vector(3 downto 0);
			quitoent: out std_logic_vector(3 downto 0);
			remainder: out std_logic_vector(3 downto 0));
end Lab4;
architecture Lab4_arch of Lab4 is 
	signal load,load1,shift,notmsb,msbload: std_logic;
	signal aregin,nota,bot,bot_out: std_logic_vector(5 downto 0);
	
begin
	aregin(4)<='0';
	aregin(5)<='0';
	nota<=not aregin;
	msbload<= notmsb and load;
	notmsb <= not bot_out(5);
	
	remainder<=bot(3 downto 0);
	
	par  : partialRegister 	port map(load1,msbload,shift,clk,rst,numerator,bot_out,bot);
	
	dreg : BitReg 				port map('0',load1,'0',clk,rst,'0',denom,aregin(3 downto 0));
	areg : BitReg 			  	port map(load,load1,shift,clk,rst,notmsb,"0000",quitoent);
	
	adder: FA					port map('1',nota,bot,bot_out);
	FS	  : FSM					port map(start,clk,rst,shift,load,load1);
end Lab4_arch;