
#CF-12, L2_puck, cold stick


histmem stop
hset sample/tc3/heater/heaterRange_1 3
hset /sample/msom 45
#############################################################

##Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

#Temperature
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300
#wait 600


samplename Antibubbles_R972

#cryo setting
hset /sample/tc1/pres7/setpoint 60

hset /sample/tc3/sensor/setpoint1 50
hset /sample/tc3/sensor/setpoint3 1

runscan dummy_motor 10 14 240 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

####################################################################################
####################################################################################

#cryo setting
hset /sample/tc1/pres7/setpoint 6

hset /sample/tc3/sensor/setpoint1 50
hset /sample/tc3/sensor/setpoint3 50
wait 600

#Ramp on for sample stick from Lakeshore

hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 170 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1

###################################################################################

hset /sample/msom 0 
