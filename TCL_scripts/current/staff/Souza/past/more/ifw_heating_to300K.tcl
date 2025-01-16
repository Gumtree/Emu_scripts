 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 1.5
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
set_chopper_config_with_roi 4.654 20.21 1 1000 0 50 0 255 0 999


samplename AgBehenate90deg-10to300K-1.5FW

hset /sample/tc1/pres7/setpoint 6
wait 1
# sample 
hset /sample/tc3/control/ramp_Loop_1 1,2.0
wait 1
hset /sample/tc3/sensor/setpoint1 300
wait 1
# VTI
hset /sample/tc3/control/ramp_Loop_3 1,2.0
wait 1
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 155 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#switch ramps off 
hset /sample/tc3/control/ramp_Loop_1 0,1.0
wait 1
hset /sample/tc3/control/ramp_Loop_3 0,1.0
wait 1




#tertiary close



