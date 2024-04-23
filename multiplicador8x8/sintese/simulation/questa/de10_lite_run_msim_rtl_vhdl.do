transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/shifter.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/seven_segment_cntrl.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/reg16.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/mux_when.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/mux_sel.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/mult4x4.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/mult_control.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/counter.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/adder.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/multiplicador8x8.vhd}
vcom -93 -work work {C:/Users/Elvis/OneDrive/Documentos/_pld/avaliacaodois/multiplicador8x8/sintese/de10_lite.vhd}

