# Sample Environment: CF-12 
# Sample: 150W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: Warming from 240K -> 300K

set savenumber 0
set START_NUMBER 0
set loopnumber 6
 
# Start loop 6
# Measures 1K temp steps from 241 - 270K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx4 0} {$idx4 < 30} {incr idx4} {
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
for {set idx5 0} {$idx5 < 30} {incr idx5} {
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