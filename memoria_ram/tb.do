# ============================================================================
# Name        : tb_divisor.do
# Author      : Renan Augusto Starke
# Version     : 0.1
# Copyright   : Renan, Departamento de Eletr�nica, Florian�polis, IFSC
# Description : Exemplo de script de compila��o ModelSim para divisor de clock
# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom  pc.vhd registrador_instrucao.vhd rom_ram.vhd main.vhd testbench.vhd

#Simula (work � o diretorio, testbench � o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /reset
add wave -radix hex /addr
add wave -radix binary  /data

#Simula at� um 500ns
run 500ns

wave zoomfull
write wave wave.ps