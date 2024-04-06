library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity fsm is
    port(
        -- Portas de entrada
        done    : in  std_logic;  -- Sinal de conclusão
        clk_ena : in  std_logic;  -- Sinal de habilitação do clock
        sclr_n  : in  std_logic   -- Sinal de reset assíncrono
        -- Portas de saída (comentadas)
        --input_sel  : out std_logic_vector(1 downto 0);  -- Seleção de entrada
        --shift_sel  : out std_logic_vector(1 downto 0)   -- Seleção de deslocamento
    );
end entity fsm;

architecture RTL of fsm is
    -- Definição do tipo de estado da máquina de estados finitos (FSM)
    type state_type is (IDLE, LSB);
    
    -- Sinal para armazenar o estado atual da FSM
    signal state : state_type;

begin

    -- Processo responsável pela transição de estados da FSM
    state_transation : process(clk_ena, sclr_n, done) is
    begin
        -- Lógica de reset
        if sclr_n = '1' or done = '0' then
            state <= IDLE;  -- Retorna ao estado IDLE quando ocorre um reset ou o sinal de conclusão é desativado
        elsif rising_edge(clk_ena) then
            -- Lógica de transição de estado
            case state is
                when IDLE =>
                    -- Transição para o estado LSB quando o sinal de conclusão é ativado
                    if done = '1' then
                        state <= LSB;
                    end if;
                when LSB =>
                    -- Retorna ao estado IDLE quando o sinal de reset é ativado
                    if sclr_n = '0' then
                        state <= IDLE;
                    end if;
            end case;
        end if;
    end process;

end architecture RTL;
