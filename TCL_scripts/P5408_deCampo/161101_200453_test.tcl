histmem mode time
histmem preset 5
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

for {set idx0 0} {$idx0 < 22} {incr idx0} {

	#run tc1_temp0_setpoint [expr $idx0*1+278]
	#drive tc2_temp0_setpoint [expr $idx0*1+278]
	broadcast [expr $idx0*1+278]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	broadcast [t01_Sensor00] [t02_Sensor]
	histmem start block
	
	save	
}
