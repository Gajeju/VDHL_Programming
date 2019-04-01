Library ieee;
Use ieee.std_logic_1164.all;

-- 2015108223 함수를 이용한 7세그먼트 드라이버

Entity DisplayFunction223 is
	port (x, y : in integer range 0 to 9;
	
	--입력의 범위를 0부터 9까지로 제한하여 함수 내에서 when others 를 이용하여 예외처리를 해 주었음에도
	--10 ~ 15 범위의 입력을 인식하지 못하여 예외 처리를 해 주지 못하고 이상한 값이 출력
	
			HEX1, HEX0 : out std_logic_vector(6 downto 0));
end Entity;

Architecture KDH of DisplayFunction223 is

	function segdisp(n : integer range 0 to 9) return std_logic_vector is
		variable z : std_logic_vector(6 downto 0) := "1111111";
	begin
		case n is
			when 0 => z := "1000000";
			when 1 => z := "1111001";
			when 2 => z := "0100100";
			when 3 => z := "0110000";
			when 4 => z := "0011001";
			when 5 => z := "0010010";
			when 6 => z := "0000010";
			when 7 => z := "1011000";
			when 8 => z := "0000000";
			when 9 => z := "0010000";
			when others => z:= "1111111";
		end case;
	return(z);
	end segdisp;

	begin
	HEX0 <= segdisp(x);
	HEX1 <= segdisp(y);
end Architecture;