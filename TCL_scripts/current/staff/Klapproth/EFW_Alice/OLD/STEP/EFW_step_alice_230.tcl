# Sample Environment: CF-12 


# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg



histmem stop
 
#hset sample/tc2/temp0/auto 1
#hset /sample/tc1/temp0/auto 1
#hset /sample/tc1/pres3/auto 1
hset /sample/tc1/pres3/setpoint 20

#EFW##################################################################

#Doppler: off
hset instrument/doppler/ctrl/run_cmd 0 
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5

# Temperature: start
#drive tc1_temp0_setpoint 155 tc3_driveable2 160
#wait 240


histmem mode time
histmem preset 180

#heating

samplename TBAB_low_160-230K
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 71} {incr idx0} {
	
		broadcast Target temperature = [expr $idx0*(0)+160]
	
		drive tc1_temp0_setpoint [expr $idx0*(0)+155] 
		drive tc3_driveable2 [expr $idx0*(0)+160]
		 
		wait 60
		
		broadcast [tc1_temp0_setpoint] [tc3_driveable2] 
		histmem start block
		broadcast [tc1_temp0_setpoint] [tc3_driveable2] 
		save $idx0
	}

