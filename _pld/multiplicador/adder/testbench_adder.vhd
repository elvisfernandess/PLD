-------------------------------------------------------
--! Tarefa 1 - ADDER - Somador
--! Aluno: Elvis Fernandes
--! Data: 01/03/2024
--! Arquivo: testbench_adder.vhd
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_adder is
    
        constant DATA_WIDTH : integer := 16;  -- Largura padrão para os vetores UNSIGNED
        signal dataa : unsigned(DATA_WIDTH - 1 downto 0);
        signal datab : unsigned(DATA_WIDTH - 1 downto 0);
        signal sum : unsigned(DATA_WIDTH - 1 downto 0);
        
        
end entity testbench_adder;

architecture stimulus of testbench_adder is
    
begin

   adder_inst : entity work.adder
       generic map(
           DATA_WIDTH => DATA_WIDTH
       )
       port map(
           dataa => dataa,
           datab => datab,
           sum   => sum
       );

   dataa <= x"01A3";
   datab <= x"01A3";


end architecture stimulus;