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


#QENS############################################################################


######################################################################################
##################################################################################
# QENS 323K


#Doppler
hset instrument/doppler/ctrl/run_cmd 1   
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 323

histmem mode time
histmem preset 3600

#LOOP acquisition of  16 x 1 hour blocks 
samplename empty_323K
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0  empty_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

######################################################################################


######################################################################################
# Temperature: QENS 298K
drive tc1_temp0_setpoint 293 tc2_temp0_setpoint 298



histmem mode time
histmem preset 3600

#LOOP acquisition of  16 x 1 hour blocks 
samplename empty_298K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0  empty_298K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



