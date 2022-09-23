
vlib work

vcom mux_sel.vhd testbench.vhd

vsim -t ns work.testbench

view wave

add wave -radix binary -label sel /sel
add wave -radix binary -label in_1 /in_1
add wave -radix binary -label in_2 /in_2
add wave -radix binary -label output /output

run 100ns

wave zoomfull
write wave wave.ps
