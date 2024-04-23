-------------------------------------------------------------------
-- Name        : de0_lite.vhd
-- Author      : Elvis Fernandes
-- Version     : 0.1
-- Copyright   : Departamento de Eletrônica, Florianópolis, IFSC
-- Description : Tarefa 09: síntese multiplicador
-- Date        : 22/04/2024
-------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity de10_lite is
    port(
        ---------- CLOCK ----------
        ADC_CLK_10      : in    std_logic;
        MAX10_CLK1_50   : in    std_logic;
        MAX10_CLK2_50   : in    std_logic;
        ----------- SDRAM ------------
        DRAM_ADDR       : out   std_logic_vector(12 downto 0);
        DRAM_BA         : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N      : out   std_logic;
        DRAM_CKE        : out   std_logic;
        DRAM_CLK        : out   std_logic;
        DRAM_CS_N       : out   std_logic;
        DRAM_DQ         : inout std_logic_vector(15 downto 0);
        DRAM_LDQM       : out   std_logic;
        DRAM_RAS_N      : out   std_logic;
        DRAM_UDQM       : out   std_logic;
        DRAM_WE_N       : out   std_logic;
        ----------- SEG7 ------------
        HEX0            : out   std_logic_vector(7 downto 0);
        HEX1            : out   std_logic_vector(7 downto 0);
        HEX2            : out   std_logic_vector(7 downto 0);
        HEX3            : out   std_logic_vector(7 downto 0);
        HEX4            : out   std_logic_vector(7 downto 0);
        HEX5            : out   std_logic_vector(7 downto 0);
        ----------- KEY ------------
        KEY             : in    std_logic_vector(1 downto 0);
        ----------- LED ------------
        LEDR            : out   std_logic_vector(9 downto 0);
        ----------- SW ------------
        SW              : in    std_logic_vector(9 downto 0);
        ----------- VGA ------------
        VGA_B           : out   std_logic_vector(3 downto 0);
        VGA_G           : out   std_logic_vector(3 downto 0);
        VGA_HS          : out   std_logic;
        VGA_R           : out   std_logic_vector(3 downto 0);
        VGA_VS          : out   std_logic;
        ----------- Accelerometer ------------
        GSENSOR_CS_N    : out   std_logic;
        GSENSOR_INT     : in    std_logic_vector(2 downto 1);
        GSENSOR_SCLK    : out   std_logic;
        GSENSOR_SDI     : inout std_logic;
        GSENSOR_SDO     : inout std_logic;
        ----------- Arduino ------------
        ARDUINO_IO      : inout std_logic_vector(15 downto 0);
        ARDUINO_RESET_N : inout std_logic
    );
end entity;

architecture rtl of de10_lite is

    signal product8x8            : unsigned(15 downto 0); -- Sinal de saída do multiplicador 8x8.
    signal input                 : unsigned(7 downto 0);
    signal reset_a               : std_logic;
    signal start                 : std_logic;
    signal done_flag             : std_logic;
    signal segs                  : unsigned(7 downto 0);
    signal product8x8_out        : unsigned(15 downto 0);
    signal dataa                 : unsigned(7 downto 0);
    signal datab                 : unsigned(15 downto 8);
   
	signal produto8x8_parte_baixa : std_logic_vector(7 downto 0);
    signal produto8x8_parte_inter : std_logic_vector(7 downto 0);
    signal produto8x8_parte_med   : std_logic_vector(15 downto 8);
    signal produto8x8_parte_high : std_logic_vector(15 downto 8); -- Novo sinal para armazenar os bits de product8x8_out(15 downto 4)
    signal HEX0_teste           : unsigned(7 downto 0);
    --signal HEX1_teste           : unsigned(7 downto 0);
    --signal HEX2_teste           : unsigned(7 downto 0);
    --signal HEX3_teste           : unsigned(7 downto 0);
	  

	 signal source : std_logic_vector(15 downto 0);
	 signal probe : std_logic_vector(15 downto 0);
	 
	 	component unnamed is
		port (
			source : out std_logic_vector(15 downto 0);                    -- source
			probe  : in  std_logic_vector(15 downto 0) := (others => 'X')  -- probe
		);
	end component unnamed;

