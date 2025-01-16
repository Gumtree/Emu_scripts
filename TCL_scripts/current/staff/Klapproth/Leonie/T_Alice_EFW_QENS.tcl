 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 


#EFW_1

#Set cryo
hset /sample/tc3/sensor/setpoint1 298
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NEM_H2O_0.1_EFW_heating


#Needle valve
#hset /sample/tc1/pres7/setpoint 5
#wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 363
#hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 90 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#Ramp off for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 0,0.5

#########################################################################

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename YP_NEM_H2O_0.1_363K
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0  YP_NEM_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
