 
histmem stop

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1


samplename CNF_80_EFW_cool

#Cryo
hset /sample/tc1/pres7/setpoint 60
wait 300
drive tc3_driveable3 300 tc3_driveable 313
#wait 300 


#Ramp on for samplestick from lakeshore
#hset /sample/tc3/control/ramp_loop_1 1,0.2
#wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1
hset /sample/tc3/sensor/setpoint1 180
wait 1

runscan dummy_motor 10 14 90 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################


# cryo off
#hset /sample/tc3/control/ramp_loop_1 0,0.5




