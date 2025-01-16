 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename vanadium_el

# VTI needle valve
#hset /sample/tc1/pres3/setpoint 6
#wait 1
#VTI temp control 
hset /sample/tc3/sensor/setpoint1 290
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 300
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1



runscan dummy_motor 10 14 60 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


# set to 300 K
# VTI needle valve
hset /sample/tc1/pres3/setpoint 6
wait 1
#VTI temp control 
hset /sample/tc3/sensor/setpoint1 290
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 300
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1

#tertiary close



