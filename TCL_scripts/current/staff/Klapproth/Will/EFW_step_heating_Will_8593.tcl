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
 
#hset sample/tc2/temp0/auto 1

#EFW##################################################################

#Doppler
hset instrument/doppler/ctrl/run_cmd 0 
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 3

# Temperature
drive tc1_temp0_setpoint 295 tc3_driveable 325
#wait 120
 
 
histmem mode time
histmem preset 240

samplename Ca_Mt_5M_NaCl2_D2O_heating_325-350K
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 < 26} {incr idx0} {
	
		broadcast Target temperature = [expr $idx0*1+325]
		#drive tc1_temp0_setpoint [expr $idx0*1+295]
		drive tc3_driveable [expr $idx0*1+325]
		wait 60
		
		broadcast [tc1_temp0_setpoint] [tc3_driveable2] 
		histmem start block
		broadcast [tc1_temp0_setpoint] [tc3_driveable2]
		save $idx0
	}


	


