-------------------------------------------------------------------------------
--
-- Title       : TestBench
-- Design      : Opdracht1
-- Author      : Ewout Boks
-- Company     : Hogeswool van Arnhem en Nijmegen
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\bkse\home\vakken\ti_cp\DSO\practicum\VHDL\2023-2024\opdracht_assignment1\simulatie\Opdracht1\src\TestBench.vhdl
-- Generated   : Thu Aug 31 09:45:37 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {TestBench} architecture {TestBench}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;	
	

entity TestBench is
end TestBench;

--}} End of automatically maintained section


architecture TestBench of TestBench is	   


	component toplevel is

	PORT ( SW : in std_logic_vector(9 downto 0);     -- switches
			 KEY : in std_logic_vector(1 downto 0);    -- drukbuttons
			 LEDR : out std_logic_vector(9 downto 0);  -- rode leds
			 HEX0 : out std_logic_vector(7 downto 0);  -- SSD0 (meest rechter)
			 HEX1 : out std_logic_vector(7 downto 0);  -- SSD1
			 HEX2 : out std_logic_vector(7 downto 0);  -- SSD2
			 HEX3 : out std_logic_vector(7 downto 0)); -- SSD3
	end component;
	
	subtype Switches is std_logic_vector(9 downto 0);	
	subtype KEYS is std_logic_vector(1 downto 0);
	subtype LEDs is std_logic_vector(9 downto 0);
	subtype SSD is std_logic_vector(7 downto 0);
	type Display is array(0 to 3) of SSD;	 
	
	signal sw : Switches := (others => '0');
	signal buttons : keys := (others => '1');
	signal littleleds : LEDs := (others => '0');
	signal ssds : Display;
		
	constant testvalue1 : integer := 3;
	constant testvalue2 : integer := 754;
	
begin
	
	
	-- enter your statements here 
	
	dut : toplevel port map (SW => sw, KEY => buttons, LEDR => littleleds, HEX0 => ssds(0), HEX1=>ssds(1), HEX2=> ssds(2), HEX3 => ssds(3));
	
	sw <= conv_std_logic_vector(testvalue1,sw'length) after 20 ns, conv_std_logic_vector(testvalue2,sw'length) after 60 ns;
	
	buttons(0) <= '0' after 30 ns, '1' after 40 ns;
	buttons(1) <= '0' after 45 ns, '1' after 50 ns;
	
	-- Testresultaat/ Test result 1 : 0 ==> c0,c0,c0,c0 ==> 0 op alle 7s  / 0 on all 7s
	-- Testresultaat/ Test result 2a : 3 ==> b0,c0,c0,c0  : standaard weergave maar dan geinverteerd (pos logica) / standard display but inverted (pos logic)
	-- Testresultaat/ Test result 2b : 3 ==> 0d,03,03,03  : standaard weergave maar dan normaal (neg logica) / standard display but normal (negative logic)
	-- Testresultaat/ Test result 3 : 754 ==> 99,92,f8,c0 : standaard weergave maar dan geinverteerd (pos logica) / standard display but inverted (pos logic)
	
end TestBench;
