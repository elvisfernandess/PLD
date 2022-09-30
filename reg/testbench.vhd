-------------------------------------------------------
--! Tarefa 04: Banco de Registradores
--! Aluno: Elvis Fernandes
--! Data: 30/09/2022
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
signal reset 	 : std_logic                     := '1';
signal w_wr      : std_logic                     := '1';
signal w_data    : std_logic_vector(15 downto 0) := x"045a";
signal ra_data   : std_logic_vector(15 downto 0);
signal rb_data   : std_logic_vector(15 downto 0);

dut : entity work.pc
port map(
clk       => clk,
reset     => reset,
w_wr      => w_wr,
w_data    => w_data,
ra_data   => ra_data,
rb_data   => rb_data);

gera um clock
process
begin
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
end process;

--gera um reset
process
begin
wait for 60 ns;
reset <= '1';
wait;
end process;

--gera um w_wr
process
begin
wait for 80 ns;
w_wr <= '1';
wait;
end process;