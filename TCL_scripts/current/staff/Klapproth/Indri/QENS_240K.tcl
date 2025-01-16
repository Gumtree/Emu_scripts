 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 


#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


################################################################################
###################################################################################

#Temperature

drive tc3_driveable3 240 tc3_driveable 240
hset sample/tc1/pres7/setpoint 6
wait 60
#drive tc3_driveable3 240 tc3_driveable 240
#wait 300
 
 
# Acquisition 
histmem mode time
histmem preset 1800


samplename Lys_wet_240K  
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 Lys_wet_240K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


