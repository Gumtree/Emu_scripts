histmem mode time
histmem preset 1


# Temperature = 278K - 300K
broadcast heat1
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat1
for {set idx0 0} {$idx0 < 23} {incr idx0} {
	broadcast [expr $idx0*1+278]
	broadcast [expr $idx0*1+278]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

# Temperature = 301K - 353K
broadcast heat2
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat2
for {set idx0 0} {$idx0 < 53} {incr idx0} {
	broadcast [expr $idx0*1+301]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}
}
