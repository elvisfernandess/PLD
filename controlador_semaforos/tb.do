#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom controlador_semaforos.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /reset
add wave /dut/state
add wave -radix binary  /stby
add wave -radix binary  /vermelho_1
add wave -radix binary  /amarelo_1
add wave -radix binary  /verde_1
add wave -radix binary  /vermelho_2
add wave -radix binary  /amarelo_2
add wave -radix binary  /verde_2



#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps