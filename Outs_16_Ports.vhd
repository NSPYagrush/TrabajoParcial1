library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Outs_16_Ports is
    port (
        reset 		: in std_logic;
		  clock 		: in std_logic;
		  write 		: in std_logic;
		  address 	: in std_logic_vector (7 downto 0);
		  data_in 	: in std_logic_vector (7 downto 0);
		  port_Out_00, port_Out_01, port_Out_02, port_Out_03, 
		  port_Out_04, port_Out_05, port_Out_06, port_Out_07,
		  port_Out_08, port_Out_09, port_Out_10, port_Out_11, 
		  port_Out_12, port_Out_13, port_Out_14, port_Out_15 	: out std_logic_vector (7 downto 0));
end entity;

architecture Outs_16_Ports_arch of Outs_16_Ports is
	begin
		U0 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_00<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E0" and write='1') then
							port_Out_00 <= data_in;
						end if;
				end if;
		end process;
		
		U1 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_01<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E1" and write='1') then
							port_Out_01 <= data_in;
						end if;
				end if;
		end process;
		
		U2 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_02<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E2" and write='1') then
							port_Out_02 <= data_in;
						end if;
				end if;
		end process;
		
		U3 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_03<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E3" and write='1') then
							port_Out_03 <= data_in;
						end if;
				end if;
		end process;
		
		U4 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_04<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E4" and write='1') then
							port_Out_04 <= data_in;
						end if;
				end if;
		end process;
		
		U5 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_05<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E5" and write='1') then
							port_Out_05 <= data_in;
						end if;
				end if;
		end process;
		
		U6 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_06<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E6" and write='1') then
							port_Out_06 <= data_in;
						end if;
				end if;
		end process;
		
		U7 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_07<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E7" and write='1') then
							port_Out_07 <= data_in;
						end if;
				end if;
		end process;
		
		U8 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_08<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E8" and write='1') then
							port_Out_08 <= data_in;
						end if;
				end if;
		end process;
		
		U9 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_09<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"E9" and write='1') then
							port_Out_09 <= data_in;
						end if;
				end if;
		end process;
		
		U10 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_10<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A0" and write='1') then
							port_Out_10 <= data_in;
						end if;
				end if;
		end process;
		
		U11 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_11<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A1" and write='1') then
							port_Out_11 <= data_in;
						end if;
				end if;
		end process;
		
		U12 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_12<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A2" and write='1') then
							port_Out_12 <= data_in;
						end if;
				end if;
		end process;
		
		U13 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_13<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A3" and write='1') then
							port_Out_13 <= data_in;
						end if;
				end if;
		end process;
		
		U14 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_14<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A4" and write='1') then
							port_Out_14 <= data_in;
						end if;
				end if;
		end process;
		
		U15 : process (clock,reset)
			begin 
				if (reset='0') then
					port_Out_15<=x"00";
				elsif (clock'event and clock='1') then 
						if (address=x"A5" and write='1') then
							port_Out_15 <= data_in;
						end if;
				end if;
		end process;
end architecture;