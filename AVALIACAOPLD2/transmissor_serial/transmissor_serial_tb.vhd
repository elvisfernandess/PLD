-------------------------------------------------------------------
-- Name        : transmissor_serial.vhd
-- Author      : Elvis Fernandes
-- Version     : 0.1
-- Copyright   : Departamento de Eletrônica, Florianópolis, IFSC
-- Description : Tarefa 12: Transmissor Serial 
-- Date        : 06/05/2024
-------------------------------------------------------------------
--Esta tarefa envolve a criação de um módulo em VHDL que recebe dados em paralelo de barramentos de 8 bits e os converte em formato serial para serem transmitidos por um pino de saída.
--Pinos de entrada e saída:
--clk - fclk = 100 kHz (usar uma PLL para redução).
--start: sinal que sinaliza o início da transmissão. A transmissão é iniciada quando start é nível lógico alto.
--reset: reinicializa circuitos síncronos.
--data: dado de 8 bits para ser transmitido em formato serial.
--addr: endereço de 8 bits que será transmitido em formato serial antes do dado.
--sdata: canal de saída da transmissão serial.
--Implementação e requisitos:
--Um exemplo de formato de saída pode ser visualizado na figura abaixo.
--Um bit em nível baixo deve ser enviado no início da transmissão (start bit).
--A linha permanece em nível lógico alto quando não há nenhuma transmissão.
--Use uma máquina de estados.
--Use simulação para o desenvolvimento.
--Comprovar o funcionamento da síntese com o osciloscópio.
--Código deve conter documentação.
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity transmissor_serial_tb is
end entity transmissor_serial_tb;

architecture tb of transmissor_serial_tb is

    -- Constants
    constant CLK_PERIOD : time := 10 ns; -- Período do clock de simulação
    constant BAUD_RATE  : integer := 9600;   -- Taxa de transmissão em bps
    
    -- Signals
    signal clk    : std_logic := '0';  -- Clock
    signal start  : std_logic := '0';  -- Sinal de início de transmissão
    signal reset  : std_logic := '0';  -- Sinal de reset
    signal data   : std_logic_vector(7 downto 0) := (others => '0'); -- Dado de entrada
    signal addr   : std_logic_vector(7 downto 0) := (others => '0'); -- Endereço de entrada
    signal sdata  : std_logic_vector(15 downto 0);


    -- Signals
    signal clk_in    : std_logic := '0';  -- Clock
	signal rst       : std_logic;
	signal sel_pr    : std_logic_vector (2 downto 0); -- Ajustado para 3 bits
	signal counter   : unsigned(7 downto 0);
	signal clk_out   : std_logic := '0';  -- Clock
begin

    -- Instanciação do transmissor serial
    dut: entity work.transmissor_serial
        port map (
            clk   => clk,
            start => start,
            reset => reset,
            data  => data,
            addr  => addr,
            sdata => sdata
        );
		
		    -- Instanciação do transmissor serial
    pll: entity work.pll
        port map (
            clk_in   => clk_in,
            rst       => rst,
            sel_pr    => sel_pr,
			counter   => counter,
            clk_out => clk_out
        );

    -- Gera um clock
    stimulus_process_clk : process
    begin
        clk <= '0';
        wait for 5 ns; -- Tempo de espera reduzido para permitir uma verificação mais frequente do match
        clk <= '1';    -- Alternando o clock
        wait for 5 ns;
    end process stimulus_process_clk;

    -- Processo de estímulo
    start_process: process
    begin
        -- Inicia a transmissão após 20 ns
        wait for 20 ns;
        start <= '1';
        wait for 10 ns;
        start <= '0';
        wait;
    end process start_process;
	
	    -- Processo de reset
    reset_process: process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait;
    end process reset_process;
	
    -- Processo de estimulação de dados
    data_stim_process: process
    begin
        for i in 0 to 255 loop
            data <= std_logic_vector(to_unsigned(i, data'length));
            wait for 10417 ns; -- Espera 1 byte ser transmitido (10417ns = 1 byte / 9600bps)
			--wait for 100 ns;
        end loop;
        wait;
    end process data_stim_process;
    
    -- Processo de estimulação de endereço
    addr_stim_process: process
    begin
        for i in 0 to 255 loop
            addr <= std_logic_vector(to_unsigned(i, addr'length));
            wait for 10417 ns; -- Espera 1 byte ser transmitido (10417ns = 1 byte / 9600bps)
			--wait for 100 ns;
        end loop;
        wait;
    end process addr_stim_process;
	
	
	-- Processo de estimulação de dados
	--data_stim_process: process
	--begin
	--	data <= "01010101";  -- Por exemplo, aqui você pode definir o valor desejado para data
	--  wait for 10417 ns; -- Espera 1 byte ser transmitido (10417ns = 1 byte / 9600bps)
	--	wait for 100 ns;
		-- Repita para cada valor que desejar atribuir a data
	--	wait;
	--end process data_stim_process;

	-- Processo de estimulação de endereço
	--addr_stim_process: process
	--begin
	--	addr <= "11001100";  -- Por exemplo, aqui você pode definir o valor desejado para addr
	--  wait for 10417 ns; -- Espera 1 byte ser transmitido (10417ns = 1 byte / 9600bps)
	--	wait for 100 ns;
		-- Repita para cada valor que desejar atribuir a addr
	--	wait;
	--end process addr_stim_process;
	
	    -- Gera um clock
    stimulus_process_clk_pll : process
    begin
        clk_in <= '0';
        wait for 5 ns; -- Tempo de espera reduzido para permitir uma verificação mais frequente do match
        clk_in <= '1';    -- Alternando o clock
        wait for 5 ns;
    end process stimulus_process_clk_pll;
    
    -- Processo para estímulos para o sinal reset
    stimulus_process_reset: process
    begin
        rst <= '1';
        wait for 2 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos
        rst <= '0';
        wait for 2 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos
        wait;
    end process stimulus_process_reset;
	
	    -- Processo para estímulos para o sinal sel_pr
    stimulus_process_sel_pr: process
    begin
		--wait for 5 ns; -- Aguarda um tempo antes de mudar o valor de sel_pr
        sel_pr <= "000";
        wait for 100 ns; -- Aguarda um tempo antes de mudar o valor de sel_pr
        sel_pr <= "001";
        wait;
    end process stimulus_process_sel_pr;

end architecture tb;