library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        clk : in  std_logic;
        rst : in  std_logic;
        d   : in  std_logic;
        q   : out std_logic
    );
end entity fsm;

architecture RTL of fsm is
    type state_type is (zero, um, dois, tres);

    signal state : state_type;
begin

    -- Processo repsons�vel apenas pela
    -- transi��o de estados
    state_transation : process(clk, rst, d) is
    begin
        if rst = '1' or d = '0' then
            state <= zero;

        elsif rising_edge(clk) then
            case state is
                when zero =>
                    if d = '1' then
                        state <= um;
                    elsif (d = '0') then
                        state <= zero;
                    end if;
                when um =>
                    if (d = '1') then
                        state <= dois;

                    elsif (d = '0') then
                        state <= zero;
                    end if;
                when dois =>
                    if (d = '1') then
                        state <= tres;

                    elsif (d = '0') then
                        state <= zero;
                    end if;
                when tres =>

                    if (d = '1') then
                        state <= tres;

                    elsif (d = '0') then
                        state <= zero;

                    end if;

            end case;
        end if;
    end process;

    -- Sa�da(s) tipo Moore:
    -- Apenas relacionadas com o estado.
    moore : process(state)
    begin
        q <= '0';

        case state is
            when zero =>                     
                q <= '0';
            when um =>
                q <= '0';
            when dois =>
                q <= '0';
            when tres =>
                q <= '1';
        end case;
    end process;

end architecture RTL;