begin

		u0 : component unnamed
		port map (
			source => source, -- sources.source
			probe  => probe   --  probes.probe
		);
		
		dataa<=unsigned(source(7 downto 0));
		datab<=unsigned(source(15 downto 8));

		
		with reset_a select 
		
		product8x8_out<=x"0000" when '0',
							 dataa * datab when others;
		probe(15 downto 0)<=std_logic_vector(product8x8_out);
		
				 

    -- Instanciando o DUT
    dut : entity work.multiplicador8x8
        generic map(
            DATA_WIDTH => 16
        )
        port map(
            dataa          => dataa,
            datab          => datab,
            start          => SW(2),
            reset_a        => SW(1),
            clk            => SW(0),
            done_flag      => LEDR(0),
            --product8x8_out(3 downto 0) => unsigned(produto8x8_parte_baixa(3 downto 0)),
				--product8x8_out(7 downto 4) => unsigned(produto8x8_parte_inter(7 downto 4)),
				--product8x8_out(11 downto 8) =>unsigned(produto8x8_parte_med(11 downto 8)),
				--product8x8_out(15 downto 12) =>unsigned(produto8x8_parte_med(15 downto 12)),
				--product8x8_out(15 downto 0) => product8x8_out(15 downto 0),
				--product8x8_out(0) => product8x8_out(0),
				--product8x8_out(1) => product8x8_out(1),
				--product8x8_out(2) => product8x8_out(2),
				--product8x8_out(3) => product8x8_out(3),
				--product8x8_out(4) => product8x8_out(4),
				--product8x8_out(5) => product8x8_out(5),
				--product8x8_out(6) => product8x8_out(6),
				--product8x8_out(7) => product8x8_out(7),
				--product8x8_out(8) => product8x8_out(8),
				--product8x8_out(9) => product8x8_out(9),
				--product8x8_out(10) => product8x8_out(10),
				--product8x8_out(11) => product8x8_out(11),
				--product8x8_out(12) => product8x8_out(12),
				--product8x8_out(13) => product8x8_out(13),
				--product8x8_out(14) => product8x8_out(14),
				--product8x8_out(15) => product8x8_out(15),
				--product8x8_out  => product8x8,
				product8x8_out (7 downto 0)  => product8x8 (7 downto 0),
			   product8x8_out (15 downto 8)  => product8x8 (15 downto 8),
				--segs(0)        => segs(0),      
				--segs(1)        => segs(1),
				--segs(2)        => segs(2),
				--segs(3)        => segs(3),
				--segs(4)        => segs(4),
				--segs(5)        => segs(5),
				--segs(6)        => segs(6),
				--segs(7)        => segs(7)
				segs			  => segs
				 --segs (7 downto 0)           => HEX0_teste (7 downto 0)   
		  
        );
		  

		  -- Assigning the converted product8x8_out to HEX2
		HEX2 <= std_logic_vector(product8x8(7 downto 0));
		
		  -- Assigning the converted product8x8_out to HEX3
		HEX3 <= std_logic_vector(product8x8(15 downto 8));
		
		
		  -- Assigning the converted product8x8_out to HEX3
		HEX4 <= std_logic_vector(HEX0_teste);
		  
		  -- Assigning intermediate signals for each part of product8x8_out
			produto8x8_parte_baixa <= "0000" & std_logic_vector(product8x8_out(3 downto 0));
			produto8x8_parte_inter <= "0000" & std_logic_vector(product8x8_out(7 downto 4));
			produto8x8_parte_med   <= "0000" & std_logic_vector(product8x8_out(11 downto 8));
			produto8x8_parte_high  <= "0000" & std_logic_vector(product8x8_out(15 downto 12));
		  
		  
		  
		  seven_segment_cntrl_hex1 : entity work.seven_segment_cntrl
			port map(
			input => produto8x8_parte_baixa(3 downto 0),
			segs(1 downto 0)  => HEX0_teste( 1 downto 0)
			);

			seven_segment_cntrl_hex2 : entity work.seven_segment_cntrl
        port map(
            input => produto8x8_parte_inter(7 downto 4),
            segs(3 downto 2)  => HEX0_teste(3 downto 2)
			);
			
			seven_segment_cntrl_hex3 : entity work.seven_segment_cntrl
        port map(
            input => produto8x8_parte_med(11 downto 8),
            segs(5 downto 4)  => HEX0_teste (5 downto 4)
			);
			
			seven_segment_cntrl_hex4 : entity work.seven_segment_cntrl
        port map(
            input => produto8x8_parte_high(15 downto 12),
            segs(7 downto 6)  => HEX0_teste(7 downto 6)
			);
		 	
end architecture;
