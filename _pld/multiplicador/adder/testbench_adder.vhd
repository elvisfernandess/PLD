library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_adder is
    constant DATA_WIDTH : integer := 16;  -- Largura padrão para os vetores UNSIGNED
    signal clk : std_logic := '1';  -- Sinal de clock
    signal dataa : unsigned(DATA_WIDTH - 1 downto 0);
    signal datab : unsigned(DATA_WIDTH - 1 downto 0);
    signal sum : unsigned(DATA_WIDTH - 1 downto 0);
end entity testbench_adder;

architecture stimulus of testbench_adder is
begin
    -- Processo para gerar o sinal de clock
    clk_process: process
    begin
        while now < 1000 ns loop  -- Defina a duração do ciclo de clock
            clk <= '0';
            wait for 5 ns;  -- Metade do período de clock
            clk <= '1';
            wait for 5 ns;  -- Metade do período de clock
        end loop;
        wait;
    end process;

    adder_inst : entity work.adder
        generic map(
            DATA_WIDTH => DATA_WIDTH
        )
        port map(
            clk   => clk,  -- Conecte o sinal de clock
            dataa => dataa,
            datab => datab,
            sum   => sum
        );

    -- Estímulos para dataa e datab (você pode modificar conforme necessário)
    stimulus_process: process
    begin
        wait for 10 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos
        dataa <= x"01A3";
        datab <= x"01A3";
        wait;
    end process;
	
end architecture stimulus;
