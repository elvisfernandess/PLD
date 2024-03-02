#-------------------------------------------------------
#--! Tarefa 1 - MULTIPLIER - Somador
#--! Aluno: Elvis Fernandes
#--! Data: 01/03/2024
#--! Arquivo: tb.do
#-------------------------------------------------------
#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom multiplier.vhd testbench_multiplier.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench_multiplier

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix dec  /clk
add wave -radix dec  /dataa
add wave -radix dec  /datab
add wave -radix dec  /result

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps