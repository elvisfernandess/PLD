# Cria biblioteca do projeto
vlib work

# Compila projeto: todos os arquivos. Ordem é importante
vcom 	input_registers.vhd input_registers_tb.vhd

# Simula (work é o diretório, testbench é o nome da entity)
vsim -t ns work.input_registers_tb

# Mostra forma de onda
view wave

# Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary /input_registers_tb/clk_tb
add wave -radix binary /input_registers_tb/reset_tb
add wave -radix binary /input_registers_tb/enable_tb
add wave -radix binary /input_registers_tb/data1_tb
add wave -radix binary /input_registers_tb/data2_tb
add wave -radix binary /input_registers_tb/q1_tb
add wave -radix binary /input_registers_tb/q2_tb

# Simula até um 1000ns
run 1000ns

wave zoomfull
write wave wave.ps
