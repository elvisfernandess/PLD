-------------------------------------------------------
--! Unidade Logica Aritmetica
--! Aluno: André Adami Tanaka
--! Data: 02/09/2022
--! 
--! 
--! 
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(
         alu_op   : in  std_logic_vector (4 downto 0); --seletor da operaçao a ser feita.
         A  : in  signed (15 downto 0); --Variavel de entrada
         B : in  signed (15 downto 0);  --Variavel de entrada
         result : out signed (15 downto 0); --Resultado da operação feita
         --N : out bit; --Bit flag para resultados negativos
         C : out std_logic --Bit flag de carry(estouro de contagem).
    );
end entity alu;

architecture rtl of alu is
    signal temp_res : signed (16 downto 0); --sinal intermediário para criar o bit de carry
begin
    with alu_op select
        temp_res <= resize(A+B,temp_res'length) when "00000", --Operação de adição
                    resize(A-B,temp_res'length) when "00001", --Operação de subtração
                    resize(B-A,temp_res'length) when "00010", --Faz B-A para comparar depois
                    resize(A and B, temp_res'length) when "00011", --Operação de AND(E) bit abit entre os operadores A e B.
                    resize(A or B, temp_res'length) when "00100", --Operação de OR(OU) bit abit entre os operadores A e B.
                    (others =>'0') when "00101", --Clear, zera o operador A.
                    resize(NOT(A),temp_res'length) when "00110", --Inverte os bits do operdor A.
                    (others =>'0') when others;
        
        result <= temp_res(15 downto 0);
        C <= temp_res(16);
end architecture rtl;
