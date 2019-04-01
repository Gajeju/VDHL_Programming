Library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 7세그먼트 (입력 4비트 2진수)

Entity Lab0304CADriverB223 is
	port (x : in std_logic_vector(3 downto 0);
			z : out std_logic_vector(6 downto 0));
end Entity;

Architecture KDH of Lab0304CADriverB223 is
	begin
		process(x)
			begin
			case x is
				when "0000" => z <= "1000000";
				when "0001" => z <= "1111001";
				when "0010" => z <= "0100100";
				when "0011" => z <= "0110000";
				when "0100" => z <= "0011001";
				when "0101" => z <= "0010010";
				when "0110" => z <= "0000010";
				when "0111" => z <= "1011000";
				when "1000" => z <= "0000000";
				when "1001" => z <= "0010000";
				when "1010" => z <= "0001000";
				when "1011" => z <= "0000011";
				when "1100" => z <= "1000110";
				when "1101" => z <= "0100001";
				when "1110" => z <= "0000110";
				when "1111" => z <= "0001110";
				when others => z <= "1111111";
			end case;
		end process;
end Architecture;