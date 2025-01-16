# Sample Environment: CF-12 


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

#EFW##################################################################


#Doppler
hset instrument/doppler/ctrl/run_cmd 0 
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 3

# Temperature: Warming from 298-> 305K
drive tc1_temp0_setpoint 293 tc2_temp0_setpoint 298
wait 60


histmem mode time
histmem preset 240

samplename EFW_empty_298_305K
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 8} {incr idx0} {
	
		broadcast Target temperature = [expr $idx0*0+298]
		drive tc1_temp0_setpoint [expr $idx0*1+293]
		drive tc2_temp0_setpoint [expr $idx0*1+298]
		wait 90
		
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint] 
		histmem start block
		broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
		save $idx0
	}

	
# Temperature: 
drive tc1_temp0_setpoint 293 tc2_temp0_setpoint 298
wait 60

#Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 3

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 3

histmem mode time
histmem preset 3600


# acquisition 12 blocks of 1 hour

samplename empty_can_298K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 empty_can_298K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

