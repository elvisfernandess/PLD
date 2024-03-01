library ieee;
use ieee.std_logic_1164.all;

entity top_entity is  -- Nome da entidade alterado para top_entity
    port (
        a, b : in std_logic_vector(15 downto 0);
        clk, enable : in std_logic;
        result_and, result_or, result_xor, result_not_a, result_not_b : out std_logic_vector(15 downto 0);
        result_add, result_sub, result_mul, result_div : out std_logic_vector(16 downto 0);
        result_mod : out std_logic_vector(15 downto 0)
    );
end entity top_entity;  -- Nome da entidade alterado para top_entity

architecture rtl of top_entity is  -- Arquitetura renomeada para rtl de top_entity
    -- Instância do bloco logical_arithmetic_operations
    component logical_arithmetic_operations is
        port (
            a, b : in std_logic_vector(15 downto 0);
            clk, enable : in std_logic;
            result_and, result_or, result_xor, result_not_a, result_not_b : out std_logic_vector(15 downto 0);
            result_add, result_sub, result_mul, result_div : out std_logic_vector(16 downto 0);
            result_mod : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Sinais internos para conectar os blocos
    signal temp_result_and, temp_result_or, temp_result_xor, temp_result_not_a, temp_result_not_b : std_logic_vector(15 downto 0);
    signal temp_result_add, temp_result_sub, temp_result_mul, temp_result_div : std_logic_vector(16 downto 0);
    signal temp_result_mod : std_logic_vector(15 downto 0);
begin
    -- Instância do bloco logical_arithmetic_operations
    uut_logical_arithmetic : logical_arithmetic_operations
        port map (
            a => a,
            b => b,
            clk => clk,
            enable => enable,
            result_and => temp_result_and,
            result_or => temp_result_or,
            result_xor => temp_result_xor,
            result_not_a => temp_result_not_a,
            result_not_b => temp_result_not_b,
            result_add => temp_result_add,
            result_sub => temp_result_sub,
            result_mul => temp_result_mul,
            result_div => temp_result_div,
            result_mod => temp_result_mod
        );

    -- Conexão dos sinais
    result_and <= temp_result_and;
    result_or <= temp_result_or;
    result_xor <= temp_result_xor;
    result_not_a <= temp_result_not_a;
    result_not_b <= temp_result_not_b;
    result_add <= temp_result_add;
    result_sub <= temp_result_sub;
    result_mul <= temp_result_mul;
    result_div <= temp_result_div;
    result_mod <= temp_result_mod;
end architecture rtl;
