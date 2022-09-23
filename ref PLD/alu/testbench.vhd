library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture simul of testbench is

  signal alu_op      : std_logic_vector (4 downto 0);
  signal a     : signed (15 downto 0);
  signal b     : signed (15 downto 0);
  signal carry : std_logic;
  signal output   : signed (15 downto 0);

  begin

    alu_dut : entity work.alu
        port map(
                 alu_op => alu_op,
                 A => a,
                 B => b,
                 result => output,
                 C => carry);

    process
    begin
      a <= x"01A3";
      b <= x"000C";
      for i in 0 to 2**(alu_op'length)-1 loop
          alu_op <= std_logic_vector(to_unsigned(i,alu_op'length));
          wait for 10 ns;
      end loop;
      
--      a <= x"F1A3";
--      b <= x"700C";
--      alu_op <= "00001";
--      wait for 50 ns;
      
--      a <= x"0503";
--      b <= x"001B";
--      alu_op <= "00001";
--      wait for 50 ns;
      
--      a <= x"0503";
--      b <= x"001B";
--      alu_op <= "00011";
--      wait for 50 ns;
      
--      alu_op <= "11111";
--      wait for 50 ns;
    end process;
  end architecture simul;