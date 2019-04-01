-- Lab30102
-- programed by KDH

library ieee;
use ieee.std_logic_1164.all;

entity Lab0301022 is

	port 
	(
		A, B, C	   : in std_logic;
		F1     	   : out std_logic;
		F2				: inout std_logic
		);

end entity;

architecture rtl of Lab0301022 is
	signal T1, T2, T3 : std_logic;
	
	begin
		T2 <= A and B and C;
		T1 <= A or B or C;
		T3 <= T1 and (not F2);
		F1 <= T2 or T3;
		F2 <= (A and B) or (A and C) or (B and C);
end rtl;
