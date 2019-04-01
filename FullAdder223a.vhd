Library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현
-- 논리식을 이용한 전가산기 설계

Entity FullAdder223a is

port (x, y, z : in std_logic;
		S, C : out std_logic
		);
end Entity;


Architecture KDH of FullAdder223a is
begin
			S <= (not x and not y and z) or (not x and y and not z)
					or (x and not y and not z) or (x and y and z);
			C <= (x and y) or (x and z) or (y and z);
end Architecture; 