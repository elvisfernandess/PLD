-------------------------------------------------------
--! Tarefa 3 - Contador de Programa
--! Aluno: Elvis Fernandes
--! Data: 29/09/2022
--! Arquivo: testbench.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------
architecture stimulus of testbench is

-- declaração de sinais
signal clk       : std_logic                     := '0';
signal load 	 : std_logic                     := '1';
signal reset 	 : std_logic                     := '1';
signal up    	 : std_logic                     := '1';
signal datain    : std_logic_vector(15 downto 0) := x"045a";
signal data   	 : std_logic_vector(15 downto 0);

begin                                   -- inicio do corpo da arquitetura

dut : entity work.reg16
port map(
clk       => clk,
load      => load,
reset     => reset,
up        => up,
datain    => datain,
data      => data);

- gera um clock
process
begin
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
end process;

--gera um load
process
begin
wait for 80 ns;
load <= '1';
wait;
end process;

--gera um reset
process
begin
wait for 100 ns;
reset <= '1';
wait;
end process;

--gera um up
process
begin
wait for 120 ns;
reset <= '1';
wait;
end process;

end architecture stimulus;