 
histmem stop
hset sample/tc2/heater/heaterRange_13



#EFW

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename vanadium_CF-11_hot_stick_vacuum 298K

runscan dummy_motor 10 14 12 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }




#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


################################################################################
###################################################################################
#drive tc3_driveable3 12
#drive tc3_driveable 12
#wait 300

#hset sample/tc3/sensor/setpoint1 4
#hset sample/tc3/sensor/setpoint3 4
#wait 300

#hset sample/tc1/pres7/setpoint 5
#wait 180

histmem mode time
histmem preset 1800

# Acquisition 
samplename vanadium_CF-11_hot_stick 298K
for {set idx0 0} {$idx0 < 48} {incr idx0} {
	broadcast loop $idx0 vanadium_CF-11_hot_stick 298K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
