# Sample Environment: CF-12 
# Sample: SBA-15 1:100

# Doppler = 0 m/s

# Low background mode i.e. bchs = 1213 rpm, mode = 1:2, bchp = -64 deg
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999 
# Configure SAT [6.45 10.9 1.0 4.45 0 0]

# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: 300K

# Counting time per measurement = 25 minutes
histmem mode time
histmem preset 1500

set savenumber 0
set START_NUMBER 0
set loopnumber 0


# Start loop 2
# Measures 5K temp steps from 55 - 115K ie 13 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx1 0} {$idx1 < 13} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+55]
		drive tc2_temp6_setpoint [expr $idx1*5+55]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx1
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 5K temp steps from 120 - 180K ie 13 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx2 0} {$idx2 < 13} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx2*5+120]
		drive tc2_temp6_setpoint [expr $idx2*5+120]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx2
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 5K temp steps from 185 - 245K ie 13 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx3 0} {$idx3 < 13} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx3*5+185]
		drive tc2_temp6_setpoint [expr $idx3*5+185]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx3
	}
	incr savenumber
	incr loopnumber
}

# Start loop 5
# Measures 5K temp steps from 250 - 300K ie 11 temp points
# Data will be saved in one file as a list
newfile TOTAL_HISTOGRAM_T
for {set idx4 0} {$idx4 < 11} {incr idx4} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx4*5+250]
		drive tc2_temp6_setpoint [expr $idx4*5+250]
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx4
	}
	incr savenumber
	incr loopnumber
}
