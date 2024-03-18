-------------------------------------------------------
--! Tarefa 03: multiplexador
--! Aluno: Elvis Fernandes
--! Data: 17/03/2024
--! Arquivo: tb.do
-------------------------------------------------------
#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom mux4.vhd testbench_mux4.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench_mux4
#vsim -voptargs="+acc" -t ns work.testbench_mux4

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix dec  /mux_in_a
add wave -radix dec  /mux_in_b
add wave -radix dec  /mux_out
add wave -radix bin  /mux_in_a
add wave -radix bin  /mux_in_b
add wave -radix bin  /mux_out
add wave -radix bin  /mux_sel


#Simula até um 500ns
run 1000ns

wave zoomfull
write wave wave.ps