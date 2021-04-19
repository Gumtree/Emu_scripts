# Sample Environment: CF-12 
# Sample: 150W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: Warming from 20K -> 300K

set savenumber 0
set START_NUMBER 0
set loopnumber 2
 
# Start loop 1
# Measures 5K temp steps from 20 - 50K ie 7 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 30 minutes
histmem mode time
histmem preset 1800
newfile TOTAL_HISTOGRAM_T

# For temperatures above 50K, activate control of tc2_temp6
hset sample/tc2/temp6/auto 1

# Start loop 2
# Measures 5K temp steps from 55 - 110K ie 12 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 30 minutes
histmem mode time
histmem preset 1800
newfile TOTAL_HISTOGRAM_T
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*5+55]
		drive tc2_temp6_setpoint [expr $idx0*5+55]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 5K temp steps from 115 - 180K ie 14 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 30 minutes
histmem mode time
histmem preset 1800
newfile TOTAL_HISTOGRAM_T
for {set idx1 0} {$idx1 < 14} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+115]
		drive tc2_temp6_setpoint [expr $idx1*5+115]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx1
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 1K temp steps from 181 - 210K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx2 0} {$idx2 < 30} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx2*1+181]
		drive tc2_temp6_setpoint [expr $idx2*1+181]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx2
	}
	incr savenumber
	incr loopnumber
}

# Start loop 5
# Measures 1K temp steps from 211 - 240K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx3 < 30} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx3*1+211]
		drive tc2_temp6_setpoint [expr $idx3*1+211]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx3
	}
	incr savenumber
	incr loopnumber
}

# Start loop 6
# Measures 1K temp steps from 241 - 270K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx4 < 30} {incr idx4} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx4*1+241]
		drive tc2_temp6_setpoint [expr $idx4*1+241]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx4
	}
	incr savenumber
	incr loopnumber
}

# Start loop 7
# Measures 1K temp steps from 271 - 300K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx5 < 30} {incr idx5} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx5*1+271]
		drive tc2_temp6_setpoint [expr $idx5*1+271]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx5
	}
	incr savenumber
	incr loopnumber
}