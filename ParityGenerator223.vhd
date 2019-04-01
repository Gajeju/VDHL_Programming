library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현

Entity ParityGenerator223 is
	generic(n : integer := 8);					--전역으로 사용할 변수 바꾸면 n비트 입력에 따른
	port(												--패리티 생성 가능
			data_in : in std_logic_vector(n-1 downto 0);		--8비트 입력
			parity_out : out std_logic_vector(n downto 0)	--패리티비트를 포함하여 9비트 출력
		  );
end Entity;

Architecture KDH of ParityGenerator223 is

	function parity(x : std_logic_vector) return std_logic_vector is
		variable tmp1 : std_logic := '0';					--패리티비트를 넣을 변수
		variable tmp2 : std_logic_vector(n downto 0);	--입력신호 + 패리티변수를 넣을 벡터
	begin
		for i in x'range loop
			tmp1 := tmp1 xor x(i);		--다수의 수를 xor 할 경우 홀수일때1 짝수일때1 출력
			tmp2(i) := x(i);				--입력값 복사
		end loop;
		tmp2(n) := tmp1;					--MSB에 패리티비트 추가
		return tmp2;						--완성된 벡터 리턴
	end parity;

begin
	process(data_in)
	begin
		parity_out <= parity(data_in);	--입력값이 바뀔때마다 피리티비트를 포함하여 출력
	end process;
end Architecture;
			