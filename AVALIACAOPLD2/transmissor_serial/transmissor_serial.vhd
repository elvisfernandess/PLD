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

entity transmissor_serial is
    port (
        clk   : in  std_logic;
        start : in  std_logic;
        reset : in  std_logic;
        data  : in  std_logic_vector(7 downto 0);
        addr  : in  std_logic_vector(7 downto 0);
        sdata : out std_logic_vector(15 downto 0)
    );
end entity transmissor_serial;

architecture rtl of transmissor_serial is
    constant CLK_FREQUENCY : integer := 100000; -- Frequência de clock em Hz
    constant BAUD_RATE     : integer := 9600;   -- Taxa de transmissão em bps

    constant COUNTER_MAX   : integer := CLK_FREQUENCY / BAUD_RATE;
    signal counter_transmissor         : integer range 0 to COUNTER_MAX - 1 := 0;
    signal data_unsigned   : unsigned(7 downto 0);
    signal addr_unsigned   : unsigned(7 downto 0);
    signal sdata_unsigned  : unsigned(15 downto 0);
    signal pll_clk_out 	   : std_logic;
	signal clk_in          : std_logic := '0';  -- Clock
	signal rst             : std_logic;
	signal sel_pr          : std_logic_vector (2 downto 0); -- Ajustado para 3 bits
	signal counter         : unsigned(7 downto 0);
	signal clk_out         : std_logic;  -- Clock
	signal clk_transmissor : std_logic;  -- Clock
begin

	    -- Instanciação do transmissor serial
    pll: entity work.pll
        port map (
            clk_in    => clk,
            rst       => rst,
            sel_pr    => sel_pr,
			counter   => counter,
            clk_out   => clk_out
        );	
		
    -- Conversão de std_logic_vector para unsigned
    data_unsigned <= unsigned(data);
    addr_unsigned <= unsigned(addr);
	clk_transmissor <=clk;
	clk_out<=clk_transmissor;
    --clk <=clk_out;
    -- Processo de divisão do clock para reduzir a frequência e transmissão serial
    process (clk_out)
    begin
        if rising_edge(clk_out) then
            if reset = '1' then
                counter_transmissor  <= 0;
            elsif start = '1' then
                if counter_transmissor  = COUNTER_MAX - 1 then
                    counter_transmissor  <= 0;
                else
                    counter_transmissor  <= counter_transmissor  + 1;
                end if;
            end if;
        end if;
    end process;

    -- Conversão de unsigned para std_logic_vector
    sdata_unsigned <= data_unsigned & addr_unsigned;
    sdata <= std_logic_vector(sdata_unsigned);

end architecture rtl;

