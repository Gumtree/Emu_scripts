 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 



#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_D2O_0.1_EFW_cooling


#Needle valve
hset /sample/tc1/pres7/setpoint 40
#wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1

hset /sample/tc3/sensor/setpoint3 50
hset /sample/tc3/sensor/setpoint1 298

wait 1

runscan dummy_motor 10 14 87 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#Ramp off for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 0,0.5

#########################################################################

