library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	port(
		 clock 		: in std_logic;
		 reset 		: in std_logic;
		 write 		: in std_logic;
		 address	: in std_logic_vector (7 downto 0);
		 data_in 	: in std_logic_vector (7 downto 0);
		 data_Out 	: out std_logic_vector (7 downto 0);
		 port_in_00, port_in_01, port_in_02, port_in_03, 
		 port_in_04, port_in_05, port_in_06, port_in_07,
		 port_in_08, port_in_09, port_in_10, port_in_11, 
		 port_in_12, port_in_13, port_in_14, port_in_15 	: in std_logic_vector (7 downto 0);
		 port_Out_00, port_Out_01, port_Out_02, port_Out_03, 
		 port_Out_04, port_Out_05, port_Out_06, port_Out_07,
		 port_Out_08, port_Out_09, port_Out_10, port_Out_11, 
		 port_Out_12, port_Out_13, port_Out_14, port_Out_15 	: out std_logic_vector (7 downto 0));
	end entity;
 
architecture memory_arch of memory is
	signal rom_data_out, ram_data_out : std_logic_vector (7 downto 0);
 
	component rom_128x8_sync
		port (
			  address 	: in std_logic_vector (7 downto 0);
			  clock 	: in std_logic;
			  data_Out  	: out std_logic_vector (7 downto 0));
	end component;
  
	component rw_96x8_sync
		port (
			  clock	   : in std_logic;
			  write	   : in std_logic;
			  address  : in std_logic_vector (7 downto 0);
			  data_in  : in std_logic_vector (7 downto 0);
			  data_Out : out std_logic_vector (7 downto 0));
	end component;
	
	component Outs_16_Ports
		port (
			reset 	: in std_logic;
			clock 	: in std_logic;
			write 	: in std_logic;
			address : in std_logic_vector (7 downto 0);
			data_in : in std_logic_vector (7 downto 0);
			port_Out_00, port_Out_01, port_Out_02, port_Out_03, 
			port_Out_04, port_Out_05, port_Out_06, port_Out_07,
			port_Out_08, port_Out_09, port_Out_10, port_Out_11, 
			port_Out_12, port_Out_13, port_Out_14, port_Out_15 : out std_logic_vector (7 downto 0));
	end component;
	
	component Mux_3to1
		port( 
			port_in_00, port_in_01, port_in_02, port_in_03,
			port_in_04, port_in_05, port_in_06, port_in_07,
			port_in_08, port_in_09, port_in_10, port_in_11,
			port_in_12, port_in_13, port_in_14, port_in_15 	: in std_logic_vector(7 downto 0);
			rom_data_out, rw_data_out, address 		: in std_logic_vector(7 downto 0);
			data_out 					: out std_logic_vector(7 downto 0));
	end component;
	
	begin
		U0 : rom_128x8_sync port map (address=>address, clock=>clock, data_Out=>rom_data_out);
		
		U1 : rw_96x8_sync port map (address=>address, data_in=>data_in, clock=>clock, write=>write, data_Out=>ram_data_out);
		
		U2 : Outs_16_Ports port map (address=>address, data_in=>data_in, clock=>clock, write=>write, port_Out_00=>port_Out_00 , port_Out_01=>port_Out_01 , port_Out_02=>port_Out_02 , 
											  port_Out_03=>port_Out_03 , port_Out_04=>port_Out_04 , port_Out_05=>port_Out_05 , port_Out_06=>port_Out_06 , port_Out_07=>port_Out_07 , 
											  port_Out_08=>port_Out_08 , port_Out_09=>port_Out_09 , port_Out_10=>port_Out_10 , port_Out_11=>port_Out_11 , port_Out_12=>port_Out_12 , 
											  port_Out_13=>port_Out_13 , port_Out_14=>port_Out_14 , port_Out_15=>port_Out_15, reset=>reset);
											  
		U3 : Mux_3to1 port map (port_in_00=>port_in_00, port_in_01=>port_in_01, port_in_02=>port_in_02, port_in_03=>port_in_03 , port_in_04=>port_in_04 , port_in_05=>port_in_05 , 
											  port_in_06=>port_in_06 , port_in_07=>port_in_07 , port_in_08=>port_in_08 , port_in_09=>port_in_09 , port_in_10=>port_in_10 , 
											  port_in_11=>port_in_11 , port_in_12=>port_in_12 , port_in_13=>port_in_13 , port_in_14=>port_in_14 , port_in_15=>port_in_15 , 
											  rom_data_out=>rom_data_out , rw_data_out=>ram_data_out , address=>address, data_out=>data_Out);
 end architecture;
