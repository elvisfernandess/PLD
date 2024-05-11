-------------------------------------------------------------------
-- Name        : BCD_to_7seg_display.vhd
-- Author      : Elvis Fernandes
-- Version     : 0.1
-- Copyright   : Departamento de Eletrônica, Florianópolis, IFSC
-- Description : Tarefa 11: subprogramas
-- Date        : 05/05/2024
-------------------------------------------------------------------
--Implemente um pacote que contenha a função especificada abaixo.
--Desenvolva usando a simulação.
--Sintetize e teste no kit DE10-Lite.
--Analise a quantidade de hardware utilizado no resultado da síntese.
--Escreva uma função que faz a conversão de 4-bits BCD para display de 7-segmentos (0 a 0xF).
--Use um vetor (array) constante para definir a tabela.
--Escreve outra função que recebe um número de 8-bits e converte para dois diplays de 7 segmentos. Use a função acima.
--Teste utilizando 2 displays de 7 segmentos e um contador síncrono.
-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.bcd_to_7seg_pkg.all;

entity BCD_to_7seg_display is
    Port (
        bcd_input : in  std_logic_vector(7 downto 0);
        seven_seg_output : out std_logic_vector(13 downto 0) -- Alterado para acomodar dois displays
    );
end entity BCD_to_7seg_display;

architecture Behavioral of BCD_to_7seg_display is
begin
    -- Função para converter um número de 8 bits para dois displays de 7 segmentos
    --function convert_8bits_to_dual_7seg(bcd_input : std_logic_vector(7 downto 0)) return std_logic_vector is
    --begin
       -- return bcd_to_7seg(bcd_input(7 downto 4)) & bcd_to_7seg(bcd_input(3 downto 0));
    --end function;

    -- Atribui o resultado da função convert_8bits_to_dual_7seg à saída seven_seg_output
    seven_seg_output <= convert_8bits_to_dual_7seg(bcd_input);

end architecture Behavioral;