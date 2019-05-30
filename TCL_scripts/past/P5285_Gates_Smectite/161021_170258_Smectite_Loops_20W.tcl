# Smectite EFW 

histmem mode time
histmem preset 900
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Start loop 1
# Measures 5K temp steps from 300 - 205K ie 20 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr 300-$idx0*5]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 2
# Measures 5K temp steps from 200 - 105K ie 20 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr 200-$idx0*5]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 5K temp steps from 100 - 10K ie 19 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 19} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr 100-$idx0*5]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 5K temp steps from 10 - 100K ie 19 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 19} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx0*5+10]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 5
# Measures 5K temp steps from 105 - 200K ie 20 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx0*5+105]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 6
# Measures 5K temp steps from 205 - 300K ie 20 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx0*5+205]
		wait 1200
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}
