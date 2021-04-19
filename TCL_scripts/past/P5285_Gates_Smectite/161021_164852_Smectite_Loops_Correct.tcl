# Smectite EFW 

histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

set savenumber 0
set START_NUMBER 0
set loopnumber 0

for {set idx0 0} {$idx0 < 6} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Wait 2 hours at 4K
wait 7200
# Measure 1 x 5min
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

# Set temperature = 150K
drive tc1_driveable 150
# Wait 30 minutes
wait 1800
# Measure 1 x 5min
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

# Start loop to measure temperature increments from 180 - 300K ie 30 temp points
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx1 0} {$idx1 < 24} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx1*5+180]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}
