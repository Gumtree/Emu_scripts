
histmem mode time
histmem preset 5
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Start loop 1
# Measures 5K temp steps from 300 - 205K ie 20 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 5} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		#run tc1_temp0_setpoint [expr $idx0*1+278]
		#drive tc2_temp0_setpoint [expr $idx0*1+278]
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
		broadcast [expr $idx0*1+278]
		
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}
