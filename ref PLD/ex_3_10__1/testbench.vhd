library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture stimulos of testbench is

                signal a : std_logic;
                signal x: std_logic;

begin

    ex_3_dut : entity work.ex_3
        port map (
                  a => a,
                  x => x);

        process
        begin
                a <= '0';
                wait for 10 ns;
                
                a <= '1';
                wait for 10 ns;
                
                a <= '0';

                wait;

        end process;

end architecture stimulos;
