#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom sig_test0.vhd tb_sig_test0.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /a
#add wave -radix binary  /b
add wave -radix binary  /x

#Como mostrar sinais internos do processo
#add wave -radix dec /dut

#Simula at� um 500ns
run 500ns

wave zoomfull
write wave wave.ps