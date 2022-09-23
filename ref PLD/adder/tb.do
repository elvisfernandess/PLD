vlib work

vcom adder.vhd testbench.vhd

vsim -t ns work.testbench

view wave

add wave -radix unsigned -label p_1 /p_1
add wave -radix unsigned -label p_2 /p_2
add wave -radix unsigned -label result /result

run 100ns

wave zoomfull
write wave wave.ps
