 ------- ESE DSDL practicum
 ------- Altera DE10-Lite
 ------- ir drs E.J Boks, HAN Embedded Systems Engineering. https://ese.han.nl
-------- $Id: DE10_7SegmentDriver.vhd 138 2026-09-03 08:06:08Z ewout $ 
 ------- Voltooi alle code hier onder / Complete all code below
 
-- 7 segment decoder  
-- input: 4-bit number 0 to F  
-- output: 7 led segments  
 
LIBRARY ieee; 
use ieee.std_logic_1164.all; 

package SevenSegmentDriver is
	
	-- Input : This is the number that must be converted to std_logic.
	-- doReverse : Do you want the output in normal (Little Endian)  or in reversed order (Big Endian)?	
	-- doInverse : toon de segmenten op bitnivo geinverteerd / show the segments bitwise inverted
	function integer_to_ssd(signal input : integer;
							doReverse : boolean;
							doInverse : boolean) return std_logic_vector;

	function reverseVector(a: in std_logic_vector) return std_logic_vector;
	
end SevenSegmentDriver;
 
 
package body SevenSegmentDriver is
 

 function integer_to_ssd(signal input : integer;
 						 doReverse : boolean;
  						 doInverse : boolean) return std_logic_vector
	is variable output: std_logic_vector(7 downto 0);
begin

	-- LOGIC
	case input is
		when 0 		=> output := "11111010";
		when 1 		=> output := "10011110";
		when 2 		=> output := "00100100";
		when 3 		=> output := "00001100";
		when 4 		=> output := "10011000";
		when 5 		=> output := "01001000";
		when 6 		=> output := "01000000";
		when 7 		=> output := "00011110";
		when 8	 	=> output := "00000000";
		when 9 		=> output := "00001000";
		when others => output := "11111110";
	end case;

	if doInverse then
		output := not output;
	end if;

	if doReverse then
		output := reverseVector(output);
	end if;

	return output;
	
end integer_to_ssd;


	function reverseVector(a: in std_logic_vector)
		return std_logic_vector is
	variable result: std_logic_vector(a'RANGE);
	alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
begin
  for i in aa'RANGE loop
    result(i) := aa(i);
  end loop;
  return result;
end function; -- function reverse_any_vector


																							  
end SevenSegmentDriver;

-----------------------------------------

 
  

