-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------
architecture stimulus of testbench is

    -- declaração de sinais
    signal a : std_logic;
    signal x : std_logic;

    
begin
    
    dut:entity work.sig_test0
        port map(
            a => a,
            x => x		
        );

    -- gera sinal de a
    process
    begin

		a <= '0';
                wait for 10 ns;
                
                a <= '1';
                wait for 10 ns;
                
                a <= '0';

                wait;
       
 	              
    end process;
                
    end architecture stimulus;