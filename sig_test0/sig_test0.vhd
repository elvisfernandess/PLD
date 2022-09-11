library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_unsigned.all;
use ieee. std_logic_arith.all;

entity sig_test0 is
port (
    a : in std_logic;
    x : buffer std_logic
);
end entity sig_test0;

architecture rtl of sig_test0 is
 	signal b : std_logic;
begin

x <= b XOR a;
b <= not x;

end architecture rtl;