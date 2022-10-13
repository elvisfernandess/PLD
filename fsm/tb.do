#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom fsm.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /rst
add wave /dut/state
add wave -radix binary  /start
add wave -radix binary  /set_point
add wave -radix binary  /temperature
add wave -radix binary  /light
add wave -radix binary  /motor


#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps