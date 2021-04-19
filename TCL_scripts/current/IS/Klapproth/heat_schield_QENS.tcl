 # Sample Environment: CF-12 
# Sample: room-temp-holder

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm

histmem stop

hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 7200


###########################################################################################################
# acquisition during heating 355K - 655K


samplename empty_heating_355-655K
for {set idx0 0} {$idx0 <6} {incr idx0} {
	
	broadcast Target temperature = [expr $idx0*50+355]
	
	drive tc1_temp0_setpoint 300
	drive tc2_temp0_setpoint [expr $idx0*50+355]
	
	broadcast loop $idx0 samplename empty_heating_355-655K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###########################################################################################################
# acquisition during cooling 605K - 305K


samplename empty_cooling_605-305K
for {set idx0 0} {$idx0 <6} {incr idx0} {
	
	broadcast Target temperature = [expr 605-$idx0*50]
	
	drive tc1_temp0_setpoint 300
	drive tc2_temp0_setpoint [expr 605-$idx0*50]
	
	broadcast loop $idx0 samplename empty_cooling_605-305K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

