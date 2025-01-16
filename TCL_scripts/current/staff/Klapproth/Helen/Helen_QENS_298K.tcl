 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 


#QENS
#Doppler
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#wait 1


################################################################################
###################################################################################

#Temperature
#hset sample/tc1/pres7/setpoint 6
#wait 300
#drive tc3_driveable3 298 tc3_driveable 298

# Acquisition 
histmem mode time
histmem preset 1800


samplename sample_1_H_third_298K  
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 sample_1_H_third_298K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
