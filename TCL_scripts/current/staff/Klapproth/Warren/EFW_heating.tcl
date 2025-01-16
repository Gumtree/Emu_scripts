 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#EFW
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1


samplename CNC_90_RH_EFW_heating 

#Cryo
#Cryo
hset /sample/tc1/pres7/setpoint 6
wait 300
drive tc3_driveable3 10 tc3_driveable 10
wait 300 

#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.7    
wait 1
hset /sample/tc3/control/ramp_loop_3 1,0.7   
wait 1
hset /sample/tc3/sensor/setpoint3 300
wait 1
hset /sample/tc3/sensor/setpoint1 315
wait 1


runscan dummy_motor 10 14 204 time 130 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,0.7
wait 1 
hset /sample/tc3/control/ramp_loop_3 0,0.7            

####################################################################################

