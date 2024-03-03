library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_multiplier_8x8 is
end entity testbench_multiplier_8x8;

architecture testbench of testbench_multiplier_8x8 is
    -- Constantes de configuração
    constant CLOCK_PERIOD : time := 10 ns;
    constant RESET_PERIOD : time := 5 ns;
    constant TEST_DURATION : time := 1000 ns; -- Aumentado para garantir tempo suficiente para os testes
    
    -- Largura padrão para os vetores UNSIGNED
    constant DATA_WIDTH : integer := 8;
    
    -- Sinais para o DUT (Design Under Test)
    signal clk : std_logic := '0';
    signal dataa, datab : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal result : unsigned((2 * DATA_WIDTH) - 1 downto 0) := (others => '0');
    
begin

    -- Instância do DUT
    dut : entity work.multiplier_8x8
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            clk => clk,
            dataa => dataa,
            datab => datab,
            result => result
        );

    -- Processo para gerar o sinal de clock
    clk_process: process
    begin
        while now < TEST_DURATION loop
            clk <= not clk;
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo para aplicar os estímulos de entrada
    stimulus_process: process
    begin
	
        -- Aguarda um curto período antes de iniciar os testes
        wait for 10 ns;
        
        -- Teste 1: dataa = 5, datab = 3
        dataa <= to_unsigned(5, dataa'length);
        datab <= to_unsigned(3, datab'length);
        wait for 100 ns; -- Aumentado para garantir tempo suficiente para o teste ser processado
        
        -- Teste 2: dataa = 7, datab = 6
        dataa <= to_unsigned(7, dataa'length);
        datab <= to_unsigned(6, datab'length);
        wait for 100 ns;
        
        -- Teste 3: dataa = 10, datab = 5
        dataa <= to_unsigned(10, dataa'length);
        datab <= to_unsigned(5, datab'length);
        wait for 100 ns;
        
        -- Teste 4: dataa = 12, datab = 8
        dataa <= to_unsigned(12, dataa'length);
        datab <= to_unsigned(8, datab'length);
        wait for 100 ns;
        
        -- Teste 5: dataa = 15, datab = 15
        dataa <= to_unsigned(15, dataa'length);
        datab <= to_unsigned(15, datab'length);
        wait for 100 ns;
        
        -- Fim dos testes
        wait;
    end process;

end architecture testbench;
