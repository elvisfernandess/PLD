library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture stimulos of testbench is

                signal invec : std_logic_vector (31 downto 0);
                signal outvec: std_logic_vector (7 downto 0);

begin

    ones_count_dut : entity work.ones_count
        port map (
                  invec => invec,
                  outvec => outvec);

        process
        begin
                invec <= x"00FF0002";
                wait for 10 ns;
                
                invec <= x"00FF00FF";
                wait for 10 ns;

                wait;

        end process;

end architecture stimulos;
