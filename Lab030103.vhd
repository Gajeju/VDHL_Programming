-- Lab30103
-- programed by KDH

library ieee;
use ieee.std_logic_1164.all;

entity Lab030103 is

	port 
	(
		A, B, C	   : in std_logic;
		F1, F2  	   : out std_logic
		);

end entity;

architecture rtl of Lab030103 is
	
	begin
		F1 <= A xor B xor C;
		F2 <= (A and C) or (A and B) or (B and C);
end rtl;
