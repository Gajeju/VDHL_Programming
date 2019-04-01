library ieee;
use ieee.std_logic_1164.all;

--2015108223 김동현 DeMux case문 사용

Entity Lab0305DeMux223 is
	port (i : in std_logic;
			s : in std_logic_vector(1 downto 0);
			y : out std_logic_vector(3 downto 0)
			);
end Entity;

Architecture KDH of Lab0305DeMux223 is
begin
	process(i, s)
	begin
		y <= "0000";
		case s is 
			when "00" => y(0) <= i;
			when "01" => y(1) <= i;
			when "10" => y(2) <= i;
			when "11" => y(3) <= i;
			when others => y <= "0000";rrr
		end case;
	end process;
end Architecture;