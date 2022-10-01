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
signal w_addr    : unsigned(3 downto 0) := "0101";
signal w_data    : unsigned(15 downto 0) := x"045a";
signal ra_addr   : unsigned(3 downto 0) := "1010";
signal rb_addr   : unsigned(3 downto 0) := "0110";
signal ra_data   : unsigned(15 downto 0);
signal rb_data   : unsigned(15 downto 0);

begin                                   -- inicio do corpo da arquitetura

dut : entity work.reg

port map(
clk       => clk,
reset     => reset,
w_wr      => w_wr,
w_addr    => w_addr,
w_data    => w_data,
ra_addr   => ra_addr,
rb_addr   => rb_addr,
ra_data   => ra_data,
rb_data   => rb_data); 

--gera um clock
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
reset <= '0';
wait;
end process;

--gera um w_wr
process
begin
wait for 80 ns;
w_wr <= '1';
w_addr <= ra_addr;
wait for 10 ns;
w_wr <= '0';
wait for 10 ns;
w_wr <= '1';
w_addr <= rb_addr;
wait;
end process;

end architecture stimulus;