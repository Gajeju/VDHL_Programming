library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현

Entity SimpleMooreMachine223 is
	port (
			clk, rst, i, m, n : in std_logic;
			y						: out std_logic
			);
end Entity;

Architecture KDH of SimpleMooreMachine223 is
	type state_type is (S0, S1);					--상태값 S0, S1을 갖는 사용자지정 타입
	signal state, next_state : state_type;
begin
	process (rst, clk)		--리셋과 클럭이 변할때마다 동작
	begin
		if rst = '0' then		--초기화의 역할
			state <= S0;
		elsif rising_edge(clk) then		--클럭의 상승에지
			state <= next_state;				--process문을 나누어 사용하였기 때문에 상태를 2개 사용
		end if;
	end process;
	
	process (i, state)			--입력값과 상태값이 바뀔때마다 동작
	begin
		case state is
			when S0 =>
				if (i = '1') then next_state <= S1;
				else next_state <= S0;
				end if;
			when S1 =>
				if (i = '1') then next_state <= S0;
				else next_state <= S1;
				end if;
			end case;
		end process;
		
	y <= m when state = S0 else n;
end Architecture;