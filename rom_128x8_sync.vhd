library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rom_128x8_sync is
    port (
	clock	  : in std_logic;
        address	  : in std_logic_vector (7 downto 0);
	data_Out  : out std_logic_vector (7 downto 0));
end entity;

architecture rom_128x8_sync_arch of rom_128x8_sync is

	constant LDA_IMM : std_logic_vector (7 downto 0) := x"86";
	constant LDA_DIR : std_logic_vector (7 downto 0) := x"87";
	constant LDB_IMM : std_logic_vector (7 downto 0) := x"88";
	constant LDB_DIR : std_logic_vector (7 downto 0) := x"89";
	constant STA_DIR : std_logic_vector (7 downto 0) := x"96";
	constant STB_DIR : std_logic_vector (7 downto 0) := x"97";
	constant ADD_AB  : std_logic_vector (7 downto 0) := x"42";
	constant BRA 	 : std_logic_vector (7 downto 0) := x"20";
	constant BEQ 	 : std_logic_vector (7 downto 0) := x"23";
	
	type rom_type is array (0 to 127) of std_logic_vector(7 downto 0);
	
	constant ROM : rom_type := (
					0 => LDA_IMM,
				 	1 => x"AA",
					2 => STA_DIR,
					3 => x"E0",
					4 => BRA,
					5 => x"00",
					others => x"00");
						 
	signal EN : std_logic;
										 
	begin
		enable : process (address)
		begin
			if ((to_integer(unsigned(address)) >= 0) and (to_integer(unsigned(address)) <= 127)) then
				EN <= '1';
			else
				EN <= '0';
			end if;
		end process;
		
		memory : process (clock)
		begin
			if (clock'event and clock='1') then
				if (EN='1') then
					data_Out <= ROM(to_integer(unsigned(address)));
				end if;
			end if;
		end process;
end architecture;
