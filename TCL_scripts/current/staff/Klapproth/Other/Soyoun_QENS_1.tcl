 
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

#drive tc3_driveable3 300 tc3_driveable 348
#drive tc3_driveable 300
#wait 600

#hset sample/tc3/sensor/setpoint1 4
#hset sample/tc3/sensor/setpoint3 4


#hset sample/tc1/pres7/setpoint 5
#wait 180

histmem mode time
histmem preset 1800

# Acquisition 
samplename CEH-3
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0 CEH-3
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
#temp 

#hset sample/tc1/pres7/setpoint 60
#drive tc3_driveable3 200 tc3_driveable 300

#temp
hset sample/tc3/sensor/setpoint1 300
hset sample/tc3/sensor/setpoint3 250

##############################################################################
#heater off
#hset sample/tc3/heater/heaterRange_1 0






