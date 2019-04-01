library ieee;
use ieee.std_logic_1164.all;
use work.MyPackage.all;

-- 2015108223 김동현 1 개수 카운터

Entity OneCounter223 is
	port (
			d	   : in std_logic_vector(9 downto 0);		--DE0 스위치가 10개이기 때문에 책에내용 수정
			HEX0 	: out std_logic_vector(6 downto 0)
			);
end Entity;

Architecture KDH of OneCounter223 is
begin
	process(d)
		variable oneCount : integer;
	begin
		oneCount := 0;							-- 1의 갯수를 넣을 변수 선언 (process문 안에서만 선언 가능)
		for i in d'range loop				-- d의 범위동안 루프
			if d(i) = '1' then
				oneCount := oneCount + 1;
			end if;
		end loop;
	
	HEX0 <= segdisp(oneCount);
	end process;
end Architecture;