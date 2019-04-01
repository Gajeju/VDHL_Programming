Library ieee;
use ieee.std_logic_1164.all;
use work.MyPackage.all;

-- 2015108223 카운터

Entity UpDownCounter223 is
	port (reset 		: in std_logic;
			stepClk		: in std_logic;
			UpDown		: in std_logic;
			HEX0			: out std_logic_vector(6 downto 0)
			);
end Entity;

Architecture KDH of UpDownCounter223 is
	type state_type is (S0, S1, S2, S3);
	signal state : state_type;

begin
	process (reset, stepClk)
	begin
		if reset = '0' then					--reset 단자 우선순위가 가장 높음
			state <= S0;
		elsif rising_edge(stepClk) then
			case state is
				when S0 =>
					if UpDown = '0' then state <= S1;
					else state <= S3;
					end if;
				when s1 =>
					if UpDown = '0' then state <= S2;
					else state <= S0;
					end if;
				when S2 =>
					if UpDown = '0' then state <= S3;
					else state <= S1;
					end if;
				when S3 =>
					if UpDown = '0' then state <= S0;
					else state <= S2;
					end if;
			end case;
		end if;
	end process;
	
	HEX0 <= segdisp(0) when state = S0 else	--state는 사용자 정의 타입이기 때문에 바로 출력이 안됨
			  segdisp(1) when state = s1 else
			  segdisp(2) when state = s2 else
			  segdisp(3);
	
	
end Architecture;	