library ieee;
use ieee.std_logic_1164.all;

--2015108223 김동현

Entity FA4_223 is

	port ( X , Y   : in std_logic_vector(3 downto 0);
			 Cin 		: in std_logic;
			 Sum 		: out std_logic_vector(3 downto 0);
			 Cout 	: out std_logic
			);
end Entity;

Architecture KDH of FA4_223 is
	component FullAdder
	port (x, y , cin : in std_logic;
			sum, cout : out std_logic
			);
	end component;
	signal C : std_logic_vector(2 downto 0);		--전단의 cout 을 넣어서 윗단의 cin 올 사용할 중간신호
begin

U0 : FullAdder port map (X(0), Y(0), Cin, Sum(0), C(0));
U1 : FullAdder port map (X(1), Y(1), C(0), Sum(1), C(1));
U2 : FullAdder port map (X(2), Y(2), C(1), Sum(2), C(2));
U3 : FullAdder port map (X(3), Y(3), C(2), Sum(3), Cout);

end Architecture;
