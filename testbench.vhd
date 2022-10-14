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
signal clk   : std_logic;
signal reset : std_logic;
signal stby  : std_logic;
signal test  : std_logic;
signal vermelho_1 : std_logic;
signal amarelo_1 : std_logic;
signal verde_1 : std_logic;
signal vermelho_2 : std_logic;
signal amarelo_2 : std_logic;
signal verde_2 : std_logic;