# Sample Environment: CF-12 
# Sample: S2-90W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg

histmem stop

set savenumber 0
set START_NUMBER 0
set loopnumber 0



# Start loop 6
# Measures 1K temp steps from 271 - 300K ie 30 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_T
for {set idx6 0} {$idx6 < 30} {incr idx6} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx6*1+271]
		drive tc2_temp6_setpoint [expr $idx6*1+271]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx6
	}
	incr savenumber
	incr loopnumber
}

# Set the VTI cooling
drive tc1_pres3_setpoint 60
drive tc1_temp0_setpoint 20
