# Smectite EFW test

histmem mode time
histmem preset 30
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX

set savenumber 0
set START_NUMBER 0
set loopnumber 0

for {set idx0 0} {$idx0 < 30} {incr idx0} {
	for {set idx1 0} {$idx1 < 30} {incr idx1} {
		if {$START_NUMBER <= $loopnumber} {
			drive tc1_driveable [expr $idx1*145+5]
			wait 10
			broadcast CURRENT LOOP = $loopnumber
			histmem start block
			save $savenumber
		}
		incr savenumber
		incr loopnumber
	}
}


