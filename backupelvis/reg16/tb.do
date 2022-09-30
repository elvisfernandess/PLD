-------------------------------------------------------
--! Tarefa 02: Registrador de 16 bits
--! Aluno: Elvis Fernandes
--! Data: 23/09/2022
--! Arquivo: tb.do
-------------------------------------------------------

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom reg16.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /rst_clear
add wave -radix binary  /w_flag
add wave -radix hex /datain
add wave -radix hex /reg_out

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps
