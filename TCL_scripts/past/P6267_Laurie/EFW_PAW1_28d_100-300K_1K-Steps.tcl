# Sample Environment: CF-12, gas loading stick (similar to cold stick)
# Sample: PAW1_28d_85RH Rehydrated(laurie)

# Doppler = 0 m/s (EFW)
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Low Background Mode

# Chopper phase = -64 deg
# chom = 21.2 deg
# mom = 21.0 deg

histmem stop

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Drive temperature to 100K, 
drive tc1_temp0_setpoint 95
drive tc2_temp6_setpoint 100
drive tc2_temp0_setpoint 105

# Temperature: Warming from 100K -> 300K
 

# For temperatures above 50K, activate control of tc2_temp6
hset sample/tc2/temp6/auto 1



# Start loop 0
# Measures 20K temp steps from 100 - 140K ie 3 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 3} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*20+100]
		
		drive tc1_temp0_setpoint [expr $idx0*20+95] tc2_temp6_setpoint [expr $idx0*20+100] tc2_temp0_setpoint [expr $idx0*20+105]
		#drive tc2_temp6_setpoint [expr $idx0*20+100]
		#drive tc2_temp0_setpoint [expr $idx0*20+105]
		wait 600
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Start loop 1
# Measures 1K temp steps from 141 - 180K ie 40 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 180
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT 
for {set idx1 0} {$idx1 < 40} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*1+141]
		
		drive tc1_temp0_setpoint [expr $idx1*1+136]
		drive tc2_temp6_setpoint [expr $idx1*1+141]
		drive tc2_temp0_setpoint [expr $idx1*1+146]
		wait 180
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx1
	}
	incr savenumber
	incr loopnumber
}

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
		drive tc2_temp0_setpoint [expr $idx2*1+186]
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
		drive tc2_temp0_setpoint [expr $idx3*1+226]
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
		drive tc2_temp0_setpoint [expr $idx4*1+266]
		wait 180
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx4
	}
	incr savenumber
	incr loopnumber
}
