# Sample Environment: CF-1 
# Sample: SBA15 1:1

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 500 16 50 68 200 0 499 

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: Warming from 20K -> 300K


histmem mode time
histmem preset 900
newfile TOTAL_HISTOGRAM_T

set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 1
# Measures 4K temp steps from 20 - 88K ie 18 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx0 0} {$idx0 < 18} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx0*4+20]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 2
# Measures 4K temp steps from 92 - 160K ie 18 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx1 0} {$idx1 < 18} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx1*4+92]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 4K temp steps from 164 - 232K ie 18 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx2 0} {$idx2 < 18} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx2*4+164]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 4K temp steps from 236 - 300K ie 17 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx3 < 17} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		drive tc1_driveable [expr $idx3*4+236]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

