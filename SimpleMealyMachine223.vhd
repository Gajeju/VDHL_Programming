library ieee;
use ieee.std_logic_1164.all;

-- 2015018223 김동현 Mealy 모델

Entity SimpleMealyMachine223 is
	port (clk, rst, i, m, n : in std_logic;
			y						: out std_logic
			);
end Entity;

Architecture KDH of SimpleMealyMachine223 is
	type state_type is (S0, S1);
	signal state, next_state : state_type;
begin
	
	process (rst, clk)			--클럭과 리셋의 동작을 정의 하는 process문
	begin
		if rst = '0' then
			state <= S0;
		elsif rising_edge(clk) then	--상승에지에서 상태를 다음상태로 바꿈
			state <= next_state;
		end if;
	end process;

	process (i, state, m, n)		--상태동작을 정의 Mealy머신에서는 process문 안에서 출력까지 정의
	begin
		case state is
			when S0 =>
				if (i = '1') then			--클럭과 관계없이 입력이 바뀌면 출력이 바뀔 수 있다
					next_state <= S1;
					y <= n;
				else
					next_state <= S0;
					y <= m;
				end if;
			when S1 =>
				if (i = '1') then
					next_state <= S0;
					y <= m;
				else
					next_state <= S1;
					y <= n;
				end if;
		end case;
	end process;
end Architecture;
	