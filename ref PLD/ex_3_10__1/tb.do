vlib work

vcom ex_3.vhd testbench.vhd

vsim -t ns work.testbench

view wave

add wave -radix binary -label a /a
add wave -radix binary -label b /ex_3_dut/b
add wave -radix binary -label x /x

run 50ns

wave zoomfull
write wave wave.ps
