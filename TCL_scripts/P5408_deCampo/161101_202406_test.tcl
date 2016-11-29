histmem mode time
histmem preset 5
run tc1_temp0_setpoint 277
run tc2_temp0_setpoint 277

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 22} {incr idx0} {

	#run tc1_temp0_setpoint [expr $idx0*1+278]
	#drive tc2_temp0_setpoint [expr $idx0*1+278]
	broadcast [expr $idx0*1+278]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	
	save	
}

# Temperature = 301K - 353K

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 53} {incr idx0} {
	#drive tc2_temp0_setpoint [expr $idx0*1+301]
	broadcast [expr $idx0*1+301]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save	
}
