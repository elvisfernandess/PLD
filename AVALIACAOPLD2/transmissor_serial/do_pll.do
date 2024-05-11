#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom pll.vhd pll_tb.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.pll_tb

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary  /clk_in
add wave -radix binary  /rst
add wave -radix binary  /sel_pr
add wave -radix uns  /counter
add wave -radix binary  /clk_out

#Simula até um 500ns
run 500

wave zoomfull
write wave wave.ps