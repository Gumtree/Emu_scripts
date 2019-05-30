# Sample Environment: CF-12 
# Sample: 150W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: Warming from 20K -> 300K

# Counting time per measurement = 30 minutes
histmem mode time
histmem preset 1800
newfile TOTAL_HISTOGRAM_T

set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 1
# Measures 5K temp steps from 20 - 50K ie 7 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx0 0} {$idx0 < 7} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*5+20]
		drive tc1_temp0_setpoint [expr $idx0*5+20]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# For temperatures above 50K, activate control of tc2_temp6
hset sample/tc2/temp6/auto 1

# Start loop 2
# Measures 5K temp steps from 55 - 110K ie 12 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*5+55]
		drive tc1_temp0_setpoint [expr $idx0*5+55] tc2_temp6_setpoint [expr $idx1*5+55]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 5K temp steps from 115 - 170K ie 12 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx1 0} {$idx1 < 12} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+130]
		drive tc1_temp0_setpoint [expr $idx1*5+130] tc2_temp6_setpoint [expr $idx1*5+130]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 5K temp steps from 175 - 230K ie 12 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx2 0} {$idx2 < 12} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+205]
		drive tc1_temp0_setpoint [expr $idx2*5+205] tc2_temp6_setpoint [expr $idx2*5+205]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

# Start loop 5
# Measures 5K temp steps from 235 - 300K ie 14 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx3 < 14} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+235]
		drive tc1_temp0_setpoint [expr $idx3*5+235] tc2_temp6_setpoint [expr $idx3*5+235]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $savenumber
	}
	incr savenumber
	incr loopnumber
}

