#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom adder.vhd testbench_adder.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench_adder

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix dec  /dataa
add wave -radix dec  /datab
add wave -radix dec  /sum

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps