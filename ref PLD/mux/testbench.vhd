library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
        generic(
                 N : integer := 4
    );
end entity testbench;

architecture simul of testbench is

  signal sel	  : std_logic;
  signal in_1     : unsigned (N-1 downto 0);
  signal in_2     : unsigned (N-1 downto 0);
  signal output   : unsigned (N-1 downto 0);

  begin

    mux_sel_work : entity work.mux_sel
        port map(
                 mux_sel => sel,
                 mux_in_a => in_1,
                 mux_in_b => in_2,
                 mux_out => output);

    process
    begin
      in_1 <= "1001";
      in_2 <= "1111";
      sel <= '0';
      wait for 50 ns;

      sel <= '1';
      wait for 50 ns;
      wait;

    end process;
  end architecture simul;
