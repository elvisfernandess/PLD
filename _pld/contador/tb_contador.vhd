-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------

architecture stimulus of testbench is

    -- declaração de sinais
    signal invec : std_logic_vector (31 downto 0);
    signal outvec : std_logic_vector (7 downto 0);
    
begin
    
    dut:entity work.ones_count
        port map(
            invec  => invec,
            outvec => outvec
        );
        
    -- gera sinal de invec
    process
    begin
        invec <= x"00020000";
        wait for 40 ns;
       
    end process;
        

        
    end architecture stimulus;