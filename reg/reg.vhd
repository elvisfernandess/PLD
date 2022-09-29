-------------------------------------------------------
--! Tarefa 04: Banco de Registradores
--! Aluno: Elvis Fernandes
--! Data: 29/09/2022
--! Arquivo: reg.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
port(
clk       : in  std_logic;      --! porta de entrada de clock
reset 	  : in  std_logic;      --! reset assíncrono (clear)
w_wr      : in  std_logic;      --! bit de controle de escrita
w_addr    : in  std_logic_vector(3 downto 0); --! seletor de endereço
w_data    : in  std_logic_vector(15 downto 0); --! porta com os dados a serem gravados
ra_addr   : in  std_logic_vector(3 downto 0); --! seletor a (o qual registrador será lido)
rb_addr   : in  std_logic_vector(3 downto 0); --! seletor b (o qual registrador será lido)
ra_data   : out std_logic_vector(15 downto 0); --! porta de saída da leitura (a)
rb_data   : out std_logic_vector(15 downto 0)  --! porta de saída da leitura (b)
);
end entity reg;

