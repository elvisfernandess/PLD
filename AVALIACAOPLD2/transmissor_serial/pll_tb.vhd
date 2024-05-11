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

entity pll_tb is
end entity pll_tb;

architecture tb of pll_tb is

    -- Signals
    signal clk_in    : std_logic := '0';  -- Clock
	signal rst       : std_logic;
	signal sel_pr    : std_logic_vector (2 downto 0); -- Ajustado para 3 bits
	signal counter   : unsigned(7 downto 0);
	signal clk_out   : std_logic := '0';  -- Clock

begin

    -- Instanciação do transmissor serial
    dut: entity work.pll
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
        clk_in <= '0';
        wait for 5 ns; -- Tempo de espera reduzido para permitir uma verificação mais frequente do match
        clk_in <= '1';    -- Alternando o clock
        wait for 5 ns;
    end process stimulus_process_clk;
    
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