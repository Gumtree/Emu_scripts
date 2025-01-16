 
histmem stop


#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2


samplename D-CYP+D2O+H-g-RTto15K-el

# fast cooling
hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc1/temp0/setpoint 1
hset /sample/tc3/heater/heaterRange_1 0
wait 1
hset /sample/tc3/sensor/setpoint1 15

runscan dummy_motor 10 14 165 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# the following may not get executed as optimally,
# runscan would be manually aborted upon reaching temperature.
hset /sample/tc1/temp0/setpoint 15
hset /sample/tc3/heater/heaterRange_1 3
hset /sample/tc1/pres3/setpoint 15
wait 900


#tertiary close
