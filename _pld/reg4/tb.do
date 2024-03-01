# Cria biblioteca do projeto
vlib work

# Compila projeto: todos os arquivos. Ordem é importante
vcom reg4.vhd tb_reg4.vhd

# Simula (work é o diretório, testbench é o nome da entity)
vsim -t ns work.tb_reg4

# Mostra forma de onda
view wave

# Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary /tb_reg4/clk_tb
add wave -radix binary /tb_reg4/reset_tb
add wave -radix binary /tb_reg4/enable_tb
add wave -radix binary /tb_reg4/data_tb
add wave -radix binary /tb_reg4/q_tb

# Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps
