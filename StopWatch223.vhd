Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.MyPackage.all;

-- 2015108223 

Entity StopWatch223 is
	port (CLOCK_50 : in std_logic;
			SW : in std_logic_vector(9 downto 0);
			LEDG : out std_logic_vector(9 downto 0);
			HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0)
			);
end Entity;

Architecture KDH of StopWatch223 is
begin
	process (CLOCK_50, SW)
	
		variable count : integer range 0 to 5000000;
		variable sec1, sec2 : integer range 0 to 9 := 0;
		variable min1, min2 : integer range 0 to 9 := 0;
		variable dec: integer range 0 to 9 := 0;
		
		begin
			if (SW(9) = '1') then											--초기화
				count := 0; sec1 := 0; sec2 := 0;
					HEX0 <= segdisp(sec1); HEX1 <= segdisp(sec2);
				min1 := 0; min2 := 0;
					HEX2 <= segdisp(min1); HEX3 <= segdisp(min2);
				LEDG <= "0000000000";
				
			elsif (rising_edge(CLOCK_50) and (SW(0) = '1')) then
				if (count < 5000000) then
					count := count +1;
				else
					count := 0;
					if (dec < 9) then
						dec := dec + 1;
						LEDG(dec-1) <= '1';
					else
						dec := 0;
						LEDG <= "0000000000";
						
						if(sec1 < 9) then
							sec1 := sec1 + 1;
							HEX0 <= segdisp(sec1);
						else
							sec1 := 0;
							HEX0 <= segdisp(sec1);
							if (sec2 < 5) then
								sec2 := sec2 + 1;
								HEX1 <= segdisp(sec2);
							else
								sec2 := 0;
								HEX1 <= segdisp(sec2);
							if (min1 < 9) then
								min1 := min1 + 1;
								HEX2 <= segdisp(min1);
							else
								min1 := 0;
								HEX2 <= segdisp(min1);
							if (min2 < 5) then
								min2 := min2 + 1;
								HEX3 <= segdisp(min2);
							else
								min2 := 0;
								HEX3 <= segdisp(min2);
							end if;
						end if;
						end if;
					end if;
				end if;	
			end if;
			end if;
		end process;
	end Architecture;