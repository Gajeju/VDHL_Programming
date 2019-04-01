Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.MyPackage.all;

-- 2015018223 김동현

Entity UpDownCounter223B is
	port (reset :		in std_logic;
			stepClk :	in std_logic;
			UpDown :		in std_logic;
			HEX0 :		out std_logic_vector(6 downto 0)
			);
end Entity;

Architecture KDH of UpDownCounter223B is
	signal n : integer range 0 to 9;
begin
	process (reset, stepClk)
	begin
		if reset = '1' then		--reset이 1일 경우 0으로 리셋
			n <= 0;
		elsif rising_edge(stepClk) then  
			if UpDown = '0' then				--UpDown 이 0이면 업카운터
				if n < 9 then n <= n+1;
				else n <= 0;					--1~9까지 카운트 한 후 0으로 돌아감
				end if;
			else									--UpDown 이 1이면 다운카운터
				if n >0 then n <= n-1;
				else n <= 9;
				end if;
			end if;
		end if;
	end process;
	HEX0 <= segdisp(n);
end Architecture;