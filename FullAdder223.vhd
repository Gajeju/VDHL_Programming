Library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현

Entity FullAdder223 is

port (x, y, z : in std_logic;
		S, C : out std_logic
		);
end Entity;


Architecture KDH of FullAdder223 is
	signal k : std_logic_vector(2 downto 0);
	begin
		k <= x&y&z;  --x, y, z 변수를 이용하여s bus 생성, k = xyz
		
		process(k)  -- case 문을 이용하기 위한 process문, k가 변할때마다 실행
		begin
			case k is
				when "000" =>	S <= '0';	C <= '0';
				when "001" =>	S <= '1';	C <= '0';
				when "010" =>	S <= '1';	C <= '0';
				when "011" =>	S <= '0';	C <= '1';
				when "100" =>	S <= '1';	C <= '0';
				when "101" =>	S <= '0';	C <= '1';
				when "110" =>	S <= '0';	C <= '1';
				when "111" =>	S <= '1';	C <= '1';
				end case;
			end process;
			
end Architecture; 