# Sample Environment: CF-12, cold stick, rectangular cell
# Sample: Tobermorite (Laurie)

# Doppler = 0 m/s (EFW)
hset instrument/doppler/ctrl/run_cmd 0


# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Low Background Mode

# Chopper phase = -88 deg
# chom = 21.5 deg
# mom = 21.0 deg

histmem stop

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Drive temperature to 100K, 
drive tc1_temp0_setpoint 175
drive tc2_temp6_setpoint 180


# Temperature: Warming from 100K -> 300K
 

# For temperatures above 50K, activate control of tc2_temp6
hset sample/tc2/temp6/auto 1




# Start loop 2
# Measures 1K temp steps from 181 - 220K ie 40 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180

newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT 
for {set idx2 0} {$idx2 < 40} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx2*1+181]
		
		drive tc1_temp0_setpoint [expr $idx2*1+176]
		drive tc2_temp6_setpoint [expr $idx2*1+181]
		
		wait 180
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx2
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 1K temp steps from 221 - 260K ie 40 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180

newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx3 0} {$idx3 < 40} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx3*1+221]
		
		drive tc1_temp0_setpoint [expr $idx3*1+216]
		drive tc2_temp6_setpoint [expr $idx3*1+221]
		
		wait 180
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx3
	}
	incr savenumber
	incr loopnumber
}

# Start loop 4
# Measures 1K temp steps from 261 - 300K ie 40 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180

newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx4 0} {$idx4 < 40} {incr idx4} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx4*1+261]
		
		drive tc1_temp0_setpoint [expr $idx4*1+256]
		drive tc2_temp6_setpoint [expr $idx4*1+261]
		
		wait 180
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx4
	}
	incr savenumber
	incr loopnumber
}
