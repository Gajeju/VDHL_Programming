Library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 세그먼트 (입력을 정수 사용)

Entity Lab0304CADriver223 is
	port ( x : in integer range 0 to 15;
			 z : out std_logic_vector(6 downto 0));
end Entity;

Architecture KDH of Lab0304CADriver223 is
	begin
		process(x)
		begin
			case x is --common anode    gfedcba
							when 0 => z <= "1000000";
							when 1 => z <= "1111001";
							when 2 => z <= "0100100";
							when 3 => z <= "0110000";
							when 4 => z <= "0011001";
							when 5 => z <= "0010010";
							when 6 => z <= "0000010";
							when 7 => z <= "1011000";
							when 8 => z <= "0000000";
							when 9 => z <= "0010000";
							when 10 => z <= "0001000";
							when 11 => z <= "0000011";
							when 12 => z <= "1000110";
							when 13 => z <= "0100001";
							when 14 => z <= "0000110";
							when 15 => z <= "0001110";
				when others => z <= "1111111";
			end case;
		end process;
end;
