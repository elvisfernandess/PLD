-------------------------------------------------------
--! Tarefa 5 - Registrador de Instrução
--! Aluno: Elvis Fernandes
--! Data: 11/11/2022
--! Arquivo: registrador_instrucao.vhd
-------------------------------------------------------

-- Bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidades e portas
entity registrador_instrucao is
    port(
        signal clk          : in  std_logic; --Clock
        signal reset        : in  std_logic; --reset assícrono
        signal en           : in  std_logic; --Enable síncrono
        signal datain       : in  unsigned(15 downto 0); --Entrada de 16bits
        signal opcode       : out unsigned(3 downto 0); --opcode (bits mais significativos)
        signal cond         : out unsigned(3 downto 0);
        signal deslocamento : out unsigned(7 downto 0);
        signal mode         : out unsigned(2 downto 0);
        signal reg          : out unsigned(2 downto 0);
        signal reg2         : out unsigned(2 downto 0);
        signal src          : out unsigned(5 downto 0);
        signal dst          : out unsigned(5 downto 0)
    );
end entity registrador_instrucao;

architecture RTL of registrador_instrucao is

begin

    process(clk, reset)
    begin
        if reset = '1' then             -- Condição Reset Assincrono ligado
            opcode       <= (others => '0');
            opcode       <= (others => '0');
            cond         <= (others => '0');
            deslocamento <= (others => '0');
            mode         <= (others => '0');
            reg          <= (others => '0');
            reg2         <= (others => '0');
            src          <= (others => '0');
            dst          <= (others => '0');
        elsif rising_edge(clk) then     --Condição borda de subida clock
            if en = '1' then            --Enable ligado
                opcode       <= datain(15 downto 12);
                cond         <= datain(11 downto 8);
                deslocamento <= datain(7 downto 0);
                mode         <= datain(5 downto 3);
                reg          <= datain(2 downto 0);
                reg2         <= datain(10 downto 8);
                src          <= datain(11 downto 6);
                dst          <= datain(5 downto 0);
            end if;
        end if;

    end process;

end architecture RTL;
