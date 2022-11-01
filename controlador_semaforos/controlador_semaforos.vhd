-------------------------------------------------------
--! Avaliação 1 - Controlador Semáforos
--! Aluno: Elvis Fernandes
--! Data: 14/10/2022
--! Arquivo: controlador_semaforos.vhd
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlador_semaforos is
    generic(
        constant MAX: natural := 80;
        TEMPO_TESTE_1 : integer := 5;
        TEMPO_TESTE_2 : integer := 45;
        TEMPO_TESTE_3 : integer := 5;
        TEMPO_TESTE_4 : integer := 30
    );

    port(
        --sinais de entrada
        clk        : in  std_logic;
        reset      : in  std_logic;
        stby       : in  std_logic;
        test       : in  std_logic;
        --semaforo 1
        vermelho_1 : out std_logic;
        amarelo_1  : out std_logic;
        verde_1    : out std_logic;
        --semaforo 1
        vermelho_2 : out std_logic;
        amarelo_2  : out std_logic;
        verde_2    : out std_logic
    );
end entity controlador_semaforos;

architecture RTL of controlador_semaforos is
    type state_type is (AmAm,VmAm,VdVm,AmVm,VmVd);

    signal state : state_type;
    --signal AmAm  : state_type;
    --signal VmAm  : state_type;
    --signal VdVm  : state_type;
    --signal AmVm  : state_type;
    --signal VmVd  : state_type;

begin

    -- Processo repsonsável apenas pela
    -- transição de estados
    state_transation : process(clk, reset) is
        variable cont : integer;
	variable count: natural range 0 to MAX := 0;
    begin
        if reset = '1' then
		if stby = '1' then
		state <= AmAm;
		end if;
		count := count + 1;

        elsif rising_edge(clk) then

	if stby = '0' then
            state <= VmAm;
	
	elsif rising_edge(clk) then
		count := count + 1;

	if count >= TEMPO_TESTE_1 then
            	state <= VdVm;
	
	elsif rising_edge(clk) then
		count := count +1;	
        
	if count >= (TEMPO_TESTE_2) then
		state <= AmVm;
		
	elsif rising_edge(clk) then
		count := count + 1;

	if count >= (TEMPO_TESTE_3) then
		state <= VmVd;
	
	elsif rising_edge(clk) then
		count := count + 1;

	if count >= (TEMPO_TESTE_4) then
		state <= VmAm;

	--elsif rising_edge(clk) then
		count := count + 1;

					end if;
				end if;
			end if;
		end if;	
	end if;
end if;
    end process;

output : process(state)
    begin
        vermelho_1 <= '0';
        amarelo_1 <= '1';
        verde_1 <= '0';
        vermelho_2 <= '0';
        amarelo_2 <= '1';
        verde_2 <= '0';
        
        case state is
                when AmAm =>
                    vermelho_1 <= '0';
                    amarelo_1 <= '1';
                    verde_1 <= '0';
                    vermelho_2 <= '0';
                    amarelo_2 <= '1';
                    verde_2 <= '0';
                when VmAm =>
                    vermelho_1 <= '1';
                    amarelo_1 <= '0';
                    verde_1 <= '0';
                    vermelho_2 <= '0';
                    amarelo_2 <= '1';
                    verde_2 <= '0';
                when VdVm =>
                    vermelho_1 <= '0';
                    amarelo_1 <= '0';
                    verde_1 <= '1';
                    vermelho_2 <= '1';
                    amarelo_2 <= '0';
                    verde_2 <= '0';
                when AmVm =>
                    vermelho_1 <= '0';
                    amarelo_1 <= '1';
                    verde_1 <= '0';
                    vermelho_2 <= '1';
                    amarelo_2 <= '0';
                    verde_2 <= '0';
                when VmVd =>
                    vermelho_1 <= '1';
                    amarelo_1 <= '0';
                    verde_1 <= '0';
                    vermelho_2 <= '0';
                    amarelo_2 <= '0';
                    verde_2 <= '1';
            end case;
    end process;


end architecture RTL;