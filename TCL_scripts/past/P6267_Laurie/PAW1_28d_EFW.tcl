# Sample Environment: CF-12, gas loading stick (similar to cold stick)
# Sample: PAW1_28d (laurie)

# Doppler = 0 m/s (EFW)
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Low Background Mode

# Chopper phase = -64 deg
# chom = 21.2 deg
# mom = 21.0 deg

histmem stop

hset instrument/doppler/ctrl/run_cmd 0
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Drive temperature to 20K, then close the needle valve
#drive tc1_temp0_setpoint 20
#drive tc1_pres3_setpoint 5

# Temperature: Warming from 180K -> 300K
 

# For temperatures above 50K, activate control of tc2_temp6
hset /sample/tc2/temp6/auto 1


hset /sample/tc2/temp6/setpoint 100K
hset /sample/tc2/temp0/setpoint 105K
hset /sample/tc1/temp0/setpoint 95K
samplename cool_PAW1_28d_85RH_EFW
runscan dummy_motor 10 14 84 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


# Start loop 0
# Measures 1K temp steps from 180 - 210K ie 31 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 3 minutes
histmem mode time
histmem preset 180
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 31} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*1+180]
		drive tc2_temp6_setpoint [expr $idx0*1+180]
		wait 300
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Start loop 1
# Measures 1K temp steps from 211 - 240K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT 
for {set idx1 0} {$idx1 < 30} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*1+211]
		drive tc2_temp6_setpoint [expr $idx1*1+211]
		wait 300
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx1
	}
	incr savenumber
	incr loopnumber
}

# Start loop 2
# Measures 1K temp steps from 241 - 270K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 3 minutes
histmem mode time
histmem preset 180
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx2 0} {$idx2 < 30} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx2*1+241]
		drive tc2_temp6_setpoint [expr $idx2*1+241]
		wait 300
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx2
	}
	incr savenumber
	incr loopnumber
}

# Start loop 3
# Measures 1K temp steps from 271 - 300K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx3 0} {$idx3 < 30} {incr idx3} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx3*1+271]
		drive tc2_temp6_setpoint [expr $idx3*1+271]
		wait 300
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx3
	}
	incr savenumber
	incr loopnumber
}

# Set the VTI cooling
drive tc1_pres3_setpoint 60
drive tc1_temp0_setpoint 20
