 
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



################################################################################
##########################################################################


#Temperature
#drive tc3_driveable3 310 tc3_driveable 453
#wait 300 
#drive tc3_driveable 470
#wait 300
#drive tc3_driveable 473


#wait 600


histmem mode time
histmem preset 1800

# Acquisition 
samplename X_70_H_1mm_473K 
for {set idx0 0} {$idx0 < 28} {incr idx0} {
	broadcast loop $idx0 X_70_H_1mm_473K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}




################################################################################
##########################################################################