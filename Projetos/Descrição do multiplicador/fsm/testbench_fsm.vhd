-- bibliotecas e cláusulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_fsm is
end entity testbench_fsm;

architecture stimulus of testbench_fsm is

    -- declaração de sinais
    -- Sinais de entrada (comentados)
    --signal input_sel  : out std_logic_vector(1 downto 0);
    --signal shift_sel  : out std_logic_vector(1 downto 0);
    signal done       : in  std_logic;  -- Sinal de conclusão
    signal clk_ena    : in  std_logic;  -- Sinal de habilitação do clock
    signal sclr_n     : in  std_logic;  -- Sinal de reset assíncrono
		
begin

    -- Instanciação da unidade sob teste (DUT)
    dut : entity work.fsm
        port map(
            -- Portas de entrada (comentadas)
            --input_sel         => input_sel,
            --shift_sel         => shift_sel,
            done       => done,
            clk_ena    => clk_ena,
            sclr_n     => sclr_n
        );
		
    -- Processo para gerar uma forma de onda repetitiva e regular de clocks
    process
    begin
        clk_ena <= '0';
        wait for 50 ns;
        clk_ena <= '1';
        wait for 50 ns;
    end process;
	
    -- Processo para gerar uma forma de onda de um só pulso para o sinal sclr_n
    process
    begin
        sclr_n <= '1';
        wait for 20 ns;
        sclr_n <= '0';
        wait;
    end process;
	
    -- Processo para gerar uma forma de onda de um só pulso para o sinal done
    process
    begin
        done <= '1';
        wait for 100 ns;
        done <= '0';
        wait for 40 ns;
        done <= '1';
        wait for 120 ns;
        done <= '0';
        wait for 40 ns;
        --wait;
    end process;
	
end architecture stimulus;
