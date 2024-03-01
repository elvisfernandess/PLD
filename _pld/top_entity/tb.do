#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom top_entity.vhd top_entity_tb.vhd

#Simula (work Ã© o diretorio, testbench Ã© o nome da entity)
vsim -t ns work.top_entity_tb

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk_tb
add wave -radix binary  /enable_tb

#Como mostrar sinais internos do processo
#add wave -radix dec /dut/count

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps