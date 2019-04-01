library ieee;
use ieee.std_logic_1164.all;

--2015108223 김동현

Entity TrafficLight223 is
	port(
		  CLOCK_50 			: in std_logic; 						  --50MHz
		  reset 				: in std_logic;						  --리셋
		  NS_LED, EW_LED  : out std_logic_vector(5 downto 0) --남북 동서 각각 LED 6개 할당
		 );
end Entity;

Architecture KDH of TrafficLight223 is
	
	signal state, nextstate : integer range 0 to 5 := 0;			--현제상태와 다음상태변수 0~5	
	type timer is array (5 downto 0) of integer range 0 to 15;	--정수 6개를 저장할 수 있는 배열
	signal t : timer;															--LED 지연시간 변수
	signal clk, ct : std_logic;											--쿨럭과 시간을 세주는 변수

begin

MakeClk: process (reset, CLOCK_50)
	
	variable nc : integer range 0 to 5000000 := 0;					--57
	Hz 주파수의 쿨럭을 만들기 위한 변수
	
	begin
		if (rising_edge(CLOCK_50)) then
			if (nc = 5000000) then
				nc := 0;
				clk <= not clk;												--CLOCK_50을 이용하여 새로운 쿨럭을 만듬
			else
				nc := nc + 1;													
			end if;
		end if;
	end process;
	
	process (state, reset, ct)		--상태를 정의하는 PROCESS
	begin
		if reset = '1' then
			nextstate <= 0;
			t(0) <= 10;		--state(0)
			t(1) <= 5;		--state(1)
			t(2) <= 2;		--state(2)
			t(3) <= 10;		--state(3)
			t(4) <= 5;		--state(4)
			t(5) <= 2;		--state(5)
		else
			case state is
				when 0 =>					--NS_Green  EW_Red
					if ct = '1' then		--ct를 이용하여 정해준 시간이 지나지 않는다면 상태를 유지
						nextstate <= 1;
					else
						nextstate <= 0;
						
						NS_LED <= "100010";
						EW_LED <= "000110";
					end if;
				when 1 =>					--NS_Left EW_Red
					if ct = '1' then
						nextstate <= 2;
					else
						nextstate <= 1;
						
						NS_LED <= "010011";
						EW_LED <= "000111";
					end if;
				when 2 =>					--NS_Yellow EW_Red
					if ct = '1' then
						nextstate <= 3;
					else
						nextstate <= 2;
						
						NS_LED <= "001011";
						EW_LED <= "000111";
					end if;
				when 3 =>					--NS_Red EW_Green
					if ct = '1' then
						nextstate <= 4;
					else
						nextstate <= 3;
						
						NS_LED <= "000101";
						EW_LED <= "100001";
					end if;
				when 4 =>					--NS_Red EW_Left
					if ct = '1' then
						nextstate <= 5;
					else
						nextstate <= 4;
						
						NS_LED <= "000111";
						EW_LED <= "010011";
					end if;
				when 5 =>					--NS_Red  EW_Yellow
					if ct = '1' then
						nextstate <= 0;
					else
						nextstate <= 5;
						
						NS_LED <= "000111";
						EW_LED <= "001000";
					end if;
				end case;
			end if;
	end process;
	
	process (clk)			--타이머에서 정의해준 시간동안 동작이 유지하게 하는 부분
		
		variable nt : integer range 0 to 15;
	
	begin
		if (rising_edge(clk)) then
			state <= nextstate;
			if nt = t(state) then
				ct <= '1'; nt := 0;
			else
				ct <= '0'; nt := nt + 1;
			end if;
		end if;
	end process;
end Architecture;
	