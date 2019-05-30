# Sample Environment: CF-12 
# Sample: 60W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: Warming from 20K -> 300K

hset /sample/tc1/temp0/setpoint 5
hset /sample/tc2/temp6/setpoint 10
hset /sample/tc2/temp0/setpoint 10


set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 0
# Measures 5K temp steps from10 - 100K ie 7 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 3 minutes

for {set idx0 0} {$idx0 < 9} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*10+10]
		
		hset /sample/tc1/temp0/setpoint [expr $idx0*10+5]
		hset /sample/tc2/temp6/setpoint [expr $idx0*10+10]
		hset /sample/tc2/temp0/setpoint [expr $idx0*10+10]
		
		samplename elastic_C3H8_D2O_new_cooling100K
		runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }
		
		broadcast CURRENT LOOP = $loopnumber
	
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Start loop 1
# Measures 5K temp steps from 100-200K ie 9 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 3 minutes

for {set idx1 0} {$idx1 < 9} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*10+100]
		
		hset /sample/tc1/temp0/setpoint [expr $idx1*10+95]
		hset /sample/tc2/temp6/setpoint [expr $idx1*10+100]
		hset /sample/tc2/temp0/setpoint [expr $idx1*10+100]
		
		samplename elastic_C3H8_D2O_new_cooling200K
		runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }
		
		broadcast CURRENT LOOP = $loopnumber
	
		save $idx1
	}
	incr savenumber
	incr loopnumber
}
