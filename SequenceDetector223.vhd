library ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현 순차 검출기

Entity SequenceDetector223 is
	port (stepClk	 : in std_logic;
			reset		 : in std_logic;
			inp		 : in std_logic;
			outp 		 : out std_logic
			);
end Entity;

Architecture KDH of SequenceDetector223 is
	type state_type is (S0, S1, S2, S3);
	signal state : state_type;
begin
	process (reset, stepClk)
	begin
		if reset = '0' then				--리셋
			state <= S0;
		elsif rising_edge(stepClk) then
			case state is
				when S0 =>
					if inp = '0' then
						state <= S0;
					else
						state <= S1;
					end if;
				when S1 =>
					if inp = '0' then
						state <= S0;
					else
						state <= s2;
					end if;
				when S2 =>
					if inp = '0' then
						state <= S0;
					else
						state <= S3;
					end if;
				when S3 =>
					if inp = '0' then
						state <= S0;
					else
						state <= S3;
					end if;
				end case;
		end if;
	end process;
	
	process(state)
	begin
		case state is
			when S0 => outp <= '0';
			when S1 => outp <= '0';
			when S2 => outp <= '0';
			when S3 => outp <= '1';
		end case;
	end process;
end Architecture;			