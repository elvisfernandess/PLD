-------------------------------------------------------
--! Tarefa 03: Contador de Programa
--! Aluno: Elvis Fernandes
--! Data: 29/09/2022
--! Arquivo: tb.do
-------------------------------------------------------

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom pc.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /load
add wave -radix binary  /reset
add wave -radix binary  /up
add wave -radix hex /datain
add wave -radix hex /data

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps