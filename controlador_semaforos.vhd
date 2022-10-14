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
        TEMPO_TESTE_1 : integer := 5;
        TEMPO_TESTE_2 : integer := 45;
        TEMPO_TESTE_3 : integer := 50;
        TEMPO_TESTE_4 : integer := 80
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
    type state_type is (REGULAR, TEST, STANDBY);

    signal state : state_type;
    signal AmAm  : state_type;
    signal VmAm  : state_type;
    signal VdVm  : state_type;
    signal AmVm  : state_type;
    signal VmVd  : state_type;

begin

    -- Processo repsonsável apenas pela
    -- transição de estados
    state_transation : process(clk, reset) is
        variable cont : integer;
    begin
        if reset = '1' then
            state <= STANDBY;
        elsif rising_edge(clk) then
            case state is
                when STANDBY =>
                    if stby = '1' then
                        state <= AmAm;
                    end if;
                    state <= VmAm;
                    cont  := cont + 1;
                when REGULAR =>
                    if cont = TEMPO_TESTE_1 then
                        state <= VdVm;
                        cont  := cont + 1;
                    end if;
                    if cont = TEMPO_TESTE_2 then
                        state <= AmVm;
                        cont  := cont + 1;
                    end if;
                    if cont = TEMPO_TESTE_3 then
                        state <= VmVd;
                        cont  := cont + 1;
                    end if;
                    if cont = TEMPO_TESTE_4 then
                        state <= VmAm;
                        cont  := 0;
                    end if;
                when TEST =>
                    null;
            end case;
        end if;
    end process;
end architecture RTL;
