Library  ieee;
use ieee.std_logic_1164.all;

-- 2015108223 김동현

Entity Lab03Encoder is
	port ( D : in std_logic_vector(7 downto 0);
			 A : out std_logic_vector(2 downto 0);
			 V : out std_logic);    --enable 역할
end Entity;

Architecture KDH of Lab03Encoder is

-- don't care 가 존재할 경우 case문으로 처리하기 매우 어렵다
begin
	process(D)
		begin
		V <= '1';
		if D(7) = '1' then A <= "111";
		elsif	D(6) = '1' then A <= "110";
		elsif D(5) = '1' then A <= "101";
		elsif D(4) = '1' then A <= "100";
		elsif D(3) = '1' then A <= "011";
		elsif D(2) = '1' then A <= "010";
		elsif D(1) = '1' then A <= "001";
		elsif D(0) = '1' then A <= "000";
		else A <= "000"; V <= '0';  --예외처리, enalbe 단자가 0
		end if;
	end process;
end Architecture;