# Sample Environment: CF-12 
# Sample: gas loading stick, D1, 0.5mm gap

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.2 deg
# mom = 21.0 deg


histmem stop

set savenumber 0
set START_NUMBER 0
set loopnumber 0




#############################################################################################
############################################################################################
# For temperatures above 50K, activate control of tc2_temp6
# hset sample/tc2/temp6/auto 1




drive tc1_temp0_setpoint 300 

# Temperature: Cooling from 300K -> 180K (press 20mbar)
 
# Start loop 0
# Measures 5K temp steps from 300 - 180K ie 25 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 5 minutes
histmem mode time
histmem preset 300
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T 
for {set idx0 0} {$idx0 < 25} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr 300-$idx0*5]
		drive tc1_temp0_setpoint [expr 300-$idx0*5]
		
		wait 300
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# For temperatures above 50K, activate control of tc2_temp6
#hset sample/tc2/temp6/auto 1

# Start loop 1
# Measures 5K temp steps from 55 - 110K ie 12 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 20 minutes
