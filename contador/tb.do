#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom contador.vhd tb_contador.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /invec
add wave -radix binary  /outvec

#Como mostrar sinais internos do processo
#add wave -radix dec /dut/count

#Simula at� um 500ns
run 500ns

wave zoomfull
write wave wave.ps