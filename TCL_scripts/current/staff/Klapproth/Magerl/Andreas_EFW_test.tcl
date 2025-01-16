 
histmem stop
#hset sample/tc3/heater/heaterRange_1 3 

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_test

#Set cryo
#hset /sample/tc3/sensor/setpoint1 300
#hset /sample/tc3/sensor/setpoint3 300

#Needle valve
#hset /sample/tc1/pres7/setpoint 5
#wait 180


#Ramp on for sample stick from Lakeshore
#hset /sample/tc3/control/ramp_loop_1 1,1.0
#hset /sample/tc3/control/ramp_loop_3 1,1.0
#wait 1
#hset /sample/tc3/sensor/setpoint1 370
#hset /sample/tc3/sensor/setpoint3 300
#wait 1

runscan dummy_motor 10 14 4 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

