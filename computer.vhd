library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity computer is
    port ( 
	Clock	: in   std_logic;
	Reset	: in   std_logic;
	port_in_00, port_in_01, port_in_02, port_in_03, port_in_04, port_in_05,
	port_in_06, port_in_07, port_in_08, port_in_09, port_in_10, port_in_11,
	port_in_12, port_in_13, port_in_14, port_in_15		: in	std_logic_vector (7 downto 0);  	 
	port_out_00, port_out_01, port_out_02, port_out_03, port_out_04, port_out_05,
	port_out_06, port_out_07, port_out_08, port_out_09, port_out_10, port_out_11,
	port_out_12, port_out_13, port_out_14, port_out_15	: out	std_logic_vector (7 downto 0));
end entity;

architecture computer_arch of computer is

	signal write		: std_logic;
	signal address		: std_logic_vector(7 downto 0);
	signal to_memory	: std_logic_vector(7 downto 0);
	signal data_in		: std_logic_vector(7 downto 0);
	signal from_memory	: std_logic_vector(7 downto 0);
	signal data_out		: std_logic_vector(7 downto 0);
	  
  component CPU
	  port (
		Clock 		: in std_logic;
		Reset 		: in std_logic;
		write 		: out std_logic;
		from_memory 	: in std_logic_vector(7 downto 0);
		to_memory 	: out std_logic_vector(7 downto 0);
		address 	: out std_logic_vector(7 downto 0));
	end component;

	component memory
		port (
			clock 	 : in std_logic;
			reset 	 : in std_logic;
			write 	 : in std_logic;
			address  : in std_logic_vector (7 downto 0);
			data_in  : in std_logic_vector (7 downto 0);
			data_Out : out std_logic_vector (7 downto 0);
			port_in_00, port_in_01, port_in_02, port_in_03, 
			port_in_04, port_in_05, port_in_06, port_in_07,
			port_in_08, port_in_09, port_in_10, port_in_11, 
			port_in_12, port_in_13, port_in_14, port_in_15		: in std_logic_vector (7 downto 0);
			port_Out_00, port_Out_01, port_Out_02, port_Out_03, 
			port_Out_04, port_Out_05, port_Out_06, port_Out_07,
			port_Out_08, port_Out_09, port_Out_10, port_Out_11, 
			port_Out_12, port_Out_13, port_Out_14, port_Out_15 	: out std_logic_vector (7 downto 0));
	end component;

	begin
	
		U0 : CPU port map (Clock => Clock, Reset => Reset, from_memory => from_memory, to_memory => to_memory, write => write, address => address);
		
		U1 : memory port map (clock => Clock, reset => Reset, port_in_00 => port_in_00, port_in_01 => port_in_01, port_in_02 => port_in_02,
										port_in_03 => port_in_03, port_in_04 => port_in_04, port_in_05 => port_in_05, port_in_06 => port_in_06, 
										port_in_07 => port_in_07, port_in_08 => port_in_08, port_in_09 => port_in_09, port_in_10 => port_in_10, 
										port_in_11 => port_in_11, port_in_12 => port_in_12, port_in_13 => port_in_13, port_in_14 => port_in_14,
										port_in_15 => port_in_15, port_out_00 => port_out_00, port_out_01 => port_out_01, port_out_02 => port_out_02,
										port_out_03 => port_out_03, port_out_04 => port_out_04, port_out_05 => port_out_05, port_out_06 => port_out_06,
										port_out_07 => port_out_07, port_out_08 => port_out_08, port_out_09 => port_out_09, port_out_10 => port_out_10, 
										port_out_11 => port_out_11, port_out_12 => port_out_12, port_out_13 => port_out_13, port_out_14 => port_out_14, 
										port_out_15 => port_out_15, data_in => to_memory, data_out => from_memory, write => write, address => address);
end architecture;
