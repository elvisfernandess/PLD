library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logical_arithmetic_operations is
    port (
        a, b : in std_logic_vector(3 downto 0);
        result_and, result_or, result_xor, result_not_a, result_not_b : out std_logic_vector(3 downto 0);
        result_add, result_sub, result_mul, result_div : out std_logic_vector(4 downto 0);
        result_mod : out std_logic_vector(3 downto 0)
    );
end entity logical_arithmetic_operations;

architecture rtl of logical_arithmetic_operations is
begin
    -- Operações Lógicas
    result_and <= a and b;
    result_or <= a or b;
    result_xor <= a xor b;
    result_not_a <= not a;
    result_not_b <= not b;

    -- Operações Aritméticas
    -- Adição
    process(a, b)
    begin
        result_add <= std_logic_vector(unsigned('0' & a) + unsigned('0' & b));
    end process;

    -- Subtração
    process(a, b)
    begin
        result_sub <= std_logic_vector(unsigned('0' & a) - unsigned('0' & b));
    end process;

    -- Multiplicação
    process(a, b)
    begin
        result_mul <= std_logic_vector(unsigned('0' & a) * unsigned('0' & b));
    end process;

    -- Divisão
    process(a, b)
    begin
        if to_integer(unsigned(b)) = 0 then
            result_div <= (others => 'X'); -- Sinal de divisão por zero
        else
            result_div <= std_logic_vector(unsigned('0' & a) / unsigned('0' & b));
        end if;
    end process;
end architecture rtl;
