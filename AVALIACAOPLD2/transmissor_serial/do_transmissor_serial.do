#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom transmissor_serial.vhd transmissor_serial_tb.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.transmissor_serial_tb

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary  /clk
add wave -radix binary  /start
add wave -radix binary  /reset
add wave -radix binary  /data
add wave -radix binary  /addr
add wave -radix binary  /sdata

add wave -radix binary  /clk_in
add wave -radix binary  /rst
add wave -radix binary  /sel_pr
add wave -radix uns  /counter
add wave -radix binary  /clk_out

#Simula até um 100000ns
run 100000

wave zoomfull
write wave wave.ps