 
histmem stop
hset sample/tc3/heater/heaterRange_1 2


#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


################################################################################
###################################################################################

#temp 
# drive tc3_driveable3 300 tc3_driveable 348
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
samplename KTY-1
for {set idx0 0} {$idx0 < 18} {incr idx0} {
	broadcast loop $idx0 KTY-1
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
