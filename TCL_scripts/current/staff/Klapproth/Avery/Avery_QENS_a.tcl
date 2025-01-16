 
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
#hset sample/tc1/pres7/setpoint 30
#wait 180

#hset sample/tc3/sensor/setpoint1 325
#hset sample/tc3/sensor/setpoint3 300
#wait 600

#drive tc3_driveable3 300
#drive tc3_driveable 300
#wait 600

hset sample/tc1/pres7/setpoint 5
#wait 600

histmem mode time
histmem preset 1800

# Acquisition 
samplename PAAR-DC_300K
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 PAAR-DC_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
################################################################################
###################################################################################
drive tc3_driveable3 300
drive tc3_driveable 325
wait 600

#hset sample/tc3/sensor/setpoint1 4
#hset sample/tc3/sensor/setpoint3 4
#wait 300

#hset sample/tc1/pres7/setpoint 5
#wait 180

histmem mode time
histmem preset 1800

# Acquisition 
samplename PAAR-DC_325K
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 PAAR-DC_325K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
drive tc3_driveable3 300
drive tc3_driveable 340
wait 600

#hset sample/tc3/sensor/setpoint1 4
#hset sample/tc3/sensor/setpoint3 4
#wait 300

#hset sample/tc1/pres7/setpoint 5
#wait 180

histmem mode time
histmem preset 1800

# Acquisition 
samplename PAAR-DC_340K
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 PAAR-DC_340K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
hset sample/tc1/pres7/setpoint 30
#wait 180

drive tc3_driveable3 140
drive tc3_driveable 140
#wait 600