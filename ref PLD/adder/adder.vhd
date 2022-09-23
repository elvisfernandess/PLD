library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
        --Entradas e saidas do sistema
    port (
            a : in std_logic_vector (4 downto 0);
            b : in std_logic_vector (4 downto 0);
            sum : out std_logic_vector (4 downto 0)
        );
end entity adder;

architecture behave of adder is
begin
        sum <= std_logic_vector(signed(a) + signed(b));
end architecture behave;