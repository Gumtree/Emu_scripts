
#CF-12, L2_puck, cold stick

histmem stop

#############################################################
#hset instrument/doppler/ctrl/run_cmd 0
#wait 30

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

##############################################################
samplename elastic_C3H8_D2O_new_263K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

########################################################################################
hset /sample/tc1/temp0/setpoint 1
hset /sample/tc2/temp6/setpoint 1
hset /sample/tc2/temp0/setpoint 1

samplename elastic_C3H8_D2O_new_263K_cooling
runscan dummy_motor 10 14 144 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


###########################################################################################
###########################################################################################


hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600



###########################################################################################################
# acquisition 6 blocks of 1 hour at 100K

hset /sample/tc2/temp0/setpoint 100
drive tc1_temp0_setpoint 95 tc2_temp6_setpoint 100
wait 60 

samplename QENS_C3H8_D2O_new_100K
for {set idx0 0} {$idx0 <6} {incr idx0} {
	broadcast loop $idx0 samplename QENS_C3H8_D2O_new_100K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###########################################################################################################
# acquisition 6 blocks of 1 hour at 263K

hset /sample/tc2/temp0/setpoint 200
drive tc1_temp0_setpoint 195 tc2_temp6_setpoint 200
wait 60 

samplename QENS_C3H8_D2O_new_200K
for {set idx0 0} {$idx0 <6} {incr idx0} {
	broadcast loop $idx0 samplename QENS_C3H8_D2O_new_200K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

