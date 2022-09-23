vlib work

vcom ones_count.vhd testbench.vhd

vsim -t ns work.testbench

view wave

add wave -radix binary -label invec /invec
add wave -radix dec -label outvec /outvec

run 50ns

wave zoomfull
write wave wave.ps
