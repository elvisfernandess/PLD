#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom fsm.vhd testbench_fsm.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench_fsm

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary  /done
add wave -radix binary  /clk_ena
add wave -radix binary  /sclr_n


#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps