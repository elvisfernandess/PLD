library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex_3 is
    port(
        a : in std_logic;
        x : buffer std_logic
    );
end entity ex_3;

architecture behave of ex_3 is
    signal b : std_logic;
    signal c : std_logic;
begin
    x <= a XOR c;
    c <= a AND b;
    b <= not x;

end architecture behave;
