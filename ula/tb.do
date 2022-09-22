-------------------------------------------------------
--! Tarefa 1 - ULA - Unidade Logica Aritmetica
--! Aluno: Elvis Fernandes
--! Data: 22/09/2022
--! Arquivo: tb.do.vhd
-------------------------------------------------------

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom ula.vhd testbench.vhd

#Simula (work Ã© o diretorio, testbench Ã© o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix unsigned -label op_select /op_select
add wave -radix signed -label a /a
add wave -radix signed -label b /b
add wave -radix signed -label output /output
add wave -radix binary -label carry /carry

#Como mostrar sinais internos do processo
#add wave -radix dec /dut

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps