# Test script 2

histmem mode time
histmem preset 30
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

set savenumber 0
set START_NUMBER 0
set loopnumber 0


# Set temperature
drive tc1_driveable 302
# Wait
wait 20
# Measure 1 x 5min
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

# Start loop
# 
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx1 0} {$idx1 < 3} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx1*1+300]
		wait 15
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}
