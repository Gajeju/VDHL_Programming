library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현

Entity FullAdder is
	port (x, y, Cin : in bit;
			sum, Cout : out bit
			);
end entity;

Architecture KDH of FullAdder is
begin
	sum <= x xor y xor Cin;
	Cout <= (x and y) or (x and Cin) or (y and Cin);
end Architecture;