# Sample Environment: CF-12 
# Sample: 60W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg


#Doppler: off
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999



histmem stop
 
hset sample/tc2/temp0/auto 1


set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Temperature: Warming from 20K -> 300K
#drive tc1_temp0_setpoint 280 tc2_temp0_setpoint 295

# Start loop 0
# Measures 1K temp steps from 295 to 305K
# Data will be saved in one file as a list

histmem mode time
histmem preset 240
#samplename XXXX
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 11} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*1+295]
		drive tc1_temp0_setpoint [expr $idx0*1+290]
		drive tc2_temp0_setpoint [expr $idx0*1+295]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint] 
		histmem start block
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Temperature: Warming from 20K -> 300K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 305

# Start loop 1
# Measures 5K temp steps from 305 - 375K 
# Data will be saved in one file as a list

histmem mode time
histmem preset 240
#samplename XXXX
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx1 0} {$idx1 < 75} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*1+305]
		drive tc2_temp0_setpoint [expr $idx1*1+305]
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
		histmem start block
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
		save $idx1
	}
	incr savenumber
	incr loopnumber
}





	  
