-- 2015108223 김동현 전감산기

Library ieee;
use ieee.std_logic_1164.all;

Entity Lab030201 is
	port (Xi, Yi, Bi : in std_logic;
			Di, B      : out std_logic
			);	
end Entity;

Architecture KDH of Lab030201 is
	begin
		Di <= Xi xor Yi xor Bi;
		B  <= ((not Xi) and Yi) or ((not Xi) and Bi) or (Yi and Bi);
End Architecture;