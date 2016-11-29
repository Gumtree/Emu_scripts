
samplename test1

histmem mode time
histmem preset 5

# Temperature = 278K - 300K

broadcast heat1
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat1
for {set idx0 0} {$idx0 < 3} {incr idx0} {
	run tc1_temp0_setpoint [expr $idx0*1+276]
	drive tc2_temp0_setpoint [expr $idx0*1+276]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}
