library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        clk                : in std_logic;
        reset              : in std_logic;
        signal data_in_fsm :    unsigned(15 downto 0);
        signal opcode      :    unsigned(3 downto 0)
    );
end entity fsm;

architecture RTL of fsm is
    type state_type is (STOP, fetch, decode, halt, error, ld_imed, mem_calc, branch_compl);

    signal state : state_type;

begin

    state_transation : process(clk, reset) is
    begin
        state <= STOP;
        if reset = '0' then
            state <= fetch;

        elsif rising_edge(clk) then
            case state is
                when STOP =>
                    if reset = '0' then
                        state <= fetch;
                    end if;

                when fetch =>
                    state <= decode;

                when decode =>
                    if opcode = x"0xFF" then
                        state <= halt;

                    elsif opcode = x"0x60" then
                        state <= ld_imed;

                    elsif opcode = x"0x01" then
                        state <= mem_calc;

                    elsif opcode = x"0x03" then
                        state <= mem_calc;

                    elsif opcode = x"0x04" then
                        state <= branch_compl;

                    elsif opcode = x"0x05" then
                        state <= branch_compl;

                    end if;

                when halt =>
                    null;
                when error =>
                    null;
                when ld_imed =>
                    null;
                when mem_calc =>
                    null;
                when branch_compl =>
                    null;
            end case;
        end if;
    end process;

end architecture RTL;
