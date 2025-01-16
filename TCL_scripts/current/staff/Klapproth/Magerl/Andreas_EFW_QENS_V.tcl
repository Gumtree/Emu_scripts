 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 


#EFW_1

#Set cryo
#hset /sample/tc3/sensor/setpoint1 300
#hset /sample/tc3/sensor/setpoint3 300
#wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename Vanadium_300K_EFW

runscan dummy_motor 10 14 10 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS_1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename Vanadium_300K_QENS
for {set idx0 0} {$idx0 < 24} {incr idx0} {
	broadcast loop $idx0 Vanadium_300K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################