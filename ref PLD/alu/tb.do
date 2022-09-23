vlib work

vcom alu.vhd testbench.vhd

vsim -t ns work.testbench

view wave

add wave -radix unsigned -label alu_op /alu_op
add wave -radix signed -label a /a
add wave -radix signed -label b /b
add wave -radix signed -label output /output
add wave -radix binary -label carry /carry

run 500ns

wave zoomfull
write wave wave.ps