#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom fsm.vhd testbench.vhd

#Simula (work � o diretorio, testbench � o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /rst
add wave /dut/state
add wave -radix binary  /d
add wave -radix binary  /q


#Simula at� um 500ns
run 500ns

wave zoomfull
write wave wave.ps