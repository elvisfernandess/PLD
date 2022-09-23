library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture stimulos of testbench is

                signal p_1 : std_logic_vector (4 downto 0);
                signal p_2 : std_logic_vector (4 downto 0);
                signal result: std_logic_vector (4 downto 0);

begin

    adder_dut : entity work.adder
        port map (
                  a => p_1,
                  b => p_2,
                  sum =>result);

        process
        begin
                p_1 <= "01010";
                p_2 <= "00001";
                wait for 10 ns;

                p_1 <= "00110";
                p_2 <= "00010";
                wait for 10 ns;

                p_1 <= "01110";
                p_2 <= "00111";
                wait;

        end process;

end architecture stimulos;
