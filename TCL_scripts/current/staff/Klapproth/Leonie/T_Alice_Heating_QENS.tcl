 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 
#wait 300

hset sample/tc3/sensor/setpoint1 363
hset sample/tc3/sensor/setpoint3 298 

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

#hset sample/tc1/pres7/setpoint 40

#drive tc3_driveable3 298
#drive tc3_driveable 298

#hset sample/tc1/pres7/setpoint 5
#wait 300

histmem mode time
histmem preset 1800

# Acquisition 
samplename PBS_D2O_0.1_363K
for {set idx0 0} {$idx0 < 7} {incr idx0} {
	broadcast loop $idx0 PBS_D2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################

