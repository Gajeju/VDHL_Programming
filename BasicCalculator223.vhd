library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.MyPackage.all;							--work 는 현재 디렉토리

Entity BasicCalculator223 is					--DE0.qsf 를 사용하기 위해 모든 입출력을 정의
	port(
			SW : in std_logic_vector(9 downto 0);
			HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0);
			LEDG : out std_logic_vector(9 downto 0)
		  );
end Entity;

Architecture KDH of BasicCalculator223 is  	--중간신호를 선언하여 입출력을 할당
	signal a, b : integer range 0 to 9;
	signal mode : integer range 0 to 3;
	signal negative : std_logic := '0';
	
begin
	a <= to_integer(unsigned( SW(9 downto 6)));		--bit_vector 를 정수로 바꾸는 과정 
	b <= to_integer(unsigned( SW(5 downto 2)));		--부호비트를 없애기 위해 unsigned형으로 바꾼후 변환
	mode <= to_integer(unsigned( SW(1 downto 0)));	--to_integer 함수는 numeric_std 패키지에서 정의 
	LEDG(8 downto 0) <= "000000000";						--음수일대 켜지는 LED 초기값 양수
	LEDG(9) <= negative;
	
	process(a, b, mode)
		variable result : integer range -81 to 81;	
		variable r1, r0 : integer range 0 to 9;
	begin
		case mode is											--연산 모드 설정
			when 0 => result := a + b;
			when 1 => result := a - b;
			when 2 => result := a * b;
			when 3 => result := a / b;
			when others => result := a;					--예외처리 case문에서 모든 경우의수를 처리하기때문에 의미X
		end case;
		
		if (result < 0) then									--계산결과가 음수일대 LED를 키기 위한 과정
			negative <= '1';
			result := result * (-1);
		else
			negative <= '0';
		end if;
		
		r1 := result / 10;
		r0 := result - (r1 * 10);
		
		HEX0 <= segdisp(r0);								--segdisp 정수 매개변수를 받아서 7세그먼트로 출력하는 함수
		HEX1 <= segdisp(r1);								--MyPackage 에 정의 되어 있음
		HEX2 <= segdisp(b);								--가독성을 높이기 위해 패키지를 사용
		HEX3 <= segdisp(a);
		end process;
end ARchitecture;
	