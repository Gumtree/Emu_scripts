 
histmem stop
hset sample/tc3/heater/heaterRange_1 2

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename YP_10_D2O_CaCl2_cooling

#Set cryo
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 150
hset /sample/tc3/sensor/setpoint1 150


runscan dummy_motor 10 14 12 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
################################################################################################################################


