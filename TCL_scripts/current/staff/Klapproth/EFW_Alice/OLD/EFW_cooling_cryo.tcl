 
histmem stop


hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


samplename X70_H_5mm_cooling

#Cryo
#hset /sample/tc3/sensor/setpoint3 1
#wait 1
#hset /sample/tc3/sensor/setpoint 1
#wait 1
hset /sample/tc1/pres7/setpoint 60

#Ramp on for samplestick from lakeshore
#hset /sample/tc3/control/ramp_loop_2 1,0.5
#wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1
hset /sample/tc3/sensor/setpoint 1
wait 1

runscan dummy_motor 10 14 138 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################



#off
#hset /sample/tc3/control/ramp_loop_2 0,0.5
#wait 1



####################################################################################

