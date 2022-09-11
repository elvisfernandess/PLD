#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom sig_test0.vhd tb_sig_test0.vhd

#Simula (work Ã© o diretorio, testbench Ã© o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /a
#add wave -radix binary  /b
add wave -radix binary  /x

#Como mostrar sinais internos do processo
#add wave -radix dec /dut

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps